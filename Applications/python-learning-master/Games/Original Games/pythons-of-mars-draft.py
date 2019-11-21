# Pythons of Mars - Original text-based Python Game by L.Arbuckle, CEO of Orgzy Design & Chairman of ACORD Robotics
# Pythons of Mars is a Stellarios game and was first released with the Stellarios 0.3 "Australian Terrier" Release


# Importing assets/functions
import pygame
from pygame import pygame

import time # this will be one of the most important functions that we import, it allows the delaying of messages based on certain criteria

pygame.init() # initializes pygame

# Game Display/Arena
display_width = 800
display_height = 600

gameDisplay = pygame.display.set_mode((display_width,display_height)) # sets the paramaters/values for the display/game Arena to be the values from the variables inside the double brackets
pygame.display.pygame.display.set_caption('Pythons of Mars', icontitle=None) # sets caption for window

clock = pygame.time.Clock()

# Game Colours
black = (0,0,0)
white = (255,255,255)