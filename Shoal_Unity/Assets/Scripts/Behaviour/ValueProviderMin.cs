using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class ValueProviderMin : ValueProvider
{
    [SerializeField] private ValueProvider[] inputs;

    protected override float Value
    {
        get
        {
            if (inputs.Length == 0)
                return 0;

            return inputs.Min(input => input.ValueOutput);
        }
    }
}
