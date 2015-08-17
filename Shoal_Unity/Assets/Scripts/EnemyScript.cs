using UnityEngine;
using System.Collections;
using System.Linq;

public class EnemyScript : MonoBehaviour {

	enum EnemyState {
						Sleeping,
						Hunting,
						Repositioning,
						Attacking,
						Resetting,
						Dying,
						WakingUp,
						Blank,
						TakingDamage,
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
	public float attackWidth;

	public Vector2 gapBetweenMoves; //x shortest, y longest
	public float moveSpeed; //degrees per second to move around the circle
	public Vector2 moveRange;

	public float attackSpeed;

	private int currentHealth = 0;

	private float zPosition;
	private float lerpTimer, lerpDuration;

	private float targetRadius, targetAngle;
	private float startRadius, startAngle;

	private  float currentAngle, currentRadius;

	private Entity prey;

	private Rect watchingRect;
	static public EnemyScript Me;

	//Animation Script
	EnemyAnimationScript enemyAnimation;

	void Awake(){
		Me = this;

	}

	void Start () {
		float sleepTime = Random.Range(sleepTimeRange.x, sleepTimeRange.y);
		zPosition = transform.position.z;
		Invoke("WakeUp", sleepTime);

		enemyAnimation = GetComponent<EnemyAnimationScript>();
		enemyAnimation.setSleepTime (sleepTime);
		enemyAnimation.setEnemyAnimation (EnemyAnimationScript.EnemyAnimation.wakeAnimation);
		startRadius = sleepingRadius;
		// startAngle = Random.Range(0f, 360f);
		startAngle = -359f;
		Quaternion degrees = Quaternion.Euler(0, 0, startAngle);
		Vector3 unrotatedStart = new Vector3(sleepingRadius, 0, zPosition);
		transform.position = degrees * unrotatedStart;

		float rectLeft = huntingRadius - attackRange;
		watchingRect = new Rect(rectLeft, attackWidth/2, attackRange, attackWidth);


		//get animation script
	}
	
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
			case EnemyState.Resetting:
				ResettingUpdate();
				break;
			case EnemyState.TakingDamage:
				TakingDamageUpdate();
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

		if (Input.GetKeyDown(KeyCode.B)) 
		{
			CheckForDamage();
		}


	}

	void AttackingUpdate() {
		if (prey == null) {
			Debug.Log("ERROR: prey is null during attack");
			Reset();
			return;
		}

		Vector2 preyPos = prey.transform.position;
		Vector2 enemyPos = transform.position;

		lerpTimer += Time.deltaTime;
		float time = lerpTimer/lerpDuration;
		targetRadius = Vector2.Distance(Vector2.zero, preyPos);
		targetAngle = Mathf.Rad2Deg * Mathf.Atan2(preyPos.y, preyPos.x);

		if (Mathf.Abs(targetAngle - startAngle) > 180f) {
			if (targetAngle > startAngle) {
				targetAngle -= 360f;
			} else {
				startAngle -= 360f;
			}
		}

		// Debug.Log("starting: " + startAngle + " attacking: " + targetAngle);
		SmoothMove(startRadius, targetRadius, startAngle, targetAngle, time);

		if (time >= 1f) {
			//Destroy(prey.gameObject);
			prey.gameObject.GetComponentInChildren<Tail>().GoDieWithNewDuration(0.2f);
			prey = null;

			Reset();
		}
		enemyAnimation.setTargetAngle (currentAngle);
		enemyAnimation.setEnemyAnimation (EnemyAnimationScript.EnemyAnimation.attackAnimation);
	}

	void ResettingUpdate() {
		lerpTimer += Time.deltaTime;
		float time = lerpTimer/lerpDuration;
		SmoothMove(startRadius, targetRadius, startAngle, targetAngle, time);
		if (time >= 1f) {
			Hunt();
		}
	}

	void DyingUpdate() {
		lerpTimer += Time.deltaTime;
		float time = lerpTimer/lerpDuration;
		SmoothMove(startRadius, targetRadius, startAngle, targetAngle, time);
		if (time >= 1f) {

			nextState = EnemyState.Sleeping;
			startRadius = sleepingRadius;
			startAngle = Random.Range(0f, 360f);
			Quaternion degrees = Quaternion.Euler(0, 0, startAngle);
			Vector3 unrotatedStart = new Vector3(sleepingRadius, 0, zPosition);
			transform.position = degrees * unrotatedStart;

			float sleepTime = Random.Range(sleepTimeRange.x, sleepTimeRange.y);
			
			Invoke("WakeUp", sleepTime);
			Debug.Log("enemy rebirth");

			//enemyAnimation.setSleepTime (sleepTime);
			//enemyAnimation.setEnemyAnimation (EnemyAnimationScript.EnemyAnimation.resetAnimation);
			
		}
	}

	void HuntingUpdate() {
		/*
		* finding fishes with slow lookup until a constantly maintined
		* collection of fishes is implimeneted
		*/
		//FishScript[] fishes = FindObjectsOfType(typeof(FishScript)) as FishScript[];
		//enemyAnimation.setEnemyAnimation(EnemyAnimationScript.EnemyAnimation.huntAnimation);

		
		Entity[] fishes = Pond.Instance.GetEntitiesOfType(EntityType.Fish).ToArray();

		Vector2 pos = transform.position;
		float enemyRads = Mathf.Atan2(pos.y, pos.x);

		for (int i = 0; i < fishes.Length; i++) {
			Vector2 fishPos = fishes[i].transform.position;
			float distance = Vector2.Distance(fishPos, pos);
			if (distance <= attackRange) {
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

				if (watchingRect.Contains(adjFish) && fishes[i].gameObject.GetComponent<Fish>().Health>0f) {
					Attack(fishes[i]);
					break;
				}
			}
		}
		//CheckForDamage();


	}

