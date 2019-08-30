---
title: Arduino Repository
image: /assets/img/rasppi.jpg
description: On the Stellarios repository, we have a branch called "Arduino" which is for all our Arduino & Raspberry Pi project (for example the Open Source Rover). We have created another repository to house the documentation. This is located at [Github/Acord-Robotics/Arduino-Stellarios](http://github.com/acord-robotics/arduino-stellarios). The documentation is also located in the Arduino branch, however we created this site for easier documentation.
published: true
---

## Welcome to ACORD/Arduino

This repository is part of [Github/Acord-Robotics/Stellarios](http://github.com/acord-robotics/stellarios).
Stellarios is a suite of software developed by ACORD, an Australian 
Robotics & Science Development company. Stellarios includes a number
of games, including Asteroid Dodgers. It also includes cool robots and 
hard/software designed for use in science experiments and missions.



## Projects?

There are a number of awesome projects that we’re working on that use Arduino & Raspberry Pi. One of these is a [“fork”](http://github.com/acord-robotics/open-source-rover) of [NASA’s Open Source Rover](http://github.com/nasa-jpl/open-source-rover).

```python
#!/usr/bin/env python
import rospy
import time
import math

class Robot():
	'''
	Robot class contains all the math and motor control algorithms to move the rover
	In order to call command the robot the only method necessary is the sendCommands() method
	with drive velocity and turning amount
	'''
	def __init__(self):
		distances = rospy.get_param('mech_dist','7.254,10.5,10.5,10.073').split(",")
		self.d1 = float(distances[0])
		self.d2 = float(distances[1])
		self.d3 = float(distances[2])
		self.d4 = float(distances[3])

```

Currently the fork of Open Source Rover is our only Arduino project 
which is part of Stellarios, however that doesn’t mean it will be the 
last!