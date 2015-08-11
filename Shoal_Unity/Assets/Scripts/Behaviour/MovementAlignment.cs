using System.Linq;
using UnityEngine;
using System.Collections;

public class MovementAlignment : MovementFlockingBase
{
    protected override Vector2 GetEntityForce(Entity otherEntity, Vector2 delta, float closenessPercent)
    {
        return otherEntity.GetComponent<Vehicle>().Velocity * closenessPercent;
    }
}
