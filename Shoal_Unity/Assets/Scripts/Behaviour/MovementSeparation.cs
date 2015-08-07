using System.Linq;
using UnityEngine;
using System.Collections;

public class MovementSeparation : Movement
{
    [SerializeField] private EntityType type = EntityType.Fish;
    [SerializeField] private float radius;

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
                var percent = distance / radius;
                sum += -delta.normalized * percent;
                count++;
            }
        }

        if (count == 0)
            return new Vector2();

        var average = sum / count;

        return average;
    }
}
