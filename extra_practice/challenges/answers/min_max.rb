puts "Please give me 2 numbers:"

numbers = []

2.times do
  numbers << gets.chomp.to_i
end

puts "The larger number is #{numbers.max}"
puts "The smaller number is #{numbers.min}"
