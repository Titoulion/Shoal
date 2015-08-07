using UnityEngine;
using System.Collections;

public class Whirlpool : MonoBehaviour {

	public float duration = 8f;
	float progress;
	Material myMat;

	float currentState = 1f;
	bool goDie = false;

	// Use this for initialization
	void Start () {
		myMat = GetComponent<Renderer>().material;
		myMat.SetTextureOffset("_Perlin",new Vector2(Random.Range (-1f,1f),Random.Range (-1f,1f)));
		duration = Random.Range(4f,8f);
	}
	
	// Update is called once per frame
	void Update () {
	
		float valueOpen = 1f;

		if(currentState==1f)
		{
			progress+=Time.deltaTime;
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
			progress+=Time.deltaTime/duration;
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
			progress+=Time.deltaTime;
			progress = Mathf.Clamp01(progress);
			valueOpen=1f-progress;
			if(progress==1f)
			{
				goDie = true;
				progress=0f;
			}	
		}



	
		myMat.SetFloat ("_ProgressOpen",valueOpen);




		if(goDie)
		{
			Destroy(this.gameObject);
		}

	}
}
