using UnityEngine;
using System.Collections;

public class EnemyBodyUnit : MonoBehaviour {
	
	public AnimationCurve floatingCurve;
	public 	Color testColor;
	
	
	private float angelUnit = 20.0f;
	private float scaleUnit = 0.5f;
	private float randomSeed;
	
	
	
	private SpriteRenderer theRenderer;
	private Material theMaterial;
	
	
	private Vector3 initPosition;
	private Vector3 initScale;
	private float initAngel;
	private float _alpha;
	private float partID;
	private int animationID;
	private float lerpTime;

	private Material myMat;
	
	
	public void setPartID(float _id){
		
		partID = _id;
		setPositionandScale(partID);
		
		
	}
	
	public void setColor(){
		
		testColor = new Color( 0.2f,0.3f,Random.Range(0.1f,0.5f),0.0f);
		theRenderer.color = testColor;
		
	}
	
	public void setAnimation(int _animation){
		
		animationID = _animation;
		
	}
	public int getAnimationID(){
		
		return animationID;
	}
	
	
	// Use this for initialization
	void Awake () {
		
		myMat = GetComponent<Renderer>().material;
		theRenderer = gameObject.GetComponent<SpriteRenderer>();
		theMaterial = theRenderer.material;
		randomSeed = Random.value;
		partID = -1.0f;
		animationID = 0;
		setColor ();
		_alpha = Random.Range (0.3f, 0.5f);
		lerpTime = 0.0f;

		
	}
	
	void setPositionandScale(float _id){
		
		float r = Mathf.Ceil(_id/18) ;
		float n = _id%18;
		
		gameObject.transform.localRotation = Quaternion.AngleAxis(angelUnit * n, Vector3.forward);
		gameObject.transform.localScale = new Vector3 (1.5f + (scaleUnit-0.2f) * r , 1.5f + scaleUnit * r, 0.0f);
		
		initAngel = angelUnit * n;
		initScale = gameObject.transform.localScale;
		initPosition = gameObject.transform.position;
		
	}
	
	void animationController(int _aniamtion){
		
		
		switch (_aniamtion) {
			
		case 1:
			idleAniamtion();
			break;
		case 2:
			fadeInAnimation();
			break;
		case 3:
			fadeOutAnimation();
			break;
		default:
			//Debug.Log("No aniamtion");
			break;
		}
	}
	
	void idleAniamtion(){
		gameObject.transform.localRotation = Quaternion.AngleAxis(initAngel + floatingCurve.Evaluate(randomSeed + Time.time) * 5, Vector3.forward);
		gameObject.transform.localScale = new Vector3 (initScale.x , initScale.y + floatingCurve.Evaluate(randomSeed + Time.time)/10, 0.0f);
	}
	
	void fadeInAnimation(){
		
		lerpTime += Time.deltaTime;
		
		if (lerpTime < _alpha) {
			Color _c = new Color (theRenderer.color.r, theRenderer.color.g, theRenderer.color.b, lerpTime);
			theRenderer.color = _c;
			myMat.SetFloat("_MyOpacity",lerpTime);
			//Debug.Log ("FadeIn animation is playing" + lerpTime);
		} else {
			
			setAnimation(1);
			lerpTime = 0.0f;
		}
	}
	
	void fadeOutAnimation(){
		
		_alpha -= Time.deltaTime;
		
		if (_alpha > 0.0f) {
			Color _c = new Color (theRenderer.color.r, theRenderer.color.g, theRenderer.color.b, _alpha);
			theRenderer.color = _c;
			myMat.SetFloat("_MyOpacity",_alpha);
			//Debug.Log("FadeOut animation is playing");	
			
		} else {
			
			
		}//Debug.Log("Disappear");
		
		
		
	}
	
	void blinkAnimation(){
		
		
		
		
	}
	
	// Update is called once per frame
	void Update () {
		
		if (partID != -1.0f) {
			
			animationController (animationID);
			
		}
		
		
	}
}
