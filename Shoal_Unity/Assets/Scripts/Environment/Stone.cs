using System.Collections.Generic;
using UnityEngine;
using System.Collections;

public class Stone : Entity
{


	protected override void Awake()
	{
		base.Awake();
		GetComponent<Renderer>().material.SetFloat ("_rand",Random.value);
	}

	public override EntityType Type
    {
        get { return EntityType.Stone; }
    }
}
