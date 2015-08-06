using UnityEngine;
using System.Collections;
using UnityEditor;


[CustomEditor(typeof(NewGradient))]

public class NewGradient : MonoBehaviour {
	
	public Gradient randomGradient;
	public Gradient randomGradient2;
	[HideInInspector]public GradientColorKey[] gradientKeys;
	[HideInInspector]public GradientAlphaKey[] gradientAlpha;
	
	public Color headColor_hsv;
	public Color headASColor_hsv;
	public Color bottomAScolor_hsv;
	public Color bottomColor_hsv;
	
	[HideInInspector]public float h_h;
	[HideInInspector]public float h_s;
	[HideInInspector]public float h_v;
	[HideInInspector]public float b_h;
	[HideInInspector]public float b_s;
	[HideInInspector]public float b_v;
	
	public AnimationCurve blinkingCurve;
	[HideInInspector]public float curveValue = 0.0f;
	
	void getHeadandBottomColors(){
		
		h_h = Random.Range (0.0f, 339.0f);
		h_s = Random.Range (160.0f,190.0f);
		h_v = Random.Range (100.0f,200.0f);
		
		
		//headColor_hsv = mapColor (h_h, h_s, h_v);
		
		b_h = Random.Range (0.0f, 339.0f);
		while (((b_h < h_h + 50.0f) && (b_h > h_h - 50.0f))) {		
			b_h = Random.Range (0.0f, 232.0f);
		}
		
		b_s = Random.Range (220.0f, 255.0f);
		b_v = 245.0f;
		//bottomColor_hsv = mapColor (b_h, b_s, b_v);
		
	}
	
	void setHeadandTailColor(){
		
		float h = h_h ;
		float s = h_s + curveValue;
		float v = h_v + curveValue;
		
		headColor_hsv = mapColor (h, s, v);
		
		h = b_h ;
		s = b_s + curveValue;
		v = b_v + curveValue;
		bottomColor_hsv = mapColor (h, s, v);
		
	}
	
	void getASColors(){
		
		float _h = h_h + Random.Range (-10.0f, 10.0f);
		float _s = h_s - Random.Range (20.0f, 30.0f);
		float _v = h_v + Random.Range (10.0f, 30.0f);
		
		headASColor_hsv = mapColor (_h, _s, _v);
		
		float h = b_h + Random.Range (-10.0f, 10.0f);
		float s = Random.Range (80.0f, 100.0f);
		float v = b_v + Random.Range (-10.0f, 10.0f);
		
		bottomAScolor_hsv = mapColor (h, s, v);
		
		
	}
	
	Color mapColor(float _a, float _b, float _c){
		
		float a = Map(_a, 0.0f, 359.0f, 0.0f, 1.0f);
		float b = Map(_b, 0.0f, 255.0f, 0.0f, 1.0f);
		float c = Map(_c, 0.0f, 255.0f, 0.0f, 1.0f);
		
		Color _color = new Color ();
		_color = EditorGUIUtility.HSVToRGB(a,b,c);
		
		
		return _color;
		
	}
	
	
	void setGradient(){
		
		gradientKeys = new GradientColorKey[4];
		gradientKeys [0].color = headColor_hsv;
		gradientKeys [0].time = 0.0f;
		gradientKeys [1].color = headASColor_hsv;
		gradientKeys [1].time = 0.2f;
		gradientKeys [2].color = bottomAScolor_hsv;
		gradientKeys [2].time = 0.7f;
		gradientKeys [3].color = bottomColor_hsv;
		gradientKeys [3].time = 1.0f;
		
		gradientAlpha = new GradientAlphaKey[4];
		gradientAlpha [0].alpha = 1.0f;
		gradientAlpha [1].alpha = 1.0f;
		gradientAlpha [2].alpha = 1.0f;
		gradientAlpha [3].alpha = 1.0f;
		gradientAlpha[0].time = 0.0f;
		gradientAlpha[1].time = 0.2f;
		gradientAlpha[2].time = 0.7f;
		gradientAlpha[3].time = 1.0f;
		
		randomGradient = new Gradient();
		randomGradient.SetKeys(gradientKeys,gradientAlpha);



		gradientKeys = new GradientColorKey[4];
		gradientKeys [0].color = bottomColor_hsv;
		gradientKeys [0].time = 0.0f;
		gradientKeys [1].color = bottomAScolor_hsv;
		gradientKeys [1].time = 0.2f;
		gradientKeys [2].color = headASColor_hsv;
		gradientKeys [2].time = 0.7f;
		gradientKeys [3].color = headColor_hsv;
		gradientKeys [3].time = 1.0f;

		
		randomGradient2 = new Gradient();
		randomGradient2.SetKeys(gradientKeys,gradientAlpha);






		
	}
	
	float Map(float val, float fromMin, float fromMax, float toMin, float toMax) {
		
		return ((val - fromMin) / (fromMax - fromMin)) * (toMax - toMin) + toMin;	
	}
	
	void Start () {
		
		getHeadandBottomColors();
		getASColors ();
	}
	
	void Update () {
		
		curveValue = blinkingCurve.Evaluate (Time.time) * 20;
		setHeadandTailColor ();
		setGradient ();
		
	}
}
