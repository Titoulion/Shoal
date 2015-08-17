using UnityEngine;
using System.Collections;
using System.Linq;

public class Tail : MonoBehaviour {

	[SerializeField] private GameObject prefabBodyPart;
	[SerializeField] private ProgressModifProperty property1;
	[SerializeField] private ProgressModifProperty property1B;
	[SerializeField] private ProgressModifProperty property2;
	[SerializeField] private ProgressModifProperty property2B;
	[SerializeField] private ProgressModifProperty property2C;
	[SerializeField] private ProgressModifProperty property3;
	[SerializeField] private ProgressModifProperty property3B;
	[SerializeField] private AnimationCurve curveSizeA;
	[SerializeField] private AnimationCurve curveSizeB;
	[SerializeField] private AnimationCurve curveGradient;
	[SerializeField] private AnimationCurve curveBlinkHunger;
	[SerializeField] private AnimationCurve curveSizeApparition;

	private GameObject[] bodyParts = new GameObject[0];
	private BodyPartScript[] bodyPartsScripts = new BodyPartScript[0];
	private TrailRenderer[] bodyPartsTrails = new TrailRenderer[0];
	private Vector3[] bodyPartsPositions = new Vector3[0];
	private int numberBodyParts = 50;
	private float nextHeadSize = 2f;
	private float tailLenght = 0f;
	private float radiusMotionBodyParts = 1f;
	private float headSize = 0f;
	private float exchangeColor = 0f;
	private float lerpValueSize = 0f;
	private float speedMotionBodyPart = 1f;
	private float speedMotion = 1f;
	private float[] randomValues = new float[0];
	private float[] randomValues2 = new float[0];
	private int[] randomSens = new int[0];
	private float timeLife = 0f;
	public bool dying = false;
	private bool dead = false;
	private float finalLife = 1f;
	private Vector2 minMaxTrailTime;
	private float hunger =0f;
	private float minAlpha = 0.2f;
	private float myFishRandom;
	private float speedBlink = 1f;
	private Color[] trailsColors;
	private float progressDigestion = -0.5f;
	private bool digestion = false;
	private Gradient gradient1;
	private Gradient gradient2;
	private NewGradient myGradientsStuff;
	private float durationDeath = 1f;
	public float previousProgressIntro = 0f;
		
	void Start () 
	{
		GetComponentInParent<Fish>().EventDeath += GoDie;
		myGradientsStuff = GetComponent<NewGradient>();
		InitValues();
		GenerateBody();
		GetComponentInParent<Fish>().PutInSpawningMode();
	}
		
	private void InitValues()
	{
		gradient1 = GetComponent<NewGradient>().randomGradient;
		gradient2 = GetComponent<NewGradient>().randomGradient2;
		numberBodyParts = Random.Range (18,30);
		speedMotion = Random.Range (0.55f,1.35f);
		myFishRandom = Random.value;
		float rand1 = Random.Range(0.1f,0.3f);
		minMaxTrailTime = new Vector2(rand1,rand1+Random.Range (0.1f,0.3f));
		speedMotionBodyPart = Random.Range (0.7f,1.35f);
		radiusMotionBodyParts = Random.Range (0f,1.2f);
		property1.Init();
		property1B.Init();
		property2.Init();
		property2B.Init();
		property2C.Init();
		property3.Init();
		property3B.Init();
		SetInitPropertiesValues(property1.GetValue(), property1B.GetValue(),property2.GetValue(), property2B.GetValue(),property2C.GetValue(), property3.GetValue(), property3B.GetValue());
	}

	private void SetInitPropertiesValues(float p1, float p1B, float p2,float p2B,float p2C, float p3, float p3B)
	{
		tailLenght = p1;
		radiusMotionBodyParts = p1B;
		exchangeColor = p2;
		nextHeadSize = p3;
		headSize = 0f;
		lerpValueSize = p3B;
	}

