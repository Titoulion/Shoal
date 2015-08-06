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
    }
}
