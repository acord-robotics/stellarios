#!/usr/bin/env python
import time # // imports time module, which allows things like time.sleep (wait), etc
import rospy
import pygame # why not - for mini-screen, this will need to be in the scripts for the actual game/app files as well for Stellarios
from osr_msgs.msg import Status 
from screen import LedScreen

screen = LedScreen() # https://www.fullstackpython.com/screen.html // Sets the value of the screen to the LedScreen (see https://www.tapatalk.com/groups/jpl_opensource_rover/ucp.php?i=pm&mode=view&f=0&p=175 when you log into the ACoRD tapatalk)

"""
Terminal multiplexer - line 8 (screen = LedScreen() # provides separation between where a shell is running and where the shell is accessed (similar to the image that is seen in the above link)
"""

def callback(data):
	#rospy.loginfo(data)
	#send usb-> ttl serial commands
	screen.build_msg(1,data.battery,data.error_status,data.temp,data.current)
	screen.check_for_afffirm()

def shutdown():
	screen.transistion_to_idle() # transitions screen (in this case LedScreen, see line 8/11) to blank, or idle, if shutdown function is initiated. See the android app repository
	return 0

if __name__ == "__main__": # main loop

	rospy.init_node("led_screen") # // Starts led_screen when main loop/function is initiated
	rospy.loginfo("Starting the led_screen node")
	rospy.on_shutdown(shutdown) # upon shutdown function being initiated (see lines 20-22)
	sub = rospy.Subscriber("/status", Status, callback)
	rospy.spin()
