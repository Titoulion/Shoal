using UnityEngine;
using System.Collections;

public class EnemyScript : MonoBehaviour {

	enum EnemyState {
						Sleeping,
						Hunting,
						Moving,
						Repositioning,
						Attacking,
						Dying,
						WakingUp,
						Blank,
						Testing
					};
	private EnemyState state = EnemyState.Sleeping;
	private EnemyState nextState = EnemyState.Blank;

	public int health = 20;

	public float sleepingRadius;
	public float huntingRadius;
	public float movingRadius;

	public Vector2 sleepTimeRange;

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
	private float currentAngle, currentRadius;

	private FishScript prey;

	private bool mouseHovering = false;

	private Rect watchingRect;

	// Use this for initialization
	void Start () {
		zPosition = transform.position.z;
		float sleepTime = Random.Range(sleepTimeRange.x, sleepTimeRange.y);
		Invoke("WakeUp", sleepTime);

		startLerpRadius = sleepingRadius;
		startLerpAngle = Random.Range(0f, 360f);
		Quaternion degrees = Quaternion.Euler(0, 0, startLerpAngle);
		Vector3 unrotatedStart = new Vector3(sleepingRadius, 0, zPosition);
		transform.position = degrees * unrotatedStart;

		float rectLeft = huntingRadius - attackRange;
		watchingRect = new Rect(rectLeft, 0.5f, attackRange, 1f);
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
			case EnemyState.Repositioning:
				RepositioningUpdate();
				break;
			case EnemyState.Sleeping:
				break;
			case EnemyState.Dying:
				DyingUpdate();
				break;
			case EnemyState.WakingUp:
				WakingUpUpdate();
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
			// Debug.Log(Time.time + " Enemy state is now " + state);
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

	void DyingUpdate() {
		lerpTimer += Time.deltaTime;
		float time = lerpTimer/lerpDuration;
		SmoothMove(startLerpRadius, targetLerpRadius, startLerpAngle, targetLerpAngle, time);
		if (time >= 1f) {
			nextState = EnemyState.Sleeping;

			startLerpRadius = sleepingRadius;
			startLerpAngle = Random.Range(0f, 360f);
			Quaternion degrees = Quaternion.Euler(0, 0, startLerpAngle);
			Vector3 unrotatedStart = new Vector3(sleepingRadius, 0, zPosition);
			transform.position = degrees * unrotatedStart;

			float sleepTime = Random.Range(sleepTimeRange.x, sleepTimeRange.y);
			Invoke("WakeUp", sleepTime);
		}
	}

	void HuntingUpdate() {
		/*
		* finding fishes with slow lookup until a constantly maintined
		* collection of fishes is implimeneted
		*/
		FishScript[] fishes = FindObjectsOfType(typeof(FishScript)) as FishScript[];

		Vector2 pos = transform.position;
		float enemyRads = Mathf.Atan2(pos.y, pos.x);

		for (int i = 0; i < fishes.Length; i++) {
			Vector2 fishPos = fishes[i].transform.position;
			float distance = Vector2.Distance(fishPos, pos);
			if (distance <= attackRange) {
				prey = fishes[i];

				/*
				* If the fish is within the attack range, check to see if the
				* fish is actually within the area the enemy will attack. Do 
				* this by rotating the fish around the center based on the angle
				* of the enemy relative to the x-axis. Then compare the new fish
				* position against watchingRect. Doing the targetting this way
				* is much simpler than calculating if the fish is inside a
				* rotated rectangle.
				*/

				float cos = Mathf.Cos(-enemyRads);
				float sin = Mathf.Sin(-enemyRads);

				Vector2 adjFish = new Vector2(
											fishPos.x * cos - fishPos.y * sin,
											fishPos.x * sin + fishPos.y * cos
											);

				if (watchingRect.Contains(adjFish)) {
					startLerpRadius = Vector2.Distance(Vector2.zero, pos);
					startLerpAngle = Mathf.Rad2Deg * enemyRads;

					lerpTimer = 0f;
					lerpDuration = distance/attackSpeed;
					nextState = EnemyState.Attacking;
					CancelInvoke("Reposition");

					break;
				}
			}
		}
		CheckForDamage();
	}

	void RepositioningUpdate() {
		lerpTimer += Time.deltaTime;
		float time = lerpTimer/lerpDuration;

		SmoothMove(currentRadius, currentRadius, startLerpAngle, targetLerpAngle, time);
		if (time <= 0.2f) {
			float t = time / 0.2f;
			SmoothMove(huntingRadius, movingRadius, currentAngle, currentAngle, t);
		} else if (time >= 0.8f) {
			float t = (time - 0.8f) / 0.2f;
			SmoothMove(movingRadius, huntingRadius, currentAngle, currentAngle, t);
		}

		if (time >= 1f) {
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

	void WakingUpUpdate() {
		lerpTimer += Time.deltaTime;
		float time = lerpTimer/lerpDuration;
		SmoothMove(sleepingRadius, huntingRadius, startLerpAngle, targetLerpAngle, time);
		if (time >= 1f) {
			nextState = EnemyState.Hunting;

			startLerpAngle = targetLerpAngle;
			startLerpRadius = huntingRadius;

			if (startLerpAngle > 360f) {
				startLerpAngle -= 360f;
			} else if (startLerpAngle < 0f) {
				startLerpAngle += 360f;
			}

			float t = Random.Range(gapBetweenMoves.x, gapBetweenMoves.y);
			Invoke("Reposition", t);
		}
	}

	void FallingAsleepUpdate() {
		lerpTimer += Time.deltaTime;
		float time = lerpTimer/lerpDuration;
		SmoothMove(startLerpRadius, sleepingRadius, startLerpAngle, targetLerpAngle, time);
		if (time >= 1f) {
			nextState = EnemyState.Sleeping;

			startLerpAngle = targetLerpAngle;
			startLerpRadius = targetLerpRadius;

			if (startLerpAngle > 360f) {
				startLerpAngle -= 360f;
			} else if (startLerpAngle < 0f) {
				startLerpAngle += 360f;
			}

			float t = Random.Range(gapBetweenMoves.x, gapBetweenMoves.y);
			Invoke("WakeUp", t);
		}

	}

	/*
	* lerp towards targetLerpRadius & targetLerpAngle
	* When the moving is over, return true
	*/
	bool SmoothMove(float sRadius, float tRadius, float sAngle, float tAngle, float time) {
		float smoothTime = Mathf.SmoothStep(0f, 1.0f, time);
		currentRadius = Mathf.Lerp(sRadius, tRadius, smoothTime);
		currentAngle = Mathf.Lerp(sAngle, tAngle, smoothTime);
		Quaternion degrees = Quaternion.Euler(0, 0, currentAngle);
		transform.position = degrees * (new Vector3(currentRadius, 0, zPosition));

		if (smoothTime == 1f) {
			return true;
		}
		return false;
	}	
			
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
		if (Input.GetKeyDown(KeyCode.B)) {
			currentHealth--;

			if (currentHealth <= 0) {
				nextState = EnemyState.Dying;

				targetLerpRadius = sleepingRadius;
				Vector2 pos = transform.position;
				startLerpRadius = Vector2.Distance(Vector2.zero, pos);
				// startLerpAngle = Mathf.Atan2(pos.y, pos.x);
				startLerpAngle = currentAngle;
				targetLerpAngle = startLerpAngle;

				lerpDuration = wakingUpTime;
				lerpTimer = 0f;

				CancelInvoke("Reposition");
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

	public void Reposition() {
		CancelInvoke("Reposition");
		nextState = EnemyState.Repositioning;

		float angle = Random.Range(moveRange.x, moveRange.y);
		angle *= (Random.Range(0, 2) == 0) ? -1 : 1;

		targetLerpRadius = huntingRadius;
		targetLerpAngle = startLerpAngle + angle;

		lerpDuration = Mathf.Abs(angle) / moveSpeed;
		lerpTimer = 0f;
	}

	public void WakeUp() {
		CancelInvoke("WakeUp");
		state = EnemyState.WakingUp;

		targetLerpRadius = huntingRadius;
		targetLerpAngle = startLerpAngle;	

		currentHealth = health;

		lerpTimer = 0;
		lerpDuration = wakingUpTime;
	}
}
