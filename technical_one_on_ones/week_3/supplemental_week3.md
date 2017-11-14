# Week 3 (One on One):

## Problem 1

Figure out if you can fly to a city from a different city without connecting (aka is there a direct flight from your starting city to your destination city). Take this code and put it in a file called `flight_planner.rb`. Now fill in the code where it says `# ... your code here`.

```ruby
class FlightPlanner
  def initialize
    @flights = {
      "MIA" => ["JFK", "PHX", "LHR", "FLL"],
      "AUS" => ["SFO", "ORD"],
      "FLL" => ["WPB", "AUS", "JFK"],
      "PHX" => ["SFO", "LAX", "LAS"]
    }
  end

  def can_i_fly?(start, destination)
    # ... your code here
  end
end
```

Create a new file called `flight_checker.rb`. Put this code in that file:

```ruby
def test_code(flight_planner_instance)
  planner = flight_planner_instance
  tests = [
    [:can_i_fly?, ["MIA", "JFK"], true],
    [:can_i_fly?, ["MIA", "ORD"], false],
    [:can_i_fly?, ["MIA", "XXX"], false]
  ]
  puts "All tests passing? Yes!" if tests.all? {|t| planner.send(t[0], *t[1]) == t[2]}

  failed_tests = tests.reject {|t| planner.send(t[0], *t[1]) == t[2]}
  response = "All tests passing? No...\n"
  response = "tests fail for: #{failed_tests.map{|t| t[1]}}"
end

# ... get your flight planner class imported to this file
# ... instantiate a new flight planner object that is stored in a variable
# ... make a test of your own by looking at the code, it should use ==
# ... call test_code with your instance as the argument
```

Fill in the last 4 lines of this file and make all tests pass.

__Hint:__ Make sure you have all of the files, including your program in the same directory. Use `puts`, it's your friend. 

__For bonus points:__ Use `each` to go through the hash keys & values, googling might be useful here. :D
