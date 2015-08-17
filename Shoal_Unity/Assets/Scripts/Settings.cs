using System;
using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Settings : PersistentSingletonMonoBehaviour<Settings>
{
    public event Action<bool> EventSfxChanged;

    [SerializeField] private bool saveSettings;
    [SerializeField] private bool sfx;

    protected override void OnFirstLoad()
    {
        if (saveSettings)
        {
            sfx = UnityHelper.PlayerPrefsGetBool("Sfx", Sfx);
        }
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.N))
        {
            Sfx = !Sfx;
        }
    }

    public bool Sfx
    {
        get { return sfx; }
        set
        {
            if (sfx == value)
                return;

            sfx = value;

            UnityHelper.PlayerPrefsSetBool("Sfx", Sfx);

            if (EventSfxChanged != null)
                EventSfxChanged(sfx);
        }
    }
}
