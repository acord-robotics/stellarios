!#/usr/bin/python3

# 1 - Import library
import pygame # Importing the pygame library
from pygame.locals import *

# 2 - Initialize the game
pygame.init() # intitialise the pygame library
width, height = 640, 480
screen=pygame.display.set_mode((width, height)) # setting up the game display window

# 3 - Load images
player = pygame.image.load("resources/images/dude.png") # loading the image for the "bunny"

# 4 - keep looping through
while 1: # everything from line 14 to line 27 will be looped through
    # 5 - clear the screen before drawing it again
    screen.fill(0) # filling the screen black
    # 6 - draw the screen elements
    screen.blit(player, (100,100)) # add player image ("bunny, dude.png") to x = 100, y = 100
    # 7 - update the screen
    pygame.display.flip()
    # 8 - loop through the events
    for event in pygame.event.get():
        # check if the event is the X button 
        if event.type==pygame.QUIT:
            # if it is quit the game
            pygame.quit() 
            exit(0) 