# Implementing Numbers
import time

# 2 types - integer, decimal (floating point)
integerNumber = 10
floatingNumber = 20.75

print(integerNumber) # prints the value of the integer variable called "integerNumber"
time.sleep(2) # makes the console wait for 2 seconds before completing the next task
print(floatingNumber) # prints the value of the floating number variable called "floatingNumber"

# Checking the variable type
print(type(floatingNumber)) # output: <class 'float'>

# Converting variable types
floatingNumber = int(floatingNumber)
print(type(floatingNumber))

print(floatingNumber) # typecasting ignores the floating part
# output is 20, as only the integer part of 20.75 is retained

# from https://www.udemy.com/course/python-programming-beginners/learn/lecture/6727836#overview 

# Questions
    # Easy
myInt = 25

    # Hard
myFloat = 25.77
myFloat  = int(myFloat)    
print(myFloat)