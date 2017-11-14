Code snippets Intro to Boolean Logic

```ruby
a * b
a + b
a && b
a || b
```

```ruby
true && true
true and false
```

```ruby
(true and false) and (false or true)
true and (false and false) or true
true and false and false or true

```

```ruby

not (A and B)
not A or not B

not (A or B)
not A and not B

```

```ruby
not ((true or false) and (true or false))

not (true or false) or not (true or false)

```

```ruby
not ((true or false) and (true or false))

not (true or false) or not (true or false)

(not true and not false) or (not true and not false)

```

```ruby
nil || true
nil || false
[1,2,3].index(4) || false
!!nil
```

```ruby
!![]
!!{}
{a: 1, b: 2}[:a] && true

!!0
```

```ruby
[1,2][2] or [1,2][1]

[1,2][1] or [1,2].sort

[false, true][0] and [1,2,3][0]
```

