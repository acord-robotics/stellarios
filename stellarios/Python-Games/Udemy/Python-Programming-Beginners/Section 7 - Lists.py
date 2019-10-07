# Lists
# https://www.udemy.com/course/python-programming-beginners/learn/lecture/6727846#overview
# listName = [object1, object3, object4]
listName = ["object1", "object2", "object11"] # object1 has an index value of 0, object2 has an index value of 1
listName # prints the values in the "list" with the name "listName"

# Accessing values in lists
listName[1] # prints the second object in the list "listName", in this case "object2"

# Replacing/modifying lists
listName[1] = "object7" # Replaces the value of the second value in list "listName" with "object7"
listName # Prints the values assigned to the list "listName" to the console

# List Operations

# Append operation - add an object to the end of the list
listName.append("object99") # Adds "object99" to the end of the list "listName"

# Insert operation
listName.insert(1, "object66") # Addes "object66" to the index value of 1 (2 overall object) to the list "listName"

# Remove Operation
listName.remove("object99") # Removes the object "object99" from the list "listName"

# Sort Operation
listName.sort() # Arranges the list "listName" in alphabetical order

# Reverse Operation
listName.reverse # Reverses the order of the list "listName"

# Pop Operation
listName.pop() # Removes the last object in the list "listName" and prints it to the console

# Exercises

# Easy - Write a program to create a list of 5 elements
myList = ["This", "list", "contains", "five", "elements"]

# Medium - Update the value at 3rd element of the list
myList[3] = "does contain"

# Hard - Create another list of 3 elements. Now create a final result as a concatenation of the first two lists
myListTwo = ["3", "elements", "are here"]
myListTogether = myListTwo + myList

# Practice - 23.9.19 +
mylist = ["This", "object"]

# Easy - Write a program to create a list of 5 elements
myList = ["1", "2", "3", "4", "5"]
# Medium - Update the value at 3rd element of the list
mylist[2] = "55" # index values
# Hard - Create another list of 3 elements. Now create a final result as a concatenation of the first two lists
myList2222 = ["38", "44", "555"]
myListTogether2 = myList2222 + myList

# List Operations
# Pop - remove last value from list
# Insert - using index values, moves everything behind it back by 1 (in terms of index values)
# Reverse - reverse order (index values)
# Sort - alphabetical order (changed index values)
# Append - add item to end of list

# To insert operation: 
listName.operation (i.e. listName.append(55))
