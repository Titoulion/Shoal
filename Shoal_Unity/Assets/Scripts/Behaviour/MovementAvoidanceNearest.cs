using System.Linq;
using UnityEngine;
using System.Collections;

public class MovementAvoidanceNearest : Movement
{
    [SerializeField] private EntityType type;
    [SerializeField] private float radius;
    [SerializeField] private AnimationCurve curve;

    protected override Vector2 CalculateForce()
    {
        var entities = pond.GetEntitiesOfType(type, entity);
        if (!entities.Any())
            return new Vector2();

        var position = vehicle.Position;
        var closestEntity = entities.Nearest(position);
        var delta = (Vector2) closestEntity.transform.position - position;
        var distance = delta.magnitude;
        if (distance >= radius)
            return new Vector2();

        var percent = distance / radius;

        return -delta.normalized * curve.Evaluate(percent);
    }
}
