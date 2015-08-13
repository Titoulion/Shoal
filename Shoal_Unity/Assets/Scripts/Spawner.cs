using System.Collections.Generic;
using UnityEngine;
using System.Collections;

public class Spawner : MonoBehaviourBase 
{
	public static Spawner Instance;

	[SerializeField] private Transform prefabBoulder;
	[SerializeField] private Transform prefabFish;
	[SerializeField] private Transform prefabWhirlPool;
	[SerializeField] private Transform prefabRipple;
	[SerializeField] private Transform prefabFood;
	[SerializeField] private FoodArea[] foodAreas;

	void Awake()
	{
		Instance = this;
	}

	public GameObject SpawnBoulder(Vector2 posOnScreen)
	{
		return(SpawnStuff(prefabBoulder, posOnScreen, 0f));
	}

	public GameObject SpawnFish(Vector2 posOnScreen)
	{
		return(SpawnStuff(prefabFish, posOnScreen, 0f));
	}

	public GameObject SpawnWhirlPool(Vector2 posOnScreen)
	{
		return(SpawnStuff(prefabWhirlPool, posOnScreen, 0f));
	}

	public GameObject SpawnRipple(Vector2 posOnScreen)
	{
		return(SpawnStuff(prefabRipple, posOnScreen, 0f));
	}

	public GameObject SpawnFood(Vector2 posOnScreen)
	{
		return(SpawnStuff(prefabFood, posOnScreen, 0f));
	}
	
	GameObject SpawnStuff(Transform prefab,Vector2 posOnScreen, float zPos)
	{
		Vector3 spawnPos = Camera.main.ScreenToWorldPoint(posOnScreen)*2.5f;
		spawnPos.z = zPos;
		return(InstantiatePrefab(prefab, spawnPos, Quaternion.identity).gameObject);
	}

	public void ActivateFoodArea(bool activated, int indexFoodArea)
	{
		foodAreas[indexFoodArea].GoActivate(activated);
	}

	public void RevertStateFoodArea(int indexFoodArea)
	{
		foodAreas[indexFoodArea].RevertState();
	}

	void Update()
	{
		if (Input.GetMouseButtonDown(0))
			SpawnFish (Vec2MousePos());

		if (Input.GetMouseButtonDown(1))
			SpawnFood(Vec2MousePos());

		if (Input.GetMouseButtonDown(2))
			SpawnBoulder (Vec2MousePos());

		if (Input.GetKeyDown(KeyCode.Alpha0)||Input.GetKeyDown(KeyCode.Keypad0))
			SpawnWhirlPool(Vec2MousePos());
		
		if (Input.GetKeyDown(KeyCode.Alpha1)||Input.GetKeyDown(KeyCode.Keypad1))
			SpawnRipple(Vec2MousePos());
		
		if (Input.GetKeyDown(KeyCode.Alpha2)||Input.GetKeyDown(KeyCode.Keypad2))
			RevertStateFoodArea(0);

		if (Input.GetKeyDown(KeyCode.Alpha3)||Input.GetKeyDown(KeyCode.Keypad3))
			RevertStateFoodArea(1);
	}

	private Vector2 Vec2MousePos()
	{
		return(new Vector2(Input.mousePosition.x,Input.mousePosition.y));
	}
}
