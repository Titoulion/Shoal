using System;
using System.Collections.Generic;
using UnityEngine;
using System.Collections;

public class Fish : Entity
{
    [SerializeField] private float timeToDeath = 10f;
    [SerializeField] private Transform eatingTransform;
    [SerializeField] private float eatingRadius;
    [SerializeField] private float eatMaxValue = 0.8f;
	public GameObject myWhisker;
    private float health;

	public event Action EventDeath;

    protected override void Awake()
    {
        base.Awake();
        health = 1;
    }

    public void PutInSpawningMode()
    {
        GetComponent<SpawningFishBehaviour>().enabled = true;
    }

    public void ExitSpawningMode()
    {
		if(GetComponent<SpawningFishBehaviour>().enabled)
		{
			GetComponent<SpawningFishBehaviour>().enabled = false;
			SfxManager.Instance.PlaySound(SfxManager.Instance.ploufSound,1f,UnityEngine.Random.Range (0.8f,1.2f));
		}
    }

    private void Update()
    {
		if(Health==0)
			return;

		Health -= Time.deltaTime / timeToDeath;

        var eatingTransformPosition = eatingTransform.position;
        foreach (var food in pond.GetEntitiesOfType(EntityType.Food))
        {
            if (Vector2.Distance(food.transform.position, eatingTransformPosition) <= eatingRadius)
            {
                EatFood((Food) food);
            }
        }

		myWhisker.transform.eulerAngles = new Vector3(0f,0f,GetComponent<Vehicle>().HeadingAngleDeg+90f);
    }

	public void Kill()
	{
		Health = 0f;
	}

    public float Health
    {
        get { return health; }
        private set
        {
            value = Mathf.Clamp01(value);

            if (health == value)
                return;

            health = value;

            if (health == 0)
            {
                Die();
            }
        }
    }

    private void EatFood(Food food)
    {
        if ((Health == 0) || (Health > eatMaxValue))
            return;

		GetComponentInChildren<Tail>().GoDigest();
        Health += food.HealthPlus;
		SfxManager.Instance.PlaySound(SfxManager.Instance.fishEatSound,1f,UnityEngine.Random.Range (1f,1.6f));
        food.Eaten();
    }

    private void Die()
    {
        if(EventDeath!=null)
			EventDeath();
    }

    public override EntityType Type
    {
        get { return EntityType.Fish; }
    }
}
