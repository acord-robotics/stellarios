---
description: >
  This chapter explores adding energy/health bars and attributes to a Unity project
hide_description: false
---

### Prevent character from having a value too large/too small

Add this snippet just below where you define variables in the script `Stat.cs`:

```cs

 public float MyCurrentValue
    {
        get
        {

            return currentValue;
        }

        set
        {
            if (value > MyMaxValue)//Makes sure that we don't get too much health
            {
                currentValue = MyMaxValue;
            }
            else if (value < 0) //Makes sure that we don't get health below 0
            {
                currentValue = 0;
            }
            else //Makes sure that we set the current value withing the bounds of 0 to max health
            {
                currentValue = value;
            }

            //Calculates the currentFill, so that we can lerp
            currentFill = currentValue / MyMaxValue;
        }
    }
```
    
   If we set the health (manually in the stat.cs script) to -50,000, the Debug.Log(MyCurrentValue); (this is for Health) would be set to 0, similarly, if the health was set to 50,000, the `Debug.Log(MyCurrentValue);` would set to 100, as that is the maximum defined value.
   
   To test this out, we can then set the value of health (or mana, but let's use health in this example) to something outside the defined limits (currently 0-100 for health):
   
   File: `player.cs`
   ```cs
   protected override void Update () {
   // Executes the GetInput function
  GetInput();
  health.myCurrentValue = testValue;
  base.Update();
}
```

### Add health and mana to the player game object

`Player.cs`

```cs
public class Player : Character
{
    /// <summary>
    /// The player's health
    /// </summary>
    [SerializeField]
    private Stat health;

    /// <summary>
    /// The player's mana
    /// </summary>
    [SerializeField]
    private Stat mana;
```


 By doing this ^^ we reference the health and mana objects in the Player game object, thus opening up a field to drag them in via the inspector. However, before doing this we must first initalize the values of health and mana:
 
 `Player.cs`
 
 
 ```cs
     /// <summary>
    /// The player's initialHealth
    /// </summary>
    private float initHealth = 100;

    /// <summary>
    /// The player's initial mana
    /// </summary>
    private float initMana = 50;

    protected override void Start()
    {

        health.Initialize(initHealth, initHealth);
        mana.Initialize(initMana, initMana);

        base.Start();
    }
```

    
![](https://user-images.githubusercontent.com/31812229/89854958-d82ca200-dbc7-11ea-955a-dbb078e12f94.png)

Finally, test it out by temporarily assigning a keybinding to modify the values of health and mana in the file `Player.cs`:

```cs
        base.Update();
    }

    /// <summary>
    /// Listen's to the players input
    /// </summary>
    private void GetInput()
    {
        direction = Vector2.zero;

        ///THIS IS USED FOR DEBUGGING ONLY
        ///
        if (Input.GetKeyDown(KeyCode.I))
        {
            health.MyCurrentValue -= 10;
            mana.MyCurrentValue -= 10;
        }
        if (Input.GetKeyDown(KeyCode.O))
        {
            health.MyCurrentValue += 10;
            mana.MyCurrentValue += 10;
        }
        
