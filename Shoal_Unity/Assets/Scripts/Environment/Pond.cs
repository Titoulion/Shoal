using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using System.Collections;

public class Pond : SingletonMonoBehaviour<Pond>
{
    [SerializeField] private float radius;

    public float Radius { get { return radius; } }

    private List<Entity> entities = new List<Entity>();

    public IEnumerable<Entity> Entities { get { return entities; } }

    public void RegisterEntity(Entity entity)
    {
        entities.Add(entity);
    }

    public void RemoveEntity(Entity entity)
    {
        entities.Remove(entity);
    }

    public IEnumerable<Entity> GetEntitiesOfType(EntityType type)
    {
        return entities.Where(entity => entity.Type == type);
    }
}
