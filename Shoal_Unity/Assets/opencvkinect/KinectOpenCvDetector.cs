using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using Rect = UnityEngine.Rect;
using OpenCvSharp;
using OpenCvSharp.CPlusPlus;
using OpenCvSharp.Blob;
using System.Threading;
using System.Runtime.InteropServices;


// Parallel is used to speed up the for loop when converting CvMat to 2D texture
using Uk.Org.Adcock.Parallel;  // Stewart Adcock's implementation of parallel processing 

public class Trak
{
    public int Lifetime;
    public double X;
    public double Y;
    public int Inactive;
    public int Active;
    public int Label;
    public long Id;
    public CvPoint2D64f Centroid;
    public int MinX;
    public int MinY;
    public int MaxX;
    public int MaxY;
    public bool foodArea = false;
    public int targetFoodArea;
    public bool boulder = false;
    public bool fish = false;
    public bool hands = false;
    public bool stoneArea;
    public int targetStoneArea;
    public GameObject targetObject;
    public Vector2 lastFishPos;


}

public class KinectOpenCvDetector : MonoBehaviour
{

    public KinectManagerSimple kinect;
    Thread detectorThread;
    public bool showDetection = true;
    [Range(0.0f, 100.0f)]
    public double smoothBlur = 1.0;
    [Range(1, 10000)]
    public int blobMinArea = 1;
    [Range(1, 10000)]
    public int blobMaxArea = 1;
    public GameObject ScreenObject;
    [Range(0.0f, 255.0f)]
    public double threshold = 7.0;
    [Range(0.0f, 255.0f)]
    public double smThresh = 7.0;
    [Range(-500.0f, 500.0f)]
    public double xAdjust = 0.0;
    [Range(-800.0f, 800.0f)]
    public double yAdjust = 0.0;
    [Range(0, 640)]
    public int roiX = 0;
    [Range(0, 480)]
    public int roiY = 0;
    [Range(0, 640)]
    public int roiW = 640;
    [Range(0, 480)]
    public int roiH = 480;
    [Range(0.0f, 640.0f)]
    public double axisMaskX = 0.0;
    [Range(0.0f, 480.0f)]
    public double axisMaskY = 0.0;
    [Range(0.0f, 640.0f)]
    public double ellipseMaskCenterX = 0.0;
    [Range(0.0f, 480.0f)]
    public double ellipseMaskCenterY = 0.0;
    [Range(0.0f, 360.0f)]
    public double maskAngle = 0.0;
    [Range(0.0f, 360.0f)]
    public double maskStartAngle = 0.0;
    [Range(0.0f, 360.0f)]
    public double maskEndAngle = 0.0;
    [Range(1, 100)]
    public int blobMaxLife = 5;
    [Range(0, 100)]
    public int blobTrackDly = 5;
    [Range(0.0f, 1000.0f)]
    public double blobMinDistance = 10.0;
    [Range(0.0f, 1000.0f)]
    public double boulderThresh = 2.7;
    [Range(0.0f, 10.0f)]
    public double foodAreaDist = 1.7;
    [Range(0.1f, 100.0f)]
    public float handsPeriod = 1.0f;
    [Range(0, 4000)]
    public int srcThreshMin = 0;
    [Range(0, 4000)]
    public int srcThreshMax = 4000;
    [Range(0, 100)]
    public int radiusRemove = 20;
    [Range(0.0f, 1.0f)]
    public double handsThreshold = 0.2;

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
    private Mat src;
    private Mat roi;
    private Mat bg;
    private Mat fg;
    private Mat fgthresh;
    private Mat[][] handsContours;
    private CvMat blobResultImg;
    private bool first = true;
    private SimpleBlobDetector blob;
    private List<Trak> tracks;
    private OpenCvSharp.Blob.CvBlobs blobs;
    public GameObject spawner;
    private Vector2 foodPosA;
    private Vector2 foodPosB;
    private List<Vector2> foodAdd;
    private List<Vector2> boulderAdd;
    private List<Vector2> rippleAdd;
    private long trakCount = 0;
    public KinectProjectorCalibrator calib;



