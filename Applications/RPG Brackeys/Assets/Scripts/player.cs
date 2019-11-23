using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour {

    /// <summary>
    /// The Player's movement speed
    /// </summary>
    [SerializeField]
    private float speed = 1; // when a variable is private, only the player/entity it is assigned to can access it

    /// <summary>
    /// The Player's direction
    /// </summary>
    private Vector2 direction;



	// Update is called once per frame
	void Update ()
    {
        //Executes the GetInput function
        GetInput();

        //Executes the Move function
        Move();
	}

    /// <summary>
    /// Moves the player
    /// </summary>
    public void Move()
    {
        //Makes sure that the player moves
        transform.Translate(direction*speed*Time.deltaTime); // the entity will move at the same speed on all devices (not dependant on FPS)
    }

    /// <summary>
    /// Listen's to the players input
    /// </summary>
    private void GetInput()
    {
        direction = Vector2.zero;

        if (Input.GetKey(KeyCode.W))
        {
            direction += Vector2.up;
        }
        if (Input.GetKey(KeyCode.A)) // If "A" key is pressed, move to the left (line 52) - this follows for everything in this "private void GetInput()" at line 42
        {
            direction += Vector2.left;
        }
        if (Input.GetKey(KeyCode.S))
        {
            direction += Vector2.down;
        }
        if (Input.GetKey(KeyCode.D))
        {
            direction += Vector2.right;
        }
    }
}
