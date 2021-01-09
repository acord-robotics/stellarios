# Pong - Trevor Appleton
# http://trevorappleton.blogspot.com/2014/04/writing-pong-using-python-and-pygame.html

"""
CONTENTS:
Line 9: Creating a blank screen
"""

# Creating a blank screen

import pygame, sys # imports the pygame library & sys
"""
Import pygame - pygame libraries, for python applications. pygame draws directly onto the screen/display (variable: displaysurf)
import sys - sys libraries, used to exit the game
import pygame, sys can be done on separate lines
"""
from pygame import pygame

# Number of Frames/Second
FPS = 200

# Global Variables
    # Window Size
WINDOWWIDTH = 400    
WINDOWHEIGHT = 300
LINETHICKNESS = 10 # used to determine the thickness of lines throughout the entire program
PADDLESIZE = 50 # length of the paddle
PADDLEOFFSET = 20 # how far the paddle is away from the edge of the screen

# Colour Set up
BLACK     = (0  ,0  ,0  )
WHITE     = (255   ,255   ,255   )

# Drawing the game arena
def drawArena(): # defines the function name, empty brackets = nothing passed into function
    DISPLAYSURF.fill((0,0,0)) # fills the arena with the colour 0,0,0 (hex/rgb) - white
    # Outline of Arena
    pygame.draw.rect(DISPLAYSURF, WHITE, ((0,0)(WINDOWWIDTH,WINDOWHEIGHT)), LINETHICKNESS*2) # uses pygame to draw the arena with these instructions - white for the outlines based on the coords of WINDOWHEIGHT, WINDOWWIDTH
    # Draw Centre Line
    pygame.draw.rect(DISPLAYSURF, WHITE, ((WINDOWWIDTH/2),0),((WINDOWWIDTH/2),WINDOWHEIGHT), (LINETHICKNESS/4))

# Drawing the Paddles
#  

# Main Function
def main():
    pygame.init # Initialize pygame
    global DISPLAYSURF # display surface

    FPSCLOCK = pygame.time.Clock() # this means that the clock will run at the value that we set in the variable FPS (see line 43)
    DISPLAYSURF = pygame.display.set_mode((WINDOWWIDTH,WINDOWHEIGHT)) # set the size of the display, or window, to the values set in "WINDOWHEIGHT", "WINDOWWIDTH"
    pygame.display.set_caption('Pong by ACORD') # Setting the caption, or title, of the window

    # Setting starting positions for ball and for paddles
    ballX = WINDOWWIDTH/2 - LINETHICKNESS/2
    ballY = WINDOWWIDTH/2 - LINETHICKNESS/2 # placing the ball position at the centre of the ball
    playerOnePosition = (WINDOWHEIGHT - PADDLESIZE) /2
    playerTwoPosition = (WINDOWHEIGHT - PADDLESIZE) /2

    # Creating rectangles for the ball & paddles
    paddle1 = pygame.Rect(PADDLEOFFSET,playerOnePosition, LINETHICKNESS,PADDLESIZE) # using pygame to draw the rectangle for Player 1's paddle
    paddle2 = pygame.Rect(WINDOWWIDTH - PADDLEOFFSET - LINETHICKNESS, playerTwoPosition, LINETHICKNESS,PADDLESIZE)
    ball = pygame.Rect(ballX, ballY, LINETHICKNESS, LINETHICKNESS) # using pygame to draw a rectangle - the ball
    

    # Drawing the Arena - also in time loop (while true)
    drawArena() # arena remains the same throughout the game
    drawPaddle(paddle1)
    drawPaddle(paddle2)
    drawBall(ball)



    while true: # main game loop. It keeps running until the game ends
        for event in pygame.event.get():
            if event.type == QUIT: # set what happens if the "quit" event is triggered
                pygame.quit()
                sys.exit()

        drawArena() # arena remains the same throughout the game
        drawPaddle(paddle1)
        drawPaddle(paddle2)
        drawBall(ball)       

        pygame.display.update() # asking the screen to update (for example if something is drawn it won't? show unless the screen is updated)
        FPSCLOCK.tick(FPS) # see line 39

if __name__=='__main__': # calling in the main function (line 36)
    main()                