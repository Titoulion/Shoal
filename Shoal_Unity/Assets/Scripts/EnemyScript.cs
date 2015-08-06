using UnityEngine;
using System.Collections;

public class EnemyScript : MonoBehaviour {

	enum EnemyState {
						Sleeping,
						Hunting,
						Moving,
						Attacking,
						Blank,
						Testing
					};
	private EnemyState state = EnemyState.Sleeping;
	private EnemyState nextState = EnemyState.Blank;

	public int health = 20;

	public float sleepingRadius;
	public float huntingRadius;

	public Vector2 sleepingTimeRange;

	public float wakingUpTime;

	public float attackRange;

	public Vector2 gapBetweenMoves; //x shortest, y longest
	public float moveSpeed; //degrees per second to move around the circle
	public Vector2 moveRange;

	public float attackSpeed;

	private int currentHealth = 0;

	private float zPosition;
	private float lerpTimer, lerpDuration;

	private float targetLerpRadius, targetLerpAngle;
	private float startLerpRadius, startLerpAngle;

	private FishScript prey;

	private bool mouseHovering = false;

	// Use this for initialization
	void Start () {
		zPosition = transform.position.z;
		float sleepTime = Random.Range(sleepingTimeRange.x, sleepingTimeRange.y);

		Invoke("WakeUp", sleepTime);

		startLerpRadius = sleepingRadius;
		startLerpAngle = Random.Range(0f, 360f);
		Quaternion degrees = Quaternion.Euler(0, 0, startLerpAngle);
		transform.position = degrees * (new Vector3(sleepingRadius, 0, zPosition));
	}
	
	// Update is called once per frame
	void Update () {
		switch(state) {
			case EnemyState.Attacking:
				AttackingUpdate();
				break;
			case EnemyState.Hunting:
				HuntingUpdate();
				break;
			case EnemyState.Moving:
				MovingUpdate();
				break;
			case EnemyState.Sleeping:
				break;
			case EnemyState.Blank:
				Debug.Log("state should never be set to Blank");
				break;
		}

		/*
		* only over change state here to ensure consistency
		*/ 
		if (nextState != EnemyState.Blank) {
			state = nextState;
			Debug.Log(Time.time + " Enemy state is now " + state);
			nextState = EnemyState.Blank;
		}
	}

	void AttackingUpdate() {
		if (prey == null) {
			Debug.Log("ERROR: prey is null during attack");
			return;
		}

		Vector2 preyPos = prey.transform.position;
		targetLerpRadius = Vector2.Distance(Vector2.zero, preyPos);
		targetLerpAngle = Mathf.Rad2Deg * Mathf.Atan2(preyPos.y, preyPos.x);

		if (Move()) {
			Destroy(prey.gameObject);
			prey = null;

			nextState = EnemyState.Moving;

			Vector2 pos = transform.position;
			startLerpAngle = Mathf.Rad2Deg * Mathf.Atan2(pos.y, pos.x);
			targetLerpAngle = startLerpAngle;
			startLerpRadius = Vector2.Distance(Vector2.zero, pos);
			targetLerpRadius = huntingRadius;
			float returnDistance = targetLerpRadius - startLerpRadius;

			lerpDuration = Mathf.Abs(returnDistance/(attackSpeed * 0.25f));
			lerpTimer = 0f;
		}
	}

	void HuntingUpdate() {
		/*
		* finding fishes with slow lookup until a constantly maintined
		* collection of fishes is implimeneted
		*/
		FishScript[] fishes = FindObjectsOfType(typeof(FishScript)) as FishScript[];

		Vector2 pos = transform.position;

		for (int i = 0; i < fishes.Length; i++) {
			Vector2 fishPos = fishes[i].transform.position;
			float distance = Vector2.Distance(fishPos, pos);
			if (distance <= attackRange) {
				prey = fishes[i];
				startLerpRadius = Vector2.Distance(Vector2.zero, pos);
				startLerpAngle = Mathf.Rad2Deg * Mathf.Atan2(pos.y, pos.x);

				lerpTimer = 0f;
				lerpDuration = distance/attackSpeed;
				nextState = EnemyState.Attacking;
				CancelInvoke("Reposition");

				break;
			}
		}

		CheckForDamage();
	}

	void MovingUpdate() {
		if (Move()) {
			// state = nextState;
			nextState = EnemyState.Hunting;

			startLerpAngle = targetLerpAngle;
			startLerpRadius = targetLerpRadius;

			if (startLerpAngle > 360f) {
				startLerpAngle -= 360f;
			} else if (startLerpAngle < 0f) {
				startLerpAngle += 360f;
			}

			float t = Random.Range(gapBetweenMoves.x, gapBetweenMoves.y);
			Invoke("Reposition", t);
		}

		CheckForDamage();
	}


	/*
	* lerp towards targetLerpRadius & targetLerpAngle
	* When the moving is over, return true
	*/
	bool Move() {
		lerpTimer += Time.deltaTime;
		float t = Mathf.SmoothStep(0f, 1.0f, lerpTimer/lerpDuration);
		float radius = Mathf.Lerp(startLerpRadius, targetLerpRadius, t);
		float angle = Mathf.Lerp(startLerpAngle, targetLerpAngle, t);
		Quaternion degrees = Quaternion.Euler(0, 0, angle);
		transform.position = degrees * (new Vector3(radius, 0, zPosition));

		if (lerpTimer >= lerpDuration) {
			return true;
		}
		return false;
	}

	void CheckForDamage() {
		if (Input.GetMouseButton(0)) {
			Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
			if (Physics.Raycast(ray)) {
				Debug.Log("OW");
			}
		}
	}

	void OnMouseEnter() {
		mouseHovering = true;
		Debug.Log("hovering");
	}

	void OnMouseExit() {
		mouseHovering = false;
	}

	void Reposition() {
		nextState = EnemyState.Moving;

		float angle = Random.Range(moveRange.x, moveRange.y);
		angle *= (Random.Range(0, 2) == 0) ? -1 : 1;

		targetLerpRadius = huntingRadius;
		targetLerpAngle = startLerpAngle + angle;

		lerpDuration = Mathf.Abs(angle) / moveSpeed;
		lerpTimer = 0f;
	}

	void WakeUp() {
		state = EnemyState.Moving;

		targetLerpRadius = huntingRadius;
		targetLerpAngle = startLerpAngle;	

		currentHealth = health;

		lerpTimer = 0;
		lerpDuration = wakingUpTime;
	}
}
