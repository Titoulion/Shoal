using UnityEngine;
using System.Collections;

public class LumScript : MonoBehaviour {

	// Use this for initialization

	public Light lum;
	MainScript main;
	public Vector2 minMaxIntensity;
	public GameObject plane;

	public bool isTouched = false;
	float progressTouched = 0f;
	public Color colorOff;
	public Color colorOn;
	public bool isStone = false;

	[Range(0f,1f)]
	public float progressOn = 0f;


	void Start () {
		lum = GetComponent<Light>();
		main = MainScript.Instance;
	}
	
	// Update is called once per frame
	void Update () 
	{
	

		float sens = 1f;

		if(main.lightOff == true)
		{
			sens = -1f;
		}


		progressOn = Mathf.Clamp01(progressOn+sens*Time.deltaTime/0.5f);




		lum.intensity = Map(main.ValueHeartBeat(),0f,1f,minMaxIntensity.x,minMaxIntensity.y)*progressOn;


		




		if(isTouched)
		{
			progressTouched+=Time.deltaTime*4f;
		}
		else
		{
			progressTouched-=Time.deltaTime*4f;
		}

		if(isStone)
		{
			progressTouched=Mathf.Clamp01(progressTouched);
		}
		else
		{
			progressTouched=Mathf.Clamp(progressTouched,0.3f,1f);
		}


		plane.GetComponent<Renderer>().material.color = Color.Lerp(colorOff,colorOn,progressTouched*progressOn);


	}

	public float Map(float val, float fromMin, float fromMax, float toMin, float toMax) {
		return ((val - fromMin) / (fromMax - fromMin)) * (toMax - toMin) + toMin;
	}
}
