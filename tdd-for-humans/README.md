# TDD For Humans

## What is TDD?

Let's quickly review the test-driven-development workflow, also known as *Red, Green, Refactor*:

### 1. Write A Failing Test (Red)

In test-driven development, each new feature _begins_ with writing a test. Confirm that:
1. The new test fails.
   * The test fails for the expected reason.
   * The test doesn't pass accidentally.
2. The test harness and all previous tests pass.

### 2. Write Some Code

Write _just enough code_ to change the test result. The code may not be perfect and it may not even do what you eventually want it to do.

### 3. Run The Tests

* Is the new test still red? 
  * Try again.
* Is the new test green?
  * Are any old tests now red?
    * That's a _regression_. While fixing this test, you broke something else.
  * Are all the tests green?
    * Great! The feature is done. Your code matches the specification and doesn't break any prior features.

### 4. Refactor

Look for _better_ solutions only after you've found _any_ solution.

* Did you see any non-DRY code?
* Was your solution inelegant?
* Was your solution hard to read?

If your rewrite your code and the tests are still green, then the refactoring is a success!

## Getting Started

Today we're going to design a `Human` using TDD.

### Project Directory

First, let's create a new directory.
```sh
# Terminal
mkdir human
cd human
```

### Test Files

Next, let's create a directory to hold our tests. RSpec looks for tests in the `spec` directory by default. Think of _spec_ (short for _specification_) as another word for _test_.
```sh
# Terminal
mkdir spec
```

Then create our test file.
```
# Terminal
touch spec/human_spec.rb
```

Open the project in your text editor.
```sh
# Terminal
atom . # or subl .
```

### Write Your First Test

RSpec is a behavior-driven-development (BDD) library for Ruby. BDD is similar to TDD, except it:
* uses the word _spec_ instead of _test_
* tries to make the testing code (inside `human_spec.rb`) readable by non-technical people

So, while this may look odd to you, it's simply Ruby code designed to look like English.

```rb
# spec/human_spec.rb
describe Human do

end
```

You begin an RSpec `Class` test by declaring that you are about to _describe_ a class named `Human`. `describe` is just an RSpec method that takes an argument (the `Human` class) and a block.

That's all we need for now. Expect this test to fail.

### Run Your First Test

To run these tests, simply type `rspec` at the Command Line. Make sure you're in the `human` directory, not the `spec` directory.

```sh
# Terminal
rspec
```

You should see an error like this:
```
uninitialized constant Human (NameError)
```

When doing TDD, you'll learn to recognize what these errors are asking you to do. In this case, even though Ruby is asking you to _initialize a constant_, what it means is that you need to define a `class` named `Human`.

### Write Your Test Harness

Two things are required to finish setting up this test.

First, create a file within the `human` directory (not the `spec` directory) to hold your code (your non-testing code).
```sh
touch human.rb
```

Just because `human.rb` and `human_spec.rb` are in the same project (different directories) doesn't mean they know about each other. So show your testing code where to find your regular code.

```rb
# spec/human_spec.rb
require './human.rb'

describe Human do

end
```

Finally, as the error message instructs, _initialize_ the missing _constant_.

```rb
# human.rb
class Human
end
```

Run your tests.

```sh
# Terminal
rspec
```

RSpec will automatically run all the tests in the `spec` directory. The tests should pass with `0 failures`.

### Write A Specification

We've got a place to write our code (`human.rb`) and a place to write our tests (`human_spec.rb`). Now it's time to get to work.

Write, in your own words, some agile _scenarios_ describing how your `Human` should work. Scenarios take the form of:
* Given:
* When:
* Then:

Here are the scenarios we'll be implementing today.

### Before Breakfast
* Given: a human
* When: it hasn't had breakfast
* Then: it is hungry
  * And: it is sleepy

### After Breakfast
* Given: a human
* When: it has had breakfast
* Then: it isn't hungry
  * And: it isn't sleepy

### Implement Your Specification

