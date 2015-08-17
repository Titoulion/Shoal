using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using Rect = UnityEngine.Rect;
using OpenCvSharp;
using OpenCvSharp.CPlusPlus;
using System.Threading;
using System.Runtime.InteropServices;


// Parallel is used to speed up the for loop when converting CvMat to 2D texture
using Uk.Org.Adcock.Parallel;  // Stewart Adcock's implementation of parallel processing 

public class KinectOpenCvDetector : MonoBehaviour
{

    public KinectManagerSimple kinect;
    Thread detectorThread;
    public bool showDetection = true;
    public GameObject ScreenObject;
    [Range(0.0f,100.0f)]
    public double threshold = 7.0;
    [Range(-500.0f, 500.0f)]
    public double xAdjust = 0.0;
    [Range(-500.0f, 500.0f)]
    public double yAdjust = 0.0;
    [Range(0, 640)]
    public int roiX = 0;
    [Range(0, 480)]
    public int roiY = 0;
    [Range(0, 640)]
    public int roiW = 640;
    [Range(0, 480)]
    public int roiH = 480;
    // Object parameters - rectangle where the attached gameObject is in screen coordinates
    UnityEngine.Rect objectScreenPosition = new Rect(0, 0, 1, 1);
    private int imWidth;  // Input devices image width
    private int imHeight;  // Input devices image height 
    // Flip the video source axes (webcams are usually mirrored)
    // Unity and OpenCV images are flipped
    public bool FlipUpDownAxis = false, FlipLeftRightAxis = true;
    private CascadeClassifier cascade;
    private Mat show;
    private Texture2D result;
    private bool running = false;
    private Mat calibResult;
    private Mat bg;
    private Mat fg;
    private Mat fgthresh;
    private bool first = true;
    private SimpleBlobDetector blob;
    private OpenCvSharp.Blob.CvTracks tracks;
    private OpenCvSharp.Blob.CvBlobs blobs;
    public GameObject spawner;
    private static double NUI_CAMERA_COLOR_NOMINAL_FOCAL_LENGTH_IN_PIXELS = (531.15);   // Based on 640x480 pixel size.
    private static double NUI_CAMERA_COLOR_NOMINAL_INVERSE_FOCAL_LENGTH_IN_PIXELS = (1.83e-3);  // (1/NUI_CAMERA_COLOR_NOMINAL_FOCAL_LENGTH_IN_PIXELS)
    private List<Vector2> foodAdd;
    private List<Vector2> boulderAdd;
    private List<Vector2> rippleAdd;
    






    // Use this for initialization
    void Start()
    {
        //using (CvFileStorage fs = new CvFileStorage("KinectCalibration.xml", null, FileStorageMode.Read))
        //{
        //    string nodeName = "calibResult";
        //    CvFileNode param = fs.GetFileNodeByName(null, nodeName);
        //    calibResult = new Mat(fs.Read<CvMat>(param));
        //}
        // Un-mirror the webcam image
        if (FlipLeftRightAxis)
        {
            transform.localScale = new Vector3(-transform.localScale.x,
                           transform.localScale.y, transform.localScale.z);
        }

        if (FlipUpDownAxis)
        {
            transform.localScale = new Vector3(transform.localScale.x,
                                -transform.localScale.y, transform.localScale.z);
        }

        show = new Mat(480, 640, OpenCvSharp.CPlusPlus.MatType.CV_8UC4);

        // Load the cascades
        //haarCascade = CvHaarClassifierCascade.FromFile(Application.dataPath + "/Data/haarcascade_frontalface_default.xml");
        //cascade = new CascadeClassifier(Application.dataPath + "/opencvkinect/Data/haarcascade_frontalface_alt.xml");

        imHeight = KinectWrapper.GetDepthHeight();
        imWidth = KinectWrapper.GetDepthWidth();

        result = new Texture2D(480, 640, TextureFormat.RGBA32, false);
        bg = new Mat(roiH, roiW, MatType.CV_8UC1);
        fg = new Mat(roiH, roiW, MatType.CV_8UC1);
        fgthresh = new Mat(roiH, roiW, MatType.CV_8UC1);
        SimpleBlobDetector.Params blobParam = new SimpleBlobDetector.Params();
        blobParam.MinDistBetweenBlobs = 1.0f;
        blobParam.FilterByInertia = false;
        blobParam.FilterByConvexity = false;
        blobParam.FilterByColor = false;
        blobParam.FilterByCircularity = false;
        blobParam.FilterByArea = true;
        blobParam.MinArea = 500.0f;
        blobParam.MaxArea = 10000.0f;
        blob = new SimpleBlobDetector(blobParam);

        tracks = new OpenCvSharp.Blob.CvTracks();
        blobs = new OpenCvSharp.Blob.CvBlobs();

        foodAdd = new List<Vector2>();
        boulderAdd = new List<Vector2>();
        rippleAdd = new List<Vector2>();

        detectorThread = new Thread(new ThreadStart(DoTracking));
        running = true;
        detectorThread.Start();

    }

