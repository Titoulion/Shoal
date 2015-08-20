using UnityEngine;
using System.Collections;

public class MovementConstant : Movement
{
    [SerializeField] private Vector2 velocity;

    protected override Vector2 CalculateForce()
    {
        return velocity;
    }
}
