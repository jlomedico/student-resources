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


my_shiny_new_dog = Dog.new('Doberman', 'Napoleon')

puts "The id of my_shiny_new_dog is #{my_shiny_new_dog.object_id}."


my_newer_and_even_shinier_dog = Dog.new('Vizla', 'Pika')

puts "The id of my_newer_and_even_shinier_dog is #{my_newer_and_even_shinier_dog.object_id}."



if my_shiny_new_dog.respond_to?("talk")
  my_shiny_new_dog.talk
else
  puts "Sorry, my_shiny_new_dog doesn't understand the 'talk' message."
end


if my_shiny_new_dog.respond_to?("bark")
  my_shiny_new_dog.bark
else
  puts "Sorry, my_shiny_new_dog doesn't understand the 'talk' message."
end


my_shiny_new_dog = nil
my_shiny_new_dog.display
puts "The id of my_shiny_new_dog is #{my_shiny_new_dog.object_id}."

my_newer_and_even_shinier_dog.class

my_newer_and_even_shinier_dog.class.class

