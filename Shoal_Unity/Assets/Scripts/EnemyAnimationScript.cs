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
	private EnemyAnimation theAniamtionState = EnemyAnimation.nullAnimation;

	EnemyScript enemyScript;
	

	private int wingsNumber  = 2;
	private float currentAngel;
	private float sleepTime;

	
	public void setEnemyAnimation(EnemyAnimation _state){
		theAniamtionState = _state;
	} 

	public void setSleepTime(float _t){
		sleepTime = _t;
	}

	
	void Start () {
		enemyScript = GetComponent<EnemyScript>();
		currentAngel = enemyScript.currentAngle;
		theAniamtionState = EnemyAnimation.nullAnimation;
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
		case EnemyAnimation.nullAnimation:
			break;
			
		}
	}

	
	void enemyWakeAnimation(){

		Invoke ("wingGeneration", sleepTime + enemyScript.wakingUpTime - 1);
		theAniamtionState = EnemyAnimation.idleAnimation;
		
	}

	void enemyResetAnimation(){

		Invoke ("wingReset", sleepTime + enemyScript.wakingUpTime - 1);
		theAniamtionState = EnemyAnimation.idleAnimation;
		
	}

	void enemyHuntAnimation(){

		currentAngel = enemyScript.currentAngle;
		for (int i = 0; i < EnemyWings.Length; i++) {
			
			WingScript[i].setStatus(2);

		}
		
	}
	void enemyAttackAnimation(){

	}
	
	void enemyRepositionAnimation(){
		
		
	}
	
	void enemyDestroyAniamtion(){
		
		for (int i = 0; i < EnemyWings.Length; i++) {
			
			WingScript[i].setStatus(4);

		}
		Debug.Log("destory Animation");

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
			
		}

	}
}
