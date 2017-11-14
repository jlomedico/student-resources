# Week 3 One on One:

## Problem 1: The Card Class
We're going to create playing cards. To get started:
- Create a directory `week3` from within your project directory. (i.e `~/Desktop/wyncode`).
- Inside `week3`, create 2 files: `card.rb`, `deck.rb`
  - Inside `week3`, create a `spec` directory:
    - Inside `spec`, create a `units` directory.
      - Inside `units`, create 2 files: `card_spec.rb`, `deck_spec.rb`
- Open up the directory `week3` within your code editor of choice
- We've already written the RSpec tests for you. Paste the code from this repo into their respective files
  - [card_spec.rb](./spec/units/card_spec.rb)
  - [deck_spec.rb](./spec/units/deck_spec.rb)

### Creating a Card
* In `card.rb`, create a `Card` class. 
* A single `card` is initialized with 2 values: `value` and `suit`. (e.g. `Card.new 5, "clubs"`)
  * The `value` we give you will be an `Integer` from 1 to 13.
  * The `suit` we give you will be a card suit `String`, one of `["spades", "diamonds", "clubs", "hearts"]`.
  * You don't need to worry about what `value` and `suit` are yet. Just store each of them in `@attributes`.
* Given a single `card` instance, I should be able to **read** the value of the `value` and `suit` **attributes**.

When you are done, run our RSpec test like this:
```sh
rspec spec/units/card_spec.rb
```
You should see 6 passing examples and 2 failures.

### Defining Face
When we read the `value` of a card, we get a number from 1 to 13.

Define a method named `face` that will return the correct face `String` for a card.
<table>
  <tr><th>Value<th>Face</th></tr>
  <tr><td>1<td>"Ace"</td></tr>
  <tr><td>11<td>"Jack"</td></tr>
  <tr><td>12<td>"Queen"</td></tr>
  <tr><td>13<td>"King"</td></tr>
  <tr><td>all other values<td>the value itself (i.e. a number from 2 to 10)</td></tr>
</table>

For example, if I create a card with:

```rb
card = Card.new 1, "spades"
```

I should be able to get the face with
```rb
p card.face
```

And I should see "Ace" because the value `1` corresponds to `"Ace"`.

Running: 
```rb
rspec spec/units/card_spec.rb
```
should now give you 7 passing examples and 1 failure.

### `Puts`ing Cards
After the `end` of your `Card` `class`, if I create a card like this:
```rb
card = Card.new(13, 'spades')
```
And then do this
```rb
puts card
```
I want this code to display the `card`'s full name: `"King of Spades"`?

If you do this correctly, then this 
```rb
rspec spec/units/card_spec.rb
```
should now give you 8 passing examples.

## Problem 2 - The Deck Class

### Create a Deck
* In `deck.rb` create a `Deck` class. 
* On initialization of a single `deck`, create an instance variable `@cards`.
  * It should be an `Array`
  * It should contain 52 instances of `Card` (one for each card in a typical deck of playing cards).
    * 4 sets of 13 cards, one for each suit: `["spades", "diamonds", "clubs", "hearts"]`
    * Each suit set has cards valued 1 through 13.
    * Hint: Use loops to do this. Otherwise you'll have to do a lot of typing!
  * The `@cards` should be shuffled, meaning they should not be in numerical order. 
* I should have _read_ access to cards. 

Running 
```rb
rspec spec/units/deck_spec.rb
```
should give you *5* passing examples.

### Drawing a Card from a Deck
Create an instance method `draw` which grabs a card from `@cards` and then removes that card.

Running `rspec spec/units/deck_spec.rb` should now give you *7* passing examples.

### Bonus

In `spec/units/card_spec.rb`, uncomment the bonus specs and see if you can get them to pass!

## Problem 3

Return the largest number from the array, without using max. Make the tests pass. __Do not use `sort`, `max`, `for` or `while`.__

```ruby
def max(items)
  # your code here
end

puts max([1,2,3,4,5,6]) == 6
puts max([4,5,6,1,2,3]) == 6
puts max([9,8,7,6,5,3,1]) == 9
```

__Hint:__ Use `puts`, it's your friend.
