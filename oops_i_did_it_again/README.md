# OOPs, I Did It Again

The purpose of this breakout is to review OOP and better explain _why_ behind we prefer Classes and Objects.

At first glance, Classes, Objects, instance methods, instance variables, etc. can seem abstract and confusing. It can feel like an advanced technique that doesn't apply to your code.

In this exercise we'll demonstrate how OOP provides useful tools to developers of all experience levels.

## Primitive Techniques

Imagine that we are building an online celebrity fan site. We need a way to store information about celebs. 

### Using Normal Variables
How can we store information about celebrities using vanilla variables?

```ruby
britney_name = 'Britney Spears'
britney_age = 35
```

This is simple enough, but things get quite complicated as we add more and more celebs:

```ruby
johnny_name = 'Johnny Depp'
johnny_age = 53

leo_name = 'Leonardo DiCaprio'
leo_age = 42
```
Clearly, this is unwieldy.

### Enter Hashes, stage left

```ruby
britney = {}
britney[:name] = 'Britney Spears'
britney[:age] = 35
# similarly: 
# britney = {name: 'Britney Spears', age: 35}

johnny = {}
johnny[:name] = 'Johnny Depp'
johnny[:age] = 53
# similarly: 
# johnny = { name: 'Johnny Depp', age: 53 }
```

Already we can see this working much better.  Our code is clearly better _organized_ because we have just one variable per celeb. It's also more concise if we create the Hash in a single line.

But it's also more powerful. Every year we need to increment every celeb's birthday. Since each celeb is a single variable, we can put them all into an `Array` and loop over them.

 ```ruby
 celebs = [britney, johnny]

 celebs.map do |celeb|
   celeb[:age] += 1 # another year older
 end
 ```

So this works pretty well! However, we're going to have a problem handling the ages. Every year we need to remember to run this loop to update everyone's age. Since everyone has a different birthday, if we only update once a year, their ages will be incorrect for large chunks of the year.

Hashes aren't _smart_ enough.

> How can we make our program smarter? 

To handle this better, instead of storing each celeb's age, we should be storing their birthdates...
```ruby
britney[:birthday] = Time.new(1981, 12, 2) # Britney's actual birthday
```

... and _calculating_ each birth**day** when we need it (much like some humans do):
```ruby
# calculate Britney's age in years
((Time.now - britney[:birthday]) / 60 / 60 / 24 / 365).to_i
```

This code, when given a celeb's birthday, returns their age in years. This sounds useful, so let's shove it into a method so we can reuse it for all of our celebs:

```ruby
def get_age(birthday)
  ((Time.now - birthday) / 60 / 60 / 24 / 365).to_i
end
```

This is great! We have defined an easy way to calculate anyone's age. 

But there's a problem. Calculating someone's age is _separated_ from that person. In other words, every time we "meet a new person", we're respoinsible for asking for their birthday and calculating their age with `get_age`.

In real life, we don't calculate ages. People should _know_ their ages. People should be responsible for calculating their own ages (from their birth dates). We just ask for an age, and _they_ have to figure it out.

This brings us to our first revelation of what makes Classes so valuable.

## Classes

As we've learned, classes allow us to add _behavior_ to our data types. Let's make a class to represent our celebs:

```ruby
class Celeb
end
```

Every instance of a class is going to have a name. I want to be able to say `celeb.name` and have it return their name. Recalling that this is how we call methods on objects, we can tell that we want a `name` method available on our celebs:

```ruby
class Celeb
  def name
    @name
  end
end
```

```ruby
celeb = Celeb.new
p celeb.name
```

Unfortunately, this code returns `nil` when we try to check for a celeb's name. We haven't set it yet. Let's try to set it.

```rb
celeb.name = "Britney Spears"
```

This generates an error: `NoMethodError: undefined method 'name=' for #<Celeb:0x007fbb52113d38>`

Ruby is literally trying to call a method `.name=`, which we haven't defined. So let's try defining it:

```ruby
class Celeb
  # get the name
  def name
    @name
  end
  
  # set the name
  def name=(arg)
    @name = arg
  end
end
```

Great! We've defined a method to _get_ a celeb's name and a method to _set_ a celeb's name. This code makes a celeb's name fully _accessible_. Now we just need to do the same thing for a celeb's birthday.

