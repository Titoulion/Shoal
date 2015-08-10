using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class WhirlpoolPull : MonoBehaviourBase
{
    [SerializeField] private float radius;
    [SerializeField] private float strength;
    [SerializeField] private float addStrengthPerSecond;
    [SerializeField] private AnimationCurve curve;

    private Pond pond;

    private void Awake()
    {
        pond = Pond.Instance;
    }

    public void Update()
    {
        strength += addStrengthPerSecond * Time.deltaTime;

        var fishes = pond.GetEntitiesOfType(EntityType.Fish);
        var stones = pond.GetEntitiesOfType(EntityType.Stone).ToArray();
        foreach (var fish in fishes)
        {
            var delta = (Vector2) (fish.transform.position - transform.position);
            var distance = delta.magnitude;
            if (distance >= radius)
                continue;

            if (stones.Any(stone => MathUtil.CheckCircleIntersection(stone.transform.position, stone.Radius, transform.position, fish.transform.position, true)))
                continue;

            var currentStrength = strength * curve.Evaluate(distance / radius);
            fish.transform.Translate(-delta.normalized * currentStrength * Time.deltaTime, Space.World);
        }
    }
}
