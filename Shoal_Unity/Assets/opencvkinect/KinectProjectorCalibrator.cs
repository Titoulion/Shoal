using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using System.Collections;
using System.Collections.Generic;
using Rect = UnityEngine.Rect;
using OpenCvSharp;
using OpenCvSharp.CPlusPlus;
using System.Threading;
using System.Runtime.InteropServices;



public class KinectProjectorCalibrator : MonoBehaviour
{

    public KinectManagerSimple kinect;
    public GameObject ScreenObject;
    public GameObject ResultObject;
    UnityEngine.Rect objectScreenPosition = new Rect(0, 0, 1, 1);
    // Flip the video source axes (webcams are usually mirrored)
    // Unity and OpenCV images are flipped
    public bool FlipUpDownAxis = false, FlipLeftRightAxis = true;
    public double projThresh = 2.0;

    private int imWidth;  // Input devices image width
    private int imHeight;  // Input devices image height 
    private Mat show;
    private ArrayList kinectCoordinates = new ArrayList();
    private ArrayList projectorCoordinates = new ArrayList();
    private Texture2D scTex;
    private Texture2D screenTx;
    private Mat dBuffer;
    private bool addedKinectPoint;
    private bool addedProjectorPoint;
    private bool showResult = false;
    private bool foundResult = false;
    private Color32[] resetPixels;
    private bool nextBt = false;

    //private static double NUI_CAMERA_COLOR_NOMINAL_FOCAL_LENGTH_IN_PIXELS = (531.15);   // Based on 640x480 pixel size.
    //private static double NUI_CAMERA_COLOR_NOMINAL_INVERSE_FOCAL_LENGTH_IN_PIXELS = (1.83e-3);  // (1/NUI_CAMERA_COLOR_NOMINAL_FOCAL_LENGTH_IN_PIXELS)
    //private static double NUI_CAMERA_COLOR_NOMINAL_DIAGONAL_FOV = (73.9);
    //private static double NUI_CAMERA_COLOR_NOMINAL_HORIZONTAL_FOV = (62.0);
    //private static double NUI_CAMERA_COLOR_NOMINAL_VERTICAL_FOV = (48.6);
    private static double NUI_CAMERA_DEPTH_NOMINAL_FOCAL_LENGTH_IN_PIXELS = (285.63);   // Based on 320x240 pixel size.
    private static float NUI_CAMERA_DEPTH_NOMINAL_INVERSE_FOCAL_LENGTH_IN_PIXELS = (3.501e-3f); // (1/NUI_CAMERA_DEPTH_NOMINAL_FOCAL_LENGTH_IN_PIXELS)
    private static double NUI_CAMERA_DEPTH_NOMINAL_DIAGONAL_FOV = (70.0);
    private static double NUI_CAMERA_DEPTH_NOMINAL_HORIZONTAL_FOV = (58.5);
    private static double NUI_CAMERA_DEPTH_NOMINAL_VERTICAL_FOV = (45.6);

    //#define NUI_CAMERA_COLOR_NOMINAL_FOCAL_LENGTH_IN_PIXELS         (531.15f)   // Based on 640x480 pixel size.
    //#define NUI_CAMERA_COLOR_NOMINAL_INVERSE_FOCAL_LENGTH_IN_PIXELS (1.83e-3f)  // (1/NUI_CAMERA_COLOR_NOMINAL_FOCAL_LENGTH_IN_PIXELS)
    //#define NUI_CAMERA_COLOR_NOMINAL_DIAGONAL_FOV                   ( 73.9f)
    //#define NUI_CAMERA_COLOR_NOMINAL_HORIZONTAL_FOV                 ( 62.0f)
    //#define NUI_CAMERA_COLOR_NOMINAL_VERTICAL_FOV                   ( 48.6f)
    private static int NUI_IMAGE_PLAYER_INDEX_SHIFT = 3;
    private static int NUI_IMAGE_PLAYER_INDEX_MASK = ((1 << NUI_IMAGE_PLAYER_INDEX_SHIFT) - 1);
    private static long NUI_IMAGE_DEPTH_MAXIMUM = ((4000 << NUI_IMAGE_PLAYER_INDEX_SHIFT) | NUI_IMAGE_PLAYER_INDEX_MASK);
    private static long NUI_IMAGE_DEPTH_MINIMUM = (800 << NUI_IMAGE_PLAYER_INDEX_SHIFT);

