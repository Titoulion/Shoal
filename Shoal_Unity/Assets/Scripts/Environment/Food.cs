using System.Collections.Generic;
using UnityEngine;
using System.Collections;

public class Food : Entity
{
	public float maxLifeTime = 1f;
	public float lifeTime = 1f;
	public AnimationCurve curveSize;

	public override EntityType Type
    {
        get { return EntityType.Food; }
    }

    [SerializeField] private float healthPlus;

    public float HealthPlus { get { return healthPlus; } }

    protected override void Awake()
	{
        base.Awake();
		lifeTime = maxLifeTime;
	}

	void Update()
	{
		float progress = 1f-lifeTime/maxLifeTime;

		transform.localScale = Vector3.one*curveSize.Evaluate(progress)*0.4f;

		lifeTime-=Time.deltaTime;
		if(lifeTime<=0f)
			Eaten();
	}
}
