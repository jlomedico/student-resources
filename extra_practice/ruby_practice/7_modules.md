# Modules

```ruby
module GoodNight
  def leaving
    puts "Goodnight, I had a great time!"
  end

  def guest_leaving
    puts "Goodnight, Thank you for coming!"
  end
end
```

You can think of a module as a container/file/box that stores methods. (Whatever analogy works for you.)  

Modules are very much like classes. In fact the only difference is that we can't make new modules with the new method.  

For example: `GoodNight.new` isn't allowed and doesn't do anything.  

Modules typically contain constants and/or methods.  

## Constants

```ruby
module SalesGoals
MINIMUM_QUOTA = 25

  def success
    puts "You've reached your goal for the week."
  end

  def try_harder
    puts "You didn't reach the minimum quota this week."
  end
end
```

A constant is defined in all capital letters. It is a like a variable in that it stores a value. The difference is that the value does not change once it is assigned.

Technically you can change it but if you do Ruby will warn you.

Copy the constant below into irb.

```ruby
MIMIMUM_QUOTA = 25
```

Now, reset it to 35. Notice the warning Ruby throws at you. It will change the constant but gives you plenty of notice in case you accidentally changed it and want to set it back to what it was right away.  

Now let's create a new class to use a method from our module. Here we've created a Sales Associate class.  

```ruby
class SalesAssociate
  include SalesGoals
end
```

Notice that it is empty except to include the `SalesGoals` module. We're going to use this class in a few minutes but first lets create another module. You can use multiple modules inside a class so lets practice that.

```ruby
module SalesHistory

def august
  puts "You met your sales quota 4/4 weeks!"
  end

  def september
  puts "You met your sales quota 2/4 weeks!"
  end
end
```

Now lets add that to our `SalesAssociate` class as well.

```ruby
class SalesAssociate
  include SalesGoals
  include SalesHistory
end
```

Now the `SalesAssociate` is able to utilize the method inside the `SalesGoals` module as well as the methods inside the `SalesHistory` module.

Now lets instantiate an actual `SalesAssociate`.

```ruby
Joe = SalesAssociate.new
```

Let's try the methods from our modules and see if they work.

```ruby
Joe.august
Joe.success
Joe.september
Joe.try_harder
```

These will work because we included them in our class!

When we use a module this way its often called a mixin. We are taking a class and mixing in methods from the module.

So far we've been testing this code in irb. But what if I want it to exist in an actual Ruby program?

Copy and paste the `SalesAssociate` class into a file and save it as `SalesAssociate.rb`

```ruby
class SalesAssociate
  include SalesGoals
  include SalesHistory
end
```

Copy the `SalesGoals` module into another file and save it as `salesgoals.rb` in the same directory.

Copy the `SalesHistory` module into another file and save it as `salesassociate.rb` in the same directory.

In your .rb file place this at the top `require './salesgoals'`.

The `require` just lets Ruby know that you *require* the code in the other file. It makes it accessible to your current file. Note that you don't have to include the .rb file ending.

The `./` is telling the location of the file. This shows that it is in the current directory. If the file is saved in another directory, as in the folder above the one you are in, you would place two dots in front as in `../`

Type the following into the file:
```ruby
Joe = SalesAssociate.new
Joe.success
```
Open up terminal and run the file. You should see the success method from the `SalesGoals` module appear on the screen. Now that we required the file, we have access to it inside of the class!

Follow the same steps with the `saleshistory.rb` file to access its methods.

## Accessing a Constant

Here we have a module called `Birthdate` and inside it is a year which will not change. A birthdate is pretty constant.

Copy the text below into irb.
```ruby
module Birthdate
  YEAR_BORN = 1953
end
```
Now, try to access the constant `YEAR_BORN` by typing that into irb.

You should have gotten an error.

Type the following into irb:
```ruby
Birthdate::YEAR_BORN
```

Now you can access that constant! What's gong on here? The `::` is called a *scope resolution operator*. It allows us to tell Ruby where to look for the item we are looking for. It was created in the birthdate module so by giving that name and the constant, separated by the `::` we are giving directions to its location.

## Namespacing

Namespacing is a way of, well, making a *named space* for you to locate items in. This keeps you from overwriting methods with the same names.

Create a new file called `greet.rb` and paste the following code into it.

```ruby
def greet
  puts "Hi, how are you?"
end

def greet
  puts "I'm fine thanks, how are you?"
end

greet
```

Run the file and check out your results? What happened? Only the second greet ran. Basically the second method replaced the first one.

Namespacing would prevent this. By placing one method inside a module I would be able to use them both *even though* they have the same name!

Let's do that. Enclose the first method inside a module called `GoodMorning` like so.

```ruby
module GoodMorning
  def greet
    puts "Hi, how are you?"
  end
end

def greet
  puts "I'm fine thanks, how are you?"
end
```

Now, go ahead and call these? Hopefully you remember how but here is the code below.

```ruby
GoodMorning.greet
greet
```

Whoa, whoa, whoa! Whats going on here? We're getting an error: `private methodgreet called for GoodMorning:Module (NoMethodError)`

Didn't I just say that by placing one method inside the module you would be able to use them both even though they have the same name. That *is* true but our method inside the module is missing one key piece, `self`.

Modify the existing code to include `self` like in the example below.

```ruby
module GoodMorning
def self.greet
  puts "Hi, how are you?"
end
end

def greet
  puts "I'm fine thanks, how are you?"
end

GoodMorning.greet
greet
```

Works like a charm. So what is going on here? What is this mysterious `self` and what is it doing? In basic terms `self` attaches the method to the module. It's like saying, "I am the method called `greet` that belongs to the `GoodMorning` module." You can use me but you have to be sure to tell Ruby where to find me!
