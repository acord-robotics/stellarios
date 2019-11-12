import wikipedia

while True: # this is in a loop so it can be repeated
    wikinput = input("Ok Pyda! ")
    # wikipedia.set_lang("es")    # changes the language of output  to Espanyol (Spanish) - # not needed
    print(wikipedia.summary(wikinput, sentences=2)) # For wikipedia queries. # Sentences limits how long the output will be