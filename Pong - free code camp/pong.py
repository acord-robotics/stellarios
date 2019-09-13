# Simple Pong Game for Beginners
# Youtube: https://www.youtube.com/watch?v=C6jJg9Zan7w
# Part of Stellarios by ACORD - http://acord.tech/stellarios

import turtle # module that lets you do basic graphics in Python

wn = turtle.Screen() # creates a variable called "wn" that is the game windows
wn.title("Pong by ACORD") # sets the title that would appear on the window
wn.bgcolor("black") # sets the game window bg color
wn.setup(width=800, height=600) # sets the game window size
wn.tracer(0) # stops the window from updating



# Main Game Loop
while True:
    wn.update() # every time the loop runs, it updates the screen