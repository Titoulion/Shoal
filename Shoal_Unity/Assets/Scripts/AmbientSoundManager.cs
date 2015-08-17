using UnityEngine;
using System.Collections;
using System.Linq;

public class AmbientSoundManager : MonoBehaviour {

	// Use this for initialization

	[System.Serializable]
	public class AmbientSound
	{
		public AudioSource myAudioSource;
		public float maxVolume = 1f;
		private float currentVolume = 0f;
		public bool isActivated = false;
		public bool usingSpecialVolume = false;

		public void Update()
		{
			if(usingSpecialVolume==false)
			{
				currentVolume = Mathf.Clamp(currentVolume+Time.deltaTime*(isActivated?1f:-1f),0f,maxVolume);
			}

			myAudioSource.volume = currentVolume;
		}

		public void SetVolumeProgress(float progress)
		{
			currentVolume = MyHelper.Map(progress,0f,1f,0f,maxVolume);
		}
	}

	public AmbientSound soundWhirlpool;
	public AmbientSound soundMonster;
	public AmbientSound soundFood1;
	public AmbientSound soundFood2;



	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () 
	{
		soundFood1.isActivated = Spawner.Instance.foodAreas[0].isActivated;
		soundFood2.isActivated = Spawner.Instance.foodAreas[1].isActivated;
		soundMonster.SetVolumeProgress(EnemyScript.Me.GetSpawnStatus());


		if(Pond.Instance.GetEntitiesOfType(EntityType.Whirlpool).Count()>0)
		{
			soundWhirlpool.SetVolumeProgress (Pond.Instance.GetEntitiesOfType(EntityType.Whirlpool).ToArray()[0].gameObject.GetComponent<Whirlpool>().valueOpen);
		}
		else
		{
			soundWhirlpool.SetVolumeProgress(0f);
		}




		soundWhirlpool.Update();
		soundMonster.Update();
		soundFood1.Update();
		soundFood2.Update();
	}
}
