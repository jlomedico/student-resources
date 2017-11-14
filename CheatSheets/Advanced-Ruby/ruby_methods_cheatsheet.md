Ruby Methods Code snippets

```ruby
"".size

"".method("size")
"".method("size").class
"".method("size").methods

"".method(:size)

```

```ruby
def add_two(number)
  puts number + 2
end

add_two(1)


```

```ruby
def add_two(number)
  puts number + 2
end

add_two(1)

```

```ruby
def add_two(number)
  puts number + 2
end

puts number

```

```ruby
# Adds 2 to the number.
def add_two(number)
  number + 2
end

puts add_two(1)

```

```ruby
# Adds 2 to the number.
def add_two(number)
  (number + 2) unless number.nil?
end

puts add_two(nil)

```

```ruby
# Adds 2 to the number.
def add_two(number)
  if number.class == Fixnum
    number + 2
  end
end

```

```ruby
# Adds 2 to the number.
def add_two(number)
  if number.respond_to? :+
    number + 2
  end
end

```

```ruby
# Adds 2 to the number.
def add_two(number)
  if number.respond_to? :+
    if number.respond_to? :push
      number.push 2
    else
      number + 2
    end
  end
end

```

```ruby
puts add_two(1)
puts add_two(1.0)
puts add_two(nil)
puts add_two({})
puts add_two([])
puts add_two(true)

```

```ruby
def test
    puts add_two(1)
    puts add_two(1.0)
    puts add_two(nil)
    puts add_two({})
    puts add_two([])
    puts add_two(true)
end

```

```ruby
puts add_two("")

```

```ruby
puts add_two(1)
puts add_two(1.0)
puts add_two(nil)
puts add_two({})
puts add_two([])
puts add_two(true)
puts add_two("")

```

```ruby
# Add 2 to the number.
def add_two(number)
 ...
end

```

```ruby
puts add_two(1)
puts add_two(1.0)
puts add_two(nil)
puts add_two({})
puts add_two("")
puts add_two([])
puts add_two(false)

```

```ruby
def add_two
  …
end

def test_add_two
 …
end

```

```ruby
def one
  1
end

def one
  0+1
end

```

```ruby
def find_ten
    i = 0
    loop do
        if i == 10
            return i
        end
        i += 1
    end
end


```

```ruby
begin
    puts "Hello world"
end


```

```ruby
block = begin
    puts "Hello world!"
    0
end

puts block


```

```ruby
5.times do
  puts "Hello"
end

```

```ruby
def say_hello(argument)
    puts "Hello #{argument}"
end

say_hello_method = method(:say_hello)
5.times &say_hello_method

```

```ruby
5.times do
  puts "Hello"
end

```

```ruby
def say_hello(argument)
    puts "Hello #{argument}"
end

say_hello_method = method(:say_hello)
5.times &say_hello_method

```

```ruby
5.times do
  puts "Hello"
end

```

```ruby
5.times { puts "Hello" }

5.times {
  puts "Hello"
  puts "World"
}

```

```ruby
5.times do |number|
    puts "Hello #{number}"
end
```


```ruby
5.times { |number|
    puts "Hello #{number}"
}

```


```ruby
5.times.class
([].methods - 5.times.methods).count

5.times.to_a == [0,1,2,3,4]
```


```ruby
5.times.to_a == (0..4).to_a

(0..4).to_a == [0,1,2,3,4]

(0...4).to_a == [0,1,2,3]

```


```ruby
(1..100).to_a

("a".."z").to_a

(:a..:z).to_a

```


```ruby
[1,2,3,4,5].each { |number|
  puts "Counted to #{number}..."
}

(1..5).each {|i| puts i }


```


```ruby
(1..5).each {|num|
  if num.even?
    puts "Even"
  else
    puts "Odd"
  end
}

```


```ruby
for num in (1..5)
  puts num
end

(1..5).each { |num|
  puts num
}


```


```ruby
(1..5).each {|num|
  if num.even?
    puts "Even"
  else
    puts "Odd"
  end
}

```


```ruby
result = (1..5).map do |num|
  if num.even?
    "Even"
  else
    "Odd"
  end
end

puts result

```


