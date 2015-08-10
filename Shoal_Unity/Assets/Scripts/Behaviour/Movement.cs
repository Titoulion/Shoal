using System.Linq;
using UnityEngine;
using System.Collections;

public abstract class Movement : MonoBehaviourBase
{
    [SerializeField] private float multiplier = 1;
    [SerializeField] private float weight = 1;
    [SerializeField] private ValueProvider activationPercentValueProvider;
    [SerializeField] private BetweenFloat weightRandomFactor = new BetweenFloat(1, 1);
    [SerializeField] private AnimationCurve weightRandomFactorCurve = new AnimationCurve(new Keyframe(0, 0), new Keyframe(1, 1));
    [SerializeField] private BetweenFloat randomWeightChangingDelay;

    protected Pond pond;
    protected Vehicle vehicle;
    protected Entity entity;
    private float randomWeightFactor;
    private Countdown randomWeightChangingCountdown;

    public float CurrentWeight
    {
        get
        {
            if (activationPercentValueProvider == null)
                return weight * randomWeightFactor;

            return weight * Mathf.Max(activationPercentValueProvider.ValueOutput, 0f) * randomWeightFactor;
        }
    }

    public Vector2 CurrentForce { get { return CalculateForce() * multiplier; } }

    protected virtual void Awake()
    {
        pond = Pond.Instance;
        vehicle = GetComponentInParent<Vehicle>();
        entity = vehicle.GetComponent<Entity>();

        if (randomWeightChangingDelay.To > 0)
        {
            randomWeightChangingCountdown = new Countdown(0);
        }
        ChooseRandomWeightFactor();
    }

    private void ChooseRandomWeightFactor()
    {
        randomWeightFactor = weightRandomFactor.Lerp(weightRandomFactorCurve.Evaluate(Random.value));
        if (randomWeightChangingCountdown != null)
        {
            randomWeightChangingCountdown.Reset(randomWeightChangingDelay.Random);
        }
    }

    protected virtual void Update()
    {
        if (randomWeightChangingCountdown != null)
        {
            ChooseRandomWeightFactor();
        }
    }

    protected abstract Vector2 CalculateForce();
}
