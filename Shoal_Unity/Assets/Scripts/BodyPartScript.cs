using UnityEngine;
using System.Collections;

public class BodyPartScript : MonoBehaviour 
{
	private Material myMat;

	void Start()
	{
		myMat = GetComponent<Renderer>().material;
	}
	
	public void SetCustomColors(Color mainColor1, Color mainColor2)
	{
		myMat.SetColor("_CustomColorA",mainColor1);
		myMat.SetColor("_CustomColorB",mainColor2);
	}
	
	public void SetPosInTail(float _posInTail)
	{
		myMat.SetFloat("_PosInTail",_posInTail);
	}

	public void SetExchangeColor(float exchangeColor)
	{
		myMat.SetFloat("_ExchangeColor",exchangeColor);
	}

	public void SetPointCurve(float value)
	{
		myMat.SetFloat("_PointCurve",value);
	}

	public void SetHunger(float value)
	{
		myMat.SetFloat("_Hunger",value);
	}

	public void SetMinAlpha(float value)
	{
		myMat.SetFloat("_minAlpha",value);
	}

	public void SetSize(float size)
	{
		myMat.SetFloat("_Size",size);
	}

	public void SetProgressDigestion(float value)
	{
		myMat.SetFloat("_ProgressDigestion",value);
	}
}
