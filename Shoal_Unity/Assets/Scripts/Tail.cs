using UnityEngine;
using System.Collections;

public class Tail : MonoBehaviour {

	// Use this for initialization

	GameObject[] bodyParts = new GameObject[0];
	BodyPartScript[] bodyPartsScripts = new BodyPartScript[0];
	TrailRenderer[] bodyPartsTrails = new TrailRenderer[0];
	Vector3[] bodyPartsPositions = new Vector3[0];


	int numberBodyParts = 50;
	public GameObject prefabBodyPart;

	float tailLenght = 0f;
	public float nextTailLenght = 1f;
	public float nextRadiusMotionBodyParts = 1f;
	public float nextHeadSize = 2f;


	float[] randomValues = new float[0];
	float[] randomValues2 = new float[0];
	int[] randomSens = new int[0];
	bool started = false;
	MainScript main;

	public float speedMotionBodyPart = 1f;





	float radiusMotionBodyParts = 1f;


	public float speedMotion = 1f;



	public Color mainColor1A;
	public Color mainColor1B;
	public Color mainColor2A;
	public Color mainColor2B;


	float headSize = 0f;


	public float exchangeColor = 0f;
	public float nextExchangeColor;



	float timeLife = 0f;










	bool goCenter = false;
	bool goBigPond = false;

	float transitionFromProgressCircle = 0f;

	float transitionProgressCircle = 0f;








	public bool dying = false;
	bool dead = false;
	float finalLife = 1f;






	public AnimationCurve curveSizeA;
	public AnimationCurve curveSizeB;

	public float nextLerpColor1;
	float lerpColor1;

	public float nextLerpColor2;
	float lerpColor2;


	public float nextLerpValueSize = 0f;
	float lerpValueSize = 0f;







	public Vector2 minMaxTrailTime;


	float sensSpeed = 1f;


	public bool useTitouanMotion = false;

	//public Gradient myGradient;

	[Range(0f,1f)]
	public float hunger =0f;

	public AnimationCurve curveGradient;

	public float minAlpha = 0.5f;

	float myFishRandom = 0f;

	public float speedBlink = 0.5f;
	public AnimationCurve curveBlink;





	void Start () 
	{
		main = MainScript.Instance;


//		petitPondCentre = Vector3.zero+(main.littlePond.transform.position-main.bigPond.transform.position)*multDecal;
		//petitPondExit = petitPondCentre+Vector3.Normalize(main.bigPond.transform.position-main.littlePond.transform.position)*2f*1f;


		InitValues();

		RandomColors();


		GenerateBody();


		
		goBigPond = false;
		goCenter = false;


		myFishRandom = Random.value;


		



		SetFinalValues();




	}

	void RandomColors()
	{
		mainColor1A = new Color(Random.value,Random.value,Random.value);
		mainColor1B = new Color(Random.value,Random.value,Random.value);
		mainColor2A = new Color(Random.value,Random.value,Random.value);
		mainColor2B = new Color(Random.value,Random.value,Random.value);
	}


	void InitValues()
	{

		numberBodyParts = Random.Range (18,30);
		speedMotion = Random.Range (0.55f,1.35f);


		float rand1 = Random.Range(0.1f,0.3f);
		minMaxTrailTime = new Vector2(rand1,rand1+Random.Range (0.1f,0.4f));
		speedMotionBodyPart = Random.Range (0.7f,1.35f);

		radiusMotionBodyParts = Random.Range (0f,1.2f);
	}

