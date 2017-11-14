# Remediation for Rails MVC (One on One):

## Alotted Time
1 hour.

## Problem 1

__DO NOT SCAFFOLD__

Create a new rails app. Generate 2 models, one for `User`s and another for `TestScore`s. The User model should have a `first_name` and a `last_name` field. 
The `TestScore` model should have a reference to the `User`, a `name` field and a `score` field. Please make sure you choose the right column types for each of these.

__Note:__ Don't forget to run your migrations. If you used a `string` for all of the column types, you did this wrong. Also don't forget to add the right assocations.


## Problem 2

Generate a controller for the TestScores that has an `index` action. This index action is going to list all of the test scores in descending order with the user who took the tests full name, so highest score at the top in a table.

__Protip:__ Make a model method called `full_name` to avoid logic in the view.

## Problem 3

Point your root route at this controller and action. Now lets create another action by hand in the `TestScoresController` this one will be called `stats`. It should fire when I go to [This link](http://localhost:3000/stats).
There are 3 stats that I want to see there:

- Average score (mean)
- Total number of tests taken
- Total number of users

Do you see 81, 4, 10? Great - you are done!

### Wondering where to get data? 

Hopefully you read through the entire doc before you started coding, it's probably going to be helpful to have this in your seeds file so you dont have to create a bunch of users and tests :)

```ruby
u1 = User.create(first_name: 'Auston', last_name:'Bunsen')
u2 = User.create(first_name: 'Jeff', last_name:'Test')
u4 = User.create(first_name: 'Jasmine', last_name:'Pitt')
u5 = User.create(first_name: 'Jalen', last_name:'Smith')
u6 = User.create(first_name: 'Willa', last_name:'Smith')
u7 = User.create(first_name: 'Angela', last_name:'Jolie')
u8 = User.create(first_name: 'Brad', last_name:'Pith')
u9 = User.create(first_name: 'Carl', last_name:'Satan')
u10 = User.create(first_name: 'Richard', last_name:'Darkens')
u11 = User.create(first_name: 'Seth', last_name:'Goldfarb')

t1 = TestScore.create(score: 63, user: u1, name: "Test for good looks")
t2 = TestScore.create(score: 99, user: u8, name: "Test for good looks")
t3 = TestScore.create(score: 79, user: u8, name: "Test for good brains")
t4 = TestScore.create(score: 83, user: u10, name: "Test for good brains")
```
