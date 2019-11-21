# Impractical Python Projects - Lee Vaughn

# Importing libraries


import sys, random # imports these libraries (same with line 4,5 for pygame), allows this program to run. # Sys is used to redirect the output to the error channel

"""
# Pseudocode
Load list of firstNames (tuple = firstNames)
Load list of lastNames (tuple = lastNames)
Choose a first name at random (import random)
Assign that f.name to a variable (yourFirstName)
Choose a last name at random
Assign that l.name to a variable (yourLastName)
Print/Output both variables (yourFirstName + yourLastName)
Play again (main game loop)
"""
# Initializing variables
firstNames = ("Liam", "Hellen", "Ross", "Carly", "Elsie", "Kaiyo", "Hoot", "Gilbert", "Scrooby")
lastNames = ("Arbuckle", "Townsend", "Terrier", "Win", "Mr Owl", "Mr Bear", "Mc Scroobus")

# Game Loop
while True:
    yourFirstName = random.choice(firstNames)

    yourLastName = random.choice(lastNames)

    print("\n\n")
    print("{} {}".formate(yourFirstName, yourLastName), file-sys.stderr)
    print("\n\n")

    try_again = input("\n\nTry again? (Press Enter else n to quit)\n ") # Exit loop (lines 33-37)
    if try_again.lower() == "n":
        break

    input("\nPress Enter to exit. ")