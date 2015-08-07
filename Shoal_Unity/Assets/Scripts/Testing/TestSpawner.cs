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

		if (Input.GetKeyDown(KeyCode.Space))
		{
			var positionb = Camera.main.ScreenToWorldPoint(Input.mousePosition)*2.5f;
			positionb.z = 0;
			InstantiatePrefab(mouseButtonPrefabs[2], positionb, Quaternion.identity);
		}

		if (Input.GetKeyDown(KeyCode.W))
		{
			var positionc = Camera.main.ScreenToWorldPoint(Input.mousePosition)*2.5f;
			positionc.z = 0;
			InstantiatePrefab(mouseButtonPrefabs[3], positionc, Quaternion.identity);
		}
    }
}
