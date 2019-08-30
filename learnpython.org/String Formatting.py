# This prints out "Hello, John!"
name = "John"
print("Hello, %s!" % name) # %s refers to the name variable (take not of where the exclamation mark is placed)

# %d, %s
name = "Liam"
age = 16
print("%s is %d years old" % (name, age))

# List
# This prints out: A list: [1, 2, 3]
mylist = [1,2,3]
print("A list: %s" % mylist)

# Other formatters
%s - #String (or any object with a string representation, like numbers)

%d - #Integers

%f - #Floating point numbers

%.<number of digits>f - #Floating point numbers with a fixed amount of digits to the right of the dot.

%x/%X - Integers in hex # representation (lowercase/uppercase)