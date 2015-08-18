using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class SfxManager : SingletonMonoBehaviour<SfxManager>
{
    [SerializeField] private int startOneShotAudioSources = 1;
    [SerializeField] private float globalVolumeMultiplier = 1f;
    [SerializeField] private float defaultSoundCooldown = 0.1f;

    [SerializeField] private AudioClipWithVolume exampleSound;

	[SerializeField] public AudioClipWithVolume fishBornSound;
	[SerializeField] public AudioClipWithVolume fishDieSound;
	[SerializeField] public AudioClipWithVolume fishEatSound;
	[SerializeField] public AudioClipWithVolume monsterAttackSound;
	[SerializeField] public AudioClipWithVolume monsterDieSound;
	[SerializeField] public AudioClipWithVolume monsterHurtSound;

    private AudioListener audioListener;

    private List<AudioSource> createdAudioSources;
    private List<AudioSource> oneShotAudioSources;

    private Settings settings;

    private List<AudioClip> clipsInSoundCooldowns;
    private Dictionary<AudioClip, float> soundCooldowns;

    public bool Muted
    {
        get { return (settings != null) && (!settings.Sfx); }
    }

    private void Awake()
    {
        clipsInSoundCooldowns = new List<AudioClip>();
        soundCooldowns = new Dictionary<AudioClip, float>();
        createdAudioSources = new List<AudioSource>();
        oneShotAudioSources = new List<AudioSource>();

        settings = Settings.Instance;

        if (settings != null)
            settings.EventSfxChanged += OnSfxVolumeChanged;

        UpdateMuteSettings();

        for (int i = 0; i < startOneShotAudioSources; i++)
        {
            CreateTemporaryAudioSource();
        }
    }

    private void Start()
    {
        audioListener = UnityHelper.FindFirstActiveInstance<AudioListener>();
    }

    private void OnDestroy()
    {
        if (settings != null)
            settings.EventSfxChanged -= OnSfxVolumeChanged;
    }

    private void Update()
    {
        foreach (var clip in clipsInSoundCooldowns)
        {
            soundCooldowns[clip] -= Time.deltaTime;
        }
    }

    private void OnSfxVolumeChanged(bool sfxActive)
    {
        UpdateMuteSettings();
    }

    private void UpdateMuteSettings()
    {
        foreach (var audioSource in createdAudioSources)
        {
            audioSource.mute = Muted;
        }

        foreach (var audioSource in oneShotAudioSources)
        {
            audioSource.mute = Muted;
        }
    }

    public void PlayExampleSound(float volumeMultiplier, float pitch)
    {
        PlaySound(exampleSound, volumeMultiplier, pitch);
    }

    // ----- Helper methods -----

    private void PlaySoundDelayed(AudioClipWithVolume sound, float delay, float volume, float pitch)
    {
        if (delay <= 0)
        {
            PlaySound(sound, volume, pitch);
        }
        else
        {
            StartCoroutine(PlaySoundDelayedCoroutine(sound, delay, volume, pitch));
        }
    }

    private IEnumerator PlaySoundDelayedCoroutine(AudioClipWithVolume sound, float delay, float volume, float pitch)
    {
        yield return new WaitForSeconds(delay);
        PlaySound(sound, volume, pitch);
    }

    public void PlaySound(AudioClipWithVolume[] audioClips, int index, float volume, float pitch)
    {
        if ((index < 0) || (index >= audioClips.Length))
            return;

	    PlaySound(audioClips[index], volume, pitch);
    }

    public void PlaySound(AudioClipWithVolume[] audioClips, float volume, float pitch)
    {
        if ((audioClips == null) || (audioClips.Length == 0))
            return;

        var audioClip = audioClips.RandomElement();
        if (((audioClip == null) || !audioClip.Enabled) && audioClips.Any(clip => (clip != null) && clip.Enabled))
        {
            audioClip = audioClips.Where(clip => (clip != null) && clip.Enabled).ToArray().RandomElement();
        }
        PlaySound(audioClip, volume, pitch);
    }

    public void PlaySound(AudioClipWithVolume audioClip, float volume, float pitch)
    {
        if ((audioClip == null) || !audioClip.Enabled)
            return;

        PlaySound(audioClip.Clip, audioClip.Volume * volume, true, pitch);
    }

    public void PlaySound(AudioClip[] audioClips, float volume, float pitch)
    {
        if ((audioClips == null) || (audioClips.Length == 0))
            return;

        var audioClip = audioClips[UnityEngine.Random.Range(0, audioClips.Length)];

        PlaySound(audioClip, volume, true, pitch);
    }

    public void PlaySound(AudioClip audioClip, float volume, bool useGlobalVolumeMultiplier, float pitch)
    {
        if (audioListener == null)
            return;

        if (Muted)
            return;

        if (audioClip == null)
            return;

        if (defaultSoundCooldown > 0)
        {
            if (clipsInSoundCooldowns.Contains(audioClip))
            {
                if (soundCooldowns[audioClip] > 0)
                    return;
            }
            else
            {
                clipsInSoundCooldowns.Add(audioClip);
            }

            soundCooldowns[audioClip] = defaultSoundCooldown;
        }


        var position = audioListener.transform.position;

        if (useGlobalVolumeMultiplier)
            volume *= globalVolumeMultiplier;

        //AudioSource.PlayClipAtPoint(audioClip, position, volume);

        var audioSource = GetOrCreateTemporaryAudioSource();
        audioSource.clip = audioClip;
        audioSource.transform.position = position;
        audioSource.volume = volume;
        audioSource.pitch = pitch;

        audioSource.Play();
    }

    public AudioSource CreateAudioSource(AudioClipWithVolume clip)
    {
        if (!clip.Enabled)
            clip = null;

        var audioSourceName = "Unassigned Audio Source";
        if ((clip != null) && (clip.Clip != null))
            audioSourceName = "Audio Source: " + clip.Clip.name;

        var newGameObject = new GameObject(audioSourceName);
        newGameObject.transform.parent = transform;

        var audioSource = newGameObject.AddComponent<AudioSource>();

        /*
        if (!clip.IgnoreGlobalVolumeMultiplier)
        {
            audioSource.volume *= globalVolumeMultiplier;
        }
         */

        if (clip != null)
        {
            audioSource.volume = clip.Volume * globalVolumeMultiplier;
            audioSource.clip = clip.Clip;
            audioSource.loop = true;
            audioSource.mute = Muted;
        }

        createdAudioSources.Add(audioSource);

        return audioSource;
    }

    public AudioSource CreateTemporaryAudioSource()
    {
        var newGameObject = new GameObject("Temporary Audio Source #" + (oneShotAudioSources.Count + 1));
        newGameObject.transform.parent = transform;

        var audioSource = newGameObject.AddComponent<AudioSource>();

        oneShotAudioSources.Add(audioSource);

        return audioSource;
    }

    public AudioSource GetOrCreateTemporaryAudioSource()
    {
        foreach (var audioSource in oneShotAudioSources)
        {
            if (!audioSource.isPlaying)
                return audioSource;
        }

        return CreateTemporaryAudioSource();
    }
}
