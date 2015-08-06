using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class ValueProviderCurve : ValueProvider
{
    [SerializeField] private ValueProvider input;
    [SerializeField] private AnimationCurve curve;

    protected override float Value
    {
        get { return curve.Evaluate(input.ValueOutput); }
    }
}
