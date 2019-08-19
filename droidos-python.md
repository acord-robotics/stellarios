---
layout: page
title:  DroidOS - Python
---

## Other things I'm learning
* [Arduino Tutorials](https://www.arduino.cc/en/Tutorial/HomePage?from=Main.Tutorials)
* [Getting started - Arduino](https://www.arduino.cc/en/Guide/HomePage)
* [Ardafruit - arduino](https://learn.adafruit.com/category/learn-arduino)
* [Raspberry Pi projects](https://projects.raspberrypi.org/en/)
* [Raspberry pi - getting started](https://projects.raspberrypi.org/en/projects/raspberry-pi-getting-started)

<div class="codegena_iframe" data-src="http://irisdroidology.github.io/droidos-python" style="height:471px;width:800px;" data-responsive="true" data-img="https://cdn-media.threadless.com/submissions_wm/704102-c790ceeb55adcc2597e1d21252fc4855.jpg" data-css="background:url('//codegena.com/wp-content/uploads/2015/09/loading.gif') white center center no-repeat;border:0px;"></div><script src="https://rawgit.com/shaneapen/Codegena/master/async-iframe.js"></script>

# Python - Sololearn Basic Concepts

[Back to home page](http://irisdroidology.github.io/droidos-python)

## What we learn
* In Python, we use the print statement to output text - print("This is an example")
* We use quotation marks around text that should be outputed in the console

## Welcome to Python
* Python is a high-level programming language.
* It has applications in numerous areas (for example, web programming, scientific computing, and artificial intelligence)
* Used by companies such as Disney, NASA, & Google

* There are three major versions of Python - 1.xx, 2.xx, and 3.xx
* They are subdivided into minor versions (e.g.1.1)
* Code written for Python 3 is guaranteed to work for all future versions
* Python 2 & Python 3 are currently used
* An interpreter is a program that runs scripts written in an interpreted language such as python

### Questions
* Python is a *programming language*

* Which of these statements are true *Cpython is an implementation of Python*

## Your first program
* In Python, we use the print statement to output text
* We use quotation marks around text that should be outputed in the console
* We can either use "xx" or 'xx'
* The print statement can also be used to output multiple lines of text - see CODE (Your first program)

### Questions
* Fill in the blanks to print "Hi" - *print*("Hi")

## Simple Operations
* Python is capable of conducting simple calculations
* You can enter a calculation directly into Python and it will output the result for you  (see CODE (Simple operations))
* Python also carries out multiplication and division. 
* Python uses the * (shift+8) key for multiplication and the / (forward slash) key for division
* Parantheses () are used to determine which operations are performed first
* The minus sign indicates a negative number
* Operations are also performed on negative numbers
* Dividing by zero in Python gives an error as no number can be divided by zero

### Questions
* What does this code output? (1+2+3) *6*
* What is output by this code? ((4+8)/2) *6.0*

## Floats
* Floats are used in Python to represent numbers that aren't integers
* Some examples of numbers that are represented as floats are 0.5 and -7.82895
* Floats can be created directly by entering a number with a decimal point, or  by using operations such as multiplication or division on integers
* Extra zeroes at the end of the number are ignored
* Dividing any 2 numbers by each other produces a float
* A float is also produced by running an operation on 2 floats, or on a float and an integer

### Questions
* Which of these numbers will not be stored as a float? *7*

## Other numerical operations
* Exponentiation - Python also supports Exponentiation
* Raising of one number to the power of another
* This action is performed by using 2 asterisks (see Code examples|Other numerical operations)
* Quotient & Remainder - To determine the quotient and remainder of a division, use the floor division and modulo operators, respectively.
* Floor division is done using two forward slashes.
* The modulo operator is carried out with a percent symbol (%).
* These operators can be used with both floats and integers.

## Strings
* If you want to use text in Python, you have to use a string
* A string is created by entering text between 1 or 2 quotation marks (' or ")
* Some characters can't be used directly in a string
* Double quotes can't be used in a string as they would end the line prematurely
* Characters like these must be escaped by placing a backslash (\) before them
* Newlines - Python provides an easy way to avoid manually writing \n to escape newlines in a string
* Create a string with 3 sets of quotes, and newlines that are created by pressing enter are automatically escaped for you

## Simple Input and Output
* Usually, programs take an input and process it to produce an output
* In Python, you can use the print function to produce an output
* This creates a textual representation of something to the screen (see Code Examples\Simple Input & Output)
* To get input from the user in Python, you can use the input function
* This function prompts the user for an input, and returns what they answers as a __string__ (the contents are automatically __escaped__) (see Code Examples\Simple Input & Output)

## String Operations
* As with integers and floats, strings can be added in Python, using a process called __concatenation__ which can be done on any 2 strings
* Even if your strings contain numbers, they will be added as strings rather than as numbers (see Code Examples\String operations)
* Strings can also be multiplied by integers (see Code Examples\String Operations)
* The order of the string and the integer doesn't matter, but the string usually comes first
* Strings can never be multiplied by floats

## Type Conversion
* In Python, it's impossible to complete certain operations due to the types involved
* For example, you can't add 2 and 3 together 2 form 5 as a string, because since 2 and 3 are both strings adding them together would form 23
* The solution to this is __type conversion__
* In the first example above, you would convert 2 and 3 to an int funciton (see Code Examples\Type Conversion)
* Another example of type conversion is turning user input (which is a string) to numbers (integers or floats), to allow for the performance of calculations.

## Variables
* Variables play an important role in most programming languages, and Python is no exception
* A variable allows you to store a variable by assigning it to a name, which can be used to refer to the value later in the program (see code examples\variables)
* To assign a variable, we use an equals sign (=)
* Unlike most lines of code we've looked at so far, it doesn't produce an output in the Python console
* Variables can be reassigned as many times as you want in order to change their value
* In Python, variables don't have specific types, so you can assign a string to a variable, and later assign an integer to the same variable
* Variable names can't start with a number and can only contain numbers, letters and underscores
* Trying to reference a variable you haven't assigned causes an error
* You can use the del statement to remove a variable, which means the reference from the name to the value is deleted, and trying to reuse the variable causes an error
* Deleted variables can be reassigned

## In place operators
* In-place operators allow you to write code like x = x+3 more concisely as x += 3
* The same thing works for other operators as well.

*Completed Module 1 of Python on Sololearn*

# Code Examples

## Your first program

```print("Hello World")
print("Second sentence")
```

## Simple Operations
```2+2
Result = 4
```
## Other numerical operations
```2**5
32
2*5
10
```

## Simple input & output
```>>>print(1+1)
2
>>>print("Hello\nWorld!")
Hello
World!
```

```>>>name = input("What's your name?")
What's your name? (user enters "Liam")
>>>print("Hello, " + name)
Hello, Liam
```

## String Operations
```print("1" + "1")
11
```

```print("Example code" * 3)
Example codeExample codeExample code
```

## Type Conversion
```print("2" + "3")
23
>>>int("2") + int("3")
5
```

```>>> float(input("Enter a number: ")) + float(input("Enter another number: "))
Enter a number: 40
Enter another number: 2
42.0
```

## Variables
>>>x = 7
>>>print(x)
7
>>>print(x+3)
10
>>>print(x)
7

