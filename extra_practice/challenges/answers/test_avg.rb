test_count = 4
puts "Please give me #{test_count} test scores:"

scores = []
test_count.times do
  scores << gets.chomp.to_f
end

avg = scores.inject(:+) / test_count
puts "%.2f" % avg
