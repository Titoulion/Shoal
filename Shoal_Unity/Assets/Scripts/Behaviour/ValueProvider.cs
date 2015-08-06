using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public abstract class ValueProvider : MonoBehaviourBase
{
    [SerializeField] private bool inversePercent;

    public float ValueOutput
    {
        get { return inversePercent ? (1 - Value) : Value; }
    }

    protected abstract float Value { get; }
}
