# Hash Methods

Use the Ruby Docs to find **methods** to solve each of these! I repeat! Use **methods** to accomplish these. You should not need loops. Don't over think things. Exlore the Ruby Docs to come up with your answers. Play around in irb and check your answers!  

### Objective - create a new hash
1) Set h = to an empty hash. (Do this twice with two different methods.)  

### Objective - set your first key value pair

1) On his first quiz of the semester, Quiz 1 (`quiz1`), Josh got a 92. On Quiz 2, (`quiz2`), Josh received an 87. Represent this with a hash using the quiz number as the key and the score as the value. Store this in a hash called quiz_scores using strings OR symbols as the hash keys.  

Example:  

using strings:  homework_scores = {"hw1" => 88, "hw2" => 97}    
using symbols:  homework_scores = { hw1: 88, hw2: 97}  


### Objective - create a hash with lots of pairs

The last 10 College Football National Championship winners are listed below but you need to input them into a hash matching the year with the winning team.  

1) Create a hash called `national_champs` containing the correct key, value pairs. The key should be the year and the value should be the winning team.  

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


### Objective - output all of the keys in a hash

1) Using the `national_champs` hash from the last question, output just the hash keys.

2) Using the `national_champs` hash from the last question, output just the hash values.  

### Objectives - Retrieve a specific value from a hash

`country_capitals = { Denmark: "Copenhagen", Sweden: "Stockholm", Germany: "Berlin", France: "Paris", Spain: "Madrid"}`  

1) Retrive the capital of Sweden from the hash and store it in a variable called sweden_capital.


### Objective - See if a key exists in a hash

country_capitals = { Denmark: "Copenhagen", Sweden: "Stockholm", Germany: "Berlin", France: "Paris", Spain: "Madrid"}

1) Check if the country_capitals hash contains a key called "Italy".  
2) Check if the country_capitals hash contains a key called "France".  
3) Check if the country_capitals hash contains a key called :France.  
4) Check if the country_capitals hash contains a key called :france.  

Take note of what you discover!

### Objective - Set a default value

`authors = {"Little Women" => "Louisa May Alcott", "Robinson Crusoe" => "Daniel Defoe"}`

1) Set the authors hash to have a default value of `"unknown"`.  
2) See what happens when you try `authors["To Kill a Mockingbird"]`  
3) What can you learn from this? Experiment with setting default values on your own in irb.  


### Objective - Set a new value for an existing key
`bestsellers = {"Come Rain or Come Shine" => "unknown", "Make Me" => "unknown", "The Girl in the Spider's Web" => "unknown", "Go Set a Watchman" => "unknown", "All the Light We Cannot See" => "unknown"}`

1) The top 5 hardcover New York Times bestsellers are listed as having unknown authors. Set the authors(values) to the correct ones according to the ordered list of authors given. (The example syntax is given also. It's up to you to figure out what goes where!)  
1.  Jan Karon  
2.  Lee Child  
3.  David Lagercrantz  
4.  Harper Lee  
5.  Anthony Doerr  

Example:
`bestsellers[ ] = "       "`


### Objective - See if a hash contains a value

`authors = {"Little Women" => "Louisa May Alcott", "Robinson Crusoe" => "Daniel Defoe"}`

1) See if the `authors` hash contains the value "Louisa May Alcott".


### Objective - Learn how the include? method works

`remodel = {floor: "tile", cabinets: "oak", countertop: "corian", faucet: "stainless steel", refrigerator: "LG" }`

1) Look at the `remodel` hash to see if it includes "oak".  
2) Check to see if the `remodel` hash includes "oak" using the `.include?` method.  
3) Check to see if the 'remodel' has includes `:cabinets`. What can you infer about the `include?` method from this?
