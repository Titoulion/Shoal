using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class ValueProviderInversePercent : ValueProvider
{
    [SerializeField] private ValueProvider input;

    protected override float Value
    {
        get { return 1 - input.ValueOutput; }
    }
}
