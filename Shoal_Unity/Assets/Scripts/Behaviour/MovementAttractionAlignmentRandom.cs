using System.Linq;
using UnityEngine;
using System.Collections;

public class MovementAttractionAlignmentRandom : Movement
{
    [SerializeField] private EntityType type;
    [SerializeField] private float attractionMultiplier = 1;
    [SerializeField] private float alignmentMultiplier = 1;
    [SerializeField] private BetweenFloat changingDelay = new BetweenFloat(5, 20);

    private Entity currentEntity;
    private Countdown changingCountdown;

    protected override void Awake()
    {
        base.Awake();

        changingCountdown = new Countdown(changingDelay.Random);
    }

    protected override void Update()
    {
        base.Update();

        if (changingCountdown.Update())
        {
            currentEntity = null;
            changingCountdown.Reset(changingDelay.Random);
        }
    }

    protected override Vector2 CalculateForce()
    {
        if (currentEntity == null)
        {
            var entities = pond.GetEntitiesOfType(type, entity).ToArray();
            if (entities.Length == 0)
                return new Vector2();

            currentEntity = entities.RandomElement();
        }

        var position = vehicle.Position;
        var force = (((Vector2) currentEntity.transform.position - position) * attractionMultiplier) +
                    (currentEntity.GetComponent<Vehicle>().Velocity * alignmentMultiplier);

        return force;
    }
}
