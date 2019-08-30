# String Formatting - LearnPython.org

* Python uses ***c-style*** string formatting
* This can create new, **formatted** strings
* The ***%*** operator is used to format a set of variables enclosed in a **tuple** with a **format string**
* Example: '%s' = 

```python
# This prints out "Hello, John!"
name = "John"
print("Hello, %s!" % name) # %s refers to the name variable
```

* %s refers to string variable
* %d refers to number variable

Example:

```python
name = "Liam"
age = 16
print("%s is %d years old" % (name, age))
```

Any object which is not a string can be formatted in the same way:

```python
# This prints out: A list: [1, 2, 3]
mylist = [1,2,3]
print("A list: %s" % mylist)
```

```
%s - String (or any object with a string representation, like numbers)` `%d - Integers` `%f - Floating point numbers` `%.<number of digits>f - Floating point numbers with a fixed amount of digits to the right of the dot.` `%x/%X - Integers in hex representation (lowercase/uppercase)
```



Use format data:

```python
data = ("John", "Doe", 53.44)
format_string = "Hello %s %s. Your current balance is $%s."

print(format_string % data)
```

