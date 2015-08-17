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
	[SerializeField] public FoodArea[] foodAreas;

    private List<Transform> boulders = new List<Transform>();
	[SerializeField] private float timeBetweenRipples = 0.3f;
	[SerializeField] private float timeBetweenFood = 0.3f;
	private float timerFood;
	private float timerRipple;
	private float timeBeforeNextWhirlPool;

	void Awake()
	{
		Instance = this;
		ResetWhirlPoolTimer();
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
		GameObject returnObject = null;
		if(timerRipple<=0f)
		{
			returnObject = SpawnStuff(prefabRipple, posOnScreen, 0f);
			timerRipple = timeBetweenRipples;
		}
		return(returnObject);
	}

	public GameObject SpawnFood(Vector2 posOnScreen)
	{
		GameObject returnObject = null;
		if(timerFood<=0f)
		{
			returnObject = SpawnStuff(prefabFood, posOnScreen, 0f);
			timerFood = timeBetweenFood;
		}
		return(returnObject);
	}
	
	GameObject SpawnStuff(Transform prefab,Vector2 posOnScreen, float zPos)
	{
		return(InstantiatePrefab(prefab, GetPosition(posOnScreen, zPos), Quaternion.identity).gameObject);
	}

    public Vector3 GetPosition(Vector2 posOnScreen, float zPos)
    {
		Vector3 spawnPos = Camera.main.ScreenToWorldPoint(posOnScreen)*2.5f;
		spawnPos.z = zPos;
        return spawnPos;
    }

	public void ActivateFoodArea(bool activated, int indexFoodArea)
	{
		foodAreas[indexFoodArea].GoActivate(activated);
	}

	public void RevertStateFoodArea(int indexFoodArea)
	{
		foodAreas[indexFoodArea].RevertState();
	}

	public Vector2 GetFoodAreaCoordinate(int index)
	{
		return(foodAreas[index].GetPositionOnScreen());
	}

	void Update()
	{
		timerFood-=Time.deltaTime;
		timerRipple-=Time.deltaTime;

		GestionSpawnWhirlPool();

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

	private void GestionSpawnWhirlPool()
	{
		timeBeforeNextWhirlPool-=Time.deltaTime;
		if(timeBeforeNextWhirlPool<=0f)
		{
			float rand = Random.Range(0f,2f*Mathf.PI);
			Vector3 randomPo = new Vector3(Mathf.Cos (rand),Mathf.Sin (rand),0f)*Random.Range (0f,8f)/2.5f;
			SpawnWhirlPool(Camera.main.WorldToScreenPoint(randomPo));
			ResetWhirlPoolTimer();
		}
	}

	private void ResetWhirlPoolTimer()
	{
		timeBeforeNextWhirlPool = 60f+Random.Range (60f,240f);
	}

	private Vector2 Vec2MousePos()
	{
		return(new Vector2(Input.mousePosition.x,Input.mousePosition.y));
	}

    public void SetBoulderPositions(List<Vector2> positions)
    {
        while (boulders.Count < positions.Count)
        {
            boulders.Add(SpawnBoulder(Vector2.zero).transform);
        }

        for (var i = 0; i < boulders.Count; i++)
        {
            var boulder = boulders[i];
            if (i < positions.Count)
            {
                boulder.position = GetPosition(positions[i], 0f);
                boulder.gameObject.SetActive(true);
            }
            else
            {
                boulder.gameObject.SetActive(false);
            }
        }
    }
}
