using System.Collections.Generic;
using UnityEngine;
using System.Collections;

public class Food : Entity
{
    public override EntityType Type
    {
        get { return EntityType.Food; }
    }

    [SerializeField] private float healthPlus;

    public float HealthPlus { get { return healthPlus; } }
}
