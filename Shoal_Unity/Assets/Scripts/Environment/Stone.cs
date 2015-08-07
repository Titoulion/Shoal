using System.Collections.Generic;
using UnityEngine;
using System.Collections;

public class Stone : Entity
{
    public override EntityType Type
    {
        get { return EntityType.Stone; }
    }
}
