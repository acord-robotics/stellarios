# Integers
myint = 7 # this sets the value of "myint" to 7
print(myint) # this prints the value of "myint", in this case 7

# Floating point numbers
myfloat = 7.0 # this sets the value of "myfloat" to 7.0
print(myfloat) # this prints the value of "myfloat"
myfloat = float(7) # this sets the calue of "myfloat" to the float of "7", making it 7.0
print(myfloat) # this prints the value of "myfloat" - like with line 7

# Strings
# Example of String variable in Python
mystring = "This is a string"
print(mystring) # prints the variable of "mystring"

# Operators
string1 = "This is a string"
string2 = "that is half-complete"
print(string1 + string2) #prints the value of "string1" & "string2", in this case "This is a string""that is half-complete". Note that there is no space between string1 and string2

# Assignments
a, b = 3, 4 #this is 2 variables being set/defined at once
print(a,b) #this prints 34

# This does not work
hello = "hello"
myint = 7
myint2 = 8
print(myint + myint2 + hello) #this would return an error

# LearnPython.org Exercise for Variables & Types
# change this code
mystring = None
myfloat = None
myint = None

# testing code
# Exercise for variables-types

#original (need to edit):
if mystring == "hello":
    print("String: %s" % mystring)
if isinstance(myfloat, float) and myfloat == 10.0:
    print("Float: %f" % myfloat)
if isinstance(myint, int) and myint == 20:
    print("Integer: %d" % myint)

#edited version:    
mystring = "hello"
myfloat = 10.0
myint = 20

# testing code
if mystring == "hello":
    print("String: %s" % mystring)
if isinstance(myfloat, float) and myfloat == 10.0:
    print("Float: %f" % myfloat)
if isinstance(myint, int) and myint == 20:
    print("Integer: %d" % myint)

# in terms of line 8, you can either do line 8 or line 6 to declare a floating point variable

# Running this file (also see "running python" in the root directory)
# Right click in MS Visual Studio code, and click "Run"