	void RepositioningUpdate() {
		lerpTimer += Time.deltaTime;
		float time = lerpTimer/lerpDuration;

		SmoothMove(currentRadius, currentRadius, startAngle, targetAngle, time);
		if (time <= 0.2f) {
			float t = time / 0.2f;
			SmoothMove(huntingRadius, movingRadius, currentAngle, currentAngle, t);
		} else if (time >= 0.8f) {
			float t = (time - 0.8f) / 0.2f;
			SmoothMove(movingRadius, huntingRadius, currentAngle, currentAngle, t);
		}

		if (time >= 1f) {
			Hunt();
		}

		enemyAnimation.setTargetAngle (currentAngle);
		enemyAnimation.setEnemyAnimation (EnemyAnimationScript.EnemyAnimation.repositionAnimation);
		
		CheckForDamage();

	}

	void TakingDamageUpdate() {
		Debug.Log("Ow"+ currentHealth);
		lerpTimer += Time.deltaTime;
		float time = lerpTimer/lerpDuration;
		SmoothMove(startRadius, targetRadius, startAngle, targetAngle, time);
		if (time >= 1f) {
			Hunt();
		}
	}
	
	void WakingUpUpdate() {
		enemyAnimation.setEnemyAnimation(EnemyAnimationScript.EnemyAnimation.huntAnimation);

		lerpTimer += Time.deltaTime;
		float time = lerpTimer/lerpDuration;
		SmoothMove(sleepingRadius, huntingRadius, startAngle, targetAngle, time);
		if (time >= 1f) {
			Hunt();
		}
	}

	/*
	* lerp towards targetRadius & targetAngle
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

	public void CheckForDamage() {

			enemyAnimation.setEnemyAnimation(EnemyAnimationScript.EnemyAnimation.destroryAnimation);
			currentHealth--;
			Debug.Log("DYING");
			if (currentHealth <= 0) {
				nextState = EnemyState.Dying;

				targetRadius = sleepingRadius;
				Vector2 pos = transform.position;
				startRadius = Vector2.Distance(Vector2.zero, pos);
				// startAngle = Mathf.Atan2(pos.y, pos.x);
				startAngle = currentAngle;
				targetAngle = startAngle;

				lerpDuration = wakingUpTime;
				lerpTimer = 0f;

				CancelInvoke("Reposition");
			} else {
				nextState = EnemyState.TakingDamage;
				CancelInvoke("Reposition");

				startRadius = currentRadius;
				startAngle = currentAngle;
				targetRadius = huntingRadius;
				targetAngle = currentAngle;

				lerpDuration = 1f;
				lerpTimer = 0f;
			}

	}



	public void Reset() {
		nextState = EnemyState.Resetting;

		Vector2 pos = transform.position;
		startAngle = Mathf.Rad2Deg * Mathf.Atan2(pos.y, pos.x);
		targetAngle = startAngle;
		startRadius = Vector2.Distance(Vector2.zero, pos);
		targetRadius = huntingRadius;
		float returnDistance = targetRadius - startRadius;

		lerpDuration = Mathf.Abs(returnDistance/(attackSpeed * 0.25f));
		lerpTimer = 0f;
	}

	public void Hunt() {
		nextState = EnemyState.Hunting;

		// startAngle = targetAngle;
		// startRadius = targetRadius;

		// if (startAngle > 360f) {
		// 	startAngle -= 360f;
		// } else if (startAngle < 0f) {
		// 	startAngle += 360f;
		// }

		float t = Random.Range(gapBetweenMoves.x, gapBetweenMoves.y);
		Invoke("Reposition", t);
	}

	public void Attack(Entity target) {
		prey = target;

		float distance = Vector2.Distance(prey.transform.position, transform.position);

		startRadius = currentRadius;
		startAngle = currentAngle;
		lerpTimer = 0f;
		lerpDuration = distance/attackSpeed;
		nextState = EnemyState.Attacking;
		CancelInvoke("Reposition");
	}

	public void Reposition() {
		CancelInvoke("Reposition");
		nextState = EnemyState.Repositioning;

		float angle = Random.Range(moveRange.x, moveRange.y);
		angle *= (Random.Range(0, 2) == 0) ? -1 : 1;

		startAngle = currentAngle;
		startRadius = currentHealth;
		targetRadius = huntingRadius;
		targetAngle = startAngle + angle;

		lerpDuration = Mathf.Abs(angle) / moveSpeed;
		lerpTimer = 0f;
	}

	public void WakeUp() {
		CancelInvoke("WakeUp");
		state = EnemyState.WakingUp;

		targetRadius = huntingRadius;
		targetAngle = startAngle;	

		currentHealth = health;

		lerpTimer = 0;
		lerpDuration = wakingUpTime;
	}

	public float GetSpawnStatus() {
		if (state == EnemyState.WakingUp) {
			return lerpTimer/lerpDuration;
		} else if (state == EnemyState.Sleeping) {
			return 0f;
		} else if (state == EnemyState.Dying) {
			return 1f - lerpTimer/lerpDuration;
		}
		return 1f;
	}
}
