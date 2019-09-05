# Basic Data types in Python

One of the great things about Python is that there are few keywords built into Python, making it easier to learn than many other languages. 

An example of a "keyword"  is the "print" function, which prints an output to the Python console:

```python
print("Hello, World!")
```

The print function can also print an output, or calculation:

```python
print(5*5)
# prints 25 to the console
```

## Integers

- There is no limit to how long an integer is in Python 3

Printing an integer: 

```python
print(123123123)
>>> #prints 123123123
```

If there is no prefix before the sequence of numbers, Python interprets this as a decimal-type integer.

### Integer Prefixes

- 0b = Binary = Base 2
- 0o = Octal = Base 8
- 0x = Hexadecimal = Base 16

Let's put these integer prefixes into work:

```python
>>> print(0o10)
#prints 8

>>> print(0x10)
#prints 16

>>> print(0b10)
#prints 2
```



- int is short for integer



### Integer If Statements

Seen in root\variablesnumbers.py:

```python
myint = 7 # myint is an integer variable that is predefined, it is set to the value of 7
if myint == 7: #this line checks to see if the variable does indeed equal 7
<<<<<<< HEAD
    print(myint) #if it does, the console prints myint - the value of mmyint, if it was print("myint") the console would print "myint" rather than its value
 
```

```
>>>>>>> Stashed changes

## Strings

* Defined either with single quotes or double quotes
* However, double quotes are better because apostrophes ('') can be used

​```python
string 1 = "This is Liam's String"
string 2 = 'This is Liam's String'
# as you can see, "string 2" does not work
```

- You can print strings in two ways:

```python
# option 1 (printing a string directly)
print("This is a string")
>> #Output: This is a string

# option 2 (defining a string variable)
string = "This is a string"
print(string)
>> #Output: This is
```

