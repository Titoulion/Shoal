using System.Linq;
using UnityEngine;
using System.Collections;

public class MovementAlignmentNearest : Movement
{
    [SerializeField] private EntityType type;

    protected override Vector2 CalculateForce()
    {
        var entities = pond.GetEntitiesOfType(type, entity);
        if (!entities.Any())
            return new Vector2();

        var position = vehicle.Position;
        var closestEntity = entities.Nearest(position);
        var force = closestEntity.GetComponent<Vehicle>().Velocity;

        return force;
    }
}