    // Find the attached GameObject's position in screen space
    void FindObjectScreenPosition()
    {
        // Update where the object's top left corner is in screen coordinates
        Vector3 offset = Vector3.zero;
        // Make offset the top-left corner of the gameObject
        offset.x = -Mathf.Abs(transform.localScale.x / 2.0f);  // Half of the x scale
        offset.y = Mathf.Abs(transform.localScale.y / 2.0f); // Half of the y scale
        // Convert world position to screen (pixel) position
        // transform.position is the exact center of the gameObject
        Vector3 objectTopLeftScreen = Camera.main.WorldToScreenPoint(transform.position + offset);
        // Screen y axis is flipped of world y axis.
        objectTopLeftScreen.y = Screen.height - objectTopLeftScreen.y;

        Vector3 objectBottomRightScreen = Camera.main.WorldToScreenPoint(transform.position - offset);
        objectBottomRightScreen.y = Screen.height - objectBottomRightScreen.y;

        objectScreenPosition.Set(objectTopLeftScreen.x, objectTopLeftScreen.y,
                          Mathf.Abs(objectTopLeftScreen.x - objectBottomRightScreen.x),
                          Mathf.Abs(objectTopLeftScreen.y - objectBottomRightScreen.y));

    }

    // Converts the ROI (screen coordinates) into world coordinates and
    // positions world gameobject to that position and rotation
    void ROIScreenToGameObject(CvBox2D boxToTrack, GameObject obj1)
    {

        Vector2 origin;
        origin.x = objectScreenPosition.position.x + scaleObjectWidth(boxToTrack.Center.X);
        origin.y = objectScreenPosition.position.y + scaleObjectHeight(boxToTrack.Center.Y);

        obj1.transform.position = Camera.main.ScreenToWorldPoint(new Vector3(origin.x, Screen.height - origin.y,
                                                         Mathf.Abs(transform.position.z - Camera.main.transform.position.z)));


        obj1.transform.eulerAngles = new Vector3(0, 0, 90 - boxToTrack.Angle);
        obj1.transform.localScale = new Vector3(scaleObjectHeight(boxToTrack.Size.Height) / 100,
                                           scaleObjectWidth(boxToTrack.Size.Width) / 100, 1);

    }

    // Convert _outBox.BoxPoints (type CvPoint2D32f) into CvPoint[][] for use
    // in DrawPolyLine
    CvPoint[][] rectangleBoxPoint(CvPoint2D32f[] _box)
    {

        CvPoint[] pts = new CvPoint[_box.Length];
        for (int i = 0; i < _box.Length; i++)
            pts[i] = _box[i];  // Get the box coordinates (CvPoint)

        // Now we've got the 4 corners of the tracking box returned by CamShift
        // in a format that DrawPolyLine can use
        return (new CvPoint[][] { pts });


    }

    // Converts Unity's Rect type to CvRect
    // CVRect has type int and Rect has type float
    CvRect ConvertRect2CvRect(Rect _roi)
    {
        CvRect _cvroi = new CvRect(Mathf.FloorToInt(_roi.x),
                            Mathf.FloorToInt(_roi.y),
                            Mathf.FloorToInt(_roi.width),
                            Mathf.FloorToInt(_roi.height));

        return _cvroi;

    }

    // Determine if pixel box (ROI) is within the bounds of the image
    // Bounds are (0, 0, imWidth, imHeight)
    CvRect CheckROIBounds(CvRect _roi)
    {

        int _x = _roi.X, _y = _roi.Y,
        _width = Mathf.Abs(_roi.Width), _height = Mathf.Abs(_roi.Height);



        if (_roi.X < 0)
        {
            _x = 0;
            Debug.LogWarning("X is outside of image");
        }

        if (_roi.Y < 0)
        {
            _y = 0;
            Debug.LogWarning("Y is outside of image");
        }

        if (_roi.Width < 2)
            _width = 2;
        if (_roi.Height < 2)
            _height = 2;

        if ((_x + _width) > imWidth)
        {
            _width = Mathf.Abs(imWidth - _x);
            Debug.LogWarning("Width is outside of image");
        }

        if ((_y + _height) > imHeight)
        {
            _height = Mathf.Abs(imHeight - _y);
            Debug.LogWarning("Height is outside of image");
        }
        //Debug.Log (new CvRect (_x, _y, _width, _height));

        return new CvRect(_x, _y, _width, _height);
    }

