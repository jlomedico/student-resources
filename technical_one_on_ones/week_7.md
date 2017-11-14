# Week 7 (One on One):

## Problem 1

You're going to build an app based on this design.

![Tweeter UI](https://s3.amazonaws.com/f.cl.ly/items/0b042J3L263r171q1T3B/more-card-ui.png?v=f79ba4e2)

To start, please create a model diagram for the object types implied by this design.

Start with the users. Those should be the easy ones.  

### FAQ

*But what are `followers`?*  
[Followers are made of people!](https://youtu.be/9IKVj4l5GU4)

*So people are related to people? What is that?*  
It's a **SELF**-referential `has_and_belongs_to_many` relationship. Every person follows many people (_has many_) and is followed by many people (_belongs to many_). Can you draw that relationship in your ERD? (**Hint:** There are no `Follower`, `Following`, or `Followee` models required. You should only have two boxes in your ERD.)

*No... Maybe... But how do you code it?*  
You can use [this StackOverflow answer](https://stackoverflow.com/a/34208643/1284432) as a reference for later. Right now, all you need to do is draw a diagram for this advanced model association.

----

## Problem 2

Please implement your ERD.

- [ ] Please create a Rails app
- [ ] Please create each of the models you designed (each of the boxes in your diagram)
- [ ] Please create the correct association between users and comments.
- [ ] Please create the correct association for followers. Don't forget our [hint](https://stackoverflow.com/a/34208643/1284432)! It looks complex, but the only word you have to change is the *first* (and **only the first**) occurrence of `:friendships` in `user.rb`. Just copy-and-paste everything else. (Although you're welcome to change more if you want a challenge.)
- [ ] *(Optional)* You may use the `rails-erd` gem to confirm that your code matches your ERD.
- [ ] To test your models, please run this seed (you're allowed to [Google this](https://www.google.com/search?q=rails+seed) if you don't know how to). If the seed fails, please use migrations to update your data models to the correctly named columns.

<details>
  <summary>The seed file is hiding in here</summary>
    
```ruby
u = User.create(name: 'Bif Grady', bio: 'Test', picture: 'https://www.placecage.com/c/400/400')
10.times do 
  Comment.create(body: 'Cool dude!', user: u)
end

u2 = User.create(name: 'Dr. Emmett Brown', bio: 'I once wrote a book about science fiction.', picture: 'http://vignette2.wikia.nocookie.net/epicrapbattlesofhistory/images/b/b5/Doc_Brown_Based_On.png/revision/latest?cb=20150823032635')
10.times do
  Comment.create(body: 'Super stuff!', user: u2)
end

u3 = User.create(name: 'Random Person', bio: 'I like turtles', picture: 'http://fillmurray.com/200/300')
u4 = User.create(name: 'Random Person', bio: 'I like turtles', picture: 'http://fillmurray.com/g/200/300')
u5 = User.create(name: 'Random Person', bio: 'I like turtles', picture: 'http://fillmurray.com/g/300/300')
u.followers << u3
u.followers << u4
u.followers << u5
u6 = User.create(name: 'Random Person', bio: 'I like turtles', picture: 'http://fillmurray.com/g/150/150')
u7 = User.create(name: 'Random Person', bio: 'I like turtles', picture: 'http://fillmurray.com/g/200/200')
u8 = User.create(name: 'Random Person', bio: 'I like turtles', picture: 'http://fillmurray.com/g/300/300')
u9 = User.create(name: 'Random Person', bio: 'I like turtles', picture: 'http://fillmurray.com/g/200/200')
u2.followers << u6
u2.followers << u7
u2.followers << u8
u2.followers << u9
puts "Congratulations! It worked... probably."
puts "#{User.count} users created."
puts "#{Comment.count} comments created."
```

</details>

- [ ] If you don't already have one, please create an index view to display your seeded user data.
- [ ] Please update the view to display all the data seeded into your database according to the image above. It doesn't have to be perfect - no CSS is required. Just show the data (name, bio, picture, number of comments, and number of followers) for each user.
- [ ] Celebrate because you're done! 🙌
