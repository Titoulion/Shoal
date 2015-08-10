using System.Linq;
using UnityEngine;
using System.Collections;

public abstract class MovementFlockingBase : Movement
{
    [SerializeField] private EntityType type = EntityType.Fish;
    [SerializeField] private float radius;
    [SerializeField] private bool closenessPercentage;
    [SerializeField] private bool reverseClosenessPercentage;

    protected override Vector2 CalculateForce()
    {
        var otherEntities = pond.GetEntitiesOfType(type, entity);

        var sum = new Vector2();
        var count = 0;
        var position = vehicle.Position;
        foreach (var otherEntity in otherEntities)
        {
            var delta = (Vector2) otherEntity.transform.position - position;
            var distance = delta.magnitude;
            if ((distance > 0) && (distance <= radius))
            {
                var closenessPercent = 1f;
                if (closenessPercentage)
                {
                    closenessPercent = 1 - (distance / radius);
                    if (reverseClosenessPercentage)
                        closenessPercent *= -1;
                }
                sum += GetEntityForce(otherEntity, delta, closenessPercent);
                count++;
            }
        }

        if (count == 0)
            return new Vector2();

        var average = sum / count;

        return GetForce(average);
    }

    protected abstract Vector2 GetEntityForce(Entity otherEntity, Vector2 delta, float closenessPercent);

    protected virtual Vector2 GetForce(Vector2 average)
    {
        return average;
    }
}