    // Return a region of interest (_rect_roi) from within the image _image
    //  This doesn't need to be its own function, but I had so much trouble
    //  finding a method that didn't crash the program that I separated it.
    CvMat GetROI(CvMat _image, CvRect rect_roi)
    {
        // Get the region of interest
        CvMat img_roi;  // Get the region of interest

        // Grab the region of interest using the mouse-drawn box
        _image.GetSubRect(out img_roi, rect_roi);

        return (img_roi);

    }

    // Convert the Texture2D type of Unity to OpenCV's CvMat
    // This uses Adcock's parallel C# code to parallelize the conversion and make it faster
    // I found the code execution dropped from 180 msec per frame to 70 msec per frame with parallelization
    void Texture2DToMat(Texture2D tex, Mat m)
    {

        //float startTime = Time.realtimeSinceStartup;

        Color[] pixels = tex.GetPixels();

        // Parallel for loop
        Parallel.For(0, imHeight, i =>
        {
            for (var j = 0; j < imWidth; j++)
            {

                var pixel = pixels[j + i * imWidth];
                var col = new CvScalar
                {
                    Val0 = (double)pixel.b * 255,
                    Val1 = (double)pixel.g * 255,
                    Val2 = (double)pixel.r * 255
                };

                m.Set(i, j, col);
            }
        });



        //				CvScalar col;
        //				Color pixel;
        //				int i, j;
        //
        //				// Non-parallelized code
        //				for (i = 0; i < imHeight; i++) {
        //						for (j = 0; j < imWidth; j++) {
        //								pixel = pixels [j + i * imWidth];
        //						
        //								col = new CvScalar
        //								{
        //									Val0 = (double)pixel.b * 255,
        //									Val1 = (double)pixel.g * 255,
        //									Val2 = (double)pixel.r * 255
        //								};
        //				
        //								videoSourceImage.Set2D (i, j, col);
        //						}
        //
        //				}

        // Flip up/down dimension and right/left dimension
        if (!FlipUpDownAxis && FlipLeftRightAxis)
            m.Flip(FlipMode.XY);
        else if (!FlipUpDownAxis)
            m.Flip(FlipMode.X);
        else if (FlipLeftRightAxis)
            m.Flip(FlipMode.Y);

        // Test difference in time between parallel and non-parallel code
        //Debug.Log (Time.realtimeSinceStartup - startTime);

    }


    // The gameObject might not have the same resolution as the webcam image
    // used by OpenCV. So we need to scale the position to the gameObject's resolution
    float scaleObjectHeight(float _height)
    {

        _height = _height / imHeight * objectScreenPosition.height;

        return _height;

    }

    // The gameObject might not have the same resolution as the webcam image
    // used by OpenCV. So we need to scale the position to the gameObject's resolution
    float scaleObjectWidth(float _width)
    {

        _width = _width / imWidth * objectScreenPosition.width;

        return _width;

    }

