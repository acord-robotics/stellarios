---
description: >
  This chapter explores adding energy/health bars and attributes to a Unity project
hide_description: true
---

The maximum value for health and mana (100 and 50, respectively) needs to be set from the `Player.cs` script, rather than the `Stat.cs` script.
We remove `MyMaxValue = 100;` from `Stat.cs`: 

```cs
   // Use this for initialization
   void Start ()
   {
      MyMaxValue = 100;
      content = GetComponent<Image>();
   }
```

and we put in in `Player.cs`:

Create a function called `Initialize` in `Stat.cs`: 

```cs
   public void Initialize(float currentValue, float maxValue) // This function takes the following parameters
   {
      MyMaxValue = maxValue; 
      MyCurrentValue = currentValue;
   }
```

^^ Breaking it down:
* `MyMaxValue = maxValue;` --> this is because the maximum values for `health` and `mana` are different, so we create a variable that is dependant to save from having to create separate functions
* `MyCurrentValue = currentValue;` --> `currentValue` is a `private float` and refers to the current value for the health or mana. `MyCurrentValue` is a `public float` and is the property for setting the current value, which has to be used every time the value is updated:

```cs
/// <summary>
    /// Proprty for setting the current value, this has to be used every time we change the currentValue, so that everything updates correctly
    /// </summary>
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
            else //Makes sure that we set the current value within the bounds of 0 to max health
            {
                currentValue = value;
            }

            //Calculates the currentFill, so that we can lerp
            currentFill = currentValue / MyMaxValue;
        }
    }
```
(cont)
* Because it is a public float, it is therefore accessible from other scripts, functions and objects, however it cannot be set outside of the function
* Our max and current values are now set, so when the game starts the initialized values are correct

`Character.cs`

```cs
protected virtual void Start ()
{
   animator = GetComponent<Animator>();
}
```

`Player.cs`

```cs
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// This is the player script, it contains functionality that is specific to the Player
/// </summary>
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

You would then set this value in the inspector of the `Player` gameObject in the Unity Game Engine, however this is not needed since we are using `private float initHealth = 100;`

Clickup: CU-22y5uj
Now at 26:48 with above conditions
