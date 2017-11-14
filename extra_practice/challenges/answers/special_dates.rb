birth_date = {}

[:month, :day, :year].each do |n|
  puts "Please give me the #{n} of your birth:"
  birth_date[n] = gets.chomp.to_i
end

puts birth_date[:month] * birth_date[:day] == birth_date[:year].to_s[2..3].to_i ? "Your birhtday is special!" : "Your birhtday is not special"
