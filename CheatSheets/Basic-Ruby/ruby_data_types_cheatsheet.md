Code snippets Ruby Data Types 0.3.0

```ruby
-1.abs
1.even? & 1.odd?
1.zero?
1.next
```

```ruby
10.modulo 3

10 % 3
```

```ruby
1.0.class

1.5.round
1.5.truncate

1.5.round.class
```

```ruby
1.0.class

1.5.round
1.5.truncate

1.5.round.class
```

```ruby
(1+1).class
(1.0 + 1).class
```

```ruby
"Hello world!"

"Hello world!".class
"Hello world!".methods
```

```ruby
"a" <=> "b"
"hi".capitalize, "hi".upcase, "Hi".downcase
"".empty?
"hello".end_with? "lo"
"hello".include? "hell"
```

```ruby
"hello".gsub "l", "y"
"hello".length
" hello ".strip
" world".prepend "hello"
"hello".concat "world"
"hello".reverse
```

```ruby
"1" + "2"

"1".to_i
"1.0".to_f

"1".to_i + "1".to_i

```

```ruby
1.to_s

1.to_s + 2.to_s
```

```ruby
"a".codepoints

97.chr
```

```ruby
print '"Ruby would be easy", they said'

print "\"Ruby would be easy\", they said"

print '\'Hi\''
```

```ruby
[1,2,3]

["chunky", "bacon"]

[true, 0, 1.0, nil, "hello"]

```

```ruby
[]

[[1,2,3], ["a", "b", "c"]]

```

```ruby
[] << 1
[].push(1, 2, 3)
[1,2,3].length
[1,2,3].first
[1,2,3].last
```

```ruby
[1,2,3][0]
[1,2,3].[](0)
[1,2,3].at(0)
```

```ruby

[1,2,3][-1]
[1,2,3][-4]
```

```ruby
{ "H" => "Hello", "W" => "World", "n" => nil }
{ "H" => "Hello", "W" => "World", "n" => nil }["H"]
```

```ruby
{
  "H" => "Hello",
  "W" => "World"
}.keys

{
  "H" => "Hello",
  "W" => "World"
}.values

```

```ruby
{
1 => 2,
"a" => "b"
}["X"]
```

```ruby
{
  H: "Hello", W: "World"
}.keys.first.class

```

```ruby
:a

:a.class

:a.methods
"a".methods
```

```ruby
:a.object_id == :a.object_id

"a".object_id == "a".object_id

```

```ruby
{ a: "hello" }
{ :a => "hello" }

```

```ruby
{a: :a, c: :c, d: :d, b: :b}

{h: "Hello", h: "Hi"}

```

```ruby
"H".hash == "H".hash
"H".object_id == "H".object_id

"H".hash.class

```

```ruby
Object.new
Object.new.methods
Object.new.class

self.class

```

```ruby
1.class.ancestors
1.0.class.ancestors
"1".class.ancestors
true.class.ancestors
nil.class.ancestors
[].class.ancestors
```
