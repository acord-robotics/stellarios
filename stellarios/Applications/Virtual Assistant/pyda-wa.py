import wolframalpha
import wikipedia

input = input("Question: ")
app_id = "8A6LA2-ELRHR92Y88" # App ID for Wolframalpha

client = wolframalpha.Client(app_id) # calls on app id

# Output
result = client.query(input) # See line 3
answer = next(result.results).text


print(answer)