using System.Linq;
using UnityEngine;
using System.Collections;

public abstract class Movement : MonoBehaviourBase
{
    [SerializeField] private float multiplier = 1;
    [SerializeField] private float weight = 1;
    [SerializeField] private ValueProvider activationPercentValueProvider;

    protected Pond pond;
    protected Vehicle vehicle;

    public float CurrentWeight
    {
        get
        {
            if (activationPercentValueProvider == null)
                return weight;

            return weight * Mathf.Max(activationPercentValueProvider.ValueOutput, 0f);
        }
    }

    public Vector2 CurrentForce { get { return CalculateForce() * multiplier; } }

    protected virtual void Awake()
    {
        pond = Pond.Instance;
        vehicle = GetComponentInParent<Vehicle>();
    }

    protected virtual void Update()
    {
    }

    protected abstract Vector2 CalculateForce();
}
