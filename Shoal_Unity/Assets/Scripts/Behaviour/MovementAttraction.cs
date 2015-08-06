using System.Linq;
using UnityEngine;
using System.Collections;

public class MovementAttraction : Movement
{
    [SerializeField] private EntityType type;

    protected override Vector2 CalculateForce()
    {
        var entities = pond.GetEntitiesOfType(type);
        if (!entities.Any())
            return new Vector2();

        var position = vehicle.Position;
        var closestEntity = entities.Nearest(position);
        return (Vector2) closestEntity.transform.position - position;
    }
}