```ruby
puts (1..5).map do |num|
  num.even? ? "Even" : "Odd"
end


```


```ruby
puts (1..5).select { |num|
  num.even?
}

puts (1..5).reject { |num|
  num.even?
}

```


```ruby
puts [1,2,3].any? {|n| n.even? }
puts [1,2,3].all? {|n| n.even? }
puts [1,2,3].one? {|n| n.even? }
puts [1,2,3].none? {|n| n.zero? }

```


```ruby
def puts_block
  puts yield
end

puts_block { "Hello world!" }


```


```ruby
def puts_block
    if block_given?
        puts yield
    else
        puts "No block given."
    end
end

puts_block { "Hello world!" }
puts_block


```


```ruby
def puts_hello_wyncode
    if block_given?
        puts yield "Wyncode"
    else
        puts "No block given."
    end
end

puts_hello_wyncode { |name| "Hello #{name}" }


```


```ruby
def puts_hello_wyncode
    if block_given?
        puts yield "Hello", "Wyncode"
    else
        puts "No block given."
    end
end

puts_hello_wyncode { |greeting, name| "#{greeting} #{name}!" }

```


```ruby
module AlphabetTesters
  def self.a?(letter)
      letter.downcase == "a"
  end

  def self.b?(letter)
      letter.downcase == "b"
  end
end

```


```ruby
# alphabet_testers.rb
module AlphabetTesters
  #…
end

```


```ruby
require "./alphabet_testers.rb"

puts AlphabetTesters.a?("a")


```


```ruby
module AlphabetTesters
  def self.print(something)
      puts "Printing this #{something}"
  end
end

```


```ruby
require "./alphabet_testers.rb"
print "a"
AlphabetTesters.print("a")

```

```ruby
Kernel.puts "Hello"
puts "Hello"

```

```ruby
require "./alphabet_testers.rb"
include AlphabetTesters

puts b?("b")

```

```ruby
require "./alphabet_testers.rb"
include AlphabetTesters

puts b?("b")
puts AlphabetTesters.a?("A")

```

```ruby
  def b?(letter)
      letter.downcase == "b"
  end

  def self.b?(letter)
      letter.downcase == "b"
  end

```

```ruby
require "./alphabet_testers.rb"
puts AlphabetTesters.b?("b")

include AlphabetTesters
puts b?("b")


```

```ruby
puts add_two

wrong number of arguments (0 for 1)

```

```ruby
def add_two(number = 0)
  number + 2
end

puts add_two(1)

puts add_two

```

```ruby
puts add_two(1, 2)

wrong number of arguments (2 for 0..1)

```

```ruby
def add_two(number = 0, *rest)
  number + 2
end

```

```ruby
def add_two(number = 0, *rest)
  if rest.size > 0
    puts "Seriously? #{rest}"
  end
  number + 2
end

puts add_two(1)
puts add_two
puts add_two(1, 2)


```

```ruby
[].push(1,2,3,4)

```

```ruby
def add_two(number = 0,
  strings_are_ok=false,
  arrays_are_ok=false,
  nils_are_ok=false)
  number + 2
end

```

```ruby
def add_two(number = 0, options = {})
  number + 2
end

puts add_two(1)

puts add_two("1", {strings_ok: true})
puts add_two([1], {arrays_ok: true})

puts add_two("1", strings_ok: true)
puts add_two([1], arrays_ok: true)

```

```ruby
def add_two(number = 0, options = {})
  if options[:strings_ok]
    # support string arguments
  elsif options[:arrays_ok]
    # support Array arguments.
  else
    number + 2
  end
end


```

```ruby
def add_two(number = 0, options = {})
  default_options = {strings_ok: false, arrays_ok: false}
  options = default_options.merge(options)
  # option if statements
end

# Makes heroic efforts to add two to your argument.
def add_two(number = 0, options = {}, *rest)
  # merge with default options
  # keep or ignore the "rest" of the arguments
  # check the options
  # if the option is on, figure out what to do
    # e.g. check respond_to? and look for alternatives
  # just add two
end


```

```ruby
# Adds 2 to the number,
# which it assumes is numeric.
def add_two(number)
  puts number + 2 unless number.nil?
end

```
