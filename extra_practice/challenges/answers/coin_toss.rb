def coin_toss
  rand(1..2) == 1 ? "Heads" : "Tails"
end

puts "How many times do you want to flip a coin?"
number = gets.chomp.to_i

number.times do
  puts coin_toss
end
