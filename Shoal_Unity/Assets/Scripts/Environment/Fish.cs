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
	
    private float health;

	public event Action EventDeath;

    protected override void Awake()
    {
        base.Awake();
        health = 1;
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

        Health += food.HealthPlus;
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
