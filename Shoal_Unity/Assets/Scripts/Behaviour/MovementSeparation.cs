﻿using System.Linq;
using UnityEngine;
using System.Collections;

public class MovementSeparation : MovementFlockingBase
{
    protected override Vector2 GetEntityForce(Entity otherEntity, Vector2 delta, float closenessPercent)
    {
        return -delta.normalized * closenessPercent;
    }
}
