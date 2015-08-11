using System.Collections.Generic;
using UnityEngine;
using System.Collections;

public class Food : Entity
{
	public float lifeTime = 1f;

	public override EntityType Type
    {
        get { return EntityType.Food; }
    }

    [SerializeField] private float healthPlus;

    public float HealthPlus { get { return healthPlus; } }

	void Update()
	{
		lifeTime-=Time.deltaTime;
		if(lifeTime<=0f)
			Destroy (this.gameObject);
	}
}
