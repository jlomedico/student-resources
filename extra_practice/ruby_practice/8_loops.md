# Loops

A loop is a way to repeat a task multiple times. If you find yourself needing to do something repetitive, you're often better off using a loop. 

## Exercise: Simple loop

Let's practice the `for` loop before moving on. Using if statements, write a loop that prints out __all numbers, from 1 to 1000, that can be divided by 7 without any remainder__.

**Hints**

* You can use the division sign / But the modulo operator, %, may be more efficient.
* A number that is evenly divisible by 7 has a remainder of 0


## Exercise: Inner loops

For numbers *1* through *1000*, **print out how many times** each number **can be divided evenly** with the numbers ranging from *1* to *25*. A number *x* can be said to "divide evenly" by *y*, if *x / y* has no remainder.

For example, in the range of *1 – 1000*, there are 1,000 numbers that are evenly divided by the number *1*. There are 500 numbers in that range that divide evenly by *2*, and so forth.

Your output should look like this:

```sh
There are 1000 numbers divisible by 1, from 1 to 1000
There are 500 numbers divisible by 2, from 1 to 1000
There are 333 numbers divisible by 3, from 1 to 1000
...
There are 41 numbers divisible by 24, from 1 to 1000
There are 40 numbers divisible by 25, from 1 to 1000
```

__Hints__

* You'll need a loop inside your loop
* You will need a variable inside the first loop to keep track of the total number of evenly-divisible numbers.

# Use Each Instead
Not that you should forget the for loop, as it's used in most of the popular programming languages. But in Ruby, the preferred way of doing a for-type of loop is to instead use the each method.

This will become more useful when we get into collections. But we can use it with the Range (which is essentially a "collection" of integers) class that we're familiar with:

```ruby
for k in 1..100 do
   puts "#{k}. This is not as fun the each construct"
end

(1..100).each do |k|
   puts "#{k}. This is Ruby preferred way of doing loops, when possible"
end                  

(1..100).each{ |k| puts "#{k}. Curly braces make it even shorter"}
```

For just a little more practice, here is RubyMonk's section on iterating (I highly recommend you do all of Ruby Monks as we cover things in the course):
https://rubymonk.com/learning/books/1-ruby-primer/chapters/1-arrays/lessons/3-arrays-iteration

The examples here were exerpted from this resource, which is another good (although very long) resource to use:
http://ruby.bastardsbook.com/chapters/loops/
