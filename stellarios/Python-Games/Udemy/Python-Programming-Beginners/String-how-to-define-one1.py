# What is a string & how to define one

# Strings
# Any character in single ('') or double ("") quotes is part of a string
# Stored as a series of characters

myString = "String"
# Index values
    # Since the string variable is stored as a series of characters, each character in the string has a different index value
    # In the case of the variable "myString", which has 6 characters (S,t,r,i,n,g), there are 6 index values
    # 'S' has the index value of 0. 'g' has the index value of 5
myString[3] # This asks the terminal to display the character in the variable "myString" that has the index value of '3', or the fourth character. In this case it is "i"   

    # Negative index - starts counting from the end of the string, beginning with '1'

# Escaping
    # Using single quotes in a variable name as well as to define the variable    
escapeString = 'Liam\'s Awesome' # The backslash makes the console ignore the character after the backslash

# Adding variables into strings
myAge = 16
iAmYearsOld = "I am " + myAge + " years old."
print("I am " + myAge + " years old.")
    # This can also be done with the .format function:
print("I am {} years old".format(myAge))  

# Modifying strings
firstTime = "this is the first value of this variable"
firstTime = "this is the second value of this variable"