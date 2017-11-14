puts "Please enter the total number of gallons your car can hold:"
gallons = gets.chomp.to_i

puts "Please enter the total number of miles your car can drive on a full tank:"
miles = gets.chomp.to_i

mpg = miles / gallons

puts "Your car's mpg is: #{mpg}"
