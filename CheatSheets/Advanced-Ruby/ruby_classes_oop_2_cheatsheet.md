Ruby Classes 2

```ruby

class Table
  @@next_table_id = 1
end

```

```ruby

Table.@@next_table_id

syntax error, unexpected tCVAR, expecting '('

```
```ruby

class Table
  @@next_table_id = 1

  def self.next_table_id
    @@next_table_id
  end
end

p Table.next_table_id
```
```ruby

p Table.next_table_id

t = Table.new
p t.next_table_id
undefined method ‘next_table_id’

```
```ruby

class Table
  @@next_table_id = 1
  attr_reader :id

  def initialize
     @id = @@next_table_id
     @@next_table_id += 1
  end
end
```

```ruby

t = Table.new
p t.id

t2 = Table.new
p t2.id

```
```ruby

class Table
  @@next_table_id = 1
  attr_reader :id

  def initialize
     @id = @@next_table_id
     @@next_table_id += 1
  end
end
```
```ruby


class Table
  @@next_table_id = 1
  attr_reader :id

  def initialize
     @id = @@next_table_id
     @@next_table_id += 1
  end
end

```
```ruby

p Table.next_table_id

t = Table.new
p t.next_table_id
undefined method ‘next_table_id’

```
```ruby

class Table
  @@next_table_id = 1
  attr_reader :id

  def initialize
     @id = @@next_table_id
     @@next_table_id += 1
  end
end
```
```ruby

class Table
  # Methods from the previous slide
  # go here.

  def preview_next_id
    @@next_table_id
  end
end
```
```ruby

table1 = Table.new
p table1.id
p table1.preview_next_id

table2 = Table.new
p table2.id

```
```ruby

class Table
  @@next_table_id = 1

  def change_next_id(next_id)
    @@next_table_id = next_id
  end

  def self.preview_next_id
    @@next_table_id
  end
end
```
```ruby

t = Table.new
p Table.preview_next_id

t.change_next_id 100
p Table.preview_next_id

```
```ruby

class Table
  @@next_table_id = 1
  attr_reader :id

  def initialize
     @id = @@next_table_id
     @@next_table_id += 1
  end
end
```

```
```ruby

Private
class Table
  def a_public_method
    a_private_method
  end

  private

  def a_private_method
  end
end
```
```ruby

Private
t = Table.new
t.a_public_method

t.a_private_method
private method 'a_private_method' called

```
```ruby

Private By Default
t = Table.new

t.initialize
private method 'initialize' called
```
```ruby

Private
t = Table.new
t.a_public_method
#t.a_private_method
t.send :a_private_method

```
```ruby

Private
class Bank
  def transfer
    withdraw
    deposit
  end

  private

  def withdraw; end

  def deposit; end
end
```
```ruby
Inherited Secrets
class Parent
  private
  def whisper_secret
    puts "parent's secret"
  end
end

class Child < Parent
  def expose_secret
    whisper_secret
  end
end
```
```ruby
Inherited Secrets
c = Child.new
c.expose_secret


c.whisper_secret


Protected Parent
class Parent
  protected
  def whisper_family_secret
    puts "shhh!"
  end
end

Protected Child
class Child < Parent
  def chat(other)
    other.whisper_family_secret
  end
end

Protected Stranger
class Stranger
  def chat(other)
    other.whisper_family_secret
  end
end
```
```ruby
Un-Protected Secrets
jo = Child.new
juha = Child.new

jo.chat(juha)


juha.chat(jo)


Protected Secrets
jo = Child.new
skeev = Stranger.new

skeev.chat(jo)

```
```ruby
Method Security
public
Anyone can access.

private
  Only me and my subclasses (“children”) can access. No “outside” access.

protected
Given two objects, they can only access each other if they’re “related”.
Method Security
public
thing = Thing.new
thing.public_method

private
thing = Thing.new
thing.private_method # error

protected
thing = Thing.new
thing.protected_method # error if self is unrelated
Overriding
class Parent
  def whoami; puts "I'm a parent"; end
end

class Child < Parent
  def whoami; puts "I'm a child"; end
end
```
```ruby

Overriding
p = Parent.new
p.whoami



c = Child.new
c.whoami
```

```ruby
Super
class Person
  def speak; "I'm a person"; end
end

class Parent < Person
  def speak
    super + " who is a parent"
  end
end
```
```ruby
Super
p = Person.new
p p.speak



c = Parent.new
p c.speak

```
```ruby
Super
class Parent
  def speak(arg); puts arg; end
end

class Child < Parent
  def speak; super "I'm a child"; end
end

```
```ruby
Super
p = Parent.new
p.speak "I'm a parent"



c = Child.new
c.speak "I'm a child"
c.speak

```
```ruby
Super
class Parent
  def speak1(arg); puts arg; end
end

class Child < Parent
  def speak2
    super.speak1 "I'm a child"
  end
end

```
```ruby
Super
class Parent
  def speak1(arg); puts arg; end
end

class Child < Parent
  def speak2
    super.speak1 "I'm a child"
  end
end

```
```ruby
Super
class Parent
  def speak1(arg); puts arg; end
end

class Child < Parent
  def speak2
    speak1 "I'm a child"
  end
end

```
```ruby
Super
class Parent
  def speak(arg); puts arg; end
end

class Child < Parent
  def speak(arg); super; end
end

```
```ruby
Super
class Parent
  def speak; end
end

class Child < Parent
  def speak(arg); super(); end
end
```
