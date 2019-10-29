# First Application - Calculator
# Lecture: https://www.udemy.com/course/python-masterclass-for-beginners/learn/lecture/13282934#overview (#14)

# Defining two numbers for operations
print("Enter first number: ")
firstNumber = int(input())
print("Enter second number: ")
secondNumber = int(input()) # we can also use floats

# Operations
"""
print(firstNumber + secondNumber)
This will not work (line 12) as both input variables are a string type
"""
"""
For example, if I set the value of "firstNumber" to 1, and "secondNumber" to 2,
adding them together will produce 12
"""
"""
We need to turn the strings into integers:
print("Enter first number: ")
firstNumber = int(input())
print("Enter second number: ")
secondNumber = int(input())
"""

print(firstNumber " + " secondNumber " = " firstNumber + secondNumber) # addition
print(firstNumber * secondNumber) # multiplication
print(firstNumber / secondNumber) # division
print(firstNumber - secondNumber) # subtraction
print(firstNumber % secondNumber) # modulus