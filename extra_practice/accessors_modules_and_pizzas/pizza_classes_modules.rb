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