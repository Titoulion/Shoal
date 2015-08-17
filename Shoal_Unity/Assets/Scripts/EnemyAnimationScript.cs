using UnityEngine;
using System.Collections;

public class EnemyAnimationScript : MonoBehaviour {
	
	public enum EnemyAnimation{
		
		wakeAnimation,
		idleAnimation,
		huntAnimation,
		attackAnimation,
		repositionAnimation,
		destroryAnimation,
		resetAnimation,
		nullAnimation
	};

	public GameObject prefabWing;

	
	private GameObject[] EnemyWings = new GameObject[0];
	private EnemyWing[] WingScript = new EnemyWing[0];
	private EnemyScript enemyScript;

	private EnemyAnimation theAniamtionState;

	private int wingsNumber  = 2;
	private float currentAngle;
	private float targetAngle;
	private float sleepTime;

	
	public void setEnemyAnimation(EnemyAnimation _state){
		theAniamtionState = _state;
	} 

	public void setSleepTime(float _t){
		sleepTime = _t;
	}

	public void setTargetAngle(float _a){

		targetAngle = _a;

	}

	
	void Start () {
		enemyScript = GetComponent<EnemyScript>();
		theAniamtionState = EnemyAnimation.nullAnimation;
		currentAngle = gameObject.transform.eulerAngles.z;
	}
	
	void Update () {
		
		switch (theAniamtionState) {
		case EnemyAnimation.wakeAnimation:
			enemyWakeAnimation ();
			break;
		case EnemyAnimation.idleAnimation:
			break;
		case EnemyAnimation.attackAnimation:
			enemyAttackAnimation();
			break;
		case EnemyAnimation.huntAnimation:
			enemyHuntAnimation();
			break;
		case EnemyAnimation.destroryAnimation:
			enemyDestroyAniamtion();
			break;
		case EnemyAnimation.resetAnimation:
			enemyResetAnimation();
			break;
		case EnemyAnimation.repositionAnimation:
			enemyRepositionAnimation();
			break;
		case EnemyAnimation.nullAnimation:
			break;
			
		}
	}

	
	void enemyWakeAnimation(){
		//for tranparent
		//Invoke ("wingGeneration", sleepTime + enemyScript.wakingUpTime - 2.0f);

		Invoke ("wingGeneration", sleepTime );

		theAniamtionState = EnemyAnimation.idleAnimation;
		
	}

	void enemyResetAnimation(){
		//for tranparent
		//Invoke ("wingReset", sleepTime + enemyScript.wakingUpTime - 2.0f);
		Invoke ("wingReset", sleepTime);
		theAniamtionState = EnemyAnimation.idleAnimation;
	}

	void enemyHuntAnimation(){

		for (int i = 0; i < EnemyWings.Length; i++) {
			
			WingScript[i].setStatus(2);

		}
		
	}
	void enemyAttackAnimation(){


		//Debug.Log ("attack");
		for (int i = 0; i < EnemyWings.Length; i++) {
			
			WingScript[i].setStatus(3);
			
		}
		theAniamtionState = EnemyAnimation.idleAnimation;

	}
	
	void enemyRepositionAnimation(){

		float angle = Mathf.LerpAngle (currentAngle, targetAngle, Time.time);
		gameObject.transform.eulerAngles = new Vector3(0.0f,0.0f, angle);
		//Debug.Log ("reposition");
		
	}
	
	void enemyDestroyAniamtion(){
		
		for (int i = 0; i < EnemyWings.Length; i++) {
			
			WingScript[i].setStatus(4);

		}
		//Debug.Log("destory Animation");

		theAniamtionState = EnemyAnimation.nullAnimation;
	}


	void wingGeneration(){
		
		EnemyWings = new GameObject[wingsNumber];
		WingScript = new EnemyWing[wingsNumber];
		
		for (int i = 0; i < EnemyWings.Length; i++) {
			
			GameObject _thisWing = Instantiate (prefabWing, transform.position, Quaternion.identity) as GameObject;
			if (i%2 == 0){
				_thisWing.transform.localScale = new Vector3(-1.0f,1.0f,1.0f);
			}
			
			if(i%2 == 1){
				_thisWing.transform.localScale = new Vector3(1.0f,-1.0f,1.0f);
			}
			_thisWing.transform.parent = transform;
			EnemyWing _wingScripts = _thisWing.GetComponent<EnemyWing>();
			EnemyWings[i] = _thisWing;
			WingScript[i] = _wingScripts;
			WingScript[i].setWingID(i + 1);
			WingScript[i].setStatus(0);
			
		}
		
	}

	void wingReset(){


		for (int i = 0; i < EnemyWings.Length; i++) {
			
			WingScript[i].setStatus(6);
			Debug.Log ("RESET ANIAMATION"+EnemyWings.Length);

		}

	}
}