    // Use this for initialization
    void Start()
    {
        // Un-mirror the webcam image
        //if (FlipLeftRightAxis)
        //{
        //    transform.localScale = new Vector3(-transform.localScale.x,
        //                   transform.localScale.y, transform.localScale.z);
        //}

        //if (FlipUpDownAxis)
        //{
        //    transform.localScale = new Vector3(transform.localScale.x,
        //                        -transform.localScale.y, transform.localScale.z);
        //}
        show = new Mat(480, 640, OpenCvSharp.CPlusPlus.MatType.CV_8UC4);

        // Load the cascades
        //haarCascade = CvHaarClassifierCascade.FromFile(Application.dataPath + "/Data/haarcascade_frontalface_default.xml");
        //cascade = new CascadeClassifier(Application.dataPath + "/opencvkinect/Data/haarcascade_frontalface_alt.xml");

        imHeight = KinectWrapper.GetDepthHeight();
        imWidth = KinectWrapper.GetDepthWidth();

        //result = new Texture2D(480, 640, TextureFormat.RGBA32, false);
        bg = new Mat(roiH, roiW, MatType.CV_8UC1);
        fg = new Mat(roiH, roiW, MatType.CV_8UC1);
        fgthresh = new Mat(roiH, roiW, MatType.CV_8UC1);
        //showImg = new IplImage();
        //fgthreshImg = new IplImage();

        tracks = new List<Trak>();
        blobs = new OpenCvSharp.Blob.CvBlobs();

        foodAdd = new List<Vector2>();
        boulderAdd = new List<Vector2>();
        rippleAdd = new List<Vector2>();
        foodPosA = spawner.GetComponent<Spawner>().GetFoodAreaCoordinate(0);
        foodPosB = spawner.GetComponent<Spawner>().GetFoodAreaCoordinate(1);
        //detectorThread = new Thread(new ThreadStart(DoTracking));
        //running = true;
        //detectorThread.Start();
        prepareHandDetector();



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
        //while (running)
        //{
        try
        {
            if (kinect.GetDepthRaw())
            {
                //lock (this)
                //{
                src = DoDepthBuffer(kinect.usersDepthMap, KinectWrapper.GetDepthWidth(), KinectWrapper.GetDepthHeight());
                roi = src.Clone(new OpenCvSharp.CPlusPlus.Rect(roiX, roiY, roiW, roiH));
                roi.ConvertTo(roi, OpenCvSharp.CPlusPlus.MatType.CV_8U, 255.0 / 32000.0);
                Cv2.Subtract(new Mat(roiH, roiW, MatType.CV_8UC1, new Scalar(255)), roi, roi);
                double threshMax = 255.0 - ((255.0 / 32000.0) * ((ushort)srcThreshMax << 3));
                double threshMin = 255.0 - ((255.0 / 32000.0) * ((ushort)srcThreshMin << 3));
                roi = roi.Threshold(threshMin, 255.0, ThresholdType.ToZeroInv);
                roi = roi.Threshold(threshMax, 255.0, ThresholdType.ToZero);
                // Flip up/down dimension and right/left dimension
                if (!FlipUpDownAxis && FlipLeftRightAxis)
                    roi.Flip(FlipMode.XY);
                else if (!FlipUpDownAxis)
                    roi.Flip(FlipMode.X);
                else if (FlipLeftRightAxis)
                    roi.Flip(FlipMode.Y);

                //Apply ellliptical mask
                Mat ellipseMask = new Mat(roi.Rows, roi.Cols, OpenCvSharp.CPlusPlus.MatType.CV_8U, new Scalar(0.0));
                Cv2.Ellipse(ellipseMask, new Point(ellipseMaskCenterX, ellipseMaskCenterY), new Size(axisMaskX, axisMaskY), maskAngle, maskStartAngle, maskEndAngle, new Scalar(255.0), -1);
                Cv2.BitwiseAnd(roi, ellipseMask, roi);
                //Remove noise by morphologyEx
                Mat kernel = Cv2.GetStructuringElement(StructuringElementShape.Ellipse, new Size(3, 3));
                Cv2.MorphologyEx(roi, roi, MorphologyOperation.Open, kernel);
                Cv2.MorphologyEx(roi, roi, MorphologyOperation.Close, kernel);
                //Subtract background
                if (first)
                {
                    bg = roi.Clone();
                    //bg = bg.Blur(new Size(smoothBlur, smoothBlur));
                    first = false;
                }
                fg = bg.Clone();
                //roi = roi.Blur(new Size(smoothBlur, smoothBlur));
                Mat subMask = roi.Clone();
                subMask = subMask.Threshold(smThresh, 255.0, ThresholdType.ToZero);
                //Cv2.ImShow("sm",subMask);
                bg.CopyTo(roi, subMask);
                OpenCvSharp.Cv.AbsDiff(roi.ToCvMat(), bg.ToCvMat(), fg.ToCvMat());
                //Threshold foreground image
                fgthresh = fg.Threshold(threshold, 255.0, ThresholdType.Binary);
                fgthresh = fgthresh.Blur(new Size(smoothBlur, smoothBlur));
                //Detect Blobs
                Mat roiToImg = new Mat(roi.Cols, roi.Rows, MatType.CV_8UC3);
                Mat threshToImg = fgthresh.Clone();
                Cv2.Merge(new Mat[] { roi, roi, roi }, roiToImg);
                IplImage showImg = roiToImg.ToIplImage();
                IplImage fgthreshImg = threshToImg.ToIplImage();
                OpenCvSharp.Blob.CvBlobLib.Label(fgthreshImg, blobs);
                OpenCvSharp.Blob.CvBlobLib.FilterByArea(blobs, blobMinArea, blobMaxArea);
                OpenCvSharp.Blob.CvBlobLib.RenderBlobs(blobs, fgthreshImg, showImg, RenderBlobsMode.Color | RenderBlobsMode.Centroid);
                UpdateTracks(blobs, tracks, blobMinDistance, blobMaxLife);
                //OpenCvSharp.Blob.CvBlobLib.RenderTracks(tracks, fgthreshImg, showImg, RenderTracksMode.BoundingBox | RenderTracksMode.Id);
                RenderTracks(showImg);
                Cv.ShowImage("thres", fgthreshImg);
                Cv.ShowImage("showBlob", showImg);
                //Check Blob Actions
                //Debug.Log(tracks.Count);

                //}
            }


        }
        catch (System.Exception e)
        {
            //throw e;
            Debug.Log(e.Message + " " + e.StackTrace);
        }
        //}
    }
    private void UpdateTracks(CvBlobs blobs, List<Trak> tracks, double minDist, int maxLife)
    {

        ArrayList matched = new ArrayList();
        List<int> enter = new List<int>();
        List<int> end = new List<int>();
        List<int> active = new List<int>();

        foreach (var blob in blobs)
        {
            Vector2 blobPos = TransformKinectToScreenPos(new Vector2((float)blob.Value.Centroid.X, (float)(blob.Value.Centroid.Y)));
            float distanceFromCenter = Vector2.Distance(blobPos, new Vector2(Screen.width / 2, Screen.height / 2));

            if (distanceFromCenter < ((Screen.height / 2) - radiusRemove))//check Centroid is inside Pond Bounds
            {
                //Debug.Log("Inbounds");
                bool tracked = false;
                double minFound = 1000.0;
                Trak closest = new Trak();

                //Find if blob is being tracked
                foreach (Trak track in tracks)
                {

                    double distance = Vector2.Distance(new Vector2((float)blob.Value.Centroid.X, (float)blob.Value.Centroid.Y), new Vector2((float)track.X, (float)track.Y));
                    if (distance < minDist)
                    {
                        //Debug.Log("Found Closest");

                        tracked = true;
                        if (distance < minFound)
                        {
                            closest = track;
                            minFound = distance;
                        }
                    }
                }
                if (tracked)
                {
                    //Debug.Log("updating tracked");

                    //Ok it is tracked! do your stuff blob!
                    closest.Active++;
                    closest.Inactive = 0;
                    closest.Lifetime++;
                    closest.Label = blob.Key;
                    closest.X = blob.Value.Centroid.X;
                    closest.Y = blob.Value.Centroid.Y;
                    closest.Centroid = blob.Value.Centroid;
                    closest.MaxX = blob.Value.MaxX;
                    closest.MaxY = blob.Value.MaxY;
                    closest.MinX = blob.Value.MinX;
                    closest.MinY = blob.Value.MinY;
                    matched.Add(closest.Id);
                    tracked = true;
                    active.Add((int)closest.Id);
                    //break;
                }
                else
                {
                    //Debug.Log("New track");

                    //Blob Is not tracked? create new trak
                    trakCount++;
                    Trak track = new Trak();
                    track.Active = 1;
                    track.Inactive = 0;
                    track.Lifetime = 1;
                    track.Label = blob.Key;
                    track.X = blob.Value.Centroid.X;
                    track.Y = blob.Value.Centroid.Y;
                    track.Centroid = blob.Value.Centroid;
                    track.MaxX = blob.Value.MaxX;
                    track.MaxY = blob.Value.MaxY;
                    track.MinX = blob.Value.MinX;
                    track.MinY = blob.Value.MinY;
                    track.Id = trakCount;
                    tracks.Add(track);
                    enter.Add((int)track.Id);
                }
            }
        }
        for (int i = 0; i < tracks.Count; i++)
        {
            Trak track = (Trak)tracks[i];
            if (matched.IndexOf(track.Id) == -1)
            {
                if (track.Inactive >= maxLife)
                {
                    //Tracked object left, this track is leaving
                    end.Add((int)track.Id);
                }
                else
                {
                    //this track was not matched, let's wait maxLife frames
                    track.Active = 0;
                    track.Inactive++;
                    track.Lifetime++;
                }
            }
        }
        foreach (StoneArea stoneArea in Spawner.Instance.stoneAreas)
        {
            bool toOpen = false;

            for (int i = 0; i < tracks.Count; i++)
            {
                Trak track = tracks[i];
                if (track.Active > 0)
                {
                    Vector2 blobPos = TransformKinectToScreenPos(new Vector2((float)track.X, (float)(track.Y)));
                    if (Vector2.Distance(blobPos, stoneArea.GetPositionOnScreen()) < Screen.height * foodAreaDist)
                    {
                        track.stoneArea = true;
                        toOpen = true;
                        break;
                    }
                    else
                    {
                        track.stoneArea = false;
                    }
                }

            }
            stoneArea.GoActivate(toOpen);
        }
        foreach (FoodArea foodArea in Spawner.Instance.foodAreas)
        {
            bool toOpen = false;

            for (int i = 0; i < tracks.Count; i++)
            {
                Trak track = tracks[i];
                if (tracks[i].Active > 0)
                {
                    Vector2 blobPos = TransformKinectToScreenPos(new Vector2((float)track.X, (float)(track.Y)));
                    if (Vector2.Distance(blobPos, foodArea.GetPositionOnScreen()) < Screen.height * foodAreaDist)
                    {
                        track.foodArea = true;
                        toOpen = true;
                        break;
                    }
                    else
                    {
                        track.foodArea = false;
                    }
                }

            }
            foodArea.GoActivate(toOpen);
        }
        foreach (int id in active)
        {
            //Debug.Log(id);
            int idt = id;
            OnBlobActive(idt);
        }
        foreach (int id in end)
        {
            //Debug.Log(id);
            int idt = id;
            OnBlobExit(idt);
        }
        foreach (int id in enter)
        {
            //Debug.Log(id);
            int idt = id;
            OnBlobEnter(idt);
        }

    }
    private void OnBlobEnter(int idt)
    {
        Trak rT = tracks.Find(x => x.Id.Equals((long)idt));
        CvBlob cBlob = blobs[rT.Label];
        Vector2 blobPos = TransformKinectToScreenPos(new Vector2((float)cBlob.Centroid.X, (float)(cBlob.Centroid.Y)));
        Debug.Log("Blob Entered " + cBlob.Label);
        //Vector2 foodPosA = spawner.GetComponent<Spawner>().GetFoodAreaCoordinate(0);
        //Vector2 foodPosB = spawner.GetComponent<Spawner>().GetFoodAreaCoordinate(1);
        //float distTofoodA = Vector2.Distance(foodPosA / (float)Screen.height, blobPos / (float)Screen.height);
        //float distTofoodB = Vector2.Distance(foodPosB / (float)Screen.height, blobPos / (float)Screen.height);
        //if (distTofoodA < foodAreaDist || distTofoodB < foodAreaDist)
        //{
        //    rT.foodArea = true;
        //    //Debug.Log("Got foodArea");
        //}
        //else
        //{
        ////    //Get depth of Blob
        ////    ////Find brightest
        ////    //Mat blobroi = new Mat(fg, cBlob.Rect);
        ////    //double minVal = new double();
        ////    //double maxVal = new double();
        ////    //int minIdx = new int();
        ////    //int maxIdx = new int();
        ////    //Cv2.MinMaxIdx(blobroi, out minVal, out maxVal, out minIdx, out maxIdx);
        ////    //Size brightSize;
        ////    //Point ofset;
        ////    //blobroi.LocateROI(out brightSize, out ofset);
        ////    //int maxPointX = ofset.X + (maxIdx % blobroi.Cols) + 1;
        ////    //int maxPointY = ofset.Y + (maxIdx % blobroi.Rows) + 1;
        ////    //CvPoint3D64f sPoint = calib.NuiTransformDepthImageToSkeleton((long)maxPointX, (long)maxPointY, src.At<ushort>(maxPointY, maxPointX));
        ////    CvPoint3D64f sPoint = calib.NuiTransformDepthImageToSkeleton((long)cBlob.Centroid.X, (long)cBlob.Centroid.Y, src.At<ushort>((int)cBlob.Centroid.Y, (int)cBlob.Centroid.X));
        ////    //Debug.Log(maxIdx + " " + ofset.X + " " + ofset.Y + " " + maxPointX + " " + maxPointY);
        ////    //&& ( maxVal == fg.At<int>((int)cBlob.Centroid.X, (int)cBlob.Centroid.)
        ////     float distanceFromCenter = Vector2.Distance(blobPos, new Vector2(Screen.width / 2, Screen.height / 2));
        ////     if (sPoint.Z > boulderThresh && distanceFromCenter < 5.0f)
        ////    {
        ////        boulderAdd.Add(new Vector2((float)cBlob.Centroid.X, (float)cBlob.Centroid.Y));
        ////        Debug.Log("Is boulder?: " + sPoint.Z + " " + boulderThresh);
        ////        rT.boulder = true;
        ////        rT.targetObject = spawner.GetComponent<Spawner>().SpawnBoulder(blobPos);
        ////        Debug.Log("Got Boulder");
        ////    }
        //    StoneArea[] sareas = spawner.GetComponent<Spawner>().stoneAreas;
        //    for (int i = 0; i < sareas.Length; i++)
        //    {
        //        StoneArea curS = sareas[i];
        //        float distToStone = Vector2.Distance(curS.GetPositionOnScreen() / (float)Screen.height, blobPos / (float)Screen.height);
        //        if(distToStone < foodAreaDist )
        //        {
        //            rT.stoneArea = true;
        //        }
        //    }

        if (!rT.stoneArea || !rT.foodArea)
        {
            rT.targetObject = spawner.GetComponent<Spawner>().SpawnRipple(blobPos);
            Debug.Log("Got Ripple");
        }

        //}
    }

