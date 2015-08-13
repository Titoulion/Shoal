using System.Collections.Generic;
using UnityEngine;
using System.Collections;

public class TestSpawner : MonoBehaviourBase
{
    [SerializeField] private Transform[] mouseButtonPrefabs;

    private void Update()
    {
        for (var i = 0; i < 3; i++)
        {
            if ((mouseButtonPrefabs.Length <= i) || (mouseButtonPrefabs[i] == null))
                continue;

            if (Input.GetMouseButtonDown(i))
            {
                var position = Camera.main.ScreenToWorldPoint(Input.mousePosition)*2.5f;
                position.z = 0;
                InstantiatePrefab(mouseButtonPrefabs[i], position, Quaternion.identity);
            }
        }

		if (Input.GetKeyDown(KeyCode.Alpha0)||Input.GetKeyDown(KeyCode.Keypad0))
		{
			var positionb = Camera.main.ScreenToWorldPoint(Input.mousePosition)*2.5f;
			positionb.z = 0;
			InstantiatePrefab(mouseButtonPrefabs[3], positionb, Quaternion.identity);
		}

		if (Input.GetKeyDown(KeyCode.Alpha1)||Input.GetKeyDown(KeyCode.Keypad1))
		{
			var positionc = Camera.main.ScreenToWorldPoint(Input.mousePosition)*2.5f;
			positionc.z = 0;
			InstantiatePrefab(mouseButtonPrefabs[4], positionc, Quaternion.identity);
		}

		if (Input.GetKeyDown(KeyCode.Alpha7)||Input.GetKeyDown(KeyCode.Keypad7))
		{
			var positionc = Camera.main.ScreenToWorldPoint(Input.mousePosition)*2.5f;
			positionc.z = 0;
			InstantiatePrefab(mouseButtonPrefabs[0], positionc, Quaternion.identity);
		}
    }
}
