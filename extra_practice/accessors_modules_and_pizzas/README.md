
## Introduction

Scope: To clarify Object Oriented programming terms and meaning,as well as implementation.

 Classes, Instances, Class methods, Instance variables, cognitive overload, saturation, wait...did I mentioned that I am hungry?


## First Iteration

 A class is used to construct an object. A class is a blueprint for an object. For example, you might use a Dog class to make dozens of different dogs, and each dog might have its own color, size, shape, name, and so on. An object is an instance of a class.


### Read this very carefully, it's a brain bender!

<i>Classes in Ruby are first-class objects - each is an instance of class Class.</i>

Wait, WAT?


When a new class is defined (typically using class TheNameThatIChoseGoesHere ... end), an object of type Class is created and assigned to a constant (TheNameThatIChoseGoesHere in this case).

When TheNameThatIChoseGoesHere.new is called to create a new object, the new class method in Class is run by default, which in turn invokes allocate to allocate memory for the object, before finally calling the new object's initialize method.

The constructing and initializing phases of an object are separate and both can be over-ridden. The construction is done via the new class method, the initialization is done via the initialize instance method. <i>Initialize is not a constructor!</i>



### So we define the class Dog
```
class Dog
  def initialize(breed, name)
    # Instance variables
    @breed = breed
    @name = name
  end

  def bark
    puts 'Ruff! Ruff!'
  end

  def display
    puts "I am of #{@breed} breed and my name is #{@name}"
  end
end
```

### Now we make an object.
```
my_shiny_new_dog = Dog.new('Labrador', 'Napoleon')
```

The methods object_id and respond_to? are important.
Every object in Ruby has a unique id number associated with it
```
puts "The id of my_shiny_new_dog is #{my_shiny_new_dog.object_id}."
```
Ready for more dogs, I meant objects?
```
my_newer_and_even_shinier_dog = Dog.new('Vizla', 'Pika')

puts "The id of my_newer_and_even_shinier_dog is #{my_newer_and_even_shinier_dog.object_id}."
```



 To know whether the object knows how to handle the message you want
 to send it, by using the respond_to? method.
```
if my_shiny_new_dog.respond_to?("talk")
  my_shiny_new_dog.talk
else
  puts "Sorry, my_shiny_new_dog doesn't understand the 'talk' message."
end
```
 So we get "Sorry, my_shiny_new_dog doesn't understand the 'talk' message." because talk is not a 'message' or class method of the class Dog.

 Now let's try a 'known' class method.
```
if my_shiny_new_dog.respond_to?("bark")
  my_shiny_new_dog.bark
else
  puts "Sorry, my_shiny_new_dog doesn't understand the 'talk' message."
end
```

 So we get as a response 'Ruff! Ruff' which is the expected behavior.

Making my_shiny_new_dog a nil reference, meaning it does not refer to anything
If I now say

```
my_shiny_new_dog = nil
my_shiny_new_dog.display
puts "The id of my_shiny_new_dog is #{my_shiny_new_dog.object_id}."
```

#### Something went terribly wrong!
  the Dog object has been abandoned and now is eligible for Garbage Collection (GC)
Ruby's GC is called mark-and-sweep. The "mark" stage checks objects to see if they are still in use. If an object is in a variable that can still be used in the current scope, the object (and any object inside that object) is marked for keeping. If the variable is long gone, off in another method, the object isn't marked. The "sweep" stage then frees objects which haven't been marked.



You can ask any object of which class it's a member by using its Object.class method. In the above program, if we write the statement:
```
my_newer_and_even_shinier_dog.class
```
 And even:
 ```
my_newer_and_even_shinier_dog.class.class
```

## As a Second Iteration, let's take a look at Class Methods

 The idea of a class method is that you send a message to the object that is the class rather than to one of the class's instances. Class methods serve a purpose. Some operations pertaining to a class can't be performed by individual instances of that class. new is an excellent example. <i>We call Dog.new because, until we've created an individual dog instance, we can't send it any messages!</i> Besides, the job of spawning a new object logically belongs to the class. It doesn't make sense for instances of Dog to spawn each other. It does make sense, however, for the instance-creation process to be centralized as an activity of the class Dog.

 It's vital to understand that by Dog.new, we have a method that we can access through the class object Dog but not through its instances. Individual dog objects (instances of the class Dog) do not have this method. A class object (like Dog) has its own methods, its own state, its own identity. It doesn't share these things with instances of itself.

 Here's an example:
```
Dog#bark #- the instance method bark in the class Dog
Dog.breed #- the class method breed, in the class Dog

Dog::breed #- another way to refer to the class method breed
:: is called unary operator.
```



# PART 2
 Programmers use the term syntactic sugar to refer to special rules that let you write your code in a way that doesn't correspond to the normal rules but that is easier to remember how to do and looks better.

 Let us say we want to set the name of a dog. As a starting point, name can be set along with everything else at object creation time, as in the example below.


 So what are setters, getters, and all that...?

 Just syntactic sugar:

