# Week 5 (One on One):

__Note:__ All of this code should exist in the same file. Name it `1_on_1.rb`.

## Problem 1

Create an `Array` with 4 `String`s: 
* north
* east
* south
* west

Store that `Array` in a _variable_ named `directions`. 

Test:
```rb
p directions[3]
```

Output should be:
```
"west"
```

----

## Problem 2

Create a `Hash` with 4 _keys_ (n, e, s, w) and 4 corresponding `String` _values_ (north, east, south, west). 

|key|value|
|---|-----|
|n|north|
|e|east|
|s|south|
|w|west|

Store that `Hash` in a _variable_ named `compass`. 

Test:
```rb
p compass[:n]
```

Output should be:
```
"north"
```

----

## Problem 3

**a)** Create a `class` called `Direction` that when initialized, takes an `abbreviation` and `direction_name`.

Test:
```rb
Direction.new("n", "North")
```

Output: _It shouldn't break._

**b)** Make the `abbreviation` and `direction_name` publicly available.

Test:
```rb
dir = Direction.new("n", "North")
p dir, dir.abbreviation, dir.direction_name
```

Output should be:
```
#<Direction:0x0123456789abcd @abbreviation="n", @direction_name="north">
"n"
"North"
```

**c)** Now create a `class` called `Compass`.

Test:
```rb
Compass.new
```

Output: _It shouldn't break_

**d)** Store an instance of `Compass` in a variable called `my_compass`. 

When `Compass` is instantiated, create a readable _instance variable_ named `directions`. Initialize `directions` to an `Array` of `Direction` objects (i.e. instances of the `Direction` class, as in question **3a**) corresponding to north, east, south, & west. 

Test:
```rb
my_compass = Compass.new
p my_compass.directions
```

Output (your `0x`numbers may vary):
```
[#<Direction:0x0123456789abcd @abbreviation="n", @direction_name="north">, 
 #<Direction:0x0123456789abcd @abbreviation="e", @direction_name="east">, 
 #<Direction:0x0123456789abcd @abbreviation="s", @direction_name="south">, 
 #<Direction:0x0123456789abcd @abbreviation="w", @direction_name="west">]
```
Output _should not be_:
```
["north", "east", "south", "west"]
```

__Hint__: You can use the `Direction` `class` _inside_ of your `Compass` `class` as long as you define `Direction` first (above) the definition of `Compass`. That means you can write `Direction.new("n", "North")` inside a method of `Compass`.

**e)** `Compass#directions` should be write-protected, as in, I should not be able to publicly change the value of `directions`.

```rb
my_compass = Compass.new
p my_compass.directions      # should work
my_compass.directions = []   # should not work
```

----

## Problem 4

Let's get a Sinatra server running. Please put a Sinatra server in this file (at the bottom of `1_on_1.rb`). When I make a `GET` request to the root (`/`) path, it should respond with `test`.

__Hint:__ `require` is your friend. 

----

## Problem 5

Combine your `Compass` `class` with your Sinatra server. Since they're in the same file (`1_on_1.rb`), you can use your `class` inside your Sinatra `get` block. Instead of responding with `"test"`, try responding with:

```rb
Compass.new.to_s
```

If you solved the previous questions correctly, you may also respond with:

```rb
my_compass.to_s
```

When you've got the hang of referring to your `Compass` inside a Sinatra block, read the end of the [Sinatra Routes documentation](http://www.sinatrarb.com/intro.html#Routes) (the code below "_Routes may also utilize query parameters_").

In the URL `http://localhost:4567/?direction=n`, the `direction=n` part is called the _query string_. Find out how to extract the _query parameters_ using the Sinatra routing system, then implement the following pages.

| When you visit | You should see in the browser |
| -------------- | ------------------------------|
| [http://localhost:4567/?direction=n](http://localhost:4567/?direction=n) | `The direction corresponding to n is North` |
| [http://localhost:4567/?direction=e](http://localhost:4567/?direction=e) | `The direction corresponding to e is East` |
| [http://localhost:4567/?direction=s](http://localhost:4567/?direction=s) | `The direction corresponding to s is South` |
| [http://localhost:4567/?direction=w](http://localhost:4567/?direction=w) | `The direction corresponding to w is West` |

__Hint:__ Try responding with:
```rb
params.to_s
```

### Bonus
_Defensive web programming_: your server should respond normally for invalid directions like `7` or `null`.
