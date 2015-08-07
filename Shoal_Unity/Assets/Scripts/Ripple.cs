using UnityEngine;
using System.Collections;

public class Ripple : MonoBehaviour {
	Material myMat;
	public float durationRipple = 2f;
	float progress = 0f;
	// Use this for initialization
	void Start () {
		myMat = GetComponent<Renderer>().material;
	}
	
	// Update is called once per frame
	void Update () {
		progress+=Time.deltaTime/durationRipple;
		progress = Mathf.Clamp01(progress);
		myMat.SetFloat("_Progress",progress);
		if(progress==1f)
		{
			Destroy (this.gameObject);
		}
	}
}