	private void InitAspectBodyPart(int indexBodyPart)
	{
		float progress = MyHelper.Map ((float)indexBodyPart,0f,(float)(bodyParts.Length-1),0f,1f);
		bodyPartsScripts[indexBodyPart].SetExchangeColor (exchangeColor);
		bodyPartsScripts[indexBodyPart].SetPointCurve(curveGradient.Evaluate(progress));
		bodyPartsScripts[indexBodyPart].SetCustomColors(gradient1.Evaluate(progress),gradient2.Evaluate(progress));
		bodyPartsScripts[indexBodyPart].SetSize(0f);
		bodyPartsScripts[indexBodyPart].SetPosInTail(progress);
		bodyPartsScripts[indexBodyPart].SetMinAlpha(minAlpha);

		bodyPartsTrails[indexBodyPart].startWidth =0f;
		bodyPartsTrails[indexBodyPart].endWidth =0f;
		bodyPartsTrails[indexBodyPart].time = minMaxTrailTime.x+(minMaxTrailTime.y-minMaxTrailTime.x)*(progress);
		bodyPartsTrails[indexBodyPart].material.SetColor ("_Color",gradient1.Evaluate(progress));
		trailsColors[indexBodyPart] = gradient1.Evaluate(progress);
	}

	private void GenerateBody()
	{
		bodyParts = new GameObject[numberBodyParts];
		bodyPartsPositions = new Vector3[numberBodyParts];
		bodyPartsScripts = new BodyPartScript[numberBodyParts];
		bodyPartsTrails = new TrailRenderer[numberBodyParts];
		randomValues = new float[numberBodyParts];
		randomValues2 = new float[numberBodyParts];
		randomSens = new int[numberBodyParts];
		trailsColors = new Color[numberBodyParts];

		for(int i = 0; i<bodyParts.Length;i++)
		{
			float progress = MyHelper.Map ((float)i,0f,(float)(bodyParts.Length-1),1f,0f);
			GameObject bodyPart = Instantiate(prefabBodyPart,transform.position,Quaternion.identity) as GameObject;
			bodyPart.transform.parent = transform;
			bodyPart.GetComponent<Renderer>().material.SetFloat ("_RotationPerlin",Random.Range (0f,360f));
			BodyPartScript thisBodyPartScript = bodyPart.GetComponent<BodyPartScript>();
			bodyPartsScripts[i] = thisBodyPartScript;
			TrailRenderer thisBodyPartTrail = bodyPart.GetComponent<TrailRenderer>();
			bodyPartsTrails[i] = thisBodyPartTrail;
			bodyParts[i] = bodyPart;
			randomValues[i]=Random.value;
			randomValues2[i]=Random.value;
			randomSens[i]=Random.value<0.5f?-1:1;
			bodyPartsPositions[i] = transform.position;
			InitAspectBodyPart(i);
		}
	}

	private void PositionBodyParts()
	{
		GameObject tailAttractor =(Pond.Instance.GetEntitiesOfType(EntityType.Whirlpool).ToArray().Count()==0)?(null):(Pond.Instance.GetEntitiesOfType(EntityType.Whirlpool).ToArray()[0].gameObject);
		
		bodyPartsPositions[0] = bodyParts[0].transform.position = transform.position;
		for(int i=1; i<bodyParts.Length; i++)
		{
			float progress = ((float)i-1f)/((float)bodyParts.Length-2);
			float nodeAngle	 =	Mathf.Atan2(bodyPartsPositions[i].y - bodyPartsPositions[i-1].y,bodyPartsPositions[i].x - bodyPartsPositions[i-1].x);
			bodyPartsPositions[i] = new Vector3(bodyPartsPositions[i-1].x + tailLenght*(1f-progress) * Mathf.Cos(nodeAngle),bodyPartsPositions[i-1].y + tailLenght*(1f-progress) * Mathf.Sin(nodeAngle),0f);
			
			if(tailAttractor!=null)
			{
				Vector3 toAttractor = tailAttractor.transform.position-bodyPartsPositions[i];
				float distanceAttractor = toAttractor.magnitude;
				
				if(distanceAttractor<9f && distanceAttractor>0.1f)
				{
					toAttractor = Vector3.Normalize(toAttractor);
					Vector3 attraction = toAttractor*(9f-distanceAttractor)*0.034f;
					bodyPartsPositions[i]+=attraction;
					if(Vector3.Distance(bodyPartsPositions[i],bodyPartsPositions[i-1])>tailLenght)
						bodyPartsPositions[i] = bodyPartsPositions[i-1]+Vector3.Normalize(bodyPartsPositions[i]-bodyPartsPositions[i-1])*tailLenght;
				}
			}
			
			Vector3 toForward = Vector3.Normalize (bodyPartsPositions[i]-bodyPartsPositions[i-1]);
			Vector3 toUp = Vector3.Cross (toForward,Vector3.forward);
			float randomValueT =  randomValues[i] + Time.realtimeSinceStartup*randomSens[i]*speedMotionBodyPart;
			Vector3 circularMotion = toForward*Mathf.Cos (randomValueT*2f*Mathf.PI)*radiusMotionBodyParts*progress+toUp*Mathf.Sin (randomValueT*2f*Mathf.PI)*radiusMotionBodyParts*progress;
			
			bodyParts[i].transform.position = bodyPartsPositions[i] + circularMotion;
		}
	}

