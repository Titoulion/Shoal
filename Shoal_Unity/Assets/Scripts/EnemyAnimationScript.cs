using UnityEngine;
using System.Collections;

public class EnemyAnimationScript : MonoBehaviour {
	
	enum EnemyAnimation{
		
		wakeAnimation,
		idleAnimation,
		moveAnimation,
		attackAnimation,
		repositionAnimation,
		destroryAnimation,
		nullAnimation
	};
	
	
	private GameObject[] EnemyWings = new GameObject[0];
	private EnemyWing[] WingScript = new EnemyWing[0];
	private EnemyAnimation theAniamtionState = EnemyAnimation.nullAnimation;
	
	public GameObject prefabWing;
	
	private int wingsNumber  = 2;
	
	
	void setEnemyAnimation(EnemyAnimation _state){
		theAniamtionState = _state;
	} 
	
	void animationStateCheck(){
		
		switch (theAniamtionState) {
		case EnemyAnimation.wakeAnimation:
			enemyWakeAnimation ();
			break;
		case EnemyAnimation.idleAnimation:
			enemyIdleAnimation();
			break;
		case EnemyAnimation.attackAnimation:
			enemyAttackAnimation();
			break;
		case EnemyAnimation.moveAnimation:
			enemyMoveAnimation();
			break;
		case EnemyAnimation.destroryAnimation:
			enemyDestroyAniamtion();
			break;
		case EnemyAnimation.nullAnimation:
			break;
			
		}
	}
	
	void Start () {
		
		theAniamtionState = EnemyAnimation.wakeAnimation;
		
	}
	
	void Update () {
		
		animationStateCheck ();
		
		
		if (Input.anyKeyDown) {
			
			theAniamtionState = EnemyAnimation.destroryAnimation;
		}
		if (Input.GetKey ("up")) {
			
			theAniamtionState = EnemyAnimation.moveAnimation;
			
		}
		
	}
	
	
	void enemyWakeAnimation(){
		
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
		
		theAniamtionState = EnemyAnimation.idleAnimation;
		
	}
	
	void enemyIdleAnimation(){
		
		//default animation
		
		
	}
	void enemyMoveAnimation(){
		
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
		
		theAniamtionState = EnemyAnimation.idleAnimation;
	}
}
