using UnityEngine;
using System.Collections;
using System.Linq;

public class FoodArea : MonoBehaviour 
{
	[SerializeField] private GameObject prefabFood;
	private float openFoodArea = 0f;
	private float valDistortFood = 0f;
	private int counter = 0;
	private float timerReduceCompter = 1f;
	private float timeFood;
	public bool isActivated = false;
	private Material myMat;

	void Start () 
	{
		valDistortFood = Random.value;
		timeFood = prefabFood.GetComponent<Food>().lifeTime;
		myMat = GetComponent<Renderer>().material;
	}

	void Update () 
	{
		timerReduceCompter-=Time.deltaTime*counter;
		if(timerReduceCompter<=0f)
		{
			timerReduceCompter=timeFood;
			counter=Mathf.Max (0,counter-1);
		}

		openFoodArea+=(isActivated?1f:-1f)*Time.deltaTime*2f;
		openFoodArea = Mathf.Clamp01(openFoodArea);

		if(counter<8 && openFoodArea>0.2f && Random.value>0.7f)
		{
			Vector3 pos = transform.position;
			pos+=Vector3.Normalize(-pos)*1f+ Random.insideUnitSphere*1.5f;
			pos.z = 0f;
			Instantiate(prefabFood,pos,Quaternion.identity);
			counter++;
		}

		valDistortFood+=MyHelper.Map (openFoodArea,0f,1f,5f,25f)*0.001f;
		myMat.SetFloat("_valueDistort",valDistortFood);
		myMat.SetFloat("_ProgressTouch",openFoodArea);
		//Debug.Log (GetPositionOnScreen());
	}

	public void GoActivate(bool goActivate)
	{  
		isActivated = goActivate;	
	}

	public void RevertState()
	{  
		isActivated = !isActivated;	
	}

	public Vector2 GetPositionOnScreen()
	{
		return(Camera.main.WorldToScreenPoint(transform.position/2.5f));
	}
}