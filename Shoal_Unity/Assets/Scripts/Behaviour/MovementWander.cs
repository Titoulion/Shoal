using UnityEngine;
using System.Collections;

public class MovementWander : Movement
{
    [SerializeField] private float circleDistance = 2;
    [SerializeField] private float circleRadius = 1;
    [SerializeField] private float maxRandomChangeRad = 0.1f;
    [SerializeField] private bool debug = false;

    private float angleRad;

    protected override void Awake()
    {
        base.Awake();
        angleRad = Random.Range(0f, Mathf.PI * 2);
    }

    protected override Vector2 CalculateForce()
    {
        angleRad += Random.Range(0f, maxRandomChangeRad) * MathUtil.RandomSign * Time.deltaTime;

        var circleOffset = vehicle.HeadingDirection * circleDistance;
        var offsetOnCircle = UnityHelper.CreateVector2AngleRad(angleRad) * circleRadius;
        var delta = circleOffset + offsetOnCircle;

        Debug.DrawLine(transform.position, transform.position + (Vector3) delta, Color.red, Time.deltaTime);

        return delta.normalized;
    }

    private void OnDrawGizmos()
    {
        if (!debug || (vehicle == null))
            return;

        angleRad += Random.Range(0f, maxRandomChangeRad) * MathUtil.RandomSign * Time.deltaTime;

        var circleOffset = vehicle.HeadingDirection * circleDistance;
        var offsetOnCircle = UnityHelper.CreateVector2AngleRad(angleRad) * circleRadius;

        Gizmos.DrawSphere(transform.position + (Vector3) circleOffset, circleRadius);
        Gizmos.DrawSphere(transform.position + (Vector3) circleOffset + (Vector3) offsetOnCircle, 0.1f);
    }
}
