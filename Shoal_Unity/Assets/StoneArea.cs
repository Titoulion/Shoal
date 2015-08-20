using UnityEngine;
using System.Collections;
using System.Linq;

public class StoneArea : MonoBehaviour 
{
	public bool isActivated = false;
	bool prevIsActivated = false;
	public Stone myStone;
	float timerSecurity = 0f;
	float resetTimerSecurityValue = 0.3f;
	float timeSinceLastRipple = 0f;
	
	void Start () 
	{
		UpdateState(false);
		prevIsActivated = isActivated;
	}
	
	void Update () 
	{
		if(prevIsActivated!=isActivated)
		{
			prevIsActivated = isActivated;
			UpdateState (isActivated);
		}

		timerSecurity-=Time.deltaTime;
		timeSinceLastRipple+=Time.deltaTime;
	}
	
	public void GoActivate(bool goActivate)
	{  
		if(timerSecurity<=0f)
		{
			isActivated = goActivate;
			timerSecurity = resetTimerSecurityValue;
		}

	}
	
	public void RevertState()
	{  
		if(timerSecurity<=0f)
		{
			isActivated = !isActivated;
			timerSecurity = resetTimerSecurityValue;
		}
	}

	void UpdateState(bool on)
	{
		isActivated = on;
		myStone.isOn = isActivated;
		myStone.gameObject.GetComponent<Renderer>().enabled = isActivated;
		if(isActivated && timeSinceLastRipple>1f)
		{
			Spawner.Instance.SpawnRipple(GetPositionOnScreen());
			timeSinceLastRipple =0f;
		}
			
	}
	
	public Vector2 GetPositionOnScreen()
	{
		return(Camera.main.WorldToScreenPoint(transform.position/2.5f));
	}
}