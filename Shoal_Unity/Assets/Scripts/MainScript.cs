using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

public class MainScript : MonoBehaviour {

	public static MainScript Instance;
	public GameObject prefabFish;

	[Range(0f,1f)]
	public float globalOutlineWidth = 0f;
	float pulseProgress = 0f;
	public float pulse = 0f;
	public float durationCalmPulse = 2f;
	public AnimationCurve curvePulse;

	public bool autoHeartBeat = true;
	public float bpm = 80f;
	public float currentProgressAutoHeartBeat = 0f;



	public bool playerConnected = false;
	public bool wasPlayerConnected = false;

	float securityProgressON = 0f;
	float securityProgressOFF = 0f;


	public float securityTimeON = 5f;
	public float securityTimeOFF = 5f;
	public GameObject currentFish = null;


	bool isRemoving = false;
	bool isConnecting = false;

	// Use this for initialization

	public ProgressModifProperty property1;
	public ProgressModifProperty property1B;
	public ProgressModifProperty property2;
	public ProgressModifProperty property2B;
	public ProgressModifProperty property2C;
	public ProgressModifProperty property3;
	public ProgressModifProperty property3B;

	float timeSinceLastHeartBeat = 0f;

	public int lastCode = 0;


	public bool pathOpened = false;


	//public IconScript iconHeart;
	//public IconScript iconStone;

	public GameObject littlePond;
	public GameObject bigPond;
	float progressClosePond = 0f;


	public int[] stateButtons = new int[]{0,0,0};

	public AnimationCurve curveBeatEffet;
	public float forcePulsePond = 0.02f;



	public GameObject bridge;
	float progressOpenBridge = 0f;

	public ParticleSystem particleLittlePond;

	public bool needNewPlayer = false;


	public bool lightOff = true;


	public List<GameObject> listFish = new List<GameObject>();




	float valDistortFood = 0f;



	public Gradient rampColorsEdgePond;
	public Gradient rampColorsFondPond;
	public Gradient rampColorsWaves;
	public Gradient rampColorsFoodOff;
	public Gradient rampColorsFoodOn;

	public float progressDay;
	public float durationDay = 10f;
	public Camera camRenderFish;



	public float progressDistort;
	public float speedDistort;

	public EnemyScript theEnemy;

	public AnimationCurve curveDistort;




	void Awake()
	{
		Instance = this;
	
	}

	void Start () 
	{
		Shader.SetGlobalFloat("_GlobalOpacity", 1f);
		property1.Init();
		property1B.Init();
		property2.Init();
		property2B.Init();
		property2C.Init();
		property3.Init();
		property3B.Init();
	}

	void KillOldFish()
	{
		if(listFish.Count>0)
		{
			listFish[0].GetComponentInChildren<Tail>().Kill();
			listFish.RemoveAt(0);
		}
	}

	public void AddCurrentFishInList()
	{
		if(currentFish!=null)
			listFish.Add(currentFish);
	}
	

