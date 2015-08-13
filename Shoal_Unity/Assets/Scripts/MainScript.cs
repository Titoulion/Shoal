using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

public class MainScript : MonoBehaviour 
{
	void Update () 
	{
		if(Input.GetKeyDown(KeyCode.R))
			Application.LoadLevel("MainScene");
		
		if(Input.GetKeyDown(KeyCode.Escape))
			Application.Quit ();
		
		if(Input.GetKeyDown (KeyCode.Delete) && Pond.Instance.GetEntitiesOfType(EntityType.Fish).Count()>0)
			Pond.Instance.GetEntitiesOfType(EntityType.Fish).ToArray()[0].gameObject.GetComponentInChildren<Fish>().Kill();
	}
}
