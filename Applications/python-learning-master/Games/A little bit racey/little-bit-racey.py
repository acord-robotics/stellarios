import pygame # importing pygame

pygame.init()

gameDisplay = pygame.display.set_mode((800,600)) # defining how big the game window is; also known as surface or canvas
pygame.display.set_caption('A bit Racey')

clock = pygame.time.Clock() # to keep track of the time in the game

crashed = False

while not crashed:

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            crashed = True

        print(event)

    pygame.display.update()
    clock.tick(60) # This will run until the game crashes

# Quitting
pygame.quit()
quit()
