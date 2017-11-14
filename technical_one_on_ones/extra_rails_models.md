# Remediation for Rails models (One on One):

## Alotted Time
30 minutes.

## Problem 1

Create a new rails app, it should have a model called `Person` it should have the fields `name`, `date_of_birth` and `enrolled` __do not generate a scaffold for this__. Please pick the appropriate field types for these table columns.

__Note:__ Don't forget to run your migrations. If you used a `string` for all of the column types, you did this wrong.

## Problem 2

Open up your `rails console` and create a new person that represents yourself, please use your birthday and whether or not you're enrolled in wyncode. 

## Problem 3

Add an age instance method to the person model that returns the age as a FixNum. Not sure how to proceed? How would you calculate your age in real life, on paper. Do it like that, then translate it to ruby. Remember, every attribute of an instance is available inside of it's class definition. For example:

```ruby
class Dog < ApplicationRecord
  def to_s
    "#{name} is a #{breed}"
  end
end
```

In the above example, `name` and `breed` are columns in the `dogs` table and attributes of every `Dog` instance.

## Problem 4

Account for the following edge cases, drop this in your seeds:

```ruby
Person.create(name: 'Auston', date_of_birth: Date.new(1990, 11, 13), enrolled: false) # should be 25
Person.create(name: 'Jessica', date_of_birth: Date.new(1986, 1, 3), enrolled: true) # should be 30
Person.create(name: 'Jessica', date_of_birth: Date.new(1976, 6, 22), enrolled: true) # should be 40
```

Now seed your database then restart your `rails console` and fetch each of them and test to make sure your age method is right. If it's not, figure out why and fix it.
