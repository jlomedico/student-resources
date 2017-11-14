Advanced Migrations Cheatsheet

```bash
$ cd YOUR_PROJECTS_FOLDER
$ rails new good_schooler
$ cd good_schooler
```

```bash
$ rails g scaffold user name
$ rake db:migrate
```

```ruby
app/models/user.rb
class User < ActiveRecord::Base
end
```

```ruby
db/migrate/20140605210634_create_users.rb
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name

      t.timestamps
    end
  end
end
```

```bash
$ rails g migration
```

```bash
$ rails g migration AddEmail
```

```ruby
class AddEmail < ActiveRecord::Migration
  def change
  end
end
```

```bash
$ rails d migration AddEmail
```

```bash
$ rails g migration AddEmailToUser email
```

```ruby
class AddEmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
  end
end
```

```bash
rails g migration AddEmailToUser email
```

```bash
$ rails g migration RemoveEmailFromUser email
```

```ruby
class RemoveEmailFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :email, :string
  end
end
```

```bash
$ rails g migration AddAgeToUser age:integer
```

```ruby
class AddAgeToUser < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
  end
end
```

```irb
a = 1
a = “hello world”
a = {}
a = []
```

```bash
$ rake db:migrate
```

```bash
$ rake db:rollback
```

```bash
$ rake db:migrate VERSION=20140605210634_create_users
```

```bash
$ rails d migration AddAgeToUser
```

```bash
$ rails d migration RemoveEmailFromUser
```

```bash
$ rake db:version
```

```bash
$ ls db/migrate/
```

```bash
$ rake db:migrate
```

```bash
$ rails c
irb(main):001:0> u = User.new
irb(main):002:0> u.email = 'ed@wyncode.co'
irb(main):003:0> u.name = 'Ed'
irb(main):004:0> u.save
irb(main):005:0> exit
```

```bash
$ rails db
```

```bash
rails db (psql)
wyncode=# select * from users;
 id | name |         created_at         |         updated_at         |     email
----+------+----------------------------+----------------------------+---------------
  1 | Ed   | 2014-06-06 19:22:47.099676 | 2014-06-06 19:23:26.399655 | ed@wyncode.co
(1 row)
wyncode=# \q
```

```bash
rails db (sqlite)
sqlite> .mode column
sqlite> .headers on
sqlite> select * from users;
id          name        created_at                  updated_at                  email
----------  ----------  --------------------------  --------------------------  ------------
1                       2016-02-05 21:17:23.409605  2016-02-05 21:17:23.409605  ed@wyncode.co
sqlite> .exit
```

```bash
$ rails g migration AddEmailUniqToUser email:uniq
```

```ruby
class AddEmailUniqToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_index :users, :email, unique: true
  end
end
```

```ruby
class AddEmailUniqToUser < ActiveRecord::Migration
  def change
    #add_column :users, :email, :string
    add_index :users, :email, unique: true
  end
end
```

```bash
$ rake db:migrate
```

```bash
$ rails c
User.find_by(name: SOMETHING)
User.where(name: SOMETHING)
```

```bash
$ rails g migration AddNameIndexToUser name:index
```

```ruby
class AddNameIndexToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_index :users, :name
  end
end
```

```ruby
class AddNameIndexToUser < ActiveRecord::Migration
  def change
    add_index :users, :name
  end
end
```

```bash
$ rake db:migrate
```

```bash
$ rails c

irb(main):001:0> User.create(name: 'Jo')
irb(main):002:0> User.create(name: 'Juha')

irb(main):001:0> User.where(name: '').explain
  User Load (0.2ms)  SELECT "users".* FROM "users" WHERE "users"."name" = ?  [["name", ""]]
```

```bash
$ rake db:rollback
$ rails c
irb(main):001:0> User.where(name: '').explain
```

```bash
$ rake db:migrate
```

```bash
$ rails g migration ChangeEmailNotNullInUser
```

```ruby
class ChangeEmailNotNullInUser < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, null: false
  end
end
```

```bash
$ rake db:migrate
```

```ruby
class AddEmailNotNullToUser < ActiveRecord::Migration
  def change
    # set a default for users with no email
    User.where(email: nil).each do |user|
      user.email = "#{user.name}@wyncode.co"
      user.save
    end
    change_column :users, :email, :string, null: false
  end
end
```

```bash
$ rake db:migrate
$ rake db:rollback
```

```ruby
class AddEmailNotNullToUser < ActiveRecord::Migration
  def up
    User.where(email: nil).each { |user|
      user.email = "#{user.name}@wyncode.co"
      user.save
    }
    change_column :users, :email, :string, null: false
  end

  def down
    change_column :users, :email, :string, null: true
  end
end
```

```bash
$ rails g model CodeSchool name

$ rails g migration AddCodeSchoolToUser code_school:references
```

```ruby
class AddCodeSchoolToUser < ActiveRecord::Migration
  def change
    add_reference :users, :code_school, index: true, foreign_key: true
  end
end
```

```bash
$ rake db:migrate
```

```bash
$ rails c
```

```bash
$ rails c
```

```ruby
app/models/user.rb
class User < ActiveRecord::Base
  belongs_to :code_school
end
```

```bash
$ rails c
irb(main):001:0> u = User.find 1
irb(main):002:0> c = u.code_school
irb(main):003:0> c.name
irb(main):004:0> u.code_school_id
```

```bash
$ rails c
irb(main):001:0> u = User.find 1
irb(main):002:0> u.code_school = nil
irb(main):003:0> u.save
irb(main):004:0> u = User.find 1
irb(main):005:0> u.code_school
irb(main):006:0> u.code_school_id
irb(main):007:0> u.code_school = CodeSchool.first
irb(main):009:0> u.save
irb(main):009:0> u = User.find 1
irb(main):010:0> u.code_school_id
irb(main):011:0> u.code_school
```

```bash
app/models/code_school.rb
class CodeSchool < ActiveRecord::Base
  has_many :users
end
```

```bash
$ rails c
irb(main):001:0> c = CodeSchool.first
irb(main):002:0> c.users.count
irb(main):003:0> u = c.users.first
irb(main):004:0> u.name
```

```bash
$ rails c
irb(main):001:0> cs = CodeSchool.take
irb(main):002:0> cs.users.length
irb(main):003:0> cs.users.count
```

```ruby
app/models/code_school.rb
class CodeSchool < ActiveRecord::Base
  has_many :students, class_name: 'User'
end
```

```bash
rails console
irb(main):001:0> CodeSchool.take.students
```
