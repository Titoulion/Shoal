using UnityEngine;
using System.Collections;
using System.Linq;

public class FoodArea : MonoBehaviour {

	// Use this for initialization

	public KeyCode myKeyCode;
	public KeyCode myKeyCode2;
	float openFoodArea = 0f;
	public GameObject prefabFood;
	float valDistortFood = 0f;
	int compter = 0;
	float timerReduceCompter = 1f;

	float timeFood;

	void Start () {
		valDistortFood = Random.value;
		timeFood = prefabFood.GetComponent<Food>().lifeTime;
	}
	
	// Update is called once per frame
	void Update () 
	{

		if(Input.GetKey(myKeyCode) || Input.GetKey(myKeyCode2))
		{
			openFoodArea+=Time.deltaTime*2f;
		}
		else
		{
			openFoodArea-=Time.deltaTime*2f;
		}
		
		openFoodArea = Mathf.Clamp01(openFoodArea);
		
		GetComponent<Renderer>().material.SetFloat("_ProgressTouch",openFoodArea);
		
		
		if(openFoodArea>0.2f && Random.value>0.7f && compter<8)
		{
			Vector3 rand = Random.insideUnitSphere*1.5f;
			Vector3 pos = transform.position;
			pos.z = 0f;
			compter++;

			pos+=Vector3.Normalize(-pos)*1f;
			pos+= rand;
			
			Instantiate(prefabFood,pos,Quaternion.identity);
		}

		valDistortFood+=Map (GetComponent<Renderer>().material.GetFloat("_ProgressTouch"),0f,1f,5f,25f)*0.001f;
		
		GetComponent<Renderer>().material.SetFloat("_valueDistort",valDistortFood);


		timerReduceCompter-=Time.deltaTime*compter;
		if(timerReduceCompter<=0f)
		{
			timerReduceCompter=timeFood;
			compter--;
			if(compter<0)
				compter=0;
		}


	}

	public float Map(float val, float fromMin, float fromMax, float toMin, float toMax) {
		return ((val - fromMin) / (fromMax - fromMin)) * (toMax - toMin) + toMin;
	}
	
}