    // FaceTracking
    void DoTracking()
    {
        while (running)
        {
            try
            {
                if (kinect.GetDepthRaw())
                {
                    lock (this)
                    {
                        Mat src = DoDepthBuffer(kinect.usersDepthMap, KinectWrapper.GetDepthWidth(), KinectWrapper.GetDepthHeight());
                        Mat roi = src.Clone(new OpenCvSharp.CPlusPlus.Rect(roiX,roiY,roiW,roiH));
                        roi.ConvertTo(roi, OpenCvSharp.CPlusPlus.MatType.CV_8U, 255.0f / 32767.5f);
                        Cv2.Subtract(new Mat(roiH, roiW, MatType.CV_8UC1, new Scalar(255)), roi, roi);

                        // Flip up/down dimension and right/left dimension
                        if (!FlipUpDownAxis && FlipLeftRightAxis)
                            roi.Flip(FlipMode.XY);
                        else if (!FlipUpDownAxis)
                            roi.Flip(FlipMode.X);
                        else if (FlipLeftRightAxis)
                            roi.Flip(FlipMode.Y);

                        // Detect faces
                        //OpenCvSharp.CPlusPlus.Rect[] faces = cascade.DetectMultiScale(
                        //    src, 1.08, 2, HaarDetectionType.ScaleImage, new Size(30, 30));

                        //// Render all detected faces
                        //foreach (OpenCvSharp.CPlusPlus.Rect face in faces)
                        //{
                        //    var center = new Point
                        //    {
                        //        X = (int)(face.X + face.Width * 0.5),
                        //        Y = (int)(face.Y + face.Height * 0.5)
                        //    };
                        //    var axes = new Size
                        //    {
                        //        Width = (int)(face.Width * 0.5),
                        //        Height = (int)(face.Height * 0.5)
                        //    };
                        //    Cv2.Ellipse(src, center, axes, 0, 0, 360, new Scalar(255, 0, 255), 4);
                        //}

                        //roi.ConvertTo(show, OpenCvSharp.CPlusPlus.MatType.CV_8UC4);
                        //Mat[] planes = new Mat[4] { roi, roi, roi, roi };
                        if (first)
                        {
                            bg = roi.Clone();
                            bg.Blur(new Size(20, 20));
                            first = false;
                        }
                        fg = bg.Clone();
                        roi.Blur(new Size(20, 20));
                        Cv.Sub((CvMat)roi, (CvMat)bg, (CvMat)fg);
                        fgthresh = fg.Threshold(threshold, 255.0, ThresholdType.Binary);
                        KeyPoint[] bKeypoints = blob.Detect(fgthresh);
                        for (int i = 0; i < bKeypoints.Length; i++)
                        {
                            float X = bKeypoints[i].Pt.X;
                            float Y = bKeypoints[i].Pt.Y;
                            float S = bKeypoints[i].Size;
                            Cv.Circle((CvMat)roi, new CvPoint((int)X, (int)Y), (int)S, new CvScalar(0.0, 0.0, 0.0));
                            CvPoint3D64f realPos = NuiTransformDepthImageToSkeleton((long)X, (long)Y, src.Get<ushort>((int)Y, (int)X));
                            if (realPos.Z < 2.3 && realPos.Z > 1.0)
                            {
                                //Debug.Log("Blob!");
                                foodAdd.Add(new Vector2(X, Y));
                            }
                            else if (realPos.Z > 2.3 && fg.Get<float>((int)Y, (int)X) < 200f)
                            {
                                boulderAdd.Add(new Vector2(X, Y));
                            }
                            else if (realPos.Z < 1.0)
                            {
                                rippleAdd.Add(new Vector2(X, Y));
                            }
                        }
                        
                       
                        ////cvUpdateTracks(blobs, tracks, 10., 5);
                        ////OpenCvSharp.Blob.CvBlobLib.UpdateTracks(blobs, tracks, 10.0, 5);
                        //IplImage showImg = new IplImage(roi.Data);
                        ////IplImage fgthreshImg = new IplImage(480, 480, BitDepth.U8, 1);
                        //IplImage fgthreshImg = new IplImage(fgthresh.Data);
                        //OpenCvSharp.Blob.CvBlobLib.RenderBlobs(blobs,fgthreshImg, showImg, OpenCvSharp.Blob.RenderBlobsMode.Centroid | OpenCvSharp.Blob.RenderBlobsMode.BoundingBox);
                        //fgthresh = new Mat(fgthreshImg);
                        //show = new Mat(showImg);
                        
                        //OpenCvSharp.Blob.CvBlobLib.RenderTracks(tracks, (IplImage)fgthresh, (IplImage)roi, OpenCvSharp.Blob.RenderTracksMode.Id | OpenCvSharp.Blob.RenderTracksMode.BoundingBox);
                        //OpenCvSharp.Blob.CvBlobLib.RenderBlobs()

                        show = roi.Clone();
                    }
                }

            }
            catch (System.Exception e)
            {
                throw e;
            }
        }
    }

    // get a CV_8U matrix from a Kinect depth frame 
    private Mat DoDepthBuffer(ushort[] depthData, int width, int height)
    {

        Mat outp = new Mat(height, width, OpenCvSharp.CPlusPlus.MatType.CV_16U, depthData);
        return outp;
    }

