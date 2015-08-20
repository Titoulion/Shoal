using UnityEngine;
using System.Collections;
using System.Linq;

public class StoneArea : MonoBehaviour 
{
	public bool isActivated = false;
	bool prevIsActivated = false;
	public Stone myStone;
	
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
	}
	
	public void GoActivate(bool goActivate)
	{  
		isActivated = goActivate;
	}
	
	public void RevertState()
	{  
		isActivated = !isActivated;
	}

	void UpdateState(bool on)
	{
		isActivated = on;
		myStone.isOn = isActivated;
		myStone.gameObject.GetComponent<Renderer>().enabled = isActivated;
		if(isActivated)
			Spawner.Instance.SpawnRipple(GetPositionOnScreen());
	}
	
	public Vector2 GetPositionOnScreen()
	{
		return(Camera.main.WorldToScreenPoint(transform.position/2.5f));
	}
}