 # Getting input
 # Lecture: https://www.udemy.com/course/python-masterclass-for-beginners/learn/lecture/13270018?start=0#overview

 # Starting off with input and variables:
msg = "What is your name? "
print(msg)
userName = input() # sets the input to the input variable from msg (line5)
print("Hello, " + userName)

#  This all works so far.....

print(type(userName)) # <class 'str'>
"""
# Regardless of the user input, the input is always a string
# String concatenation still works, however
"""