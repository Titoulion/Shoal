using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public abstract class Entity : MonoBehaviourBase
{
    [SerializeField] private float radius;

    public abstract EntityType Type { get; }

    public float Radius { get { return radius; } }

    protected Pond pond;

    protected virtual void Awake()
    {
        pond = Pond.Instance;
        pond.RegisterEntity(this);
    }

    protected virtual void OnDestroy()
    {
        pond.RemoveEntity(this);
    }

    public void Eaten()
    {
        Destroy(gameObject);
    }
}
