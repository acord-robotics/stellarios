# Planning for Star Sailors Single Player

### Note:
* This version of Star Sailors will be a 'lite' version. This means that there will be no multiplayer to begin with and there will be no huge features

## Resources
* [RPG Playground](http://rpgplayground.com/play/)
* [Free Code Camp](https://medium.freecodecamp.org/learning-javascript-by-making-a-game-4aca51ad9030)

# Roll-A-Ball version of Star Sailors
## Aim of the game
* You're in a spaceship
* You need to pick up "alien artifacts" and avoid being hit by asteroids while travelling through space

## Alien Artifacts?
* Each one will be different (visual) but will currently have the same code - Unity Prefab
* Different "families" for Miydlian, Keplernian, etc
* Different "species"

## The future
* Summon aliens using the artifacts
* Add infiniraid into it
* Package SS-Ball/Infiniraid into Stellarios

## Purposes
* Learn how to code
* Learn which language to use
* Plan what will be in the game

## What do we need?
### Inventory System
* The inventory system will be accessible to each user
* Players can pick up items, which will be stored in the inventory
* Users can send items to each other's inventory
* Users can craft items in the inventory - users will craft crafting modules to craft different things (see in What do we need\Crafting Modules)

### Crafting Modules
* Ship crafting module & ship part module
* Robot crafting module
* Tech crafting module
* Weapons & armour crafting module
* Building crafting module (pre-installed)

### Player stat system
* Players earn XP (See What do we need\XP System)

### XP
* Players earn 1 xp for each item they craft
* Players earn anywhere from 2 xp to 10 xp for each monster they kill (doesn't include bosses) (depending on difficulty - see in What do we need\Monsters)

### Saving system
* Autosave every 5-10 minutes
* Players can save the game manually in the esc menu

### Monsters
* Monsters have a difficulty from 1-5. This affects the amount of XP that will be given out upon death

## What is the point of the game?
* Based on the Star Sailors novella - acord.allianceofdroids.org.au
* Users witness their homeworld destroyed
* Users pick a species
* Users fly around on ships, landing on planets, exploring them, killing monsters and collecting items
* Users meet NPCs, who introduce them to the Midgard Legacy (sort of the galactic senate of Star Sailors)
* Users build up an arsenal of weapons (can enhance them using items/xp found on their journey)
* Users find their home planet, free it in an epic battle that has 3 parts - space, water and land
* After this primary mission is completed, users can create a colony and manage their colony
* Users can expand their colony, produce new buildings, go on mini-missions for their colony's citizens
* Extra optional bosses
* Users can create space stations, planets, etc
* Users can capture monsters/aliens
* Item frames
* Fossils to collect

## Drawing & Sprites
* [Game Icons](https://game-icons.net/)
* [Open Game Art](https://opengameart.org/)
* [CSS Sprite Generator](https://spritegen.website-performance.org/)

# Example code
## Player Controller
```c#
using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class scrPlayerController : MonoBehaviour
{

    public float speed; // Public floats will show up in the INSPECTOR as an editable property. Changes can be made to this variable in the Unity editor. We now have control over this variable inside the Unity editor, without having to recompile.
    public Text countText;
    public Text winText;

    private Rigidbody rb;
    private int count; // No access to this variable in the inspector, as it is private

    void Start()
    {
        rb = GetComponent<Rigidbody>(); // The rigidbody is a tool to make objects move in a realistic way using physics
        count = 0;
        SetCountText();
        winText.text = "";
    }

    void FixedUpdate()
    {
        float moveHorizontal = Input.GetAxis("Horizontal");
        float moveVertical = Input.GetAxis("Vertical");

        Vector3 movement = new Vector3(moveHorizontal, 0.0f, moveVertical);

        rb.AddForce(movement * speed); // part of the rigidbody, to make the object (in this case the ball) move faster or slower. To solve the issue of compiling over and over again whenever I change the speed, I'll create a new public variable on line 7
    }

    void OnTriggerEnter(Collider other) // On Trigger Enter detects a collision between game objects without creating a physical collision. It detects when the "player game object" first touches a "trigger collider". We are given a "reference" to the collider we have touched - "OTHER". This reference gives us a way to get hold of the colliders that we touch.
    {
        if (other.gameObject.CompareTag("Pick Up")) // The Pick Up tag needs to be declared in Unity    // Destroy(other.gameObject); With this code, when the player game object touches the "other collider", it will destroy the game object that the trigger is attached to, through the reference "other.gameObject". 
        {
            other.gameObject.SetActive(false);
            count = count + 1; // To display this score, we have created a "UI object - text" in the Unity editor. This also created a canvas and an event system in the hierachy.
            SetCountText();
        }

        if (other.gameObject.CompareTag("Asteroid")) // If colliding with a game object that has the tag "Asteroid"....
        {
            other.gameObject.SetActive(false); // The asteroid will be set to false (i.e. not visible)
            count = count - 1; // The player's score will decrease by 1
            SetCountText(); 
        }
    }

    void SetCountText()
    {
        countText.text = "Count: " + count.ToString();
        if (count >= 9) // This value of 9 was set before I added asteroids. Therefore I will add more "pick ups". You have to get a certain amount (currently 9) for the game to finish!
        {
            winText.text = "You Win!";
        }

        if (count < 0) // If the score becomes negative
        {
            winText.text = "You crashed! Game over!";
        }
    }
}/* Destroy(other.gameObject); - Pallete for deactivating the game object, draft code pallete
 * if (other.gameObject.CompareTag("Player"))
 * --> [single tab] gameObject.SetActive(false); */


// Troubleshooting:

/* Making cubes deactivate w/ rigidbody. 
* At this point in the script (https://gist.github.com/IrisDroidology/76a7819716a67531cc6bd6c003cfcd49/revisions#diff-8e1c866683af6bbf910bb66fedd7816b), the pick up object is not removed.
*  Any body with a collider and a rigidbody (body = gameObject) is dynamic. If there is no rigidbody, but a collider attached, the Unity editor expects the gameObject to be STATIC.
*  However, by just adding a rigidbody, the cubes fall through the platform, as they are affected by gravity. Because they are triggers, they DON'T collide with the floor.
*  In the rigidbody section of the inspector for the "Pick up" prefab, I can disable gravity, however the cubes are still affected by other physics forces.
*  A better way to solve the problem is to make the prefab a "kinematic rigidbody." It will not react to physics forces, but it can be animated and move by its TRANSFORM. 
* */
```
