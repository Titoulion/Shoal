using System;
using UnityEngine;

[Serializable]
public class AudioClipWithVolume
{
    [SerializeField] private bool enabled = true;
    [SerializeField] private AudioClip clip;
    [SerializeField] private float volume = 1f;

    public bool Enabled { get { return enabled; } }
    public AudioClip Clip { get { return clip; } }
    public float Volume { get { return volume; } }
}
