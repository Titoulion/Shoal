using System.Linq;
using UnityEngine;
using System.Collections;

public class MovementObstacleAvoidance : Movement
{
    [SerializeField] private EntityType type = EntityType.Stone;
    [SerializeField] private float feelerLength = 2;

    protected override Vector2 CalculateForce()
    {
        var obstacles = pond.GetEntitiesOfType(type);
        if (!obstacles.Any())
            return new Vector2();


        var lineFrom = vehicle.Position;
        var lineTo = lineFrom + vehicle.HeadingDirection * feelerLength;

        Entity closestCollisionEntity = null;
        var closestCollisionPoint = new Vector2();
        var closestDistance = float.PositiveInfinity;

        foreach (var obstacle in obstacles)
        {
            var radius = entity.Radius + obstacle.Radius;
            var intersections = MathUtil.CircleIntersections(obstacle.transform.position, radius, lineFrom, lineTo, true);
            if (intersections != null)
            {
                foreach (var intersection in intersections)
                {
                    var distance = Vector2.Distance(lineFrom, intersection);
                    if (distance < closestDistance)
                    {
                        closestCollisionEntity = obstacle;
                        closestCollisionPoint = intersection;
                        closestDistance = distance;
                    }
                }
            }
        }

        if (closestCollisionEntity == null)
            return Vector2.zero;

        var normal = (closestCollisionPoint - (Vector2) closestCollisionEntity.transform.position).normalized;
        var distancePercent = closestDistance / feelerLength;
        var closenessPercent = 1 - distancePercent;

        return normal * closenessPercent;
    }
}
