using UnityEngine;
using System.Collections;

public class Whirlpool : MonoBehaviour {

	public float durationOpening = 4f;
	public float durationStaying = 8f;
	public float durationClosing = 4f;
	float progress;
	Material myMat;

	float currentState = 1f;
	bool goDie = false;
	public float maxSize;

	public AnimationCurve curveSize;

	// Use this for initialization
	void Start () {
		myMat = GetComponent<Renderer>().material;
		myMat.SetTextureOffset("_Perlin",new Vector2(Random.Range (-1f,1f),Random.Range (-1f,1f)));
		durationStaying = Random.Range(8f,16f);
	}
	
	// Update is called once per frame
	void Update () {

		float valueOpen = 1f;

		if(currentState==1f)
		{
			progress+=Time.deltaTime/durationOpening;
			progress = Mathf.Clamp01(progress);
			valueOpen = progress;
			if(progress==1f)
			{
				currentState=0f;
				progress=0f;
			}
		}
		else if(currentState==0f)
		{
			progress+=Time.deltaTime/durationStaying;
			progress = Mathf.Clamp01(progress);
			valueOpen = 1f;
			if(progress==1f)
			{
				currentState = -1f;
				progress=0f;
			}	
		}
		else if(currentState==-1f)
		{
			progress+=Time.deltaTime/durationClosing;
			progress = Mathf.Clamp01(progress);
			valueOpen=1f-progress;
			if(progress==1f)
			{
				goDie = true;
				progress=0f;
			}	
		}



	
		myMat.SetFloat ("_ProgressOpen",valueOpen);

		transform.localScale = curveSize.Evaluate(valueOpen)*maxSize*Vector3.one;


		if(goDie)
		{
			Destroy(this.gameObject);
		}

	}
}
