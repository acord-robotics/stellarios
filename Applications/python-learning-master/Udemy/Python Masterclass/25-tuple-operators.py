# 25 - Tuple Operators
https://www.udemy.com/course/python-masterclass-for-beginners/learn/lecture/13270054#content

# 24 - List Operators
# https://www.udemy.com/course/python-masterclass-for-beginners/learn/lecture/13270052#content


# 23 - sets
# https://www.udemy.com/course/python-masterclass-for-beginners/learn/lecture/13270048#overview

# 22 - Tuples
# https://www.udemy.com/course/python-masterclass-for-beginners/learn/lecture/13270046#overview

"""
Contents:
Line 26: List stuff
Line 37: Tuples
Line 51: Set Stuff
Line 87 - List Operators
Line 139 - Tuple Operators
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

"""
# 24 - List Operators
"""

"""
Contents:
Defining list [siliconValley]: Line 100
List Operator - w/ Input & If/Else: Line 104
List Length: Line 112
List Append: Line 116
List Insert: Line 120
List Remove: Line 123
Deleting Specific Elements: Line 128
"""

# Defining the list
siliconValley = ["Apple", "Microsoft", "Google"]
siliconValley[1] = "Samsung" # Since lists use indexing, this replaces the second (0-1-2-3, etc) item in the list "siliconValley" from Microsoft to Samsung

# List Operator - w/ Input & If/Else
print("What would you like to search for in this list?")
userSearch = input()
if userSearch in siliconValley:
    print(siliconValley)
else:
    print("It's not in there")   

# List Length
# (How many items in the list)     
print(len(siliconValley)) # this also includes duplicate items in the list

# List Append
siliconValley.append("Facebook") # Adds "Facebook to the end"
# This can also be done with inputs (see list operator - w/ Input & If/Else)

# List Insert
siliconValley.insert(0, "EA") # inserts "EA" into index 0 (first item) of list "siliconValley"

# List Remove
siliconValley.remove("Apple")
siliconValley.append("Apple")
# Removing removes only the first of the duplicates (goes from the beginning of the index/list)

# Deleting Specific Elements
siliconValley.remove(0, "Google")
del siliconValley[3]
# del siliconValley - # Removes the entire list
# Clearing the list, but keeping the list as a "variable/list" entity
siliconValley.clear()

"""
# Tuple Operators
"""

samsung = "Samsung"
siliconValleyT = ("Apple", "Google", samsung)

if samsung in siliconValleyT:
    print("Yes")
    print(siliconValleyT)
    print(samsung)

# Len also works w/ Tuples

# Deleting Tuples
del siliconValleyT

# Finding index value of element in tuple
indexOfSVTuple = siliconValleyT.index(samsung) # finds index value of samsung variable in SVTuple (siliconValleyT)
print(indexOfSVTuple)