BDD makes it easy to translate our written English specification into a programming spec. First, we need to define different `context`s. A _context_ is a way to group our scenarios. It represents a shared _given_ and _when_ among different scenarios.

I've grouped our scenarios into two contexts: "before breakfast" and "after breakfast".

```ruby
# In spec/human_spec.rb
describe Human do
  context 'before breakfast'
  
  context 'after breakfast'
end
```

Next, within each context, we need to define our tests. RSpec calls these _examples_. They represent the _then_ part of our scenarios.

```ruby
# In spec/human_spec.rb
describe Human do
  context 'before breakfast' do
    it 'is hungry'
    it 'is sleepy'
  end
  
  context 'after breakfast' do
    it "isn't hungry"
    it "isn't sleepy"
  end
end
```

As before, it reads well in English, but it's just Ruby. Both `context` and `it` are RSpec methods that accept a `String` and a block.

Even though we haven't filled in any details, this spec can still be run.

```sh
# Terminal
rspec
```

RSpec will tell you that there are 4 examples `pending`, meaning that they are listed, but they haven't yet been implemented. We can pass some arguments to `rspec` to improve the readability of the output.

```sh
# Terminal
rspec -fd -c
```

The `-c` tells RSpec to output the results with some _color_.

The `-fd` (_**f**ormat as if it were **d**ocumentation_) tells RSpec to summarize the entire spec at the top.
* Yellow means pending. (Everything should be yellow right now.)
* Green means passing.
* Red means failing.

This summary should closely match our original scenarios. It should match our _documentation_. By copying our scenarios into our code, we've created _executable documentation_. We're beginning the process of turning our words into code.

When we turn these words green, then we'll be done.

### Let's Code

#### Hungry

Let's write a failing test for the first example.

```rb
# In spec/human_spec.rb
describe Human do
  context 'before breakfast' do
    it 'is hungry' do
      human = Human.new                   # given: a human      
                                          # when: it hasn't had breakfast
      expect(human.tummy).to eq('hungry') # then: it is hungry
    end
    # ... more examples
  end
  # ... another context
end
```

This implementation is arbitrary. You can implement hunger any way you'd like. The point is not how it works, but how it fits into our spec. We've taken the first scenario and translated each line from English into code.

Run the tests.

```sh
# Terminal
rspec -fd -c
```

You should see `1 failure`. It should cause part of the summary at the top to glow red. The error details should appear at the bottom.

```
undefined method 'tummy' for #<Human:0x007fdf3a9798b8>
```

Write just enough code to make this test result change. In this case, if Ruby complains about an _undefined method_, then you should _define the method_.

```rb
# In human.rb
class Human
  def tummy
  end
end
```

This isn't the final answer. But it's enough to change the output and that's all that matters.

Run the tests again.

```sh
# Terminal
rspec -fd -c
```

There should still be `1 failure`, but the error is different.

```
Human before breakfast is hungry
  Failure/Error: expect(human.tummy).to eq('hungry')

    expected: "hungry"
    got: nil
```

We expect the `tummy` method to return `hungry`. Instead we got `nil`. Let's give the test what it wants.

```rb
# In human.rb
class Human
  def tummy
    'hungry'
  end
end
```

This still isn't the _right_ answer, but it's enough to satisfy this test. The documentation is green. It's time to move on.

#### Sleepy

Now let's write some code for the second test.

```rb
# In spec/human_spec.rb
describe Human do
  context 'before breakfast' do
    it 'is hungry' do
      human = Human.new                    # given: a human
                                           # when: before breakfast
      expect(human.tummy).to eq('hungry')  # then: it's hungry
    end
    
    it 'is sleepy' do
      human = Human.new                    # given: a human
                                           # when: before breakfast
      expect(human.state).to eq('sleepy')  # then: it's sleepy
    end
  end
  # ... 
end
```

This test should generate an error.

```
undefined method 'state' for #<Human:0x007ff7f31bebd8>
```

Let's follow Ruby's advice.

