using System.Linq;
using UnityEngine;
using System.Collections;

public class MovementCohesion : MovementFlockingBase
{
    protected override Vector2 GetEntityForce(Entity otherEntity, Vector2 delta, float closenessPercent)
    {
        return -otherEntity.GetComponent<Vehicle>().Velocity * closenessPercent;
    }

    protected override Vector2 GetForce(Vector2 average)
    {
        var deltaToTarget = average - vehicle.Position;
        return deltaToTarget;
    }
}
