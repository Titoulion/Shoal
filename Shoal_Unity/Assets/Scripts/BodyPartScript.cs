using UnityEngine;
using System.Collections;

public class BodyPartScript : MonoBehaviour {

	Color color1A;
	Color color1B;
	Color color2A;
	Color color2B;
	float transitionVal;

	Material myMat;

	void Awake()
	{
		myMat = GetComponent<Renderer>().material;
	}


	public void SetColors(Color mainColor1A, Color mainColor1B, Color mainColor2A, Color mainColor2B)
	{
		myMat.SetColor("_MainColor1A",mainColor1A);
		myMat.SetColor("_MainColor1B",mainColor1B);
		myMat.SetColor("_MainColor2A",mainColor2A);
		myMat.SetColor("_MainColor2B",mainColor2B);

		color1A = mainColor1A;
		color1B = mainColor1B;
		color2A = mainColor2A;
		color2B = mainColor2B;
	}

	public void SetLerpsColors(float lerpMainColor1,float lerpMainColor2)
	{
		myMat.SetFloat("_LerpColor1",lerpMainColor1);
		myMat.SetFloat("_LerpColor2",lerpMainColor2);
	}

	public void SetTransitionColorValue(float transitionValue)
	{
		myMat.SetFloat("_TransitionValue",transitionValue);
		transitionVal = transitionValue;
	}

	public void SetOutlineWidth(float outlineWidth)
	{
		myMat.SetFloat("_OutlineWidth",outlineWidth);
	}

	public Color[] GetColors()
	{
		Color[] colors = new Color[2];
		colors[0] = Color.Lerp(myMat.GetColor("_MainColor1A"),myMat.GetColor("_MainColor1B"),myMat.GetFloat("_LerpColor1"));
		colors[1] = Color.Lerp(myMat.GetColor("_MainColor2A"),myMat.GetColor("_MainColor2B"),myMat.GetFloat("_LerpColor2"));
		return(colors);
	}

	public Color GetTransitionColor()
	{
		Color col1 = Color.Lerp (color1A,color1B,myMat.GetFloat("_LerpColor1"));
		Color col2 = Color.Lerp (color2A,color2B,myMat.GetFloat("_LerpColor2"));

		Color colI = Color.Lerp (col1,col2,myMat.GetFloat("_TransitionValue"));
		Color colJ = Color.Lerp (col2,col1,myMat.GetFloat("_TransitionValue"));

		return(Color.Lerp (colI,colJ,1f-myMat.GetFloat("_OutlineWidth")));


	}

	public void SetCustomColor(Color value)
	{
		myMat.SetColor ("_myCustomColor",value);
	}

	public void SetSize(float size)
	{
		myMat.SetFloat("_Size",size);
	}

	public float GetSize()
	{
		return(myMat.GetFloat("_Size"));
	}


}