    /**
     * The system of linear equations is X*A = B
     * X: Vector of unknown variables q1..q11 (result)
     * A: Matrix of coefficients of the system (foundCoordinatesMatrix)
     * B: Right side matrix
     */

    Mat foundCoordinatesMatrix;
    Mat rightSideMatrix;
    Mat result;

    private const int MINIMUM_POINTS = 8;
    /** Solves system of linear equations -> finds coefficients of transformation (these are variables of linear equations) from kinect to the projector point.
    *
    */
    public void findTransformation(ArrayList kinectCoors, ArrayList projectorCoors)
    {
        prepareMatrices(kinectCoors, projectorCoors);
        //QRDecomposition problem = new QRDecomposition(foundCoordinatesMatrix);
        //result = problem.solve(rightSideMatrix);
        if (Cv2.Solve(foundCoordinatesMatrix, rightSideMatrix, result, OpenCvSharp.CPlusPlus.MatrixDecomposition.QR))
        {
            Debug.Log("Found Result: " + result.Get<double>(0, 0).ToString() + " " + result.Get<double>(0, 1) + " " + result.Get<double>(0, 2) + " " + result.Get<double>(0, 3) + " " + result.Get<double>(0, 4) + " " + result.Get<double>(0, 5) + " " + result.Get<double>(0, 6) + " " + result.Get<double>(0, 7) + " " + result.Get<double>(0, 8) + " " + result.Get<double>(0, 9) + " " + result.Get<double>(0, 10));
        }
        else
        {
            Debug.Log("Problem solving");
        }
    }

    private void prepareMatrices(ArrayList kinectCoors, ArrayList projectorCoors)
    {
        foundCoordinatesMatrix = new Mat(projectorCoors.Count * 2, 11, OpenCvSharp.CPlusPlus.MatType.CV_64FC1);
        rightSideMatrix = new Mat(projectorCoors.Count * 2, 1, OpenCvSharp.CPlusPlus.MatType.CV_64FC1);
        for (int i = 0; i < projectorCoors.Count * 2; i = i + 2)
        {
            OpenCvSharp.CvPoint3D64f kc = (OpenCvSharp.CvPoint3D64f)kinectCoors[i / 2];
            OpenCvSharp.CvPoint2D64f projC = (OpenCvSharp.CvPoint2D64f)projectorCoors[i / 2];
            foundCoordinatesMatrix.Set(i, 0, kc.X);
            foundCoordinatesMatrix.Set(i, 1, kc.Y);
            foundCoordinatesMatrix.Set(i, 2, kc.Z);
            foundCoordinatesMatrix.Set(i, 3, 1);
            foundCoordinatesMatrix.Set(i, 4, 0);
            foundCoordinatesMatrix.Set(i, 5, 0);
            foundCoordinatesMatrix.Set(i, 6, 0);
            foundCoordinatesMatrix.Set(i, 7, 0);
            foundCoordinatesMatrix.Set(i, 8, -projC.X * kc.X);
            foundCoordinatesMatrix.Set(i, 9, -projC.X * kc.Y);
            foundCoordinatesMatrix.Set(i, 10, -projC.X * kc.Z);
            rightSideMatrix.Set(i, 0, projC.X);

            foundCoordinatesMatrix.Set(i + 1, 0, 0);
            foundCoordinatesMatrix.Set(i + 1, 1, 0);
            foundCoordinatesMatrix.Set(i + 1, 2, 0);
            foundCoordinatesMatrix.Set(i + 1, 3, 0);
            foundCoordinatesMatrix.Set(i + 1, 4, kc.X);
            foundCoordinatesMatrix.Set(i + 1, 5, kc.Y);
            foundCoordinatesMatrix.Set(i + 1, 6, kc.Z);
            foundCoordinatesMatrix.Set(i + 1, 7, 1);
            foundCoordinatesMatrix.Set(i + 1, 8, -projC.Y * kc.X);
            foundCoordinatesMatrix.Set(i + 1, 9, -projC.Y * kc.Y);
            foundCoordinatesMatrix.Set(i + 1, 10, -projC.Y * kc.Z);
            rightSideMatrix.Set(i + 1, 0, projC.Y);
        }
    }

