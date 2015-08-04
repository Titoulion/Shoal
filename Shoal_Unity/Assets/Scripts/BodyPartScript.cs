using UnityEngine;
using System.Collections;

public class BodyPartScript : MonoBehaviour {

	Color color1A;
	Color color1B;
	Color color2A;
	Color color2B;
	float transitionVal;


	public void SetColors(Color mainColor1A, Color mainColor1B, Color mainColor2A, Color mainColor2B)
	{
		GetComponent<Renderer>().material.SetColor("_MainColor1A",mainColor1A);
		GetComponent<Renderer>().material.SetColor("_MainColor1B",mainColor1B);
		GetComponent<Renderer>().material.SetColor("_MainColor2A",mainColor2A);
		GetComponent<Renderer>().material.SetColor("_MainColor2B",mainColor2B);

		color1A = mainColor1A;
		color1B = mainColor1B;
		color2A = mainColor2A;
		color2B = mainColor2B;
	}

	public void SetLerpsColors(float lerpMainColor1,float lerpMainColor2)
	{
		GetComponent<Renderer>().material.SetFloat("_LerpColor1",lerpMainColor1);
		GetComponent<Renderer>().material.SetFloat("_LerpColor2",lerpMainColor2);
	}

	public void SetTransitionColorValue(float transitionValue)
	{
		GetComponent<Renderer>().material.SetFloat("_TransitionValue",transitionValue);
		transitionVal = transitionValue;
	}

	public void SetOutlineWidth(float outlineWidth)
	{
		GetComponent<Renderer>().material.SetFloat("_OutlineWidth",outlineWidth);
	}

	public Color[] GetColors()
	{
		Color[] colors = new Color[2];
		colors[0] = Color.Lerp(GetComponent<Renderer>().material.GetColor("_MainColor1A"),GetComponent<Renderer>().material.GetColor("_MainColor1B"),GetComponent<Renderer>().material.GetFloat("_LerpColor1"));
		colors[1] = Color.Lerp(GetComponent<Renderer>().material.GetColor("_MainColor2A"),GetComponent<Renderer>().material.GetColor("_MainColor2B"),GetComponent<Renderer>().material.GetFloat("_LerpColor2"));
		return(colors);
	}

	public Color GetTransitionColor()
	{
		Color col1 = Color.Lerp (color1A,color1B,GetComponent<Renderer>().material.GetFloat("_LerpColor1"));
		Color col2 = Color.Lerp (color2A,color2B,GetComponent<Renderer>().material.GetFloat("_LerpColor2"));

		Color colI = Color.Lerp (col1,col2,GetComponent<Renderer>().material.GetFloat("_TransitionValue"));
		Color colJ = Color.Lerp (col2,col1,GetComponent<Renderer>().material.GetFloat("_TransitionValue"));

		return(Color.Lerp (colI,colJ,1f-GetComponent<Renderer>().material.GetFloat("_OutlineWidth")));


	}

	public void SetSize(float size)
	{
		GetComponent<Renderer>().material.SetFloat("_Size",size);
	}

	public float GetSize()
	{
		return(GetComponent<Renderer>().material.GetFloat("_Size"));
	}


}
