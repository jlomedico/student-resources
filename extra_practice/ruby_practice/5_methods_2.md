# More Methods Practice  

#### 1) Objective: Use an explicit return to exit a loop once the value is found.  
Write a method called `exit_at_six`. Use a loop to start counting from 0 up to 10. Use an explicit return to exit the loop at 6 and return 6.  

Remember! A return does not output anything to screen. Make sure to run this code in irb in order to see the return value!

#### 2) Objective(s):
* Use the times Enumerator.  
* Review - Understand how to output text on the same line vs. on a new line.  

Use the times method to output "Hi!" four times on the same line with a space between each word.  

Your output should look like this:  
`Hi! Hi! Hi! Hi! => 4`  


#### 3) Objective: Use the `select` and `reject` methods to return specific items.  

Use the `select` method to return all numbers from 1-40 that are divisible by four. Store the result in a variable called `divisible_by_four`.  


Use the `reject` method to return all numbers from 1-40 that are not divisible by four. Store the result in a variable called `not_divisible_by_four`.  


#### 4) Objective: Write a method which yields to a block.  

Write a method called my_dog. If a block is given, the method should yield to "your dog's name". If no block is given, the method should output: "I don't have a dog". The method calls are given for you.  

```ruby
def my_dog
***YOUR CODE HERE***
end

my_dog {|name| puts "My dog's name is #{name}"}
my_dog
```
