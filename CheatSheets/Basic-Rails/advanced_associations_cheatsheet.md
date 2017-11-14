Advanced Associations Custom Association Names

```bash
$ rails g model code_school name

$ rails g migration AddCodeSchoolToUser code_school:belongs_to

$ rake db:migrate

```

```ruby
app/models/user.rb
class User < ActiveRecord::Base
  belongs_to :code_school
end
```

```ruby
app/models/code_school.rb
class CodeSchool < ActiveRecord::Base
  has_many :students, class_name: 'User'
end
```

```bash

$ rails g model Profile user:belongs_to photo
$ rake db:migrate
```

```ruby
app/models/user.rb
class User < ActiveRecord::Base
  belongs_to :code_school
  has_one :profile
end
```

Rails automatically added the belongs_to association to the Profile class, so we can skip that.

```ruby
app/models/profile.rb
class Profile < ActiveRecord::Base
  belongs_to :user
end
```

```bash
rails console
> ed = User.find_by(name: ‘Ed’)
> ed = User.create(name: "Ed", email: "ed@wyncode.co")
> ed.profile
> profile = Profile.create(user: ed, photo: "photo.jpg")
> profile.user

> jo = User.find_by(name: ‘Jo’)
> profile.user = jo
> profile.save

```

Quiz: Confirm that the profile is now associated with jo instead of ed.

```ruby
> jo.profile
> profile.user
```

```bash
$ rails g model Project user:belongs_to source url
$ rake db:migrate
```

Rails automatically added the belongs_to association for us.

```ruby
app/models/project.rb
class Project < ActiveRecord::Base
  belongs_to :user
end
```
Rails doesn’t automatically add the other side of the association, the has_many. Add it yourself.
```ruby
app/models/user.rb
class User < ActiveRecord::Base
  belongs_to :code_school
  has_one :profile
  has_many :projects
end
```
1-to-many-to-many relationship
```ruby
app/models/code_school.rb
class CodeSchool < ActiveRecord::Base
  has_many :students, class_name: 'User'
  has_many :projects, through: :students
end
```
```bash
rails console

> cs = CodeSchool.take

> cs.students.count

> cs.students = User.all
> u = User.take
> u.projects.count
> p = Project.create

> u.projects << p

> cs.projects

```
rails db (psql)

wyncode=# \x
Expanded display is on.
wyncode=# SELECT * FROM "projects" INNER JOIN "users" ON "projects"."user_id" = "users"."id";
rails db (sqlite)
sqlite> .mode line
sqlite> SELECT * FROM "projects" INNER JOIN "users" ON "projects"."user_id" = "users"."id";
            id = 1
       user_id = 1
        github =
           url =
    created_at = 2016-02-08 18:00:58.542997
    updated_at = 2016-02-08 18:01:04.209736
            id = 1
          name = Ed
    created_at = 2016-02-08 13:35:57.270295
    updated_at = 2016-02-08 18:00:49.413835
         email = ed@wyncode.co
code_school_id = 1

The INNER JOIN SQL clause literally joins two tables together, all the columns from the projects table, followed by all the corresponding columns in the users table.
```ruby
Inside db/migrate/20140610194549_create_projects.rb
    t.references :user, index: true, foreign_key: true
```

app/models/code_school.rb
```ruby
class CodeSchool < ActiveRecord::Base
  has_many :students, class_name: 'User'
  has_many :projects, through: :students

  # a (hypothetical) has_many through another has_many
  # has_many :other_things, through: :projects
end

```

a many-to-many through a join table


To implement a many-to-many relationship with two opposite-facing has_many/through:s:

Create Student, Team, and StudentTeam models
StudentTeam
belongs_to :student
belongs_to :team
Student
```ruby
has_many :student_teams
has_many :teams, through: :student_teams
```
Team
```ruby
has_many :student_teams
has_many :students, through: :student_teams
```

```ruby
id:integer (primary key)
student_id:integer (foreign key)
team_id:integer (foreign key)
timestamps
maybe role (string)
```


polymorphic association
```ruby
employee = Employee.last
until employee.manager.nil? do
  employee = employee.manager
end
```

Foreign and Primary Keys

```ruby

db/migrate/20140610194549_create_projects.rb
class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user, index: true, foreign_key: true
      t.string :url
      t.string :github

      t.timestamps null: false
    end
  end
end

```

```bash
rails console
irb(main):001:0> Project.connection
irb(main):002:0> Project
```
```sql
SELECT "projects".* FROM "projects" INNER JOIN "users" ON "projects"."user_id" = "users"."id" WHERE "users"."code_school_id" = 1
```
Joining Project to User:
```ruby
Project.all.each do |project|
  User.find(project.user_id)
end
```
```ruby
Joining User to Project:
User.all.each do |user|
  Project.where(user_id: user.id)
end
```

You can JOIN two tables along any two columns. For example, this SQL query will create a join table matching rows where user names match school names (i.e. where a student is named “Wyncode”).
```sql
SELECT * FROM code_schools INNER JOIN users WHERE users.name = code_schools.name;
```
```bash
$ rails g migration AddActiveAndCohortToUser active:boolean cohort:integer
$ rake db:migrate
```
```bash
rails console
> u = User.take
> u.active
> u.cohort
> User.where(active: true)
> User.where(cohort: 1)
```

```ruby
> User.where(name: “; DROP TABLE users;--”)
> User.where(active: true)
> User.where(cohort: 1)
```
```ruby
app/models/user.rb
class User < ActiveRecord::Base
  belongs_to :code_school
  has_one :profile
  has_many :projects

  def self.active
    where(active: true)
  end

  def self.cohort(cohort_num)
    where(cohort: cohort_num)
  end
end
```

```bash
rails console
> User.active
> User.cohort 1
>User.where(active: true)

```ruby
app/models/user.rb
… stuff …
  def self.active
    where(active: true)
  end

  def self.cohort(cohort_num)
    where(cohort: cohort_num)
  end

  def self.active_cohort(cohort_num)
    active.cohort cohort_num
  end
end
```
```bash

rails console (this code should tab auto-complete in the console too!)
> User.active_cohort 1
```

```ruby
app/models/user.rb
… head code ...
  scope :active, -> { where(active: true) }
  scope :cohort, ->(cohort_num) { where(cohort: cohort_num) }
  scope :active_cohort, ->(cohort_num) { active.cohort cohort_num }
end
```
```bash
rails console
> User.active
> User.cohort 1
> User.active_cohort 1
```
```bash
rails console
> cs = CodeSchool.take
> cs.students.active
> cs.students.cohort 1
> cs.students.active_cohort 1
```
