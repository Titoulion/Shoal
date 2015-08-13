﻿using UnityEngine;
using System.Collections;

public class EnemyWing : MonoBehaviour {
	
	GameObject[] EnemyBody = new GameObject[0];
	EnemyBodyUnit[] EnemyPartsScripts = new EnemyBodyUnit[0];


	public GameObject prefabEnemyBodyPart;
	public 	Color testColor;
	
	
	public int bodyNumber = 8;
	
	private int wingID;
	private int statusID;
	
	private int _currentPointer;
	
	private int attackDistance;
	private float enemyHalfSize;
	
	public void setWingID(int id){
		
		wingID = id;
		
		
	}
	public void setStatus(int _status){
		
		statusID = _status;
		
	}
	public void setTransform(){
		
		
	}
	
	void Start () {
		
		_currentPointer = 0;
		enemyHalfSize = 2.0f;
		
	}
	
	void Update () {
		
		
		checkStatus(statusID);
		//Debug.Log ("rotation"+ gameObject.transform.localRotation.eulerAngles);

		
	}
	
	void apperaSequence(){
		if (_currentPointer < EnemyBody.Length) {
			EnemyPartsScripts [_currentPointer].setAnimation (2);
			_currentPointer++;
		} 
	}
	
	void generateBody(){
		
		EnemyBody = new GameObject[bodyNumber];
		EnemyPartsScripts = new EnemyBodyUnit[bodyNumber];	
		
		for(int i = 0; i < EnemyBody.Length; i++){
			
			float progress = Map ((float)i,0f,(float)(EnemyBody.Length-1),0f,1f);
			GameObject _enemyBody = Instantiate(prefabEnemyBodyPart,transform.position,Quaternion.identity) as GameObject;
			_enemyBody.transform.parent = transform;
			EnemyBodyUnit _enemyPartsScripts = _enemyBody.GetComponent<EnemyBodyUnit>();
			EnemyBody [i] = _enemyBody;
			EnemyPartsScripts [i] = _enemyPartsScripts;
			EnemyPartsScripts [i].setPartID(i);
			
		}
		
		if ((_currentPointer < EnemyBody.Length)) {
			InvokeRepeating ("apperaSequence", 0.3f, 0.3f);
			
		}
		
		setStatus(1);
	}
	
	void wingRotation(){
		
		if (wingID  == 1){
			gameObject.transform.rotation = Quaternion.AngleAxis( (60 - Time.time * 20.0f), Vector3.forward);
		}
		if (wingID  == 2){
			//gameObject.transform.localScale = new Vector3(-1.0f,1.0f,1.0f);
			gameObject.transform.rotation = Quaternion.AngleAxis( (300 + Time.time * 20.0f), Vector3.forward);
		}
		
	}
	
	void idleAniamtion(){
		Debug.Log("idle animation");
		
	}
	
	void catchAnimation(){
		
		
		if(wingID == 1){
			
		}
		if (wingID == 2) {
		}
				
	}
	
	
	void destoryAnimation(){
		
		if (bodyNumber > 0) {
			int thelast = bodyNumber;
			EnemyPartsScripts [thelast - 1].setAnimation (3);
			Invoke ("destoryTheLast", 1);
		}
		else{
			Debug.Log("dead");
			
		}
		setStatus (1);
		
	}
	
	void destoryTheLast(){
		
		int thelast = bodyNumber;
		Destroy (EnemyBody[thelast-1]);
		bodyNumber--;
		Debug.Log ("the length" + bodyNumber);
		
		
		
	}
	
	void checkStatus(int _a){
		
		switch (_a) {
		case 0:
			generateBody();
			break;
		case 1:
			idleAniamtion ();
			break;
		case 2:
			wingRotation ();
			break;
		case 3:
			catchAnimation();
			break;
		case 4:
			destoryAnimation();
			break;
		case 5:
			break;
			
		}
		Debug.Log ("current status" + _a);
		
	}
	
	float Map(float val, float fromMin, float fromMax, float toMin, float toMax) {
		
		return ((val - fromMin) / (fromMax - fromMin)) * (toMax - toMin) + toMin;	
	}
	
}