#### Blocks

Block - a chunk of code between a `do` and `end` or between two curly braces `{}`. The curly braces serve the same purpose as the `do` and `end`.  

Typically blocks that will span multiple lines are place between `do` and `end`. If the block will fit on one line (inline), curly braces are used.  

Examples of blocks:  

A multiline block:  
```ruby
[1,2,3,4,5,6,7,8,9,10].each do |x|
puts "This is number #{x}!"
end
```

An inline block:  
```ruby
["a", "b", "c"].each { |l| puts "I'm #{l}!" }
```

Blocks take in a between pipes. This is called a block parameter but you can think of it like a placeholder. It's value is going to be *each* of the things that it goes over as it is going over them.  

Another way to look at it is like a magnifying glass which hovers over each item. It looks at that item, pauses over it, runs the code, then moves on to the next one.  


#### Yielding to a block.

This block contains a yield. We see a line of code that should run. Then we see a yield. Then we see a block that is going to be the third line of code. This should tell us that the yield is going to run something before this for us.

```ruby
def test_block
puts "I am the first line of code"
yield
puts "I am going to be the third line of code"
end

test_block
```

Try running the code above. What error do you get?  
_Once you place a yield in your method it becomes mandatory and the method will expect it._  


Now, lets try giving it a block. Notice that we give the block to the method when we _call_ the method.


```ruby
def test_block
puts "I am the first line of code"
yield
puts "I am going to be the third line of code"
end


test_block {puts "I am the second line of code. I was inserted by the yield"}
```
************************************************************************************************

You cannot send a block to a method if you haven't specified the yield first. Lets look at the same method except that it doesn't have a yield.

```ruby
def test_block
puts "I am the first line of code"
puts "I am going to be the third line of code"
end
```

Let's go ahead and try to pass it a block.
```ruby
test_block {puts "I am the second line of code. I was inserted by the yield"}
```
What happens?

************************************************************************************************

What about if you're not sure if you want to give it a block or not? In that case you can use the block_given?

```ruby
def test_block
  puts "I am the first line of code"
  if block_given?
    yield
  end
end

test_block
```
Try running this again WITH a block.
```ruby
test_block {puts "I'm the second line of code!"}
```