    // Update is called once per frame
    void Update()
    {

        if (show != null)
        {

                        Cv2.ImShow("show",show);
                        Cv2.ImShow("fg", fg);
                        Cv2.ImShow("fgthresh", fgthresh);
                        Cv2.ImShow("bg", bg);
                        //Cv.ShowImage("thres", fgthreshImg);
                        //Cv.ShowImage("show2", showImg);
            if (showDetection)
            {
                
                //Debug.Log(show.Type());
                //Debug.Log((int) show.Total());
                //Debug.Log(show.Total());
                //Debug.Log(show.Channels());
                //Debug.Log(show.ElemSize());
                //Debug.Log((int)show.Total() * show.ElemSize() * show.Channels());
                //int matSize = (int)show.Total() * show.Channels();
                //Debug.Log(matSize);
                //byte[] rColors = new byte[matSize];
                //Marshal.Copy(show.DataStart, rColors, 0, matSize);
                //result.LoadRawTextureData(rColors);
                //result.Apply();
                //ScreenObject.GetComponent<Renderer>().material.mainTexture = result;
            }
            else
            {
                //Destroy(ScreenObject);
            }
        }
        for (int i = 0; i < foodAdd.Count; i++)
        {
            Vector2 fixedPos = (Vector2)foodAdd[i];
            fixedPos.x = fixedPos.x + (float)xAdjust + (Screen.width /2 - 640/2);
            fixedPos.y = (fixedPos.y + (float)yAdjust + (Screen.height / 2 - 480 / 2));
            spawner.GetComponent<Spawner>().SpawnFood(fixedPos);
        }
        foodAdd.Clear();
        for (int i = 0; i < boulderAdd.Count; i++)
        {
            Vector2 fixedPos = (Vector2)boulderAdd[i];
            fixedPos.x = fixedPos.x + (float)xAdjust + (Screen.width / 2 - 640 / 2);
            fixedPos.y = (fixedPos.y + (float)yAdjust + (Screen.height / 2 - 480 / 2));
            boulderAdd[i] = fixedPos;
            
        }
        spawner.GetComponent<Spawner>().SetBoulderPositions(boulderAdd);
        boulderAdd.Clear();
        for (int i = 0; i < rippleAdd.Count; i++)
        {
            Vector2 fixedPos = (Vector2)rippleAdd[i];
            fixedPos.x = fixedPos.x + (float)xAdjust + (Screen.width / 2 - 640 / 2);
            fixedPos.y = (fixedPos.y + (float)yAdjust + (Screen.height / 2 - 480 / 2));
            spawner.GetComponent<Spawner>().SpawnRipple(fixedPos);
        }
        rippleAdd.Clear();
    }

    void OnDestroy()
    {
        if (running)
        {
            running = false;
            detectorThread.Interrupt();
            detectorThread.Join(0);
        }
    }

    private CvPoint3D64f NuiTransformDepthImageToSkeleton(long lDepthX, long lDepthY, ushort usDepthValue)
    {

        //
        //  Depth is in meters in skeleton space.
        //  The depth image pixel format has depth in millimeters shifted left by 3.
        //

        ushort depthVal = (ushort)(usDepthValue >> 3);
        //Debug.Log(depthVal);
        double fSkeletonZ = (double)depthVal;
        //Debug.Log(fSkeletonZ);
        fSkeletonZ /= 1000.0;
        //Debug.Log(fSkeletonZ);

        //
        // Center of depth sensor is at (0,0,0) in skeleton space, and
        // and (width/2,height/2) in depth image coordinates.  Note that positive Y
        // is up in skeleton space and down in image coordinates.
        //

        double fSkeletonX = ((double)lDepthX - (double)KinectWrapper.GetDepthWidth() / 2.0) * NUI_CAMERA_COLOR_NOMINAL_INVERSE_FOCAL_LENGTH_IN_PIXELS * fSkeletonZ;
        double fSkeletonY = -((double)lDepthY - (double)KinectWrapper.GetDepthHeight() / 2.0) * NUI_CAMERA_COLOR_NOMINAL_INVERSE_FOCAL_LENGTH_IN_PIXELS * fSkeletonZ;

        //Debug.Log(lDepthX + " " + lDepthY + " " + usDepthValue + " -> " + fSkeletonX + " " + fSkeletonY + " " + fSkeletonZ);

        //
        // Return the result as a vector.
        //

        CvPoint3D64f v4;
        v4.X = fSkeletonX;
        v4.Y = fSkeletonY;
        v4.Z = fSkeletonZ;
        //v4.w = 1.0f;
        return v4;
    }

}
