Ruby Errors Code snippets



Ruby Errors

```ruby

Initialize Error
class Table
  attr_accessor :num_legs

  def initialize(num_legs)
    @num_legs = num_legs
  end
end
```

```ruby
Initialize Error
def initialize(num_legs)
  if num_legs > 0
    @num_legs = num_legs
  else
    nil
  end
end
```

```ruby
Initialize Error
table = Table.new(-1)
p table.num_legs
```
```ruby

Initialize Error
def initialize(num_legs)
  if num_legs > 0
    @num_legs = num_legs
  else
    @num_legs = 4
  end
end
```
```ruby


Initialize Error
def initialize(num_legs)
  if num_legs > 0
    @num_legs = num_legs
  else
    Exception.new
  end
end

```
```ruby

Initialize Error
table = Table.new(-1)
puts table.num_legs

Initialize Error
def initialize(num_legs)
  if num_legs > 0
    @num_legs = num_legs
  else
    raise "Invalid number of legs."
  end
end

```
```ruby
Initialize Error
table = Table.new(-1)

RuntimeError: Invalid number of legs

```
```ruby

Initialize Error
table = Table.new(-1)
puts "Hello world"

RuntimeError: Invalid number of legs
```
```ruby
Initialize Error
def initialize(num_legs)
    raise "Halt!"
    if num_legs > 0
        @num_legs = num_legs
    else
        raise "Invalid number of legs"
    end
end
```
```ruby
Initialize Error
def initialize(num_legs)
    raise "Halt!"
    complete nonsense
    if num_legs > 0
        @num_legs = num_legs
    else
        raise "Invalid number of legs"
    end
end
```
```ruby
Error Recovery
def add_two(number)
  unless number.respond_to? :+
    raise "Invalid argument"
  end
  number + 2
end

Error Recovery
puts add_two({})

RuntimeError: Invalid argument

```
```ruby
Error Recovery
# some previous code

puts add_two({})

# some more code (the never runs)
```
```ruby
Error Recovery
begin
  puts add_two({})
end

Error Rescue
begin
  puts add_two({})
rescue
  puts "Sorry!"
end

```
```ruby
Error Rescue
begin
  puts add_two({})
rescue
  puts "Sorry!"
end
puts "And we're back!"

```
```ruby
Error Types
def add_two(number)
  unless number.respond_to? :+
    raise ArgumentError, "Invalid argument"
  end
  number + 2
end
```
```ruby
Error Types
def add_two(number)
  if not number.respond_to? :+
    raise ArgumentError, "Invalid argument"
  elsif number == 0
    raise "I just don't like 0"
  end
  number + 2
end
```
```ruby
Error Type Rescue
begin
  puts add_two(0)
rescue ArgumentError
  puts "Sorry! My bad."
rescue
  puts "What?!"
end
```
```ruby
Error Type Rescue
begin
  puts add_two({})
rescue ArgumentError => e
  puts "You: #{e.message}. Me: Sorry!"
rescue
  puts "What?!"
end
```
```ruby
Error Backtrace
begin
  puts add_two(0)
rescue ArgumentError
  puts "Sorry!"
rescue => e
  puts "What?!"
  puts e.backtrace
end
Error Backtrace
wyncode.rb:3:in 'add_two'
wyncode.rb:11:in '<main>'

```
```ruby

Error Backtrace
def a
  b
end

def b
  c
end

def c
  d
end

def d
  raise "Boom!"
end

```
```ruby

Error Backtrace
begin
  a
rescue => e
  puts e.backtrace
end

```
```ruby

Error Backtrace
wyncode.rb:14:in 'd'
wyncode.rb:10:in 'c'
wyncode.rb:6:in 'b'
wyncode.rb:2:in 'a'
wyncode.rb:18:in '<main>'

```
```ruby

Error Backtrace
def b
  begin
    c
  rescue
    nil
  end
end

```
```ruby

Error Backtrace
def b
  c rescue nil
end

Error Backtrace
begin
  a
rescue => e
  puts e.backtrace
end

```
```ruby

Error Backtrace
def a
  b
end

def b
  c rescue nil
end

def c
  d
end

def d
  raise "Boom!"
end

Rescuing Errors
begin
  1/0
rescue ZeroDivisionError
  puts "I can't divide by zero"
end

```
```ruby

Rescuing Errors
begin
  exit
rescue SystemExit
  puts "Not so fast!"
end

```
```ruby

Rescuing Errors
begin
  exit
rescue # assumed StandardError
  puts "Not so fast!"
end


Rescuing Errors
rescue Exception
end
```