```ruby
class Celeb
  # get name
  def name
    @name
  end
  
  # set name
  def name=(arg)
    @name = arg
  end
  
  # get birthday
  def birthday
    @birthday
  end
  
  # set birthday
  def birthday= (arg)
    @birthday = arg
  end
end
```

This class mimics the capabilities of our previous hashes:

```ruby
britney = Celeb.new
britney.name = "Britney Spears"
britney.birthday = Time.new(1981, 12, 2)
p britney
```

Now let's teach our celebrities how to calculate their own ages. Let's give them an `.age` method!

```ruby
class Celeb
  #
  # ... getter/setter methods up here ... 
  #
  
  # calculate your age in years from your birthday
  def age
    ((Time.now - @birthday) / 60 / 60 / 24 / 365).to_i
  end
end
```

And now... drumroll please!
```ruby
britney = Celeb.new
britney.name = "Britney Spears"
britney.birthday = Time.new(1981, 12, 2)
p britney.age 
```

Violá! We taught celebs how to calculate their own ages. That's one less thing we have to worry about. And that's at the heart of OOP. Both objects and hashes can _store_ things, but only objects can _do_ things.

I _abstracted_ the math away. I know it's there, but I don't have to look at it or worry about it. I don't have to calculate `((Time.now - Time.new(1981, 12, 2)) / 60 / 60 / 24 / 365 ).to_i`. And I don't have to keep tabs on a `get_age` method so that I can use it whenever I hear a celeb's birthday.

### Making Things Easier: `attr_accessor`

Take a look at this code:

```ruby
class Celeb
  # get name
  def name
    @name
  end
  
  # set name
  def name=(arg)
    @name = arg
  end
  
  # get birthday
  def birthday
    @birthday
  end
  
  # set birthday
  def birthday= (arg)
    @birthday = arg
  end
end
```

Doesn't this code feel... _wet_? Imagine if we wanted to add more attributes, like gender, birthplace, etc. Adding all these _getters_ and _setters_ to make simple attributes _accessible_ is a pain.

Instead of having to repeatedly create a couple of methods for every attribute, Ruby gives us an amazing tool called an attribute _accessor_ that handles making these attributes for us. Take a look:

```ruby
class Celeb
  attr_accessor :name, :birthday
end
```

This works exactly like before. 

```ruby
britney = Celeb.new
britney.name = "Britney Spears"
britney.birthday = Time.new(1981, 12, 2)
p britney.age
```

It makes it easy to add additional attributes as well:

```ruby
class Celeb
  attr_accessor :name, :birthday, :gender
end
```

## Making Things Easier: `initialize`

One more convoluted thing we have to worry about is the process we go through every time we want to create a new celeb:

```ruby
angie = Celeb.new
angie.name = 'Angelina Jolie'
angie.birthday = Time.new(1975, 6, 4) # Angie's actual birthday
angie.gender = 'female'
```

See that `.new` method we're calling? When we call it for `Time`, we pass it everything it needs right there ...

```rb
t = Time.new(1975, 6, 4)
```

... instead of having to do this:

```
t = Time.new
t.year = 1975
t.month = 6
```

But when we use `Celeb.new` we don't have that power.

Again, Ruby gives us a simple way hook into that `new` method, and it's called the `initialize` method.

```ruby
class Celeb
  def initialize(name, bday, gender)
    @name = name
    @birthday = bday
    @gender = gender
  end
end
```

Now, we can make new celebs in one line:

```ruby
angie = Celeb.new("Angelina Jolie", Time.new(1975, 6, 4), "female")
p angie.age, angie.name, angie.gender
```

## Review

We've covered a few ways that OOP makes our lives easier:

1. `Class`es and `Object`s provide a more convenient way of storing and retrieving data (think `celeb.name` instead of `celeb[:name]`)
2. Unlike `Hash`es, we can teach `Object`s how to _do things_ by giving them methods. They _abstract_ complicated operations away from us by hiding the details within the `Class`.
3. `Class`es have many convenience methods like `attr_accessor` (`attr_reader`, `attr_writer) and `initialize` that make using `Object`s to store data easy (perhaps easier than storing data in other data structures, like `Hash`es and `Array`s).
