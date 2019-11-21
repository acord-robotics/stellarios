# Logical Operators - Python
# Lecture link: https://www.udemy.com/course/python-masterclass-for-beginners/learn/lecture/13283724#content

# Setup - Pt 1
number1 = 10
number2 = 20

# Comparison Operators/Statements
equalto = number1 == number2 # True, or false - are these 2 variables equal?
print(equalto)
notequalto = number1 != number2 # same as variable "equalto" but instead it is determining if the 2 variables are different - not equal to
print(notequalto)
lessequal = number1 <= number2 # True
greaterequal = number1 >= number2 # False

# Setup - Pt 2
number3 = 10

# Logical Operators
logop1 = (number1 == number3) and (number2 >= number3) # 2 operations, both are true - LOGICAL Op - logOp1_n1=n3,n2>n3
# All operations have to be true in a logOp for the logOp to be true
logop2 = (number1 == number3) or (number2 == number3) # At least 1 expression has to be true for the main result to be true for the variable
logop3 = not number1 == number3 # Basically a reverse/flip op - true/false