    private void OnBlobActive(int idt)
    {
        Trak rT = tracks.Find(x => x.Id.Equals((long)idt));
        CvBlob cBlob = blobs[rT.Label];
        Vector2 blobPos = TransformKinectToScreenPos(new Vector2((float)cBlob.Centroid.X, (float)(cBlob.Centroid.Y)));
        //if (rT.boulder)
        //{
        //    spawner.GetComponent<Spawner>().SetPositionFromScreenCoord(rT.targetObject, blobPos);
        //    //Debug.Log("Setting BoulderPos: " + (float)blobPos.x + " " + (float)blobPos.y);
        //}
        //else if (rT.foodArea)
        //{
        //    float distTofoodA = Vector2.Distance(foodPosA / (float)Screen.height, blobPos / (float)Screen.height);
        //    float distTofoodB = Vector2.Distance(foodPosB / (float)Screen.height, blobPos / (float)Screen.height);
        //    if (distTofoodA < 0.2f)
        //    {
        //        rT.foodArea = true;
        //        rT.targetFoodArea = 0;
        //        spawner.GetComponent<Spawner>().ActivateFoodArea(true, 0);
        //        Debug.Log("Got foodArea");
        //    }
        //    else
        //    {
        //        rT.foodArea = false;
        //        spawner.GetComponent<Spawner>().ActivateFoodArea(false, 0);
        //        Debug.Log("Exit foodArea");
        //    }
        //    if (distTofoodB < 0.2f)
        //    {
        //        rT.foodArea = true;
        //        rT.targetFoodArea = 1;
        //        spawner.GetComponent<Spawner>().ActivateFoodArea(true, 1);
        //        Debug.Log("Got foodArea");
        //    }
        //    else
        //    {
        //        rT.foodArea = false;
        //        spawner.GetComponent<Spawner>().ActivateFoodArea(false, 1);
        //        Debug.Log("Exit foodArea");
        //    }
        //}
        //else if (rT.stoneArea)
        //{
        //    StoneArea[] sareas = spawner.GetComponent<Spawner>().stoneAreas;
        //    for (int i = 0; i < sareas.Length; i++)
        //    {
        //        StoneArea curS = sareas[i];
        //        float distToStone = Vector2.Distance(curS.GetPositionOnScreen() / (float)Screen.height, blobPos / (float)Screen.height);
        //        if (distToStone < foodAreaDist)
        //        {
        //            rT.stoneArea = true;
        //            rT.targetStoneArea = i;
        //            spawner.GetComponent<Spawner>().ActivateStoneArea(true, i);

        //        }
        //        else {
        //            rT.stoneArea = true;
        //            rT.targetStoneArea = i;
        //            spawner.GetComponent<Spawner>().ActivateStoneArea(false, i);
        //        }
        //    }
        //}
        //else 
        if (rT.hands)
        {
            //Debug.Log("DIS: "+Vector2.Distance(rT.lastFishPos, blobPos) );
            if (Vector2.Distance(rT.lastFishPos, blobPos) > 50.0f)
            {
                Debug.Log("Exit Move");
                OnBlobExit(rT.Label);
            }
            else {
                rT.targetObject.GetComponent<SpawningFishBehaviour>().SetCircleCenterCloserToCenter(blobPos);
                rT.lastFishPos = blobPos;
            }
                    
        }
        else if (Time.frameCount % handsPeriod == 0 && DetectHands(cBlob))
        {
            //Check if it is hands
            if (!rT.hands)
            {
                Debug.Log("Hands!");
                rT.hands = true;
                rT.lastFishPos = blobPos;
                rT.targetObject = spawner.GetComponent<Spawner>().SpawnFishCloserToCenter(blobPos);
            }
        }
       
        //Debug.Log("Blob Enter " + blobLabel);

    }
    private void OnBlobExit(int idt)
    {
        Trak rT = tracks.Find(x => x.Id.Equals((long)idt));
        if (rT.boulder)
        {
            Destroy(rT.targetObject);
        }
        else if (rT.hands)
        {
            rT.targetObject.GetComponent<Fish>().ExitSpawningMode();
        }
        else if (rT.foodArea)
        {
            spawner.GetComponent<Spawner>().ActivateFoodArea(false, rT.targetFoodArea);
        }
        Debug.Log("Blob Exited " + rT.Id);
        tracks.Remove(rT);
    }

