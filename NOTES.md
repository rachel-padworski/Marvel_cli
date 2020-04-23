A Marvel character search engine to view info about characters and their related comics.

User should be able to view a list of characters (or type in a character's name) to start the program.



get the name and url for each marvel character...
bin/console
Marvel::APIManager.get_characters
t = _ (to save it)
t (to make sure it's saved)
results = t["results"] (shows me nil, but if I run results = t["data"] then I get too much info)
results.class (gives me nil)
t = Marvel::APIManager.get_characters
t["data"]["results"][0]


To view all the character names in the console:
bin/console
Marvel::APIManager.get_characters
Marvel::Characters.all
Marvel::Characters.all.length


List of characters I'd like to get info about: 
    Nick Fury's dream team: 
        Black Widow
        Thor
        Iron Man
        Hulk
        Captain America
        Hawkeye