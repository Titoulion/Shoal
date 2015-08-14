using UnityEngine;
using System.Collections;

public class EnemyWing : MonoBehaviour {
	
	GameObject[] EnemyBody = new GameObject[0];
	EnemyBodyUnit[] EnemyPartsScripts = new EnemyBodyUnit[0];


	public GameObject prefabEnemyBodyPart;
	public 	Color testColor;
	
	
	public int bodyNumber;
	
	private int wingID;
	private int statusID;
	
	private int _currentPointer;
	
	private int attackDistance;
	public float currentAngel;
	
	public void setWingID(int id){
		
		wingID = id;
		
		
	}
	public void setStatus(int _status){
		
		statusID = _status;
		
	}

	
	void Start () {
		bodyNumber = 8;
		_currentPointer = 0;
		currentAngel = 0.0f;

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
			InvokeRepeating ("apperaSequence", 0.1f, 0.1f);
			
		}
		
		setStatus(1);
	}
	
	void wingRotation(){
		
		if (wingID  == 1){
			gameObject.transform.rotation = Quaternion.AngleAxis((currentAngel - Time.time * 20.0f), Vector3.forward);
		}
		if (wingID  == 2){
			gameObject.transform.localScale = new Vector3(-1.0f,-1.0f,1.0f);
			gameObject.transform.rotation = Quaternion.AngleAxis((currentAngel + Time.time * 20.0f), Vector3.forward);
		}
		//gameObject.transform.localPosition = new Vector3(0.0f,0.0f, 0.0f);
		gameObject.transform.localScale = new Vector3 (1.0f,1.0f,0.0f);

		
	}
	
	void idleAniamtion(){
		Debug.Log("idle animation");

		
	}
	
	void catchAnimation(){
		
		float scale = 1.2f;
		if(wingID == 1){
			float angle = Mathf.LerpAngle (currentAngel, currentAngel + 15, Time.time);
			float size = Mathf.Lerp (1.0f, scale, Time.time);
			float distance = Mathf.Lerp (0.0f,-0.5f, Time.time);
			gameObject.transform.eulerAngles = new Vector3(0.0f,0.0f, angle);
			currentAngel = angle;
			gameObject.transform.localScale = new Vector3 (size,size,0.0f);

			//gameObject.transform.localPosition = new Vector3(distance,-distance, 0.0f);

			
		}
		if (wingID == 2) {
			float angle = Mathf.LerpAngle (currentAngel, currentAngel + 15, Time.time);
			float distance = Mathf.Lerp (0.0f,0.5f, Time.time);
			float size = Mathf.Lerp (1.0f, scale, Time.time);
			gameObject.transform.eulerAngles = new Vector3(0.0f,0.0f, angle);
			currentAngel = angle;
			gameObject.transform.localScale = new Vector3 (size,size,0.0f);

			//gameObject.transform.localPosition = new Vector3(distance,-distance, 0.0f);

		}
		setStatus (2);

				
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

	void rebirthAnimation(){


		bodyNumber = 8;
		_currentPointer = 0;
		generateBody();

		
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
		case 6:
			rebirthAnimation();
			break;
			
		}

	}
	
	float Map(float val, float fromMin, float fromMax, float toMin, float toMax) {
		
		return ((val - fromMin) / (fromMax - fromMin)) * (toMax - toMin) + toMin;	
	}
	
}
