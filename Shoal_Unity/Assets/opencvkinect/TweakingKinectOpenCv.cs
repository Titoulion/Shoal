using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class TweakingKinectOpenCv : MonoBehaviour 
{
	public KinectOpenCvDetector myKinectOpenCvDetector;
	public Canvas myCanvas;
	public Slider sliderSmoothBlur;
	public Slider sliderBlobMinArea;
	public Slider sliderBlobMaxArea;
	public Slider sliderThreshold;
	public Slider sliderSmThresh;
	public Slider sliderXAdjust;
	public Slider sliderYAdjust;
	public Slider sliderRoiX;
	public Slider sliderRoiY;
	public Slider sliderRoiW;
	public Slider sliderRoiH;
	public Slider sliderAxisMaskX;
	public Slider sliderAxisMaskY;
	public Slider sliderEllipseMaskCenterX;
	public Slider sliderEllipseMaskCenterY;
	public Slider sliderMaskAngle;
	public Slider sliderMaskStartAngle;
	public Slider sliderMaskEndAngle;
	public Slider sliderBlobMaxLife;
	public Slider sliderBlobTrackDly;
	public Slider sliderBlobMinDistance;
	public Slider sliderBoulderThresh;
	public Slider sliderHandsPeriod;
	public Slider sliderSrcThreshMin;
	public Slider sliderSrcThreshMax;
	public Slider sliderRadiusRemove;
	public Slider sliderHandsThreshold;
	public Slider sliderFoodAreaDistance;
	public Slider sliderStoneAreaDistance;


	void Awake()
	{
		transform.position = Vector3.zero;

		sliderSmoothBlur.value = (float)myKinectOpenCvDetector.smoothBlur;
		sliderBlobMinArea.value = (float)myKinectOpenCvDetector.blobMinArea;
		sliderBlobMaxArea.value = (float)myKinectOpenCvDetector.blobMaxArea;
		sliderThreshold.value = (float)myKinectOpenCvDetector.threshold;
		sliderSmThresh.value = (float)myKinectOpenCvDetector.smThresh;
		sliderXAdjust.value = (float)myKinectOpenCvDetector.xAdjust;
		sliderYAdjust.value = (float)myKinectOpenCvDetector.yAdjust;
		sliderRoiX.value = (float)myKinectOpenCvDetector.roiX;
		sliderRoiY.value = (float)myKinectOpenCvDetector.roiY;
		sliderRoiW.value = (float)myKinectOpenCvDetector.roiW;
		sliderRoiH.value = (float)myKinectOpenCvDetector.roiH;
		sliderAxisMaskX.value = (float)myKinectOpenCvDetector.axisMaskX;
		sliderAxisMaskY.value = (float)myKinectOpenCvDetector.axisMaskY;
		sliderEllipseMaskCenterX.value = (float)myKinectOpenCvDetector.ellipseMaskCenterX;
		sliderEllipseMaskCenterY.value = (float)myKinectOpenCvDetector.ellipseMaskCenterY;
		sliderMaskAngle.value = (float)myKinectOpenCvDetector.maskAngle;
		sliderMaskStartAngle.value = (float)myKinectOpenCvDetector.maskStartAngle;
		sliderMaskEndAngle.value = (float)myKinectOpenCvDetector.maskEndAngle;
		sliderBlobMaxLife.value = (float)myKinectOpenCvDetector.blobMaxLife;
		sliderBlobTrackDly.value = (float)myKinectOpenCvDetector.blobTrackDly;
		sliderBlobMinDistance.value = (float)myKinectOpenCvDetector.blobMinDistance;
		sliderBoulderThresh.value = (float)myKinectOpenCvDetector.boulderThresh;
		sliderHandsPeriod.value = myKinectOpenCvDetector.handsPeriod;
		sliderSrcThreshMin.value = (float)myKinectOpenCvDetector.srcThreshMin;
		sliderSrcThreshMax.value = (float)myKinectOpenCvDetector.srcThreshMax;
		sliderRadiusRemove.value = (float)myKinectOpenCvDetector.radiusRemove;
		sliderHandsThreshold.value = (float)myKinectOpenCvDetector.handsThreshold;
		sliderFoodAreaDistance.value = (float)myKinectOpenCvDetector.foodAreaDist;
		sliderStoneAreaDistance.value = (float)myKinectOpenCvDetector.stoneAreaDist;
	}

	void Update()
	{
		if(Input.GetKeyDown(KeyCode.Tab))
		{
			myCanvas.gameObject.SetActive(!myCanvas.gameObject.activeSelf);
		}

		if(myCanvas.gameObject.activeSelf)
		{
			sliderSmoothBlur.gameObject.GetComponentInChildren<Text>().text = "Smooth Blur: "+sliderSmoothBlur.value;
			sliderBlobMinArea.gameObject.GetComponentInChildren<Text>().text = "Blob Min Area: "+sliderBlobMinArea.value;
			sliderBlobMaxArea.gameObject.GetComponentInChildren<Text>().text = "Blob Max Area: "+sliderBlobMaxArea.value;
			sliderThreshold.gameObject.GetComponentInChildren<Text>().text = "Threshold: "+sliderThreshold.value;
			sliderSmThresh.gameObject.GetComponentInChildren<Text>().text = "Sm Thresh: "+sliderSmThresh.value;
			sliderXAdjust.gameObject.GetComponentInChildren<Text>().text = "X Adjust: "+sliderXAdjust.value;
			sliderYAdjust.gameObject.GetComponentInChildren<Text>().text = "Y Adjust: "+sliderYAdjust.value;
			sliderRoiX.gameObject.GetComponentInChildren<Text>().text = "Roi X: "+sliderRoiX.value;
			sliderRoiY.gameObject.GetComponentInChildren<Text>().text = "Roi Y: "+sliderRoiY.value;
			sliderRoiW.gameObject.GetComponentInChildren<Text>().text = "Roi W: "+sliderRoiW.value;
			sliderRoiH.gameObject.GetComponentInChildren<Text>().text = "Roi H: "+sliderRoiH.value;
			sliderAxisMaskX.gameObject.GetComponentInChildren<Text>().text = "Axis Mask X: "+sliderAxisMaskX.value;
			sliderAxisMaskY.gameObject.GetComponentInChildren<Text>().text = "Axis Mask Y: "+sliderAxisMaskY.value;
			sliderEllipseMaskCenterX.gameObject.GetComponentInChildren<Text>().text = "Ellipse Mask Center X: "+sliderEllipseMaskCenterX.value;
			sliderEllipseMaskCenterY.gameObject.GetComponentInChildren<Text>().text = "Ellipse Mask Center Y: "+sliderEllipseMaskCenterY.value;
			sliderMaskAngle.gameObject.GetComponentInChildren<Text>().text = "Mask Angle: "+sliderMaskAngle.value;
			sliderMaskStartAngle.gameObject.GetComponentInChildren<Text>().text = "Mask Start Angle: "+sliderMaskStartAngle.value;
			sliderMaskEndAngle.gameObject.GetComponentInChildren<Text>().text = "Mask End Angle: "+sliderMaskEndAngle.value;
			sliderBlobMaxLife.gameObject.GetComponentInChildren<Text>().text = "Blob Max Life: "+sliderBlobMaxLife.value;
			sliderBlobTrackDly.gameObject.GetComponentInChildren<Text>().text = "Blob Track Dly: "+sliderBlobTrackDly.value;
			sliderBlobMinDistance.gameObject.GetComponentInChildren<Text>().text = "Blob Min Distance: "+sliderBlobMinDistance.value;
			sliderBoulderThresh.gameObject.GetComponentInChildren<Text>().text = "Boulder Thresh: "+sliderBoulderThresh.value;
			sliderHandsPeriod.gameObject.GetComponentInChildren<Text>().text = "Hands Period: "+sliderHandsPeriod.value;
			sliderSrcThreshMin.gameObject.GetComponentInChildren<Text>().text = "Src Thresh Min: "+sliderSrcThreshMin.value;
			sliderSrcThreshMax.gameObject.GetComponentInChildren<Text>().text = "Src Thresh Max: "+sliderSrcThreshMax.value;
			sliderRadiusRemove.gameObject.GetComponentInChildren<Text>().text = "Radius Remove: "+sliderRadiusRemove.value;
			sliderHandsThreshold.gameObject.GetComponentInChildren<Text>().text = "Hands Threshold: "+sliderHandsThreshold.value;
			sliderFoodAreaDistance.gameObject.GetComponentInChildren<Text>().text = "Food Area Distance: "+sliderFoodAreaDistance.value;
			sliderStoneAreaDistance.gameObject.GetComponentInChildren<Text>().text = "Stone Area Distance: "+sliderStoneAreaDistance.value;

		}
	}

	public void SetSmoothBlur(float value){  myKinectOpenCvDetector.smoothBlur = (double)value;  }
	public void SetBlobMinArea(float value){  myKinectOpenCvDetector.blobMinArea = (int)value;  }
	public void SetBlobMaxArea(float value){  myKinectOpenCvDetector.blobMaxArea = (int)value;  }
	public void SetThreshold(float value){  myKinectOpenCvDetector.threshold = (double)value;  }
	public void SetSmThresh(float value){  myKinectOpenCvDetector.smThresh = (double)value;  }
	public void SetXAdjust(float value){  myKinectOpenCvDetector.xAdjust = (double)value;  }
	public void SetYAdjust(float value){  myKinectOpenCvDetector.yAdjust = (double)value;  }
	public void SetRoiX(float value){  myKinectOpenCvDetector.roiX = (int)value;  }
	public void SetRoiY(float value){  myKinectOpenCvDetector.roiY = (int)value;  }
	public void SetRoiW(float value){  myKinectOpenCvDetector.roiW = (int)value;  }
	public void SetRoiH(float value){  myKinectOpenCvDetector.roiH = (int)value;  }
	public void SetAxisMaskX(float value){  myKinectOpenCvDetector.axisMaskX = (double)value;  }
	public void SetAxisMaskY(float value){  myKinectOpenCvDetector.axisMaskY = (double)value;  }
	public void SetEllipseMaskCenterX(float value){  myKinectOpenCvDetector.ellipseMaskCenterX = (double)value;  }
	public void SetEllipseMaskCenterY(float value){  myKinectOpenCvDetector.ellipseMaskCenterY = (double)value;  }
	public void SetMaskAngle(float value){  myKinectOpenCvDetector.maskAngle = (double)value;  }
	public void SetMaskStartAngle(float value){  myKinectOpenCvDetector.maskStartAngle = (double)value;  }
	public void SetMaskEndAngle(float value){  myKinectOpenCvDetector.maskEndAngle = (double)value;  }
	public void SetBlobMaxLife(float value){  myKinectOpenCvDetector.blobMaxLife = (int)value;  }
	public void SetBlobTrackDly(float value){  myKinectOpenCvDetector.blobTrackDly = (int)value;  }
	public void SetBlobMinDistance(float value){  myKinectOpenCvDetector.blobMinDistance = (double)value;  }
	public void SetBoulderThresh(float value){  myKinectOpenCvDetector.boulderThresh = (double)value;  }
	public void SetHandsPeriod(float value){  myKinectOpenCvDetector.handsPeriod = value;  }
	public void SetSrcThreshMin(float value){  myKinectOpenCvDetector.srcThreshMin = (int)value;  }
	public void SetSrcThreshMax(float value){  myKinectOpenCvDetector.srcThreshMax = (int)value;  }
	public void SetRadiusRemove(float value){  myKinectOpenCvDetector.radiusRemove = (int)value;  }
	public void SetHandsThreshold(float value){  myKinectOpenCvDetector.handsThreshold = (double)value;  }
	public void SetFoodAreaDistance(float value){  myKinectOpenCvDetector.foodAreaDist = (double)value;  }
	public void SetStoneAreaDistance(float value){  myKinectOpenCvDetector.stoneAreaDist = (double)value;  }

	void OnDisable()
	{
		myCanvas.gameObject.SetActive(true);


		string stuff = "";
		stuff+="\n";
		stuff+="\n";
		stuff+="Smooth Blur: "+myKinectOpenCvDetector.smoothBlur+"\n";
		stuff+="Blob Min Area: "+myKinectOpenCvDetector.blobMinArea+"\n";
		stuff+="Blob Max Area: "+myKinectOpenCvDetector.blobMaxArea+"\n";
		stuff+="Threshold: "+myKinectOpenCvDetector.threshold+"\n";
		stuff+="Sm Thresh: "+myKinectOpenCvDetector.smThresh+"\n";
		stuff+="X Adjust: "+myKinectOpenCvDetector.xAdjust+"\n";
		stuff+="Y Adjust: "+myKinectOpenCvDetector.yAdjust+"\n";
		stuff+="Roi X: "+myKinectOpenCvDetector.roiX+"\n";
		stuff+="Roi Y: "+myKinectOpenCvDetector.roiY+"\n";
		stuff+="Roi W: "+myKinectOpenCvDetector.roiW+"\n";
		stuff+="Roi H: "+myKinectOpenCvDetector.roiH+"\n";
		stuff+="Axis Mask X: "+myKinectOpenCvDetector.axisMaskX+"\n";
		stuff+="Axis Mask Y: "+myKinectOpenCvDetector.axisMaskY+"\n";
		stuff+="Ellipse Mask Center X: "+myKinectOpenCvDetector.ellipseMaskCenterX+"\n";
		stuff+="Ellipse Mask Center Y: "+myKinectOpenCvDetector.ellipseMaskCenterY+"\n";
		stuff+="Mask Angle: "+myKinectOpenCvDetector.maskAngle+"\n";
		stuff+="Mask Start Angle: "+myKinectOpenCvDetector.maskStartAngle+"\n";
		stuff+="Mask End Angle: "+myKinectOpenCvDetector.maskEndAngle+"\n";
		stuff+="Blob Max Life: "+myKinectOpenCvDetector.blobMaxLife+"\n";
		stuff+="Blob Track Dly: "+myKinectOpenCvDetector.blobTrackDly+"\n";
		stuff+="Blo Min Distance: "+myKinectOpenCvDetector.blobMinDistance+"\n";
		stuff+="Boulder Thresh: "+myKinectOpenCvDetector.boulderThresh+"\n";
		stuff+="Hands Period: "+myKinectOpenCvDetector.handsPeriod+"\n";
		stuff+="Src Thresh Min: "+myKinectOpenCvDetector.srcThreshMin+"\n";
		stuff+="Src Thresh Max: "+myKinectOpenCvDetector.srcThreshMax+"\n";
		stuff+="Radius Remove: "+myKinectOpenCvDetector.radiusRemove+"\n";
		stuff+="Hands Threshold: "+myKinectOpenCvDetector.handsThreshold+"\n";
		stuff+="Food Area Distance: "+myKinectOpenCvDetector.foodAreaDist+"\n";
		stuff+="Stone Area Distance: "+myKinectOpenCvDetector.stoneAreaDist+"\n";
		stuff+="\n";
		stuff+="\n";
		Debug.Log(stuff);
	}
}
