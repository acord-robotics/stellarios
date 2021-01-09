"" "
This is a classic "roll the dice" program. 

We will be using the random module for this,since we want to randomize the numberswe get from the dice. 

We set two variables (min and max) , lowest and highest number of the dice. 

We then use a while loop, so that the user can roll the dice again. 

The roll_again can be set to any value, but here it's set to "yes" or "y", 
but you can also add other variations to it. 

From https://www.pythonforbeginners.com/code-snippets-source-code/game-rolling-the-dice
"" "

import random # imports the "random" function
min = 1 # sets the minimum value to an integer value of "1", called "min"
max = 6 # sets the maximum value to an integer value of "6", called "max"

roll_again = "yes" # If the user inputs "yes" into the console, then the script beliw (lines 22-28) replays

while roll_again == "yes" or roll_again == "y":
    print "Rolling the dices..." # prints "Rolling the dices" to the console
    print "The values are...." # prints "The values are" to the console
    print random.randint(min, max) # prints 2 random numbers within the values of min, max to the console
    print random.randint(min, max)

    roll_again = raw_input("Roll the dices again?")

# My take on this script - with time function    
import random # imports the "random" function
import time # imports the "time" function
min = 1 # sets the minimum value to an integer value of "1", called "min"
max = 6 # sets the maximum value to an integer value of "6", called "max"

roll_again = "yes" # If the user inputs "yes" into the console, then the script beliw (lines 22-28) replays

while roll_again == "yes" or roll_again == "y":
    print "Rolling the dices..." # prints "Rolling the dices" to the console
    time.sleep(2) # waits 2 seconds before doing the next command on the console
    print "The values are...." # prints "The values are" to the console
    time.sleep(2) # same as line 40
    print random.randint(min, max) # prints 2 random numbers within the values of min, max to the console
    print random.randint(min, max)

    roll_again = raw_input("Roll the dices again?")