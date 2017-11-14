days = 30
pennies = 1
wallet = 0

days.times do |day|
  wallet += pennies
  puts "You earned $#{pennies.to_f / 100} on day #{day + 1}!"
  pennies *= 2
end

salary = wallet.to_f * 100

puts "In total you earned: $#{'%.2f' % salary}"