	public void SetInitPropertiesValues(float p1, float p1B, float p2,float p2B,float p2C, float p3, float p3B)
	{
		nextTailLenght = p1;
		tailLenght = p1;

		nextRadiusMotionBodyParts = p1B;
		radiusMotionBodyParts = p1B;

		nextExchangeColor = p2;
		exchangeColor = p2;

		nextLerpColor1 = p2B;
		lerpColor1 = p2B;

		nextLerpColor2= p2C;
		lerpColor2 = p2C;

		nextHeadSize = p3;
		headSize = 0f;

		nextLerpValueSize = p3B;
		lerpValueSize = p3B;



	}


	
	void GenerateBody()
	{
		bodyParts = new GameObject[numberBodyParts];
		bodyPartsPositions = new Vector3[numberBodyParts];
		bodyPartsScripts = new BodyPartScript[numberBodyParts];
		bodyPartsTrails = new TrailRenderer[numberBodyParts];
		randomValues = new float[numberBodyParts];
		randomValues2 = new float[numberBodyParts];
		randomSens = new int[numberBodyParts];

		for(int i = 0; i<bodyParts.Length;i++)
		{
			float progress = Map ((float)i,0f,(float)(bodyParts.Length-1),1f,0f);
			GameObject bodyPart = Instantiate(prefabBodyPart,transform.position,Quaternion.identity) as GameObject;
			bodyPart.transform.parent = transform;
			bodyPart.GetComponent<Renderer>().material.SetFloat ("_RotationPerlin",Random.Range (0f,360f));
			float valueSizeA = curveSizeA.Evaluate(Mathf.Clamp01(progress));
			float valueSizeB = curveSizeB.Evaluate(Mathf.Clamp01(progress));
			BodyPartScript thisBodyPartScript = bodyPart.GetComponent<BodyPartScript>();
			bodyPartsScripts[i] = thisBodyPartScript;
			TrailRenderer thisBodyPartTrail = bodyPart.GetComponent<TrailRenderer>();
			bodyPartsTrails[i] = thisBodyPartTrail;
			thisBodyPartScript.SetSize(headSize* Mathf.Lerp(valueSizeA,valueSizeB,lerpValueSize));
			bodyParts[i] = bodyPart;
			thisBodyPartScript.SetLerpsColors(lerpColor1,lerpColor2);
			thisBodyPartScript.SetExchangeColor(Random.Range(0.0f,0.2f));
			thisBodyPartScript.SetExchangeColor(Random.value>0.5f?1f:0f);
			thisBodyPartScript.SetExchangeColor(0f);
			thisBodyPartScript.SetPosInTail(1f-progress);
			thisBodyPartScript.SetColors(mainColor1A,mainColor1B,mainColor2A,mainColor2B);
			randomValues[i]=Random.value;
			randomValues2[i]=Random.value;
			randomSens[i]=Random.value<0.5f?-1:1;
			thisBodyPartTrail.startWidth =thisBodyPartScript.GetSize();
			thisBodyPartTrail.endWidth =0f;
			thisBodyPartTrail.material.color = thisBodyPartScript.GetTransitionColor();
			thisBodyPartTrail.time = minMaxTrailTime.x+(minMaxTrailTime.y-minMaxTrailTime.x)*(progress);
			bodyPartsPositions[i] = transform.position;
		}

		started = true;
	}

	void Update () 
	{
		if(!dead)
		{
			if(started)
			{
				UpdateValues();




				PositionBodyParts();
				timeLife+=Time.deltaTime;
			}
		}	
	}




	void PositionBodyParts()
	{
		bodyPartsPositions[0] = bodyParts[0].transform.position = transform.position;
		for(int i=1; i<bodyParts.Length; i++)
		{
			float progressB = ((float)i-1f)/((float)bodyParts.Length-2);
			float nodeAngle	 =	Mathf.Atan2(bodyPartsPositions[i].y - bodyPartsPositions[i-1].y,bodyPartsPositions[i].x - bodyPartsPositions[i-1].x);
			bodyPartsPositions[i] = new Vector3(bodyPartsPositions[i-1].x + tailLenght*(1f-progressB) * Mathf.Cos(nodeAngle),bodyPartsPositions[i-1].y + tailLenght*(1f-progressB) * Mathf.Sin(nodeAngle),0f);
			Vector3 toForward = Vector3.Normalize (bodyPartsPositions[i]-bodyPartsPositions[i-1]);
			Vector3 toUp = Vector3.Cross (toForward,Vector3.forward);
			float randomValueT =  randomValues[i] + Time.realtimeSinceStartup*randomSens[i]*speedMotionBodyPart;
			bodyParts[i].transform.position = bodyPartsPositions[i]+toForward*Mathf.Cos (randomValueT*2f*Mathf.PI)*radiusMotionBodyParts*progressB+toUp*Mathf.Sin (randomValueT*2f*Mathf.PI)*radiusMotionBodyParts*progressB;
		}
	}

	void LateUpdate()
	{
		if(dead)
			DestroyImmediate(this.gameObject);
	}
	
	float Radians(float value)
	{
		float val = Mathf.PI*value/180;
		return(val);
	}

	float Map(float val, float fromMin, float fromMax, float toMin, float toMax) {
		return ((val - fromMin) / (fromMax - fromMin)) * (toMax - toMin) + toMin;
	}

	float Modulo(float a,float b)
	{
		return a - b * Mathf.Floor(a / b);
	}

	public void AffectProperty1(float _value)
	{

			nextTailLenght = _value;
	}

	public void AffectProperty1B(float _value)
	{

			nextRadiusMotionBodyParts = _value;
	}

	public void AffectProperty2(float _value)
	{

			nextExchangeColor = _value;

	}

	public void AffectProperty2B(float _value)
	{

			nextLerpColor1 = _value;
	}

	public void AffectProperty2C(float _value)
	{

			nextLerpColor2 = _value;
	}

