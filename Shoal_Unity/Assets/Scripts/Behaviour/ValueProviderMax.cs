using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class ValueProviderMax : ValueProvider
{
    [SerializeField] private ValueProvider[] inputs;

    protected override float Value
    {
        get
        {
            if (inputs.Length == 0)
                return 0;

            return inputs.Max(input => input.ValueOutput);
        }
    }
}