```
class Dog
  def initialize(breed, name)
    @breed = breed
    @name = name
  end

  def name
    @name
  end

  Override !!!
  def name=(name_for_the_dog)
    @name = name_for_the_dog
  end
end
new_dog = Dog.new('Doberman', 'Napoleon')

puts new_dog.name

new_dog.name = 'Nero'


puts new_dog.name
```

 Now lets use the 'real' conventions
 ==============================================================

```
class Dog
 getter method
  attr_reader :breed, :name    create reader only

  def initialize(breed, name)
    @breed = breed
    @name = name
  end
end
 This works
new_dog = Dog.new('Doberman', 'Napoleon')
puts new_dog.name
```
 Could I say?
 ```
new_dog.name = 'Nero'
```
 ##### NOPE!
 I would get a big
 ```
 NoMethodError: undefined method `name=' for <Dog:0x007fa8e9411380 @breed="Doberman", @name="Napoleon">
```


 Let's write a set_name method that allows us to set, or reset, the name of an existing dog. We'll also rewrite the initialize method so that it doesn't expect a name:


```
class Dog
 setter method
  attr_writer :breed, :name    create writer only

  def initialize(breed, name)
    @breed = breed
    @name = name
  end
end
new_dog = Dog.new('Doberman', 'Napoleon')

puts new_dog.name
```
 Could I say Now?
 ```
new_dog.name = 'Nero'
```
 YES!, because I am allowing name to be a an attribute writer

 ==============================================================

 As a shortcut:

```
class Dog
  attr_accessor :breed, :name

  def initialize(breed, name)
    @breed = breed
    @name = name
  end
end
new_dog = Dog.new('Doberman', 'Napoleon')

puts new_dog.name
new_dog.name = 'Nero'
puts new_dog.name
```


=========================PIZZAZZZZZ==================================


 Namespacing is a way of bundling logically related objects together. Modules serve as a convenient tool for this. This allows classes or modules with conflicting names to co-exist while avoiding collisions. Think of this as storing different files with the same names under separate directories in your filesystem.

 Modules can also hold classes. In this example, we'll try and define an Array class under our Perimeter module from the last lesson. Notice how it does not affect Ruby's Array class at all.


 This is pizza_classes.rb

```
    class Pizza
    def eat
      puts "10 slices for you, W0000T"
      10
    end
  end


  class Pizza
    def eat
       puts "1 slice for you, don't be a pig"
       1
    end
  end


def one_slice
  puts "I want only 1 slice, I am hungrish!\n"

  slice_o_pizza = Pizza.new
  if slice_o_pizza.eat == 1
    puts " OM NOM NOM\n"
  else
    "There is too much pizza!\n"
  end
end

def a_box
  puts "I want 10 slices, I am hungry!"
  box_o_pizza = Pizza.new

  if box_o_pizza.eat == 10
    puts "Very Happy Pizza Added! \n"
  else
    puts "Hey! ....Whatever happened to my 10 slices...I have been coding for HOURS. I am HAANGRY!\n"

  end
end


one_slice
a_box
```



 Houston!, We DO have a problem! It  is ALL mixed. No good.
 How can we separate this? Enter Modules and namespaces.
 And also the Unary operator



 The :: is a unary operator that allows: constants, instance methods and class methods defined within a class or module, to be accessed from anywhere outside the class or module.

 :: is basically a namespace resolution operator. It allows you to access items in modules, or class-level items in classes. For example, say you had this setup:

```
module SomeModule
    module InnerModule
        class MyClass
            CONSTANT = 42
        end
    end
end
```
 You could access CONSTANT from outside the module as:
```
SomeModule::InnerModule::MyClass::CONSTANT
```
 It doesnt affect instance methods defined on a class, since you access those with a different syntax (the dot .).
### Let's see this at work!
 This is pizza_classes_module.rb
```
module EatPizzaByTheBox
  class Pizza
    def eat
      puts "10 slices for you, W0000T"
      10
    end
  end
end

module EatASliceOfPizza
  class Pizza
    def eat
       puts "1 slice for you, don't be a pig"
       1
    end
  end
end


def one_slice
  puts "I am Dev 1, and I want only 1 slice, I am hungrish!\n"

  slice_o_pizza = EatASliceOfPizza::Pizza.new
  if slice_o_pizza.eat == 1
    puts " OM NOM NOM\n"
  else
    "There is too much pizza!\n"
  end
end

def a_box
  puts "I am Dev 2, and I want 10 slices, I am hungry!"
  puts "I want 10 slices, I am hungry!"
  box_o_pizza = EatPizzaByTheBox::Pizza.new

  if box_o_pizza.eat == 10
    puts "Very Happy Pizza Added! \n"
  else
    puts "Hey! ....Whatever happened to my 10 slices...I have been coding for HOURS. I am HAANGRY!\n"

  end
end


one_slice
puts "\n"
a_box
```

