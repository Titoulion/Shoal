using System.Collections.Generic;
using UnityEngine;
using System.Collections;

public class Stone : Entity
{
	private Vector3 nextPos;
	public bool useDedicatedPosition = true;
	protected override void Awake()
	{
		base.Awake();
		nextPos = transform.position;
		GetComponent<Renderer>().material.SetFloat ("_rand",Random.value);
	}

	public override EntityType Type
    {
        get { return EntityType.Stone; }
    }

	private void Update()
	{
		if(useDedicatedPosition)
			transform.position = Vector3.Lerp (transform.position, nextPos,0.4f);
	}

	public void SetPositionFromScreenCoord(Vector2 posOnScreen)
	{
		Vector3 worldPos = Camera.main.ScreenToWorldPoint(posOnScreen) * 2.5f;
		worldPos.z = 0f;
		nextPos = worldPos;
	}
}
