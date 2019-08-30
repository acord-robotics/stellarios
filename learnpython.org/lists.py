# LearnPython.org >> Lists

# Example list - from the LearnPython site
mylist = []
mylist.append(1)
mylist.append(2)
mylist.append(3)
print(mylist[0]) # prints 1
print(mylist[1]) # prints 2
print(mylist[2]) # prints 3

# prints out 1,2,3
for x in mylist:
    print(x)

# list error
print(mylist[10]) # this returns an error, as there are only 3 lists (1,2,3) defined right now. There is no list with the value of 10

# List exercise
numbers = []
numbers.append(1)
numbers.append(2)
numbers.append(3)
strings = []
strings.append("hello")
strings.append("world")
names = ["John", "Eric", "Jessica"]

# write your code here
second_name = []


# this code should write out the filled arrays and the second name in the names list (Eric).
print(numbers)
print(strings)
print("The second name on the names list is %s" % second_name)


    # Solution to exercise
numbers = []
strings = []
names = ["John", "Eric", "Jessica"]

# write your code here
numbers.append(1)
numbers.append(2)
numbers.append(3)

strings.append("hello")
strings.append("world")

second_name = names[1]

# this code should write out the filled arrays and the second name in the names list (Eric).
print(numbers)
print(strings)
print("The second name on the names list is %s" % second_name)