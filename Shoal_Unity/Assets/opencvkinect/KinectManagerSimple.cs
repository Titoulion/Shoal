using UnityEngine;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.IO;
using System.Text;

public class KinectManagerSimple : MonoBehaviour
{

    private static KinectManagerSimple instance;
    // Bool to keep track of whether Kinect has been initialized
    private bool KinectInitialized = false;
    private IntPtr depthStreamHandle;

    private Matrix4x4 kinectToWorld, flipMatrix;

    // Timer for controlling Filter Lerp blends.
    private float lastNuiTime;

    // User Map vars.
    private Color32[] usersMapColors;
    private Rect usersMapRect;
    private int usersMapSize;

    private Texture2D usersClrTex;
    //Color[] usersClrColors;
    private Rect usersClrRect;

    //short[] usersLabelMap;
    [System.NonSerialized]
    public ushort[] usersDepthMap;
    private float[] usersHistogramMap;
    public int kangle;


    // returns the single KinectManagerSimple instance
    public static KinectManagerSimple Instance
    {
        get
        {
            return instance;
        }

    }

    // checks if Kinect is initialized and ready to use. If not, there was an error during Kinect-sensor initialization
    public static bool IsKinectInitialized()
    {
        return instance != null ? instance.KinectInitialized : false;
    }

    // checks if Kinect is initialized and ready to use. If not, there was an error during Kinect-sensor initialization
    public bool IsInitialized()
    {
        return KinectInitialized;
    }

    void Awake()
    {
        //CalibrationText = GameObject.Find("CalibrationText");
        int hr = 0;

        try
        {
            hr = KinectWrapper.NuiInitialize(KinectWrapper.NuiInitializeFlags.UsesDepth);
            if (hr != 0)
            {
                throw new Exception("NuiInitialize Failed");
            }

            depthStreamHandle = IntPtr.Zero;
            hr = KinectWrapper.NuiImageStreamOpen(KinectWrapper.NuiImageType.Depth,
                KinectWrapper.Constants.DepthImageResolution, 0, 2, IntPtr.Zero, ref depthStreamHandle);
            if (hr != 0)
            {
                throw new Exception("Cannot open depth stream");
            }

            
            // set kinect elevation angle
            KinectWrapper.NuiCameraElevationSetAngle(kangle);

          
            // values used to pass to smoothing function
            KinectWrapper.NuiTransformSmoothParameters smoothParameters = new KinectWrapper.NuiTransformSmoothParameters();

            //switch (smoothing)
            //{
            //    case Smoothing.Default:
            smoothParameters.fSmoothing = 0.5f;
            smoothParameters.fCorrection = 0.5f;
            smoothParameters.fPrediction = 0.5f;
            smoothParameters.fJitterRadius = 0.05f;
            smoothParameters.fMaxDeviationRadius = 0.04f;
            //break;
            //    case Smoothing.Medium:
            //        smoothParameters.fSmoothing = 0.5f;
            //        smoothParameters.fCorrection = 0.1f;
            //        smoothParameters.fPrediction = 0.5f;
            //        smoothParameters.fJitterRadius = 0.1f;
            //        smoothParameters.fMaxDeviationRadius = 0.1f;
            //        break;
            //    case Smoothing.Aggressive:
            //smoothParameters.fSmoothing = 0.7f;
            //smoothParameters.fCorrection = 0.3f;
            //smoothParameters.fPrediction = 1.0f;
            //smoothParameters.fJitterRadius = 1.0f;
            //smoothParameters.fMaxDeviationRadius = 1.0f;
            //        break;
            //}

          
            //create the transform matrix that converts from kinect-space to world-space
            Quaternion quatTiltAngle = new Quaternion();
            quatTiltAngle.eulerAngles = new Vector3(-0, 0.0f, 0.0f);

            //float heightAboveHips = SensorHeight - 1.0f;

            // transform matrix - kinect to world
            //kinectToWorld.SetTRS(new Vector3(0.0f, heightAboveHips, 0.0f), quatTiltAngle, Vector3.one);
            //kinectToWorld.SetTRS(new Vector3(0.0f, SensorHeight, 0.0f), quatTiltAngle, Vector3.one);
            kinectToWorld.SetTRS(new Vector3(0.0f, 0.0f, 0.0f), quatTiltAngle, Vector3.one);
            flipMatrix = Matrix4x4.identity;
            flipMatrix[2, 2] = -1;

            instance = this;
            //DontDestroyOnLoad(gameObject);
        }
        catch (DllNotFoundException e)
        {
            string message = "Please check the Kinect SDK installation.";
            Debug.LogError(message);
            Debug.LogError(e.ToString());

            return;
        }
        catch (Exception e)
        {
            string message = e.Message + " - " + KinectWrapper.GetNuiErrorString(hr);
            Debug.LogError(message);
            Debug.LogError(e.ToString());

            return;
        }

        // Initialize depth & label map related stuff
        usersMapSize = KinectWrapper.GetDepthWidth() * KinectWrapper.GetDepthHeight();
        usersDepthMap = new ushort[usersMapSize];


        KinectInitialized = true;
    }

    // Use this for initialization
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {

    }

    public bool GetDepthRaw(){
        return depthStreamHandle != IntPtr.Zero && KinectWrapper.PollDepth(depthStreamHandle, KinectWrapper.Constants.IsNearMode, ref usersDepthMap);
    }

    // Make sure to kill the Kinect on quitting.
    void OnApplicationQuit()
    {
        if (KinectInitialized)
        {
            // Shutdown OpenNI
            KinectWrapper.NuiShutdown();
            instance = null;
        }
    }
}