	void Update () {
		if(Input.GetKeyDown(KeyCode.R))
			Application.LoadLevel(0);

		if(Input.GetKeyDown(KeyCode.Escape))
			Application.Quit ();

		if(Input.GetKeyDown(KeyCode.Space))
		{
			for(int i = 0; i<1;i++)
			{
			//	CreateFish ();
			}
		}

		if(Input.GetKeyDown(KeyCode.Tab))
		{
			for(int i = 0; i<10;i++)
			{
				//CreateFish ();
			}
		}
			

		if(Input.GetKeyDown(KeyCode.Return))
		{
			RockInPlace(pathOpened);
		}

		if(Input.GetKeyDown (KeyCode.Delete))
		{
			KillOldFish();
		}

			

		if(Input.GetKeyDown(KeyCode.Backspace))
			playerConnected = !playerConnected;


		//if(Input.GetKeyDown(KeyCode.LeftShift))



	










		pulseProgress-=Time.deltaTime/durationCalmPulse;
		pulseProgress = Mathf.Clamp01(pulseProgress);
		pulse = curvePulse.Evaluate(pulseProgress);

		if(Input.GetMouseButtonDown(0))
		{
			HeartBeat(true);
		}

		if(autoHeartBeat)
		{
			AutoHeartBeat();
		}


		if(wasPlayerConnected!=playerConnected)
		{
			if(playerConnected && isConnecting==false)
			{
				
				isConnecting = true;
				securityProgressON = securityTimeON;
				
			}
			
			

			if(!playerConnected&& isRemoving==false)
			{
				isRemoving = true;
				securityProgressOFF = securityTimeOFF;
			}
		}
		else
		{
			isConnecting = false;
			isRemoving=false;
		}


		if(isRemoving && playerConnected == false && wasPlayerConnected==true)
		{
			securityProgressOFF=Mathf.Clamp(securityProgressOFF-Time.deltaTime,0f,securityTimeOFF);
			if(securityProgressOFF==0f)
			{

				//PLAYER DISCONNECTED
				needNewPlayer = false;

				wasPlayerConnected = false;
				lightOff = true;

				CheckDestroyFish();
				//currentFish = null;
				//currentFish.GetComponent<Tail>().LaunchGoBigPond();

				isRemoving = false;
			}

		}

		if(isConnecting && playerConnected == true && wasPlayerConnected == false)
		{
			securityProgressON=Mathf.Clamp(securityProgressON-Time.deltaTime,0f,securityTimeON);
			if(securityProgressON==0f)
			{
				wasPlayerConnected = true;

				//PLAYER CONNECTED

				lightOff = false;
				//CreateFish();
				isConnecting = false;
			}
		}

		bpm = Mathf.Max (0f,bpm);
		durationCalmPulse = 60f/bpm;

		timeSinceLastHeartBeat+=Time.deltaTime;

		if(timeSinceLastHeartBeat>2f)
		{
			autoHeartBeat = true;
		}
		else
		{
			autoHeartBeat = false;
		}


		ActivateStuff();
		CheckToFreeFish();


		if(currentFish==null)
		{
			progressClosePond+=Time.deltaTime;
		}
		else
		{
			progressClosePond-=Time.deltaTime;
		}

		progressClosePond=Mathf.Clamp01(progressClosePond);


		//littlePond.GetComponent<Renderer>().material.SetFloat("_EdgeWidth",Map (progressClosePond,0f,1f,0.268f,1f)+(wasPlayerConnected&&playerConnected?curveBeatEffet.Evaluate(pulseProgress)*forcePulsePond:0f));
		bigPond.GetComponent<Renderer>().material.SetFloat("_EdgeWidth",0.268f+(wasPlayerConnected&&playerConnected?curveBeatEffet.Evaluate(pulseProgress)*forcePulsePond:0f));

		progressOpenBridge=Mathf.Clamp01(progressOpenBridge+(pathOpened?1f:-1f)*Time.deltaTime/0.8f);
		//bridge.GetComponent<Renderer>().material.SetFloat("_OpeningBridge",progressOpenBridge);











		UpdatePondAspect();


	}

	void UpdatePondAspect()
	{

		// Debug.Log (new Vector2(Input.mousePosition.x,Screen.height-Input.mousePosition.y));


		progressDay+=Time.deltaTime/durationDay;


		Color col = rampColorsEdgePond.Evaluate(Modulo(progressDay,1f));
		bigPond.GetComponent<Renderer>().material.SetColor ("_ColorBlendRamp",col);

		Color col2 = rampColorsFondPond.Evaluate(Modulo(progressDay,1f));
		camRenderFish.backgroundColor = col2;

		Color col3 = rampColorsWaves.Evaluate(Modulo(progressDay,1f));

		Color col4 = rampColorsFoodOff.Evaluate(Modulo(progressDay,1f));
		Color col5 = rampColorsFoodOn.Evaluate(Modulo(progressDay,1f));

		Shader.SetGlobalColor("_ColorGlobal",col2);
		Shader.SetGlobalColor("_ColorGlobal2",col);
		Shader.SetGlobalColor("_ColorGlobal3",col3);
		Shader.SetGlobalColor("_ColorGlobal4",col4);
		Shader.SetGlobalColor("_ColorGlobal5",col5);




		speedDistort = 0.02f+0.007f*(Pond.Instance.GetEntitiesOfType(EntityType.Fish).Count());


		progressDistort+=speedDistort;





		bigPond.GetComponent<Renderer>().material.SetFloat("_ProgressDistort",progressDistort);

		bigPond.GetComponent<Renderer>().material.SetFloat("_Distort", Map (curveDistort.Evaluate(theEnemy.GetSpawnStatus()),0f,1f,0.16f,1.1f));


	}

	public void ConnectionPlayer(bool connect)
	{
		playerConnected = connect;
	}

