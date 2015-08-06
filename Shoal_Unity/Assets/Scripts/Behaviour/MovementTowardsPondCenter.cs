using UnityEngine;
using System.Collections;

public class MovementTowardsPondCenter : Movement
{
    [SerializeField] private AnimationCurve pushForceCurve;
    [SerializeField] private float offset;

    protected override Vector2 CalculateForce()
    {
        var position = vehicle.Position + vehicle.HeadingDirection * offset;

        var currentDistance = position.magnitude;
        var currentDistancePercent = currentDistance / pond.Radius;

        var pushForceStrength = pushForceCurve.Evaluate(currentDistancePercent);
        if (pushForceStrength <= 0)
            return Vector2.zero;

        var pushForceDirection = -position.normalized;
        return pushForceDirection * pushForceStrength;
    }
}
