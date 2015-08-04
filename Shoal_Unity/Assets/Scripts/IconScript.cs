using UnityEngine;
using System.Collections;

public class IconScript : MonoBehaviour {




	public enum State{Blink, Off, On};
	public State myState = State.Blink;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () 
	{
		if(myState == State.Off)
		{
			GetComponent<Renderer>().enabled = false;
		}
		else if(myState == State.On)
		{
			GetComponent<Renderer>().enabled = true;
		}
		else if(myState == State.Blink)
		{
			GetComponent<Renderer>().enabled = Modulo(Time.realtimeSinceStartup*2f,1f)>0.5f;
		}


	}

	float Map(float val, float fromMin, float fromMax, float toMin, float toMax) {
		return ((val - fromMin) / (fromMax - fromMin)) * (toMax - toMin) + toMin;
	}
	
	float Modulo(float a,float b)
	{
		return a - b * Mathf.Floor(a / b);
	}
}