```rb
# In human.rb
class Human
  def tummy
    'hungry'
  end
  
  def state
  end
end
```

Run the tests again.

```
Failure/Error: expect(human.state).to eq('sleepy')
     
  expected: "sleepy"
       got: nil
```

This looks familiar. Let's give the test what it wants.

```rb
# In human.rb
class Human
  def tummy
    'hungry'
  end
  
  def state
    'sleepy'
  end
end
```

Run the tests again. It should pass.

That was deceptively easy. Half of our spec is green. But this `Human` class doesn't look right. Let's move on and see what happens.

#### Refactor

The `Human` class isn't doing much, but your code isn't the only thing that needs refactoring. Your tests can also use some refactoring.

```rb
# In spec/human_spec.rb
describe Human do
  context 'before breakfast' do
    it 'is hungry' do
      human = Human.new                    # given: a human
                                           # when: before breakfast
      expect(human.tummy).to eq('hungry')  # then: it's hungry
    end
    
    it 'is sleepy' do
      human = Human.new                    # given: a human
                                           # when: before breakfast
      expect(human.state).to eq('sleepy')  # then: it's sleepy
    end
  end
  # ... 
end
```

There's some repeated code in each of these examples.

```rb
human = Human.new
```

RSpec has some special techniques for DRYing this up.

```rb
# In spec/human_spec.rb
describe Human do
  context 'before breakfast' do
    let(:human) do
      Human.new # given: a human, when: before breakfast
    end
  
    it 'is hungry' do
      expect(human.tummy).to eq('hungry')  # then: it's hungry
    end
    
    it 'is sleepy' do
      expect(human.state).to eq('sleepy')  # then: it's sleepy
    end
  end
  # ... 
end
```

This refactoring is a natural consequence of grouping examples into contexts. Each example shares the same _given_ and _when_, so it makes sense to do that setup only once for the whole context instead of repeating it for each example.

If your tests are still green after this change (and you like the new code better than the old), then the refactoring is a success.

#### Isn't Hungry

Time to work on the third test.

```ruby
# In spec/human_spec.rb
describe Human do
  context 'before breakfast' do
    # ... some examples here ...
  end
  
  context 'after breakfast' do
    it "isn't hungry" do
      human = Human.new                 # given: a human
      human.eat_breakfast               # when: after breakfast
      expect(human.tummy).to eq('full') # then: it isn't hungry
    end
    it "isn't sleepy"
  end
end
```

This test should fail.

```
undefined method `eat_breakfast' for #<Human:0x007f87d7997f80>
```

We know how to fix this.

```rb
# human.rb
class Human
  def tummy
    'hungry'
  end
  
  def state
    'sleepy'
  end
  
  def eat_breakfast
  end
end
```

Run the tests again to generate a new failure.

```
Human after breakfast isn't hungry
  Failure/Error: expect(human.tummy).to eq('full')
     
    expected: "full"
         got: "hungry"
```

We fixed something like this before. Our test is calling the method `tummy` and getting back `"hungry"`. We just need to change it to return `"full"`.

```rb
# In human.rb
class Human
  def tummy
    'full'
  end
  
  # ...
end
```

Run the tests again.

```
Human before breakfast is hungry
  Failure/Error: expect(human.tummy).to eq('hungry')
     
    expected: "hungry"
         got: "full"
```

Unfortunately, our trick isn't working this time. By fixing the third test, we broke the first test. We've triggered a _regression_ - something that used to work isn't working anymore.

Now we need to step back and think about how to write code that will make both of these tests pass at the same time.

It seems like `eat_breakfast` should change the way `tummy` works. One way to get two methods to talk to each other is through @instance_variables.


```rb
# human.rb
class Human
  def tummy
    @tummy
  end
  
  def state
    'sleepy'
  end
  
  def eat_breakfast
    @tummy = 'full'
  end
end
```

This fixes the third test, but the first one is still failing.

```
Human before breakfast is hungry
  Failure/Error: expect(human.tummy).to eq('hungry')
     
    expected: "hungry"
         got: nil
