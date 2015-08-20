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
	[SerializeField] public StoneArea[] stoneAreas;

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

	public GameObject SpawnFishCloserToCenter(Vector2 posOnScreen)
	{
		Vector2 _posOnScreen = posOnScreen;
		_posOnScreen+=(new Vector2(Screen.width/2f,Screen.height/2f)-posOnScreen).normalized*Screen.height/20f;
		return(SpawnStuff(prefabFish, _posOnScreen, 0f));
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
    public void SetPositionFromScreenCoord(GameObject obj, Vector2 posOnScreen, float zPos = 0f)
    {
        Vector3 worldPos = Camera.main.ScreenToWorldPoint(posOnScreen) * 2.5f;
        worldPos.z = zPos;
        obj.transform.position = worldPos;
    }
	
	public void ActivateFoodArea(bool activated, int indexFoodArea)
	{
		if(indexFoodArea<foodAreas.Length && foodAreas[indexFoodArea]!=null)
			foodAreas[indexFoodArea].GoActivate(activated);
	}

	public void RevertStateFoodArea(int indexFoodArea)
	{
		if(indexFoodArea<foodAreas.Length && foodAreas[indexFoodArea]!=null)	
			foodAreas[indexFoodArea].RevertState();
	}

	public void ActivateStoneArea(bool activated, int indexStoneArea)
	{
		if(indexStoneArea<foodAreas.Length && foodAreas[indexStoneArea]!=null)
			stoneAreas[indexStoneArea].GoActivate(activated);
	}
	
	public void RevertStateStoneArea(int indexStoneArea)
	{
		if(indexStoneArea<foodAreas.Length && foodAreas[indexStoneArea]!=null)
			stoneAreas[indexStoneArea].RevertState();
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
			SpawnFishCloserToCenter (Vec2MousePos());

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
			Vector3 randomPo = new Vector3(Mathf.Cos (rand),Mathf.Sin (rand),0f)*Random.Range (5f,8f)/2.5f;
			SpawnWhirlPool(Camera.main.WorldToScreenPoint(randomPo));
			ResetWhirlPoolTimer();
		}
	}

	private void ResetWhirlPoolTimer()
	{
		timeBeforeNextWhirlPool = 60f+Random.Range (30f,120f);
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
