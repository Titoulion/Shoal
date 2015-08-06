using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class PrefabChildInitializer : MonoBehaviourBase
{
    [SerializeField] private Transform prefab;
    [SerializeField] private Vector3 localPosition;
    [SerializeField] private Vector3 localRotationEuler;
    [SerializeField] private Vector3 localScale = Vector3.one;

    private void Awake()
    {
        var child = InstantiatePrefab(prefab);
        child.parent = transform;
        child.localPosition = localPosition;
        child.localEulerAngles = localRotationEuler;
        child.localScale = localScale;
    }
}

