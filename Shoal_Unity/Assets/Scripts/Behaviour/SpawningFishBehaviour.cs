using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class SpawningFishBehaviour : MonoBehaviourBase
{
    [SerializeField] private float radius = 1;
    [SerializeField] private float speedRad = 1;

    private Fish fish;
    private Vehicle vehicle;
    private float angle;
    private int swimmingDirection;
    private Vector3 circleCenter;

    private void OnEnable()
    {
        vehicle = GetComponent<Vehicle>();
        vehicle.enabled = false;

        fish = GetComponent<Fish>();
        fish.enabled = false;

        swimmingDirection = MathUtil.RandomSign;
        circleCenter = transform.position;
    }

    private void OnDisable()
    {
        vehicle.enabled = true;
        fish.enabled = true;
    }

    private void Update()
    {
        angle += Time.deltaTime * swimmingDirection * speedRad;
        var delta = UnityHelper.CreateVector2AngleRad(angle);

        transform.position = circleCenter + (Vector3) delta * radius;
        vehicle.Velocity = new Vector2(-delta.y, delta.x) * swimmingDirection;
    }
}
