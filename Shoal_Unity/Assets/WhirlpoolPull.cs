using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class WhirlpoolPull : MonoBehaviourBase
{
    [SerializeField] private float radiusKill = 0.5f;
    [SerializeField] private float radius;
    [SerializeField] private float delay;
    [SerializeField] private float strength;
    [SerializeField] private float addStrengthPerSecond;
    [SerializeField] private AnimationCurve curve;

    private Pond pond;
    private List<Entity> killFishes;
    private Countdown delayCountdown;

    private void Awake()
    {
        pond = Pond.Instance;

        killFishes = new List<Entity>();

        delayCountdown = new Countdown(delay);
    }

    public void Update()
    {
        if (delayCountdown.TimeLeft > 0)
        {
            delayCountdown.Update();
            return;
        }

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
            fish.transform.position = Vector3.MoveTowards(fish.transform.position, transform.position, currentStrength * Time.deltaTime);

            if (Vector2.Distance(fish.transform.position, transform.position) <= radiusKill)
            {
                killFishes.Add(fish);
            }
        }

        foreach (var fish in killFishes)
        {
			fish.GetComponentInChildren<Tail>().GoDieWithNewDuration(0.2f);
        }
        killFishes.Clear();
    }
}
