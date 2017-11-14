Ruby Control Flow Code snippets

```ruby
dead_people = [
  "Ethel", "Mortimer", "Buford"
]

alive_people = [
  "Kelly", "Joe", "Megan"
]

```

```ruby
dead_people.include? "Mortimer"

dead_people.include? "Kelly"

```

```ruby
name = "Mortimer"

if dead_people.include? name then
  puts "Don't send questionnaire to #{name}."
end


```

```ruby
name = "Mortimer"

if dead_people.include? name
  puts "Don't send questionnaire to #{name}."
end

```

```ruby
if dead_people.include? name
  puts "Don't send questionnaire to #{name}."
end

if alive_people.include? name
  puts "Send questionnaire to #{name}."
end

```

```ruby
if dead_people.include? name
  puts "Don't send questionnaire to #{name}."
else
  puts "Send a questionnaire to #{name}."
end

```

```ruby
dead_people = ["Ethel", "Mortimer", "Buford"]
alive_people = ["Kelly", "Joe", "Megan"]
sick_people = ["Kelly", "Joe"]

```

```ruby
dead_people = ["Ethel", "Mortimer", "Buford"]
alive_people = ["Kelly", "Joe", "Megan"]
sick_people = alive_people.slice(0, 2)

```

```ruby
if dead_people.include? name
  puts "Don't send questionnaire to #{name}."
elsif sick_people.include? name
  puts "Don't send a questionnaire to #{name} yet."
else
  puts "Send a questionnaire to #{name}."
end

```

```ruby
country = "us"
if country == "us"
  puts "Hello"
elsif country == "es"
  puts "Hola"
elsif country == "fr"
  puts "Bonjour"
else
  puts "Alo"
end

```

```ruby
case country
when "us"
  puts "Hello"
when "es"
  puts "Hola"
when "fr"
  puts "Bonjour"
else
  puts "Alo"
end

```

```ruby
if not dead_people.include? name
  puts "Send a questionnaire to #{name}."
end

```

```ruby
unless dead_people.include? name
  puts "Send a questionnaire to #{name}."
end


```

```ruby
if false
  complete nonsense
else
  puts "Hello world!"
end

```

```ruby
if alive_people.include? name
  puts "Questionnaire for #{name}"
  puts "Question 1: ..."
end

```

```ruby
if alive_people.include? name
  unless sick_people.include? name
  puts "Questionnaire for #{name}"
  puts "Question 1: ..."
  end
end

```

```ruby
if alive_people.include? name
  puts "Questionnaire"
end

puts "Questionnaire" if alive_people.include? name

```

```ruby
if alive_people.include? name
  message = "#{name} is alive!"
else
  message = "Sorry for your loss."
end
puts message


```

```ruby
message = if alive_people.include? name
            "#{name} is alive!"
          else
            "Sorry for your loss."
          end
puts message

```

```ruby
message = is_alive ? "Alive!" : "Sorry!"

puts message

```

```ruby
# this code is dangerous!
loop do
  puts "Hello world!"
end

```

```ruby
i = 0
while i < 11
  puts i
  i += 1
end

```

```ruby
i = 0
until i >= 11  # same as "while not
               # i >= 11"
  puts i
  i += 1
end

```

```ruby
i = 0
puts "#{i+=1}" while i < 10

i = 0
puts "#{i+=1}" until i == 10

```

```ruby
for name in alive_people
  puts "Send questionnaire to #{name}"
end

```

```ruby
break
  Break out of a loop.
next
  Go to the next loop.
redo
  Redo the current loop.

```

```ruby
for name in alive_people
  alive_people.index name
end

```
