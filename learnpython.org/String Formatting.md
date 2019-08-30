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