    public CvPoint2D64f convertKinectToProjector(OpenCvSharp.CvPoint3D64f kinectPoint)
    {
        CvPoint2D64f outp = new CvPoint2D64f();
        //Debug.Log("In: " + kinectPoint.X + " " +kinectPoint.Y + " " +kinectPoint.Z);
        //xp = (q1*xk + q2*yk + q3*zk + q4)/(q9*xk + q10*yk + q11*zk + 1)
        //outp.X = (result.get(0,0)*kinectPoint.x + result.get(0,1)*kinectPoint.y + result.get(0,2)*kinectPoint.z + result.get(0,3))/
        //        (result.get(0,8)*kinectPoint.x + result.get(0,9)*kinectPoint.y + result.get(0,10)*kinectPoint.z + 1);        
        outp.X = ((result.Get<double>(0, 0) * kinectPoint.X) + (result.Get<double>(0, 1) * kinectPoint.Y) + (result.Get<double>(0, 2) * kinectPoint.Z) + result.Get<double>(0, 3)) /
                ((result.Get<double>(0, 8) * kinectPoint.X) + (result.Get<double>(0, 9) * kinectPoint.Y) + (result.Get<double>(0, 10) * kinectPoint.Z) + 1);

        //yp = (q5*xk + q6*yk + q7*zk + q8)/(q9*xk + q10*yk + q11*zk + 1)
        //outp.y = (result.get(0, 4) * kinectPoint.x + result.get(0, 5) * kinectPoint.y + result.get(0, 6) * kinectPoint.z + result.get(0, 7)) /
        //        (result.get(0, 8) * kinectPoint.x + result.get(0, 9) * kinectPoint.y + result.get(0, 10) * kinectPoint.z + 1);
        outp.Y = ((result.Get<double>(0, 4) * kinectPoint.X) + (result.Get<double>(0, 5) * kinectPoint.Y) + (result.Get<double>(0, 6) * kinectPoint.Z) + result.Get<double>(0, 7)) /
                ((result.Get<double>(0, 8) * kinectPoint.X) + (result.Get<double>(0, 9) * kinectPoint.Y) + (result.Get<double>(0, 10) * kinectPoint.Z) + 1);
        //Debug.Log(outp.X + " " + outp.Y);

        //outp.X = ((result.Get<double>(0, 0) * kinectPoint.X) + (result.Get<double>(1,0) * kinectPoint.Y) + (result.Get<double>(2,0) * kinectPoint.Z) + result.Get<double>(3,0)) /
        //        ((result.Get<double>(8,0) * kinectPoint.X) + (result.Get<double>(9,0) * kinectPoint.Y) + (result.Get<double>(10,0) * kinectPoint.Z) + 1);
        //outp.Y = ((result.Get<double>(4,0) * kinectPoint.X) + (result.Get<double>(5,0) * kinectPoint.Y) + (result.Get<double>(6,0) * kinectPoint.Z) + result.Get<double>(7,0)) /
        //        ((result.Get<double>(8,0) * kinectPoint.X) + (result.Get<double>(9,0) * kinectPoint.Y) + (result.Get<double>(10,0) * kinectPoint.Z) + 1);

        return outp;
    }

