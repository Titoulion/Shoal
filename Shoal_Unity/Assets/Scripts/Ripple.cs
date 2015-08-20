using System.Linq;
using UnityEngine;
using System.Collections;

public class Ripple : Entity
{
    private Material myMat;
    public float durationRipple = 2f;
    public float durationAfterRipple = 2f;
    private float progress = 0f;
	private float progressAfterRipples = 0f;
    public float alignmentChangeRadius = 5f;
    public float strength = 10f;
    private bool afterRipple;

    private Vehicle[] fishVehicles;
	private EnemyScript theEnemy;

    private void Start()
    {
        myMat = GetComponent<Renderer>().material;
        fishVehicles = Pond.Instance.GetEntitiesOfType(EntityType.Fish).Select(entity => entity.GetComponent<Vehicle>()).ToArray();
		theEnemy = EnemyScript.Me;
		DetectDamageEnemy();
		SfxManager.Instance.PlaySound(SfxManager.Instance.RippleSound,1f,Random.Range (0.7f,1.8f));
    }

	private void DetectDamageEnemy()
	{
		if(Vector3.Distance(transform.position,theEnemy.gameObject.transform.position)<4f)
		{
			theEnemy.CheckForDamage();
		}
	}

    private void Update()
    {
        if (afterRipple)
        {
            progressAfterRipples += Time.deltaTime / durationAfterRipple;
			if (progressAfterRipples >= 1f)
            {
                Destroy(this.gameObject);
            }
        }

        progress += Time.deltaTime / durationRipple;
        progress = Mathf.Clamp01(progress);
        myMat.SetFloat("_Progress", progress);
        if (progress == 1f && afterRipple==false)
        {
            GetComponent<Renderer>().enabled = false;
            afterRipple = true;
            progress = 1f;
            return;
        }

        var currentRadius = progress * alignmentChangeRadius;
        foreach (var vehicle in fishVehicles)
        {
            if (vehicle == null)
                continue;

            var delta = vehicle.transform.position - transform.position;
            var distance = delta.magnitude;
            if (distance < currentRadius)
            {
                vehicle.AddForce(delta.normalized * strength * Time.deltaTime);
            }
        }
    }

    public override EntityType Type
    {
        get { return EntityType.Ripple; }
    }
}