	public void SetBPM(float _bpm)
	{
		bpm=_bpm;
	}

	void CheckDestroyFish()
	{
		if(currentFish!=null)
		{
			currentFish.GetComponentInChildren<Tail>().GoDie();
			currentFish = null;
		}
	}




	void AutoHeartBeat()
	{





		currentProgressAutoHeartBeat = Mathf.Min (2f,currentProgressAutoHeartBeat);




		currentProgressAutoHeartBeat-=Time.deltaTime;

		if(currentProgressAutoHeartBeat<=0f)
		{
			currentProgressAutoHeartBeat = 60f/bpm;
			HeartBeat(false);
		}
	}

	public float Map(float val, float fromMin, float fromMax, float toMin, float toMax) {
		return ((val - fromMin) / (fromMax - fromMin)) * (toMax - toMin) + toMin;
	}

	float Modulo(float a,float b)
	{
		return a - b * Mathf.Floor(a / b);
	}

	void CreateFish()
	{

		//Debug.Log ("ok");
		//Vector3 posInit = Vector3.zero+(littlePond.transform.position-bigPond.transform.position)*2.5f;
		Vector3 posInit = Vector3.zero;
		currentFish = Instantiate (prefabFish,posInit,Quaternion.identity) as GameObject;

		/*AffectProperty1();

		AffectProperty2();

		AffectProperty3();*/

		property1.Init ();
		property1B.Init ();
		property2.Init ();
		property2B.Init ();
		property2C.Init ();
		property3.Init ();
		property3B.Init ();
		currentFish.GetComponentInChildren<Tail>().SetInitPropertiesValues(property1.GetValue(),property1B.GetValue(),property2.GetValue(),property2B.GetValue(),property2C.GetValue(),property3.GetValue(),property3B.GetValue());
		needNewPlayer = true;
		listFish.Add(currentFish);

	
	}

	public void HeartBeat(bool isTrueHeartBeat)
	{
		pulseProgress = 1f;
		pulse = curvePulse.Evaluate(pulseProgress);


		if(isTrueHeartBeat)
		timeSinceLastHeartBeat = 0f;
	}

	public void BumpProperties(Tail thisTail)
	{

		property1.Init ();
		property1B.Init ();
		property2.Init ();
		property2B.Init ();
		property2C.Init ();
		property3.Init ();
		property3B.Init ();

		property1.Update();
		thisTail.AffectProperty1(property1.GetValue());
		
		property1B.Update();
		thisTail.AffectProperty1B(property1B.GetValue());

		property2.Update();
		thisTail.AffectProperty2(property2.GetValue());
		
		property2B.Update();
		thisTail.AffectProperty2B(property2B.GetValue());
		
		property2C.Update();
		thisTail.AffectProperty2C(property2C.GetValue());

		property3.Update();
		thisTail.AffectProperty3(property3.GetValue());
		
		property3B.Update();
		thisTail.AffectProperty3B(property3B.GetValue());


	}

	public void AffectProperty1()
	{
		if(currentFish!=null)
		{

			if(currentFish.GetComponentInChildren<Tail>().CanChangeValues())
			{
				property1.Update();
				currentFish.GetComponentInChildren<Tail>().AffectProperty1(property1.GetValue());
				
				property1B.Update();
				currentFish.GetComponentInChildren<Tail>().AffectProperty1B(property1B.GetValue());
				//sensor1.isTouched = true;

			}
			else
			{
				//sensor1.isTouched = false;
			}






		}
		else
		{
			//sensor1.isTouched = false;
		}
			
	}
	
	public void AffectProperty2()
	{
		if(currentFish!=null)
		{

			if(currentFish.GetComponentInChildren<Tail>().CanChangeValues())
			{
				property2.Update();
				currentFish.GetComponentInChildren<Tail>().AffectProperty2(property2.GetValue());

				property2B.Update();
				currentFish.GetComponentInChildren<Tail>().AffectProperty2B(property2B.GetValue());

				property2C.Update();
				currentFish.GetComponentInChildren<Tail>().AffectProperty2C(property2C.GetValue());

				//sensor2.isTouched = true;
			}
			else
			{
				//sensor2.isTouched = false;
			}
		}
		else
		{
			//sensor2.isTouched = false;
		}
	}

