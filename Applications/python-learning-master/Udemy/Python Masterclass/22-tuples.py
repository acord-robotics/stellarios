# 22 - Tuples
# https://www.udemy.com/course/python-masterclass-for-beginners/learn/lecture/13270046#overview

"""
Contents:
Line 11: List stuff
Line 27: Tuples
"""

"""
List stuff (21-lists.py)
"""

# https://www.udemy.com/course/python-masterclass-for-beginners/learn/lecture/13270044#overview

# Defining the lists
listVariable = ["Google", "Samsung", "Apple"] # sets these as the values in the list
element = listVariable[0] # sets the value of the variable "element" to the first (0 - lists are arrays) part of listVariable - Google
print(listVariable) # prints the values in the list to the console
print(element)

# changing elements
listVariable[1] = "Microsoft" # changes samsung to microsoft
print(listVariable)

"""
Tuple Stuff
"""

tupleVar = ("Apple", "Google", "Microsoft")
# Tuple Item Assignment
# tupleVar[1] = "Samsung" # replaces google with samsung, as google is index value 1 # this does not work, as tuples don't support item assignment after they've been created

print(tupleVar) # prints the whole tuple
print(tupleVar[1]) # prints the index 1  # if this was a list, it would print samsung, but since it's a tuple, it prints google

# You can have the same values in tuples multiple times:
tuplevar2 = ("Apple", "Apple", "Samsung")