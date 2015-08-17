using System.Collections.Generic;
using UnityEngine;
using System.Collections;

public class Stone : Entity
{
    void Awake()
	{
		GetComponent<Renderer>().material.SetFloat ("_rand",Random.value);
	}

	public override EntityType Type
    {
        get { return EntityType.Stone; }
    }
}
