using UnityEngine;
using System.Collections;

public class Whirlpool : Entity {

	public float durationOpening = 4f;
	public float durationStaying = 8f;
	public float durationClosing = 4f;
	float progress;
	Material myMat;

	float currentState = 1f;
	bool goDie = false;
	public float maxSize;

	public AnimationCurve curveSize;

	public float progressDanger = 0f;

	float intensitySwirl = 1f;


	float progressRotation = 0f;
	public float speedRotation = 1f;

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

			progressDanger+=Time.deltaTime/durationStaying;
			progressDanger = Mathf.Clamp01(progressDanger);


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

		transform.localScale = Map(curveSize.Evaluate(progressDanger),0f,1f,6.2f,12f)*Vector3.one;

		speedRotation = Map(curveSize.Evaluate(progressDanger),0f,1f,0.02f,0.08f);
		intensitySwirl = Map(curveSize.Evaluate(progressDanger),0f,1f,0f,-7f);


		progressRotation+=speedRotation;
		myMat.SetFloat ("_ProgressRotation",progressRotation);
		myMat.SetFloat ("_IntensitySwirl",intensitySwirl);


		if(goDie)
		{
			Destroy(this.gameObject);
		}

	}

	public float Map(float val, float fromMin, float fromMax, float toMin, float toMax) {
		return ((val - fromMin) / (fromMax - fromMin)) * (toMax - toMin) + toMin;
	}

	public override EntityType Type
    {
        get { return EntityType.Whirlpool; }
    }
}
