using System.Collections.Generic;
using UnityEngine;
using System.Collections;

public class Vehicle : MonoBehaviourBase
{
    [SerializeField] private float maxSpeed = 2f;
    [SerializeField] private List<Movement> movements;

    private Vector2 velocity;

    public Vector2 Position { get { return transform.position; } }
    public Vector2 Velocity { get { return velocity; } }
    public float Speed { get { return velocity.magnitude; } }
    public Vector2 HeadingDirection { get { return velocity.normalized; } }
    public float HeadingAngleDeg { get { return velocity.GetAngleDeg(); } }
    public float HeadingAngleRad { get { return velocity.GetAngleRad(); } }

    private void Awake()
    {
        do
        {
            velocity = Random.insideUnitCircle;
        }
        while (velocity.sqrMagnitude < 0.001f);
        transform.eulerAngles = new Vector3(0, 0, velocity.GetAngleDeg());
    }

    private void Update()
    {
        var totalWeight = 0f;
        var totalDesiredForce = new Vector2();
        foreach (var movement in movements)
        {
            if (!movement.isActiveAndEnabled)
                continue;

            var weight = movement.CurrentWeight;
            var force = movement.CurrentForce;

            if ((weight == 0) || (force.sqrMagnitude == 0))
                continue;

            totalDesiredForce += movement.CurrentForce * weight;
            totalWeight += weight;
        }

        if (totalWeight > 0)
        {
            var desiredForce = totalDesiredForce / totalWeight;
            var force = desiredForce - velocity;

            velocity += force * Time.deltaTime;
        }

        if (velocity.sqrMagnitude < 0.001f)
            return;

        velocity = Vector2.ClampMagnitude(velocity, maxSpeed);
        transform.Translate(velocity * Time.deltaTime, Space.World);
        transform.eulerAngles = new Vector3(0, 0, velocity.GetAngleDeg());
    }
}
