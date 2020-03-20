---
title: Saving progress in Unity
description: >
  How we save the player's progress & settings in Manacaster
comments: true
hide_description: false
---

# Development Notes

# Goal
We want to be able to learn how to create and load save files in Unity, on all devices. We also want to, eventually, be able to save the game to the cloud. For now (as of original time of publishing) I just want to be able to save the game first.

# Content

## Key Concepts

**Player Prefs** 
* Special caching system
* Keeps track of the settings for the player between game sessions
* Should only be used for keeping track of simple things like:
  * Graphics
  * Sound settings
  * Login info
  * Basic user-related data (like cloud saving accounts)

**Serialization**
* Conversion of an object into a stream of bytes:

![](https://koenig-media.raywenderlich.com/uploads/2017/06/SerializationIllustration.png)

*Objects*
* An object does not just refer to the "game objects" in a scene
* An object is any script/file in Unity

> In fact, whenever you create a MonoBehaviour script, Unity uses serialization & deserialization to convert that file down to C++ code and then back to the C# code that you see in the inspector window. If you’ve ever added [SerializeField] to get something to appear in the inspector, you now have an idea of what’s going on.

(RayWenderlich)

* Serialization is essentially converting an object from *one form into another* --> *object into bytes*

**Deserialization**
* Conversion of a stream of bytes into an object

**JSON**:
* JavaScript Object Notation
* Format for sending & receiving data that is *language agnostic*:
  * aspects of programming that are independent of any specific programming language
* You can send *JSON representations* of objects to servers and let the server recreate a localized version (the representation can be a C# script/object that can't be read by a server running in PHP or Java)
* Converting to & from JSON: JSON serialization, JSON deserialization

> JSON is often used when data is sent from a server to a web page

(W3 Schools)

## Player Prefs
* 


# About
* **Author**: [Liam Arbuckle]({{ site.baseurl }}/profiles/gizmotronn)
* **Reference**: RayWenderlich
* **Topic**: Unity Administration
* **Date**: 20th March 2020
* **Last Edited**: 20th March 2020

## What next?
Learn how to implement a spaceship and a movement script in Unity.

Github.com/Acord-Robotics/Stellarios/Tree/Gh-Pages/development-notes-savingprogressinunity.md

{% include utterances.html %}

{% include jointcomments.html %}
