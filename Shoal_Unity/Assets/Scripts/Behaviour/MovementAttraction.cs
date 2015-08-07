using System.Linq;
using UnityEngine;
using System.Collections;

public class MovementAttraction : Movement
{
    [SerializeField] private EntityType type;
    [SerializeField] private float minForce;

    protected override Vector2 CalculateForce()
    {
        var entities = pond.GetEntitiesOfType(type, entity);
        if (!entities.Any())
            return new Vector2();

        var position = vehicle.Position;
        var closestEntity = entities.Nearest(position);
        var force = (Vector2) closestEntity.transform.position - position;

        if ((minForce > 0) && (force.sqrMagnitude < minForce * minForce))
        {
            force = force.normalized * minForce;
        }

        return force;
    }
}
