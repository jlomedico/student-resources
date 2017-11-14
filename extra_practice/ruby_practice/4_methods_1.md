## Methods Notes & Practice

Ruby provides a lot of built in methods. We use methods by attaching them to the object that we want to use the method on.  

For example  
`"I am a string".upcase`  

Upcase is a method that we can use on strings. Ruby also allows us to create our own methods. To create a method we enclose it in `def` and `end`. `def` shows the start of the method and `end` as you would expect, shows the end of the method.  

```ruby
def mashons_method(string)
  puts string.gsub("o", "p")
end

mashons_method("Row, row, row your boat")
```

Notice that the `string` within parenthesis in the first line `def mashons_method(string)`, acts as just a placeholder. It will accept whatever you place within those parenthesis as long as it is a string. We need a string because we are using `gsub` which is a string method.      

(Make sure to run this to see what it does!)

When you call the method, as in the final line `mashons_method("Row, row, row your boat")`, the string within the parenthesis is called an argument.  

This method takes in the string, uses the method `gsub` on it and puts out the new string after being modified.  

Vocabulary review:  
* define a method - used to create a new method with def and end  
* call/invoke - putting the method name at the end along with any needed arguments
* argument - what you put in the parenthesis  
* passing an argument - putting your argument in the parenthesis when you call the method  
* implicit return - a method will return whatever the last line of code returns  
* explicit return - using the `return` keyword. This can let you exit the method at whatever point you specify.  



### 1) Objective - Explain variable scope!

This doesn't work. In your own words explain why.
```ruby
def multiply_by_two(number)
  puts number * 2
end

puts number
```


#### 2) Objective - Understand that Enumerators start counting from 0.
It is important to note that a block starting with `.times` begins counting from 0 just like an array.  
```ruby
5.times {|number| puts "Hello #{number}"}
```

It's also important to note that `number` in the example above, or anything else you place in the pipes(||), is just a placeholder. Run the example below.  

```ruby
5.times {|letter| puts "Hello #{letter}"}
```
See?  

5.times.class shows us that it's class is an Enumerator. Enumerators are for going over lists, one item at a time.  


#### 3) Objective - Understand what an Enumerator does.

This is an array of names.

`pets = ["Scooby", "Soco", "Summer", "Pixie", "Wilson", "Mason","Baron", "Brinkley", "Bella"]`

This is a block of code which uses an enumerator called `each` to go through the array.
```ruby
pets.each do |name|
  puts "#{name} is a good name for a pet!"
end
```

The `each` says that we want to go through each item in the array. Think of the |name| as a magnifying glass. Imagine it sliding over each item in the array and doing something to it before going on to the next.   

The long lines below attempts to describe in painful detail how this method works.  

* (Magnifying glass....) Check to see if there is a first item in the array pets. If there is, output the sentence "[this name] is a good name for a pet!"  

* (Magnifying glass slides over....) Check to see if there is a second item in the array pets. If there is, output the sentence "[this name] is a good name for a pet!"  

* (Magnifying glass slides over....) Check to see if there is a third item in the array pets. If there is, output the sentence "[this name] is a good name for a pet!"  

* (Magnifying glass slides over....) Check to see if there is a fourth item in the array pets. If there is, output the sentence "[this name] is a good name for a pet!"  

* (Magnifying glass slides over....) Check to see if there is a fifth item in the array pets. If there is, output the sentence "[this name] is a good name for a pet!"  

* (Magnifying glass slides over....) Check to see if there is a sixth item in the array pets. If there is, output the sentence "[this name] is a good name for a pet!"  

* (Magnifying glass slides over....) Check to see if there is a seventh item in the array pets. If there is, output the sentence "[this name] is a good name for a pet!"  

* (Magnifying glass slides over....) Check to see if there is a eight item in the array pets. If there is, output the sentence "[this name] is a good name for a pet!"  

* (Magnifying glass slides over....) Check to see if there is a ninth item in the array pets. If there is, output the sentence "[this name] is a good name for a pet!"  

Once there are no longer any items in the array, the code block stops executing.  

*_Hopefully this overkill of an example helps you to begin see how powerful enumerators are!!!_*


#### 4) Objective - Use an if statement with an enumerator  
You can include if statements inside of enumerators. This allows you more ability to do specific things to certain elements in the list.  

Write a method that will iterate over each item in the pets array given above. If the name "Soco" is in the array, output "Soco is a cat!". For every other name output the the pet's name along with "...is a dog!"  

Example output:
```ruby
"Soco is a cat!"  
"Scooby is a dog!"
```
...
...
