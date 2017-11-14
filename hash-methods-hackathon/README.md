# Hash Methods

Use the Ruby Docs to find **methods** to solve each of these! I repeat! Use **methods** to accomplish these. You should not need loops. Don't over think things. Exlore the Ruby Docs to come up with your answers. Play around in `irb` and check your answers!

### Objective - Create a Hash
Set `h` = to an empty Hash. (Do this twice, in two different ways.)  

### Objective - Create a Hash with a key/value pair

On his first quiz of the semester, Quiz 1 (`quiz1`), Josh got a 92. On Quiz 2, (`quiz2`), Josh received an 87. Represent these scores with a Hash using the quiz name as the key and his score as the value. Store this result in a Hash named `quiz_scores`. You may use either Strings OR Symbols as your Hash keys.  

Example:  
* Using Strings: `homework_scores = {"hw1" => 88, "hw2" => 97}`    
* Using Symbols: `homework_scores = {hw1: 88, hw2: 97}`  

### Objective - Create a Hash with many pairs

The last 10 College Football National Championship winners are listed below. Input them into a Hash that pairs the year with the winning team.  

The Hash should be named `national_champs`. The key should be the year and the value should be the winning team.  

* 2014 - Ohio State
* 2013 - Florida State
* 2012 - Alabama
* 2011 - Alabama
* 2010 - Auburn
* 2009 - Alabama
* 2008 - Florida
* 2007 - LSU
* 2006 - Florida
* 2005 - Texas

### Objective - Get all of the keys and values in a Hash

1. Get all the keys from the `national_champs` Hash from the last question.
1. Get all the values from the `national_champs` Hash from the last question.  

### Objectives - Get a specific value from a Hash

```rb
country_capitals = { Denmark: "Copenhagen", Sweden: "Stockholm", Germany: "Berlin", France: "Paris", Spain: "Madrid"}
```

Get the capital of Sweden from the Hash and store it in a variable named `sweden_capital`.

### Objective - Check if a key exists in a Hash

```rb
country_capitals = { Denmark: "Copenhagen", Sweden: "Stockholm", Germany: "Berlin", France: "Paris", Spain: "Madrid"}
```

1. Check if `country_capitals` contains a key `"Italy"`.  
1. Check if `country_capitals` contains a key `"France"`.  
1. Check if `country_capitals` contains a key `:France`.  
1. Check if `country_capitals` contains a key `:france`.  

What new Hash method did you discover?

### Objective - Set the default value of a Hash

```rb
authors = {"Little Women" => "Louisa May Alcott", "Robinson Crusoe" => "Daniel Defoe"}
```

1. Set the default value of `authors` to `"unknown"`.  
1. What happens when you try `authors["To Kill a Mockingbird"]`?
1. What did you learn from this? Try setting other default values.  


### Objective - Set a new value for an existing key
```rb
bestsellers = {"Come Rain or Come Shine" => "unknown", "Make Me" => "unknown", "The Girl in the Spider's Web" => "unknown", "Go Set a Watchman" => "unknown", "All the Light We Cannot See" => "unknown"}
```

The top 5 hardcover New York Times bestsellers are listed with `"unknown"` authors. Set the correct author values from the list below.

1. Jan Karon  
1. Lee Child  
1. David Lagercrantz  
1. Harper Lee  
1. Anthony Doerr  

Example:
`bestsellers[?] = "?"`


### Objective - Check if a Hash contains a value

```rb
authors = {"Little Women" => "Louisa May Alcott", "Robinson Crusoe" => "Daniel Defoe"}
```

1) Check if `authors` contains the value `"Louisa May Alcott"`.


### Objective - Learn how the `Hash#include?` method works

```rb
remodel = {floor: "tile", cabinets: "oak", countertop: "corian", faucet: "stainless steel", refrigerator: "LG"}
```

1. Does `remodel` include `"oak"`. Check if `remodel` includes `"oak"` using the `.include?` method.  
1. Check if `remodel` includes `:cabinets`. 
1. What can you infer about the `include?` method from this?
