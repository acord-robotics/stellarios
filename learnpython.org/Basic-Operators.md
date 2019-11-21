# LearnPython.org >> Basic Operators

[![forthebadge made-with-python](http://ForTheBadge.com/images/badges/made-with-python.svg)](https://www.python.org/)

* Just as with other programming languages, basic operators (+, -, /, *) can be used in Python

An example of using operators in integer variables;

```python
number = 1 + 2 # sets the value of the int variable "number" to 3
print(number) # prints the value of the variable "number", in this case 3

# note: all the code on these documentation files are also put into Python files in the same folder
```

* There are many different operators:

## Types of Operators

* +. Addition
* -. Subtraction
* *. Multiplication
* /. Division
* %. Modulus - returns the remainder of a division

Modulus example:

```python
remainder = 11 % 3 # sets the value of the variable "remainder" to the remainder of 11 divided by 3
print(remainder)
```

2 multiplication symbols put together create a power relationship:

```python
squared = 7 ** 2 # sets the value of "squared" (an integer variable) to the value of 7^2 - 49
cubed = 7 ** 3 # sets the value of "cubed" (an integer/float variable) to the value of 7^3 = 343
print(cubed + squared) # prints the value of cubed added to the value of squared
```

## Operators & strings

* Python supports ***concatenating*** strings using the ***addition*** operator:

```python
helloworld = "hello " + "world" #sets the value of the string variable "helloworld" to "hello + world" = "hello world"

print(helloworld) # prints the value of "helloworld", in this case hello world
```

* You can also use the multiplication operator with strings:

```python
lotsofstring = "string" * 10 # sets the value of "lotsofstring" to 10xstring
print(lotsofstring) # prints string x10
```

## Operators & Lists

Operators can be used with lists:

```python
even_numbers = [2,4,6,8]
odd_numbers = [1,3,5,7]
all_numbers = odd_numbers + even_numbers
print(all_numbers)
```

```python
print([1,2,3] * 3) # prints "1,2,3" 3 times
```

## Exercise

```python
x = object()
y = object()

# TODO: change this code
x_list = [x,x,x,x,x,x,x,x,x,x]
y_list = [y,y,y,y,y,y,y,y,y,y]
big_list = ([x,y] * 10)

print("x_list contains %d objects" % len(x_list))
print("y_list contains %d objects" % len(y_list))
print("big_list contains %d objects" % len(big_list))

# testing code
if x_list.count(x) == 10 and y_list.count(y) == 10:
    print("Almost there...")
if big_list.count(x) == 10 and big_list.count(y) == 10:
    print("Great!")
```