	private void ProgressionsProperties(bool realTimeUpdateAspect)
	{
		if(digestion)
		{
			progressDigestion+=Time.deltaTime/0.8f;
			if(progressDigestion>1.5f)
				digestion=false;
		}
	
		if(dying)
			finalLife=Mathf.Clamp01(finalLife-Time.deltaTime/durationDeath);

		float progressIntro = Mathf.Clamp01(timeLife/3f);
		headSize=Mathf.Lerp (0f,nextHeadSize,curveSizeApparition.Evaluate(progressIntro));
		headSize *= finalLife;

		hunger = 1f-GetComponentInParent<Fish>().Health;
		float progressValueHunger = Mathf.Lerp (hunger,0f,(1f-hunger+0.5f)*curveBlinkHunger.Evaluate(MyHelper.Modulo(Time.realtimeSinceStartup*speedBlink+myFishRandom,1f)));

		for (int i=0; i<bodyParts.Length; i++)
		{
			float progress = MyHelper.Map ((float)i,0f,(float)(bodyParts.Length-1),0f,1f);
			

			float valueSizeA = curveSizeA.Evaluate((1f-Mathf.Clamp01(progress)));
			float valueSizeB = curveSizeB.Evaluate((1f-Mathf.Clamp01(progress)));
			bodyPartsTrails[i].startWidth =headSize* Mathf.Lerp(valueSizeA,valueSizeB,lerpValueSize);
			bodyPartsScripts[i].SetSize(headSize* Mathf.Lerp(valueSizeA,valueSizeB,lerpValueSize));

			
			if(realTimeUpdateAspect)
			{
				bodyPartsScripts[i].SetCustomColors(myGradientsStuff.randomGradient.Evaluate(progress),myGradientsStuff.randomGradient2.Evaluate(progress));
				bodyPartsTrails[i].material.SetColor ("_Color",myGradientsStuff.randomGradient.Evaluate(progress));
			}

			bodyPartsTrails[i].material.SetColor ("_Color", Color.Lerp (trailsColors[i],new Color(0.8f,0.8f,0.8f,minAlpha),progressValueHunger));
			bodyPartsScripts[i].SetHunger(progressValueHunger);
			bodyPartsScripts[i].SetProgressDigestion(progressDigestion);
		}

		if(previousProgressIntro!=1f && progressIntro==1f && dying == false)
		{
			GetComponentInParent<Fish>().ExitSpawningMode();
		}

		previousProgressIntro = progressIntro;

		if(finalLife==0f)
			Destroy(transform.parent.gameObject);
	}
	
	void Update () 
	{
		PositionBodyParts();
		ProgressionsProperties(true);
		timeLife+=Time.deltaTime;
	}

	public void GoDigest()
	{
		digestion = true;
		progressDigestion = -0.5f;
	}

	public void GoDie()
	{
		dying = true;
	}

	public void GoDieWithNewDuration(float duration)
	{
		durationDeath = duration;
		dying = true;
	}

	[System.Serializable]
	public class ProgressModifProperty
	{
		private float progress;
		[SerializeField] private float valueMin;
		[SerializeField] private float valueMax;
		
		public void Init()
		{
			progress = Random.value;
		}

		public float GetValue()
		{
			return(MyHelper.Map(Mathf.Cos(progress*2f*Mathf.PI)*0.5f+0.5f,0f,1f,valueMin,valueMax));
		}
	}
}
