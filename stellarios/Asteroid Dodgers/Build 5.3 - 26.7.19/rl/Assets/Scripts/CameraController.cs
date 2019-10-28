using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour {

    public GameObject player;

    private Vector3 offset;  // Private because we set this offset in the script. Take the CURRENT transform position of the camera and subtract the CURRENT transform position of the player

    // Start is called before the first frame update
    void Start() {
        offset = transform.position - player.transform.position; // See line 9. The object PLAYER has been inserted into the game object Directional Camera in the Camera Controller (Script) Section        
    }

    // Update is called once per frame. Each update we can track the position of the Player Game Object, this means we can then set the position of the camera. However, for "Follow Cameras" it is best to use "LateUpdate" rather than "Update" (see below variable)
    void LateUpdate() { // It is guaranteed to run after all OBJECTS have been processed after "update". When setting the position of the camera, we know that the player has moved for that frame.
    transform.position = player.transform.position + offset; // after the player object moves, the camera is aligned into a new position, like it is a child of the PLAYER object. This fixes the "rolling" phenomenom seen if it really was a child of the player.
    }
}
