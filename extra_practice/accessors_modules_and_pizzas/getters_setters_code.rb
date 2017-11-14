class Dog

  def initialize(breed, name)
    @breed = breed
    @name = name
  end

  def name
    @name
  end


  def name=(name_for_the_dog)
    @name = name_for_the_dog
  end
end
new_dog = Dog.new('Doberman', 'Napoleon')

puts new_dog.name

new_dog.name = 'Nero'


puts new_dog.name


# ==============================================================

class Dog
  attr_reader :breed, :name   # create reader only

  def initialize(breed, name)
    @breed = breed
    @name = name
  end
end

new_dog = Dog.new('Doberman', 'Napoleon')
puts new_dog.name


new_dog.name = 'Nero'



class Dog
# setter method
  attr_writer :breed, :name   # create writer only

  def initialize(breed, name)
    @breed = breed
    @name = name
  end
end
new_dog = Dog.new('Doberman', 'Napoleon')

puts new_dog.name

new_dog.name = 'Nero'

# ==============================================================


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



# http://rubylearning.com/satishtalim/ruby_syntactic_sugar.html