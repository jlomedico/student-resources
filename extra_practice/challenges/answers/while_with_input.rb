product = 0

while product < 100
  puts "Please give me a number:"
  number = gets.chomp.to_i
  product = number * 10
end