	public void AffectProperty3(float _value)
	{

			nextHeadSize = _value;
	}

	public void AffectProperty3B(float _value)
	{

			nextLerpValueSize = _value;
	}

	public void Kill()
	{
		dying = true;
	}

	void UpdateValues()
	{

		ProgressionsProperties();
		







	}

	void SetFinalValues()
	{
			lerpColor1 = nextLerpColor1;
			lerpColor2 = nextLerpColor2;
			exchangeColor = nextExchangeColor;
			radiusMotionBodyParts = nextRadiusMotionBodyParts;
			tailLenght=nextTailLenght;
			lerpValueSize=nextLerpValueSize;

		for (int i=0; i<bodyParts.Length; i++)
		{
			float progress = Map ((float)i,0f,(float)(bodyParts.Length-1),0f,1f);
			float valueSizeA = curveSizeA.Evaluate((1f-Mathf.Clamp01(progress)));
			float valueSizeB = curveSizeB.Evaluate((1f-Mathf.Clamp01(progress)));
			bodyPartsScripts[i].SetLerpsColors(lerpColor1,lerpColor2);
			bodyPartsScripts[i].SetExchangeColor (exchangeColor);
			//bodyPartsScripts[i].SetCustomColor(myGradient.Evaluate(progress));
			bodyPartsTrails[i].material.color = bodyPartsScripts[i].GetTransitionColor();
		}
	}
	
	void ProgressionsProperties()
	{
		float valueProgressProgress = Map (Mathf.Clamp01(timeLife),0f,1f,0.1f,1f);


		lerpColor1 += (nextLerpColor1-lerpColor1)*valueProgressProgress;
		lerpColor2 += (nextLerpColor2-lerpColor2)*valueProgressProgress;
		exchangeColor += (nextExchangeColor-exchangeColor)*valueProgressProgress;
		radiusMotionBodyParts += (nextRadiusMotionBodyParts-radiusMotionBodyParts)*valueProgressProgress;
		tailLenght+=(nextTailLenght-tailLenght)*valueProgressProgress;
		headSize+=(nextHeadSize-headSize)*valueProgressProgress;
		lerpValueSize+=(nextLerpValueSize-lerpValueSize)*valueProgressProgress;


		if(dying)
		{
			finalLife=Mathf.Clamp01(finalLife-Time.deltaTime);
		}

		headSize *= finalLife;



		hunger = 1f-GetComponentInParent<Fish>().Health;




		Gradient gradient1 = GetComponent<NewGradient>().randomGradient;
		Gradient gradient2 = GetComponent<NewGradient>().randomGradient2;




		for (int i=0; i<bodyParts.Length; i++)
		{
			float progress = Map ((float)i,0f,(float)(bodyParts.Length-1),0f,1f);
			float valueSizeA = curveSizeA.Evaluate((1f-Mathf.Clamp01(progress)));
			float valueSizeB = curveSizeB.Evaluate((1f-Mathf.Clamp01(progress)));
			bodyPartsScripts[i].SetSize(headSize* Mathf.Lerp(valueSizeA,valueSizeB,lerpValueSize));
			bodyPartsTrails[i].startWidth =headSize* Mathf.Lerp(valueSizeA,valueSizeB,lerpValueSize);
			bodyPartsTrails[i].endWidth =0f;
			bodyPartsScripts[i].SetLerpsColors(lerpColor1,lerpColor2);
			bodyPartsScripts[i].SetExchangeColor (exchangeColor);
			bodyPartsScripts[i].SetCustomColors(gradient1.Evaluate(progress),gradient2.Evaluate(progress));
			bodyPartsScripts[i].SetPointCurve(curveGradient.Evaluate(progress));


			float progressValueHunger = Mathf.Lerp (hunger,0f,Mathf.Cos ((Time.realtimeSinceStartup*speedBlink+myFishRandom)*2f*Mathf.PI)*0.5f+0.5f);
			progressValueHunger = Mathf.Lerp (hunger,0f,(1f-hunger+0.5f)*curveBlink.Evaluate(Modulo(Time.realtimeSinceStartup*speedBlink+myFishRandom,1f)));




			bodyPartsTrails[i].material.color = Color.Lerp (gradient1.Evaluate(progress),new Color(0.8f,0.8f,0.8f,minAlpha),progressValueHunger);
			//bodyPartsTrails[i].material.color = gradient1.Evaluate(progress);



			bodyPartsScripts[i].SetHunger(minAlpha,progressValueHunger);


		}

		if(finalLife==0f)
		{
			GoDestroy();
		}
	}

	public bool CanChangeValues()
	{
		return(true);
	}

	void GoDestroy()
	{
		dead = true;
	}

	public void GoDie()
	{
		dying = true;
	}

	
}
