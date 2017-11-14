# Week 2 (One on One):

## Problem 1

Create a `while` loop that outputs the square roots of the odd positive integers less than or equal to 25. The output of your program should look like this:

```
The square root of 1 equals 1.0
The square root of 3 equals 1.7320508075688772
The square root of 5 equals 2.23606797749979
The square root of 7 equals 2.6457513110645907
The square root of 9 equals 3.0
The square root of 11 equals 3.3166247903554
The square root of 13 equals 3.605551275463989
The square root of 15 equals 3.872983346207417
The square root of 17 equals 4.123105625617661
The square root of 19 equals 4.358898943540674
The square root of 21 equals 4.58257569495584
The square root of 23 equals 4.795831523312719
The square root of 25 equals 5.0
```

__Hint:__ Use `puts` to figure out what number you're currently trying to find the square root of.

----

## Problem 2
Create a method named `element_index` that accepts two arguments named `element` and `my_array`. If `element` is in `my_array`, then return the _index_ (or _position_) of `element` within `my_array`. If `element` isn't in `my_array`, return `-1`. __YOU MUST USE LOOPS__. Your method can be tested like this:

```rb
puts element_index("b", ["a", "b", "c"])
# should output 1

puts element_index("hello", ["a", "b", "c"])
# should output -1
```

__Hints:__ 
* Don't expect to build this whole method in one step. Decompose it into smaller parts. Write a method. Then add method arguments. Then test it. Examine the arguments with `p` or `puts`.
* Use TDD. Copy one of the tests into your code first (before you write anything else) and run it. It'll break. That's red. Fix those errors until you're green.
* You're looking for a _needle in a haystack_, but instead of returning `true` or `false`, we want to know _where_ you found the needle.
