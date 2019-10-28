using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rotator : MonoBehaviour {

    // Update is called once per frame
    void Update() // Since we are not using forces, Update can be used, rather than fixed update
    {
        transform.Rotate (new Vector3(15, 30, 45) * Time.deltaTime); // Time.deltatime makes the rotation fluid.            There are 2 main ways to affect transform - 'translate' and 'rotate'. 'Rotate' rotates the object by its transform, while 'translate' translates - moves - the object by its transform. We'll be using 'rotate' to make the 'pick up' object stand out more.
    } // we need to turn the "Pick up" game object into a Prefab. A prefab is an asset that contains a blueprint of a game object, or game object family.
}