    // Use this for initialization
    void Start()
    {
        Application.RegisterLogCallback(HandleLog);
        scTex = new Texture2D(KinectWrapper.GetDepthWidth(), KinectWrapper.GetDepthHeight(), TextureFormat.RGBA32, false);
        screenTx = new Texture2D(Screen.width, Screen.height, TextureFormat.RGBA32, false);
        resetPixels = new Color32[Screen.width * Screen.height];
        for (int i = 0; i < resetPixels.Length; i++)
        {
            Color32 cCol = new Color32(0, 0, 0, 0);
            resetPixels[i] = cCol;
        }
        screenTx.SetPixels32(resetPixels);
        screenTx.Apply(false);
        GameObject.FindGameObjectWithTag("Restex").GetComponent<RawImage>().texture = screenTx;
        foundCoordinatesMatrix = new Mat();
        rightSideMatrix = new Mat();
        //result = new Mat(11,1,OpenCvSharp.CPlusPlus.MatType.CV_64FC1);
        using (CvFileStorage fs = new CvFileStorage("KinectCalibration.xml", null, FileStorageMode.Read))
        {
            string nodeName = "projectorPoints";
            CvFileNode param = fs.GetFileNodeByName(null, nodeName);
            Mat pPts = new Mat(fs.Read<CvMat>(param), true);
            for (int i = 0; i < pPts.Cols; i++)
            {
                projectorCoordinates.Add(pPts.Get<CvPoint2D64f>(0, i));
            }
            nodeName = "kinectPoints";
            param = fs.GetFileNodeByName(null, nodeName);
            Mat kPts = new Mat(fs.Read<CvMat>(param), true);
            for (int i = 0; i < pPts.Cols; i++)
            {
                kinectCoordinates.Add(kPts.Get<CvPoint3D64f>(0, i));
            }
            nodeName = "calibResult";
            param = fs.GetFileNodeByName(null, nodeName);
            result = new Mat(fs.Read<CvMat>(param), true);
            fs.Dispose();
        }
        if (result.Rows > 1)
        {
            foundResult = true;
            Debug.Log("Calib Loaded: " + result.Get<double>(0, 0).ToString() + " " + result.Get<double>(0, 1) + " " + result.Get<double>(0, 2) + " " + result.Get<double>(0, 3) + " " + result.Get<double>(0, 4) + " " + result.Get<double>(0, 5) + " " + result.Get<double>(0, 6) + " " + result.Get<double>(0, 7) + " " + result.Get<double>(0, 8) + " " + result.Get<double>(0, 9) + " " + result.Get<double>(0, 10) + "--" + kinectCoordinates.Count + " " + projectorCoordinates.Count);
        }
        Debug.Log(Screen.width + " " + Screen.height);

    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetMouseButton(0) || Input.GetMouseButton(1) || Input.GetMouseButton(2))
        {
            if (Input.GetMouseButton(0))
            {
                //Debug.Log(Input.mousePosition);
                GameObject bc = GameObject.FindGameObjectWithTag("BlueCross");
                bc.transform.localPosition = new Vector3(Map(Input.mousePosition.x, Screen.width / 2.0f - 320.0f, Screen.width / 2.0f + 320.0f, 0.0f, 640.0f) - 320.0f, -Map(Input.mousePosition.y, Screen.height / 2.0f + 240.0f, Screen.height / 2.0f - 240.0f, 0.0f, 480.0f) + 240.0f, 0.0f);
            }
            else if (Input.GetMouseButton(1))
            {
                GameObject yc = GameObject.FindGameObjectWithTag("YellowCross");
                yc.transform.localPosition = new Vector3(Map(Input.mousePosition.x, Screen.width / 2.0f - 320.0f, Screen.width / 2.0f + 320.0f, 0.0f, 640.0f) - 320.0f, -Map(Input.mousePosition.y, Screen.height / 2.0f + 240.0f, Screen.height / 2.0f - 240.0f, 0.0f, 480.0f) + 240.0f, 0.0f);
                nextBt = true;
            }
            else if (Input.GetMouseButton(2) && nextBt == true)
            {
                if (addKinectPoint())
                {
                    addProjectorPoint();
                    Debug.Log("Point Added! -> (" + kinectCoordinates.Count + ") ");
                    nextBt = false;
                }
                else
                {
                    Debug.Log("Kinect Point out of bounds!");
                }
            }
        }
        if (Input.GetKeyDown(KeyCode.A))
        {
            //PointerEventData pointer = new PointerEventData(EventSystem.current);
            //pointer.position = Input.mousePosition;
            //List<RaycastResult> raycastResults = new List<RaycastResult>();
            //EventSystem.current.RaycastAll(pointer, raycastResults);
            if (addKinectPoint())
            {
                addProjectorPoint();
                Debug.Log("Point Added! -> " + kinectCoordinates.Count);
            }
            else
            {
                Debug.Log("Kinect Point out of bounds!");
            }
        }
        if (Input.GetKeyDown(KeyCode.S))
        {
            if (kinectCoordinates.Count >= 8)
            {
                Debug.Log("Starting Calibration...");
                findTransformation(kinectCoordinates, projectorCoordinates);
                foundResult = true;
            }
            else
            {
                Debug.Log("Not Enough Points!");
            }
        }
        if (Input.GetKeyDown(KeyCode.D) && foundResult == true)
        {
            showResult = !showResult;
            if (!showResult)
            {
                screenTx.SetPixels32(resetPixels);
                screenTx.Apply(false);
            }
            Debug.Log("Show result toggle: " + showResult);
        }
        if (Input.GetKeyDown(KeyCode.F) && foundResult == true)
        {

            using (CvFileStorage fs = new CvFileStorage("KinectCalibration.xml", null, FileStorageMode.Write))
            {
                string nodeName = "calibResult";
                fs.Write(nodeName, result.ToCvMat());
                nodeName = "kinectPoints";
                Mat kinectPts = new Mat(1, kinectCoordinates.Count, MatType.CV_64FC3);
                for (int i = 0; i < kinectCoordinates.Count; i++)
                {
                    kinectPts.Set<CvPoint3D64f>(0, i, (CvPoint3D64f)kinectCoordinates[i]);
                }
                fs.Write(nodeName, kinectPts.ToCvMat());
                nodeName = "projectorPoints";
                Mat projPts = new Mat(1, projectorCoordinates.Count, MatType.CV_64FC2);
                for (int i = 0; i < projectorCoordinates.Count; i++)
                {
                    projPts.Set<CvPoint2D64f>(0, i, (CvPoint2D64f)projectorCoordinates[i]);
                }
                fs.Write(nodeName, projPts.ToCvMat());
                fs.Dispose();
            }
            Debug.Log("Calib Data saved!");
        }
        if (Input.GetKeyDown(KeyCode.Q))
        {
            delLastPoints();
        }
        if (kinect.GetDepthRaw())
        {
            try
            {

                Mat src = DoDepthBuffer(kinect.usersDepthMap, KinectWrapper.GetDepthWidth(), KinectWrapper.GetDepthHeight());
                dBuffer = src.Clone();
                src.ConvertTo(src, OpenCvSharp.CPlusPlus.MatType.CV_8UC1, 255.0f / NUI_IMAGE_DEPTH_MAXIMUM);

                Mat show = new Mat(KinectWrapper.GetDepthHeight(), KinectWrapper.GetDepthWidth(), OpenCvSharp.CPlusPlus.MatType.CV_8UC4);
                Mat alpha = new Mat(KinectWrapper.GetDepthHeight(), KinectWrapper.GetDepthWidth(), OpenCvSharp.CPlusPlus.MatType.CV_8UC1, new Scalar(255));
                Mat[] planes = new Mat[4] { src, src, src, alpha };
                Cv2.Merge(planes, show);
                //Mat falseColorsMap = new Mat();
                //Cv2.ApplyColorMap(src, falseColorsMap, OpenCvSharp.CPlusPlus.ColorMapMode.Rainbow);
                //Cv2.ImShow("show", falseColorsMap);
                int matSize = (int)show.Total() * show.Channels();
                byte[] rColors = new byte[matSize];
                Marshal.Copy(show.DataStart, rColors, 0, matSize);
                scTex.LoadRawTextureData(rColors);
                scTex.Apply(false);
                ScreenObject.GetComponent<RawImage>().texture = scTex;
                if (showResult)
                {
                    //ResultObject.SetActive(true);
                    screenTx.SetPixels32(resetPixels);
                    long discarded = 0;
                    long drawn = 0;
                    long bounds = 0;
                    //Color32[] txcl = (Color32[])resetPixels.Clone();
                    Color32[] txcl = new Color32[screenTx.height * screenTx.width];
                    for (int i = 0; i < txcl.Length; i++)
                    {
                        Color32 cCol = new Color32(255, 255, 255, 255);
                        txcl[i] = cCol;
                    }
                    screenTx.SetPixels32(txcl, 0);
                    Color32 sccolor = Color.gray;
                    for (int i = 0; i < show.Rows; i ++)
                    {
                        for (int j = 0; j < show.Cols; j ++)
                        {
                            CvPoint3D64f realVal = NuiTransformDepthImageToSkeleton((long)j, (long)i, dBuffer.Get<ushort>((int)i, (int)j));
                            if (realVal.Z < projThresh && realVal.Z > 1.0)
                            {
                                CvPoint2D64f scCoord = convertKinectToProjector(realVal);
                                if (scCoord.X > 0.0 && scCoord.X < Screen.width && scCoord.Y > 0.0 && scCoord.Y < Screen.height)
                                {
                                    //Debug.Log(scCoord.X.ToString() + " " + scCoord.Y.ToString());
                                    //Vec4b bgrPixel = falseColorsMap.At<Vec4b>(i, j);
                                    //Color32 sccolor = new Color32(bgrPixel[2], bgrPixel[1], bgrPixel[0], 255);
                                    int X = Mathf.CeilToInt((float)scCoord.X);
                                    int Y = Mathf.CeilToInt((float)scCoord.Y);
                                    int arrPos = ((screenTx.height - Y) * screenTx.width) + X;
                                    //Debug.Log(scCoord.X + " -> " + X + " --" + scCoord.Y + " -> " + Y + " = " + arrPos +  " == " + screenTx.height + " == " + screenTx.width);
                                    txcl[arrPos] = sccolor;
                                    //screenTx.SetPixel((int)scCoord.X, Screen.height - (int)scCoord.Y, sccolor);
                                    drawn++;
                                }
                                else
                                {
                                    bounds++;
                                }
                            }
                            else
                            {
                                discarded++;
                            }
                        }
                    }
                    Debug.Log("Discarded: " + discarded + " Bounds: " + bounds + " Drawn: " + drawn);
                    screenTx.SetPixels32(txcl, 0);
                    screenTx.Apply(false);
                    //GameObject.FindGameObjectWithTag("Restex").GetComponent<RawImage>().texture = screenTx;
                    //CvContour contourfinder = new CvContour();
                }
                else
                {
                    //ResultObject.SetActive(false);
                }

            }
            catch (System.Exception e)
            {
                throw e;
            }
        }
    }
    private bool addKinectPoint()
    {
        //Get World to kinect screen coordinates
        GameObject bc = GameObject.FindGameObjectWithTag("BlueCross");
        float xCoord = bc.transform.localPosition.x + 320.0f;
        float yCoord = 240.0f - bc.transform.localPosition.y;
        Debug.Log(xCoord + " " + yCoord);
        //Get Real world Coordinates from kinect depth

        if (xCoord > 0 && xCoord <= 640 && yCoord > 0 && yCoord <= 480)
        {
            CvPoint3D64f realVal = NuiTransformDepthImageToSkeleton((long)xCoord, (long)yCoord, dBuffer.Get<ushort>((int)yCoord, (int)xCoord));
            Debug.Log(realVal.X + " " + realVal.Y + " " + realVal.Z);
            if(realVal.Z > 0.0){
                kinectCoordinates.Add(realVal);
                return true;
            }else{
                return false;
            }
        }
        else
        {
            return false;
        }
    }
    private void addProjectorPoint()
    {
        //Get screen coordinates
        GameObject yc = GameObject.FindGameObjectWithTag("YellowCross");
        double xCoord = yc.transform.localPosition.x + Screen.width / 2;
        double yCoord = (Screen.height / 2) - yc.transform.localPosition.y;
        Debug.Log("Projector point: " + xCoord + " " + yCoord);
        projectorCoordinates.Add(new CvPoint2D64f(xCoord, yCoord));
    }

    /// <summary>
    /// Returns the depth space coordinates of the specified point in skeleton space.
    /// </summary>
    /// <param name="lDepthX">The X coordinate of the depth pixel.</param>
    /// <param name="lDepthY">The Y coordinate of the depth pixel.</param>
    /// <param name="usDepthValue">
    /// The depth value (in millimeters) of the depth image pixel, shifted left by three bits. The left
    /// shift enables you to pass the value from the depth image directly into this function.
    /// </param>
    /// <param name="eResolution">
    /// A NUI_IMAGE_RESOLUTION value that specifies the resolution of the depth image.
    /// </param>
    /// <returns>
    /// Returns the skeleton space coordinates of the given depth image pixel (in meters).
    /// </returns>

    private CvPoint3D64f NuiTransformDepthImageToSkeleton(long lDepthX, long lDepthY, ushort usDepthValue)
    {

        //
        //  Depth is in meters in skeleton space.
        //  The depth image pixel format has depth in millimeters shifted left by 3.
        //

        ushort depthVal = (ushort)(usDepthValue >> 3);
        //Debug.Log(depthVal);
        float fSkeletonZ = (float)depthVal;
        //Debug.Log(fSkeletonZ);
        fSkeletonZ /= 1000.0f;
        //Debug.Log(fSkeletonZ);

        //
        // Center of depth sensor is at (0,0,0) in skeleton space, and
        // and (width/2,height/2) in depth image coordinates.  Note that positive Y
        // is up in skeleton space and down in image coordinates.
        //

        float fSkeletonX = ((float)lDepthX - (float)KinectWrapper.GetDepthWidth() / 2.0f) * (320.0f / (float)KinectWrapper.GetDepthWidth()) * NUI_CAMERA_DEPTH_NOMINAL_INVERSE_FOCAL_LENGTH_IN_PIXELS * fSkeletonZ;
        float fSkeletonY = -((float)lDepthY - (float)KinectWrapper.GetDepthHeight() / 2.0f) * (240.0f / (float)KinectWrapper.GetDepthHeight()) * NUI_CAMERA_DEPTH_NOMINAL_INVERSE_FOCAL_LENGTH_IN_PIXELS * fSkeletonZ;


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

    // get a CV_16U matrix from a Kinect depth frame 
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

    public float Map(float val, float fromMin, float fromMax, float toMin, float toMax)
    {
        return ((val - fromMin) / (fromMax - fromMin)) * (toMax - toMin) + toMin;
    }

    void onDestroy()
    {
        Application.RegisterLogCallback(null);
    }

    void HandleLog(string logString, string stackTrace, LogType type)
    {

        GameObject.FindGameObjectWithTag("TextOut").GetComponent<Text>().text = logString;
        //stack = stackTrace;
    }
    void delLastPoints()
    {
        kinectCoordinates.RemoveAt(kinectCoordinates.Count - 1);
        projectorCoordinates.RemoveAt(projectorCoordinates.Count - 1);
        Debug.Log("Last Points Deleted!");
    }


}
