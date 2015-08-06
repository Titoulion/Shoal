using UnityEngine;
using System.Collections;

public class BodyPartScript : MonoBehaviour {

	Color color1A;
	Color color1B;
	Color color2A;
	Color color2B;
	float posInTail;

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

	public void SetCustomColors(Color mainColor1, Color mainColor2)
	{
		myMat.SetColor("_CustomColorA",mainColor1);
		myMat.SetColor("_CustomColorB",mainColor2);

	}


	public void SetLerpsColors(float lerpMainColor1,float lerpMainColor2)
	{
		myMat.SetFloat("_LerpColor1",lerpMainColor1);
		myMat.SetFloat("_LerpColor2",lerpMainColor2);
	}

	public void SetPosInTail(float _posInTail)
	{
		myMat.SetFloat("_PosInTail",_posInTail);
		posInTail = _posInTail;
	}

	public void SetExchangeColor(float exchangeColor)
	{
		myMat.SetFloat("_ExchangeColor",exchangeColor);
	}

	public Color[] GetColors()
	{
		Color[] colors = new Color[2];
		colors[0] = Color.Lerp(color1A,color1B,myMat.GetFloat("_LerpColor1"));
		colors[1] = Color.Lerp(color2A,color2B,myMat.GetFloat("_LerpColor2"));
		return(colors);
	}

	public Color GetTransitionColor()
	{
		Color col1 = Color.Lerp (color1A,color1B,myMat.GetFloat("_LerpColor1"));
		Color col2 = Color.Lerp (color2A,color2B,myMat.GetFloat("_LerpColor2"));

		Color colI = Color.Lerp (col1,col2,myMat.GetFloat("_PosInTail"));
		Color colJ = Color.Lerp (col2,col1,myMat.GetFloat("_PosInTail"));

		return(Color.Lerp (colI,colJ,1f-myMat.GetFloat("_ExchangeColor")));


	}

	public void SetPointCurve(float value)
	{
		myMat.SetFloat("_PointCurve",value);
	}

	public void SetHunger(float minAlpha,float value)
	{
		myMat.SetFloat("_Hunger",value);
		myMat.SetFloat("_minAlpha",minAlpha);
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