    void RenderTracks(IplImage imgDest)
    {
        foreach (Trak track in tracks)
        {

            CvFont font = new CvFont(FontFace.HersheyDuplex, 0.5, 0.5, 0, 1);
            if (track.Inactive == 0)
            {
                Cv.PutText(imgDest, track.Label.ToString(), track.Centroid, font, CvColor.Green);
            }

            if (track.Inactive > 0)
                Cv.Rectangle(
                    imgDest,
                    new CvPoint(track.MinX, track.MinY),
                    new CvPoint(track.MaxX - 1, track.MaxY - 1),
                    new CvColor(0, 0, 50));
            else
                Cv.Rectangle(
                    imgDest,
                    new CvPoint(track.MinX, track.MinY),
                    new CvPoint(track.MaxX - 1, track.MaxY - 1),
                    new CvColor(0, 0, 255));
        }

    }
    // get a CV_8U matrix from a Kinect depth frame 
    private Mat DoDepthBuffer(ushort[] depthData, int width, int height)
    {

        Mat outp = new Mat(height, width, OpenCvSharp.CPlusPlus.MatType.CV_16U, depthData);
        // Flip up/down dimension and right/left dimension
        if (!FlipUpDownAxis && FlipLeftRightAxis)
            outp = outp.Flip(FlipMode.XY);
        else if (!FlipUpDownAxis)
            outp = outp.Flip(FlipMode.X);
        else if (FlipLeftRightAxis)
            outp = outp.Flip(FlipMode.Y);
        return outp;
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.P))
        {
            first = true;
        }
        DoTracking();
        if (show != null)
        {

            Cv2.ImShow("bg", bg);
            //Cv2.ImShow("show", show);
            Cv2.ImShow("fg", fg);
            //Cv2.ImShow("fgthresh", fgthresh);

        }
    }

    void OnDestroy()
    {
        //if (running)
        //{
        //    running = false;
        //    detectorThread.Interrupt();
        //    detectorThread.Join(0);
        //}
        Cv2.DestroyAllWindows();
    }


    Vector2 TransformKinectToScreenPos(Vector2 Pos)
    {

        try
        {

            CvPoint3D64f skPoint = calib.NuiTransformDepthImageToSkeleton((long)Pos.x, (long)Pos.y, src.Get<ushort>((int)Pos.y, (int)Pos.x));
            //Debug.Log(Pos.x + " " + Pos.y + " Kinect-->skPoint " + skPoint.X + " " + skPoint.Y + " " + skPoint.Z);
            CvPoint2D64f projPoint = calib.convertKinectToProjector(skPoint);
            //Debug.Log(skPoint.X + " " + skPoint.Y + " " + skPoint.Z + " SkPoint-->Projector " + projPoint.X + " " + projPoint.Y);
            return new Vector2((int)projPoint.X, Screen.height - (int)projPoint.Y);

        }
        catch (System.Exception e)
        {
            throw e;
        }

    }


    void prepareHandDetector()
    {
        try
        {
            Mat kernel = Cv2.GetStructuringElement(StructuringElementShape.Ellipse, new Size(5, 5));
            string path1 = Application.dataPath + "/../1.png";
            string path2 = Application.dataPath + "/../2.png";
            string path3 = Application.dataPath + "/../3.png";
            string path4 = Application.dataPath + "/../4.png";
            Mat src1 = new Mat(path1, LoadMode.GrayScale);
            Mat src2 = new Mat(path2, LoadMode.GrayScale);
            Mat src3 = new Mat(path3, LoadMode.GrayScale);
            Mat src4 = new Mat(path4, LoadMode.GrayScale);
            Cv2.MorphologyEx(src1, src1, MorphologyOperation.Open, kernel);
            Cv2.MorphologyEx(src1, src1, MorphologyOperation.Close, kernel);
            Cv2.MorphologyEx(src2, src2, MorphologyOperation.Open, kernel);
            Cv2.MorphologyEx(src2, src2, MorphologyOperation.Close, kernel);
            Cv2.MorphologyEx(src3, src3, MorphologyOperation.Open, kernel);
            Cv2.MorphologyEx(src3, src3, MorphologyOperation.Close, kernel);
            Cv2.MorphologyEx(src4, src4, MorphologyOperation.Open, kernel);
            Cv2.MorphologyEx(src4, src4, MorphologyOperation.Close, kernel);
            Cv2.Blur(src1, src1, new Size(5, 5));
            Cv2.Blur(src2, src2, new Size(5, 5));
            Cv2.Blur(src3, src3, new Size(5, 5));
            Cv2.Blur(src4, src4, new Size(5, 5));
            //Detect edges using canny
            //double cthresh = 0.0;
            //Cv2.Canny(src1, src1, cthresh, cthresh * 2, 3, true);
            //Cv2.Canny(src2, src2, cthresh, cthresh * 2, 3, true);
            //Cv2.Canny(src3, src3, cthresh, cthresh * 2, 3, true);
            //Cv2.Canny(src4, src4, cthresh, cthresh * 2, 3, true);
            Mat[] contoursA;
            OutputArray hierarchyA = InputOutputArray.Create(new List<Vec4i>());
            src1.FindContours(out contoursA, hierarchyA, OpenCvSharp.ContourRetrieval.CComp, OpenCvSharp.ContourChain.ApproxTC89KCOS);
            Mat[] contoursB;
            OutputArray hierarchyB = InputOutputArray.Create(new List<Vec4i>());
            src2.FindContours(out contoursB, hierarchyB, OpenCvSharp.ContourRetrieval.CComp, OpenCvSharp.ContourChain.ApproxTC89KCOS);
            Mat[] contoursC;
            OutputArray hierarchyC = InputOutputArray.Create(new List<Vec4i>());
            src3.FindContours(out contoursC, hierarchyC, OpenCvSharp.ContourRetrieval.CComp, OpenCvSharp.ContourChain.ApproxTC89KCOS);
            Mat[] contoursD;
            OutputArray hierarchyD = InputOutputArray.Create(new List<Vec4i>());
            src4.FindContours(out contoursD, hierarchyD, OpenCvSharp.ContourRetrieval.CComp, OpenCvSharp.ContourChain.ApproxTC89KCOS);
            handsContours = new Mat[][] { contoursA, contoursB, contoursC, contoursD };
            Cv2.ImShow("1", src1);
            Cv2.ImShow("2", src2);
            Cv2.ImShow("3", src3);
            Cv2.ImShow("4", src4);
            //Debug.Log(src1.Channels() + " " + src1.Depth() + " " + src1.Channels() + " " + src2.Depth());

            ///// Find contours
            //Mat[] contours = new Mat[]();
            //CvMemStorage storage = new CvMemStorage();
            //src1.FindContours(out contours, storage, ContourRetrieval.Tree, ContourChain.ApproxSimple);
            //contours = contours.ApproxPoly(storage, ApproxPolyMethod.DP, 3, true);

            //SURF sift = new SURF(0.1, 4, 2, true, false);
            // Detect the keypoints and generate their descriptors using SIFT
            //KeyPoint[] keypoints1, keypoints2;
            //MatOfFloat descriptors1 = new MatOfFloat();
            //MatOfFloat descriptors2 = new MatOfFloat();

            //sift.Run(gray1, null, out keypoints1, descriptors1);
            //sift.Run(gray2, null, out keypoints2, descriptors2);

            // Detect the keypoints and generate their descriptors using SIFT
            //Cv2.InitModule_NonFree();
            //SIFT sift = new SIFT();

            //KeyPoint[] keypoints1, keypoints2;
            //MatOfFloat descriptors1 = new MatOfFloat();
            //MatOfFloat descriptors2 = new MatOfFloat();
            //sift.Run(src1, null, out keypoints1, descriptors1);
            //sift.Run(src2, null, out keypoints2, descriptors2);

            //// Matching descriptor vectors with a brute force matcher
            //BFMatcher matcher = new BFMatcher(NormType.L2, false);
            //DMatch[] matches = matcher.Match(descriptors1, descriptors2);

            //// Draw matches
            //Mat view = new Mat();
            //Cv2.DrawMatches(src1, keypoints1, src2, keypoints2, matches, view);
            //Cv2.ImShow("SIFT-BF",view);

            //// Match descriptor vectors FLANN
            //FlannBasedMatcher flannMatcher = new FlannBasedMatcher();
            //matches = flannMatcher.Match(descriptors1, descriptors2);

            //// Draw matches
            //Mat siftflann = new Mat();
            //Cv2.DrawMatches(src1, keypoints1, src2, keypoints2, matches, siftflann);
            //Cv2.ImShow("Sift-flann", siftflann);

            ////////SURF
            //// Detect the keypoints and generate their descriptors using SURF
            //SURF surf = new SURF(300, 4, 2, false);

            //surf.Run(src1, null, out keypoints1, descriptors1);
            //surf.Run(src2, null, out keypoints2, descriptors2);

            //// Matching descriptor vectors with a brute force matcher
            //matcher = new BFMatcher(NormType.L2, false);
            //matches = matcher.Match(descriptors1, descriptors2);

            //// Draw matches
            //Mat view2 = new Mat();
            //Cv2.DrawMatches(src1, keypoints1, src2, keypoints2, matches, view2);
            //Cv2.ImShow("Surf-BF", view2);


            //// Match descriptor vectors FLANN
            //flannMatcher = new FlannBasedMatcher();
            //matches = flannMatcher.Match(descriptors1, descriptors2);

            //// Draw matches
            //Mat flannView = new Mat();
            //Cv2.DrawMatches(src1, keypoints1, src2, keypoints2, matches, flannView);

            //Cv2.ImShow("Surf-flann", flannView);


        }
        catch (System.Exception e)
        {
            throw e;
        }


    }
    bool DetectHands(CvBlob blob)
    {
        double cthresh = 0.0;
        Mat blobMat = new Mat(fgthresh, blob.Rect);
        Cv2.Blur(blobMat, blobMat, new Size(5, 5));
        //Cv2.Canny(blobMat, blobMat, cthresh, cthresh * 2, 3);
        Mat[] contoursQuery;
        OutputArray hierarchyQ = InputOutputArray.Create(new List<Vec4i>());
        blobMat.FindContours(out contoursQuery, hierarchyQ, OpenCvSharp.ContourRetrieval.CComp, OpenCvSharp.ContourChain.ApproxTC89KCOS);
        double scoreTotal = 0.0;
        double tested = 0.0;
        foreach (var modelContours in handsContours)
        {
            foreach (var contourToMatch in contoursQuery)
            {
                foreach (var contourB in modelContours)
                {
                        double ratio = Cv2.MatchShapes(contourToMatch, contourB, MatchShapesMethod.I1);
                        //Debug.Log("Matching: " + ratio + " " + contourB.IsContourConvex() + " " + contourToMatch.IsContourConvex() );
                        //if (ratio > 0.0000001)
                        //{
                            scoreTotal += ratio;
                            tested++;
                        //}

                }
            }
        }
        scoreTotal /= tested;
        //Debug.Log(scoreTotal);
        if (scoreTotal > 0.0000001 && scoreTotal <= handsThreshold)
        {
            return true;
        }else{
            return false;
        }
        
    }



}