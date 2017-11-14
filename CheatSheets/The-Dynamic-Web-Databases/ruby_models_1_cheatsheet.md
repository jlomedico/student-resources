Models 1 Cheatsheet

```bash
rails new class_roster -T
cd class_roster
atom .
```
```bash

rails console

User.new

exit

rake db:migrate
```


```bash
rails c
```
```ruby
User.new

u = User.new
u.name = “Fred”
u.email = “fred@flinstones.co”
u

u.persisted?
```



```ruby

u.save

User.create(name: "Barney", email: "barney@rubbles.co")

User.find(1)
User.find_by(name: ‘Barney’)
User.where(name: ‘Barney’)
User.all

User.find(2)
```


```ruby

User.find_by(name: “Fred”)
User.create(name: “Fred”, email: “fred@gmail.com”)
User.find_by_name(“Fred”)

User.where(name: “Fred”)
u = User.find_by(name: “Barney”)
u.email = “barney.rubbles@flinstones.co”
u.save

User.last.destroy()
```

```bash
rails g model User name email
rails g model Course name

rake db:migrate

rails g migration AddCourseIdToUsers

rake db:migrate
```

```bash
rails g model Property name zip_code:integer
rails g migration AddEmailToProperty email
rails g migration AddTenantToProperty tenant:belongs_to
```

```ruby

Course.find(1).users.create(name: “Wilma”, email: “wilma@flinstones.co)

User.find(2).course = Course.find(1)

```

