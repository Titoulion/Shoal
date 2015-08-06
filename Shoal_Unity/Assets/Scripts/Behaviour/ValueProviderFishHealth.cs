using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class ValueProviderFishHealth : ValueProvider
{
    private Fish fish;

    private void Awake()
    {
        fish = GetComponentInParent<Fish>();
    }

    protected override float Value
    {
        get { return fish.Health; }
    }
}
