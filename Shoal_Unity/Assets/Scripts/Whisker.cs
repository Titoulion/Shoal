using UnityEngine;
using System.Collections;

public class Whisker : MonoBehaviour {

	// Use this for initialization
	private float progress;
	public GameObject myShape;

	void Start () 
	{



		transform.localScale = Vector3.one*0f;

	}

	public void Init(float rota, float scal,Color colo)
	{

		transform.localPosition = Vector3.zero;
		transform.localEulerAngles = new Vector3(0f,0f, rota);
		Vector3 newSize = myShape.transform.localEulerAngles;
		newSize.x = scal;
		myShape.transform.localEulerAngles = newSize;
		SetColorShape(colo);

	}
	
	// Update is called once per frame
	void Update () 
	{
		progress+=Time.deltaTime;
		progress=Mathf.Clamp01(progress);
		transform.localScale = Vector3.one*progress*((transform.parent).transform.parent).GetComponentInChildren<Tail>().headSize*0.8f;
	}

	public void SetColorShape(Color col)
	{
		myShape.GetComponent<Renderer>().material.SetColor ("_Color",col);
	}
}
