using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// This is an abstract class that all characters needs to inherit from
/// </summary>
public abstract class Character : MonoBehaviour {

    /// <summary>
    /// The Player's movement speed
    /// </summary>
    [SerializeField]
    private float speed;

    private Animator animator;

    /// <summary>
    /// The Player's direction
    /// </summary>
    protected Vector2 direction;

    // Use this for initialization
    void Start () {
        animator = GetComponent<Animator>();
	}
	
	/// <summary>
    /// Update is marked as virtual, so that we can override it in the subclasses
    /// </summary>
	protected virtual void Update ()
    {
        Move();
	}

    /// <summary>
    /// Moves the player
    /// </summary>
    public void Move()
    {
        //Makes sure that the player moves
        transform.Translate(direction * speed * Time.deltaTime);

        if (direction.x !=0 || direction.y !=0)
        {
            //Animate's the Player's movement
        AnimateMovement(direction);
        }
        else
        {
            // If not moving
            animator.SetLayerWeight(1, 0);
        }

        
    }

    /// <summary>
    /// Makes the player animate in the correct direction
    /// </summary>
    /// <param name="direction"></param>
    public void AnimateMovement(Vector2 direction)
    {
        animator.SetLayerWeight(1, 1); // first 1 is layer (index), second 1 is weight

        //Sets the animation parameter so that he faces the correct direction
        animator.SetFloat("x", direction.x);
        animator.SetFloat("y", direction.y);
    }
}
