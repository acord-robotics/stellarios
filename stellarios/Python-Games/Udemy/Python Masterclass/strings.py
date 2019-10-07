# Strings
# Lecture: https://www.udemy.com/course/python-masterclass-for-beginners/learn/lecture/13270012#overview

stringVariable = "hello" # Sets the value of the string variable "stringVariable" to "hello" (array of characters)

# Indexing
print(stringVariable) # prints/accesses whole string
print(stringVariable[0]) # Index value - prints "h" (h = 0, e = 1, o = 4). Accessing 1 character at a time

print(stringVariable[1:3]) # Index value - 1,2,3 (e,l,l) - prints "ell"
# Length
print(len(stringVariable)) # prints 5 - 5 characters

# Removing whitespace
whitespace = "     white     spa ce"
print(whitespace.strip) # Spaces in between characters are still there, spaces in front and at end are deleted

# Lowercase & uppercase
lower = "this is lower"
print(lower.capitalize()) # first character is capatalized
# Caps lock
print(lower.upper())
upper = "this is upper"
print(upper.lower())

# Replacing characters
string1 = "shshshshshsh"
print(string1.replace('h', 'a')) # old, new, count
# Split
string1 = "sh sh sh"
string2 = string1.split(' ') # splits white space/spaces