using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class SpawningFishBehaviour : MonoBehaviourBase
{
    [SerializeField] private float radius = 1;
    [SerializeField] private float speedRad = 1;

    private Fish fish;
    private Vehicle vehicle;
    private float angle;
    private int swimmingDirection;
    private Vector3 circleCenter;
	private float sens = 1f;

    private void OnEnable()
    {
        vehicle = GetComponent<Vehicle>();
        vehicle.enabled = false;

        fish = GetComponent<Fish>();
        fish.enabled = false;

        swimmingDirection = MathUtil.RandomSign;
        circleCenter = transform.position;

		if(UnityEngine.Random.value>0.5f)
			sens = -1f;
    }

    private void OnDisable()
    {
        vehicle.enabled = true;
        fish.enabled = true;
    }

	public void SetCircleCenter(Vector2 pos)
	{
		circleCenter = Camera.main.ScreenToWorldPoint(new Vector3(pos.x,pos.y,0f))*2.5f;
	}

    private void Update()
    {
		SetCircleCenter (Input.mousePosition);

		angle += Time.deltaTime * swimmingDirection * speedRad*sens;
        var delta = UnityHelper.CreateVector2AngleRad(angle);

        transform.position = circleCenter + (Vector3) delta * radius;
        vehicle.Velocity = new Vector2(-delta.y, delta.x) * swimmingDirection;
    }
}