	public void AffectProperty3()
	{
		if(currentFish!=null)
		{
			if(currentFish.GetComponentInChildren<Tail>().CanChangeValues())
			{
				property3.Update();

				currentFish.GetComponentInChildren<Tail>().AffectProperty3(property3.GetValue());
				
				property3B.Update();
				
				currentFish.GetComponentInChildren<Tail>().AffectProperty3B(property3B.GetValue());

				//sensor3.isTouched = true;
			}
			else
			{
				//sensor3.isTouched = false;
			}
		}
		else
		{
			//sensor3.isTouched = false;
		}
	}

	[System.Serializable]
	public class ProgressModifProperty
	{
		float progress;
		public float durationLoop;
		public float valueMin;
		public float valueMax;
		public int freq;
		public int freq2;
		public int freq3;
		int phi;

		public void Init()
		{
			progress = Random.value;
			phi = Random.Range (0,360);
		}


		public void Update()
		{
			progress+=Time.deltaTime/durationLoop;
		}

		public float GetValue()
		{
			return(Map(GetLissajouValue(progress),0f,1f,valueMin,valueMax));
		}

		float GetLissajouValue(float progressValue)
		{
			return(	(Mathf.Sin (progressValue*Mathf.PI*2f*freq+Radians (phi))*0.5f+0.5f)*(Mathf.Cos (progressValue*Mathf.PI*2f*freq2)*0.5f+0.5f)*(Mathf.Cos (progressValue*Mathf.PI*2f*freq3)*0.5f+0.5f)			);
		}

		float Radians(float value)
		{
			float val = Mathf.PI*value/180;
			return(val);
		}


		float Map(float val, float fromMin, float fromMax, float toMin, float toMax) {
			return ((val - fromMin) / (fromMax - fromMin)) * (toMax - toMin) + toMin;
		}


	}


	public void GetMessageFromArduino(int code)
	{

		lastCode = code;
		//Debug.Log ("int: "+code);

	}

	void ActivateStuff()
	{
		//string _code = GetIntBinaryString(lastCode);

	


		//Debug.Log ("binary: "+_code);

		bool doCheckCreateFish = false;

		//if(_code.Length>=3)
		//{
			if(stateButtons[0]==1 || Input.GetKey (KeyCode.Keypad1))
			{
				AffectProperty1();
				doCheckCreateFish = true;


			}
			else
			{
				//sensor1.isTouched = false;
			}
			
			if(stateButtons[1]==1 || Input.GetKey (KeyCode.Keypad2))
			{
				AffectProperty2();
				doCheckCreateFish = true;
			}
			else
			{
				//sensor2.isTouched = false;
			}
			
			if(stateButtons[2]==1 || Input.GetKey (KeyCode.Keypad3))
			{
				AffectProperty3();
				doCheckCreateFish = true;
			}
			else
			{
				//sensor3.isTouched = false;
			}
		//}


		if(doCheckCreateFish)
		{
			CheckToCreateFish();
			doCheckCreateFish = false;
		}
		else
		{
			//iconHeart.myState = IconScript.State.Off;
			//iconStone.myState = IconScript.State.Off;
		}



	}

	void CheckToCreateFish()
	{
		if(currentFish == null) 
		{
			if(pathOpened==false && playerConnected==true && wasPlayerConnected == true)
			{
				if(needNewPlayer==false)
					CreateFish();
			}

			if(playerConnected==false || wasPlayerConnected == false)
			{
				//iconHeart.myState = IconScript.State.Blink;
			}
			else
			{
				//iconHeart.myState = IconScript.State.Off;
			}

			if(pathOpened==true)
			{
				//iconStone.myState = IconScript.State.Blink;
			}
			else
			{
				//iconStone.myState = IconScript.State.Off;
			}



		}


	}

	void CheckToFreeFish()
	{


	}


	static string GetIntBinaryString(int n)
	{
		char[] b = new char[3];
		int pos = 2;
		int i = 0;
		
		while (i < 3)
		{
			if ((n & (1 << i)) != 0)
			{
				b[pos] = '1';
			}
			else
			{
				b[pos] = '0';
			}
			pos--;
			i++;
		}
		return new string(b);
	}

	public float ValueHeartBeat()
	{
		return(curveBeatEffet.Evaluate(pulseProgress));
	}


	public void RockInPlace(bool rockInPlace)
	{
		pathOpened = !rockInPlace;
		//sensorStone.isTouched = rockInPlace;

	}

	public void UpdateStateButtons(int index, int state)
	{
		stateButtons[index] = state;
	}

}