```

The error is different this time. The problem is that @instance_variables are initialized to `nil`. So a `Human` who doesn't `eat_breakfast` is going to have a `nil` `@tummy`. We need the _initial_ value of `@tummy` to be `"hungry"` instead of `nil`. Ruby has a method for that sort of thing.

```rb
# human.rb
class Human
  def initialize
    @tummy = 'hungry'
  end

  def tummy
    @tummy
  end
  
  def state
    'sleepy'
  end
  
  def eat_breakfast
    @tummy = 'full'
  end
end
```

And now our tests are green.

#### Refactor

There isn't much we can do in the testing code yet, but there is a recognizable pattern in the `Human` `class`.

This:
```rb
def tummy
  @tummy
end
```

Is the same as this:
```rb
attr_reader :tummy
```

So rewrite `Human` to use `attr_reader` and check if the tests still pass. They should.

#### Isn't Sleepy

Now for the fourth and final test.

```ruby
# In spec/human_spec.rb
describe Human do
  context 'before breakfast' do
    # ... some examples here ...
  end
  
  context 'after breakfast' do
    it "isn't hungry" do
      human = Human.new                 # given: a human
      human.eat_breakfast               # when: after breakfast
      expect(human.tummy).to eq('full') # then: it isn't hungry
    end
    
    it "isn't sleepy" do
      human = Human.new                  # given: a human
      human.eat_breakfast                # when: after breakfast
      expect(human.state).to eq('awake') # then: it isn't sleepy
    end
  end
end
```

This test is going to fail for the same reason the third one failed. And the fix is going to be the same as well. So let's jump ahead to the answer.

```rb
class Human
  attr_reader :tummy
  attr_reader :state

  def initialize
    @tummy = 'hungry'
    @state = 'sleepy'
  end

  def eat_breakfast
    @tummy = 'full'
    @state = 'awake'
  end
end
```

All tests should be green.

#### Refactor

There are some opportunities to refactor in both the `Human` class and the test spec.

First, in the `Human` class, this:
```rb
attr_reader :tummy
attr_reader :state
```

Can be rewritten like this:
```rb
attr_reader :tummy, :state
```

The tests should still be green after that.

Second, in the test spec, this:
```rb
  context 'after breakfast' do
    it "isn't hungry" do
      human = Human.new                 # given: a human
      human.eat_breakfast               # when: after breakfast
      expect(human.tummy).to eq('full') # then: it isn't hungry
    end
    
    it "isn't sleepy" do
      human = Human.new                  # given: a human
      human.eat_breakfast                # when: after breakfast
      expect(human.state).to eq('awake') # then: it isn't sleepy
    end
  end
```

Can be refactored to use `let`, just like the first context.
```rb
  context 'after breakfast' do
    let(:human) do
      human = Human.new   # given: a human
      human.eat_breakfast # when: after breakfast
      human
    end
  
    it "isn't hungry" do
      expect(human.tummy).to eq('full') # then: it isn't hungry
    end
    
    it "isn't sleepy" do
      expect(human.state).to eq('awake') # then: it isn't sleepy
    end
  end
```

Just like before, grouping examples into contexts allows them to share the `given` and `when` parts of the scenario, leaving only the `then` behind in the tests.


## Conclusions

TDD is a process you can use when you have a problem that's too big to wrap your head around.

Coding is not a creationist exercise. Complexity arises through evolution. A complex working system derives from a simpler working system.

We will be creating apps soon that span hundreds of lines of code across many files and classes. No developers, no matter how senior, can keep track of all of that stuff in their heads.

Tests allow you to focus on the "next step", just the piece of code that's causing trouble at the moment.
* A `Class` or method that has not yet been defined
* A method that isn't doing what you want

All you have to do is fix the errors, one-at-a-time, and a big problem naturally decomposes into a bunch of small ones.

If you don't know what to fix next, the tests will tell you.
