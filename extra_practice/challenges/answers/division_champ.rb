# Division Champ
def get_sales(division)
  puts "Please give me the sales for #{division}"
  gets.chomp.to_i
end

def find_highest
  salses_figures = {}
  ["North", "South", "East", "West"].each do |division|
    salses_figures[division] = get_sales(division)
  end
  highest_sales = salses_figures.max_by{ |k,v| v }.first
  puts "The highest sales figures go to the #{highest_sales} division!"
end

find_highest
