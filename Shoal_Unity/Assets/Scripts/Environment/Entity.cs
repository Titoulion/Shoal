using UnityEngine;

public abstract class Entity : MonoBehaviourBase
{
    [SerializeField] private float radius;

    public abstract EntityType Type { get; }

    public float Radius { get { return radius; } }

    protected Pond pond;
	bool goDestroy = false;

    protected virtual void Awake()
    {
        pond = Pond.Instance;
    }

    protected virtual void OnEnable()
    {
        pond.RegisterEntity(this);
    }

    protected virtual void OnDisable()
    {
        pond.RemoveEntity(this);
    }

    public void Eaten()
    {
		goDestroy = true;
    }

	void LateUpdate()
	{
		if(goDestroy)
			Destroy (this.gameObject);
	}
}
