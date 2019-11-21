# 23 - sets
# https://www.udemy.com/course/python-masterclass-for-beginners/learn/lecture/13270048#overview

# 22 - Tuples
# https://www.udemy.com/course/python-masterclass-for-beginners/learn/lecture/13270046#overview

"""
Contents:
Line 14: List stuff
Line 30: Tuples
Line 45: Set Stuff
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

"""
Set Stuff
"""

"""
Set Contents:
Rules: Line 54
"""

"""
Set Rules:
1. Sets don't support indexing
2. Sets don't support duplicates - no error, however it will only show up once
3. add a dot after the set variable to see list of things you can add to the set/do to the set
4. sets are unordered
"""

# Creating & Initializing the set
set1 = {"Apple", "Samsung", "Microsoft"} # sets the values of "set1" set to "apple, samsung, microsoft"
print(set1)

# Addint to the set
set1.add("Google")
# Updating set
set1.update(["One+", "Hauwei"]) # adds these 2 values to the set1
print(set1)

# Finding length of set
print(len(set1)) # prints how many things are in the set

# Removing items from the set
set1.remove("Apple")
set1.discard("shdojxun") # won't remove an error, just in case the thing you try and remove isn't part of the set in the first place

print(set1)