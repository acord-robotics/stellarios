# 20 - Applications: Conditions
# Lecture Link: https://www.udemy.com/course/python-masterclass-for-beginners/learn/lecture/13270034#content

# Application
print("Enter Number: ")
number = int(input()) # need to change the data type from string to int

# Loop & Ifs
    # For neg input
if number < 0: # need to remember the :
    print("Number (" + str(number) + ") is negative") # I've added to this function with the variable being inserted into the print string
elif number == 0:
    print("Number (" + str(number) + ") is exactly 0") # convert number variable to string (this is the same for the other parts of this loop/if)
else: # only activates if input is positive
    print("Number (" + str(number) + ") is positive")    

# Here's another way of doing it:    
# Application
print("Enter Number: ")
number = int(input()) # need to change the data type from string to int

# Loop & Ifs
    # For neg input
if number < 0: # need to remember the :
    print("Number (" + str(number) + ") is negative") # I've added to this function with the variable being inserted into the print string
elif number == 0:
    print("Number (" + str(number) + ") is exactly 0") # convert number variable to string (this is the same for the other parts of this loop/if)
elif number > 0:
    print("Number (" + str(number) + ") is positive")  