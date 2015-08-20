using UnityEngine;
using System.Collections;
using System.Linq;

public class SpawnPromptScript : MonoBehaviour {

	public float cycleTime;
	public int fuckInHonorOfTitouan;

	private float lerpTimer;
	private bool fadingIn = true;
	private bool disabled = false;

	SpriteRenderer sprite;

	// Use this for initialization
	void Start () {
		sprite = GetComponent<SpriteRenderer>();
		sprite.color = new Color(1f, 1f, 1f, 0f);

		lerpTimer = 0f;
	}
	
	// Update is called once per frame
	void Update () {
		Entity[] fishes = Pond.Instance.GetEntitiesOfType(EntityType.Fish).ToArray();

		if (disabled && fishes.Count() <= fuckInHonorOfTitouan) {
			disabled = false;	
		}

		if (!disabled) {
	
			lerpTimer += Time.deltaTime;
			float time = Mathf.SmoothStep(0f, 1f, lerpTimer/cycleTime);
			float start = 0f, end = 1f;
			if (!fadingIn) {
				start = 1f; end = 0f;
			}
			float alpha = Mathf.Lerp(start, end, time);
			sprite.color = new Color(1f, 1f, 1f, alpha);
			if (time >= 1f) {
				lerpTimer = 0f;
				fadingIn = !fadingIn;
				if (fadingIn && fishes.Count() >= fuckInHonorOfTitouan) {
					disabled = true;
				}
			}
		}
	}
}
