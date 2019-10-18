# Tuple - a collection of immutable objects (can't be changed - e.g. d.o.b). 'tuple' object does not support item assignment
tupleName = (object1, object2) # sets the values of the objects in the tuple "tupleName" to "object1"  & "object2"
tupleName # prints the values of the tuple "tupleName" to the console

# Accessing values in a tuple
tupleName[0] # returns "object1"

# Deleting tuples
del(tupleName) # Deletes the tuple
tupleName = (object1, object2) # Creates tupleName again!


# Tuple exercises
# Easy -  Write a program to create a tuple of 4 elements
tuple4 = (object11, object22, object33, object4)

# Medium - convert this tuple ("tuple4") to a list
list(tuple4)

# Hard - Now delete the first element in this list and convert it back to tuple
tuple4.remove(object11)
tuple(tuple4)