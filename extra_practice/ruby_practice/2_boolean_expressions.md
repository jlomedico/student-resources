# Boolean Expressions  

Here is some additional practice for writing booleans. You will also get some practice working with methods. We have not specifically covered methods yet but you should have a feel for them due to your prework. In each question, the method has already been written for you, all you need to add is the logic. Once you've written the logic don't forget to call the method with various arguments to make sure your logic is correct.

##### Example: Write a boolean expression to show that if `good` is equal to "sunny" _or_ "blue sky", it's going to be a nice day.
```ruby
def weather(good)
  if **YOUR CODE GOES HERE**
    puts "It's a beautiful day out!"
  else
    puts "Grab an umbrella!"
  end
end

weather("sunny")
```
Try calling the method above again with "blue sky" or "rainy" or "cloudy".  


##### 1) Red and black are very popular car colors. Write a boolean expression to see if `color` is "red" _OR_ "black".

```ruby
def car_color(color)
  if **YOUR CODE GOES HERE**
    puts "That is a very popular car color."
  else
    puts "I'm sure your car is a nice color too."
  end
end

car_color("green")
```
**Don't forget to experiment with calling the method with different arguments!**

##### 2) On the highway its important to maintain a safe speed! Write a boolean expression to let the driver know they are doing a good job if `speed` is _greater than or equal to 40_ AND _less than or equal to 60_.


```ruby
def car_speed(speed)
  if **YOUR CODE GOES HERE**
    puts "Way to follow the posted limits!"
  else
    puts "You are a danger to other drivers!"
  end
end

car_speed(35)
```
**Don't forget to experiment with calling the method with different arguments!**

##### 3) Joann is very particular about making sure to alternate her comfy shoes with heels. Write a boolean expression to output the first message if the `day_of_week` is Monday _or_ Wednesday _or_ Friday.
```ruby
def comfy_shoes(day_of_week)
  if **YOUR CODE GOES HERE**
    puts "Don't you love comfy shoes day!"
  else
    puts "Try to stay off your feet as much as possible and you'll be fine!"
  end
end

comfy_shoes("Friday")
```
**Don't forget to experiment with calling the method with different arguments!**



##### 4) You work the front desk and a new guy named Angel is supposed to be starting today. Write a boolean expression to represent the following: if their name _is not_ Angel, greet them as usual but if their name is Angel, extend a warm welcome.
```ruby
def new_guy(name)
  if **YOUR CODE GOES HERE**
    puts "Hi! How can I help you?"
  else
    puts "Hi #{name}, great to meet you! I'm excited to work with you!"
  end
end

new_guy("Angel")
```
**Don't forget to experiment with calling the method with different arguments!**

##### 5) Cats are notoriously finicky! (Gotta love 'em though!). Write a boolean expression to show that if `fed` is "true" _and_ `has_toy` is "true", grumpy_cat is actually happy.

```ruby
def grumpy_cat(fed,has_toy)
  if **YOUR CODE GOES HERE**
    puts "That is one happy cat!"
  else
    puts "Watch out! The cat is grumpy!"
  end
end


grumpy_cat("true", "true")
```
**Don't forget to experiment with calling the method with different arguments!**

##### 6) Mondays are typically not fun and they're even worse without coffee! Write a boolean expression that shows that if `begin_week` is "Monday" **and** `coffee` is _not_ "true", your coworkers better be careful!

```ruby
def grumpy_human(begin_week, coffee)
  if **YOUR CODE GOES HERE**
    puts "Everybody better watch out!"
  else
    puts "Good Morning everyone!"
  end
end

grumpy_human("Monday", "true")
```


##### BONUS: Lets try comfy shoes another way. Write a boolean expression to let Joann know what she should do if `day_of_week` is _not_ "Monday" _or_ "Wednesday" _or_ "Friday". Check your results. They should be a little surprising! See if you can understand why this result is occuring.
```ruby
def comfy_shoes2(day_of_week)
  if **YOUR CODE GOES HERE**
    puts "Try to stay off your feet as much as possible and you'll be fine!"
  else
    puts "Don't you love comfy shoes day!"
  end
end

comfy_shoes2("Sunday")
```
**Don't forget to experiment with calling the method with different arguments!**
