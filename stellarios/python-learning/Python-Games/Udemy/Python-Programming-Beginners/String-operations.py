# String Operations

# string.upper()
string = "this is a string" # sets the value of the variable "string", which is a string variable, to "this is a string"
string.upper() # prints the value of the variable "string", however all in uppercase. E.g. 'THIS IS A STRING'

# string.lower
string.lower() # converts the value of a string to all lower case values

# Replacement Operation
string.replace("string", "string variable") # replaces the "string" in "this is a string" (the variable named string, which is a string variable) with "string variable"

# Slice Operation
string[0:4] # Uses index values to "slice" the value, which means that instead of printing "this is a string" when the "string" variable is called upon, it displays the first 5 (4) characters - "this "

# Length Operation
len(string) # prints how many index numbers/characters are in the string (13 letters + 3 spaces = 16 characters)

# Exercise problems for String Operations from udemy
# https://www.udemy.com/course/python-programming-beginners/learn/lecture/6727864?start=0#overview

# Easy - write a program to create a string “Python programming is easy”
string = "Python programming is easy"

# Medium - Now slice the first string and store “easy” in the second string
sliced = string[22:26]
print(sliced)

# Hard - Replace “easy” in the second string with “ and powerful” and concatenate both the strings
replaced = sliced.replace("easy", " and powerful")
slicedText = slicedText.replace('easy',' and powerful')