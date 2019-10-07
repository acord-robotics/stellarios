# Declare a string
text = "Python programming is easy"
# Slice the string from index 22 to 26 to extract the string 'easy' and store it in a variable
slicedText = text[22:26]
print(slicedText)
# Replace 'easy' with ' and powerful' in the variable 'slicedText'
slicedText = slicedText.replace('easy',' and powerful')
# Concatenation is adding two strings which can be done using '+' operator
concatenatedString = text + slicedText
print(concatenatedString)

# Output => "Python programming is easy and powerful"
