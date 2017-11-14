Code snippets ruby_variables_cheatsheet
```ruby
irb(main):001:0> 40 * 0.20

irb(main):002:0> 40 + 8.0

irb(main):003:0> 48.0 / 3

```

```ruby
tip = 40 * 0.20
total = 40 + tip
my_share = total / 3
puts my_share
```

```ruby
bill = 40
num_people = 3
tip_percent = 0.20

tip = bill * tip_percent
total = bill + tip
my_share = total / num_people
puts my_share

```

```ruby
age = 12

puts "I'm " + age.to_s + " years old"


```

```ruby
age = 12

puts "I'm #{age} years old"

# This does not work as expected.
puts 'I\'m #{age} years old'

```

```ruby
arr = [1,2,3]
p arr.delete(3)
p arr


```

```ruby
str = "ACME Supplies"
puts str.downcase
puts str
str.downcase!
puts str

```

```ruby
a = 1
a.next
puts a

```

```ruby
a = 1
a = a.next
puts a

```

```ruby
a = 1
a = a + 1
puts a

a = a + 2
a = a - 1


```

```ruby
a = 1
a += 1 # same as a = a + 1
puts a

a -= 2 # same as a = a - 2
puts a

```

```ruby
a = [1,2,3]
a += [4,5,6]
p a

```

```ruby
b = nil
b ||= 1 # same as "b = b || 1"
puts b

c ||= 2
puts c

```

```ruby
c = 1
c ||= 2 # default c to 2
puts c

c = false
c ||= 2 # default c to 2
puts c


```

```ruby
CONST = 1
CONST = 2

wyncode.rb:2: warning: already initialized constant C
wyncode.rb:1: warning: previous definition of C was here
2

```

```ruby
Math::PI
Math::E

```
