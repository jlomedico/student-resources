# Property Manager Models
In the last exercise, you created a `Property` model. That's great! But your app takes care of quite a bit more than that. Time to start building the rest!

## Walkthrough

Go back to your Property Manager app. You're about to prepare other models for the app so they match the ERD you designed in a previous exercise.

Change directories to the `property_manager` folder and open it in your text editor.

### Visualizing Your ERD

There's a handy gem called `rails-erd` that generates a PDF document containing an ERD of your current models. Install it so you can visualize your work as you go along:

Update your `Gemfile`.

```ruby
# Gemfile
gem "rails-erd", :group => :development
```

In the Terminal:

```sh
# Terminal
bundle install
```

The `rails-erd` gem depends on an external library called `graphviz`. It's not a Ruby program, so we need to install that separately.

```sh
# Terminal
brew install graphviz
# Linux users: sudo apt-get install graphviz
```

You now have a new *Rake task* in your application, thanks to our good friend `rails-erd`. To use it to generate an up-to-date ERD, run:

```sh
# Terminal
bundle exec erd
```

Done! Now there's an `erd.pdf` in your app's directory. Open it up.

```sh
# Terminal
open erd.pdf
# Linux users: xdg-open erd.pdf
```

At this point you should only have one table (`properties`) in your database.

### Generating Another Model

Let's generate the other models we'll need for this app.

You should know how to create a blank model and use migrations to add additional attributes to that model afterwards. But did you know you can also generate the model and the attributes all at once?

```sh
# Terminal
rails g model Landlord name
rake db:migrate
```

If you'd like, you can create a new ERD (`bundle exec erd`) to see the new model. They aren't connected in any way yet.

### Generating an Association

It's time to connect the `Landlord`s and `Property`s! 

In words, you can describe the relationship between landlords and properties in your app this way.

> A landlord has many properties.  
> Each property belongs to a landlord.

Rails defines `has_many` and `belongs_to` methods you can use to define this type of association.
  
First, open your `landlord.rb` file in your `app/models` folder. Let Rails know that "landlords have many properties".

```ruby
# app/models/landlord.rb
class Landlord < ApplicationRecord
  has_many :properties
end
```

Add the other end of the relationship to your `Property` model in `property.rb`:

```ruby
# app/models/property.rb
class Property < ApplicationRecord
  belongs_to :landlord
end
```

The `has_many`/`belongs_to` association requires changes to your database. The `belongs_to` side (the model class containing `belongs_to`, i.e. the `properties` table) requires a `landlord_id:integer` column (a _foreign key_). The `landlord_id` column tells the database which `Landlord` a `Property` is associated with.

Normally, this is where you would generate an empty migration and fill it in. But it turns out we've been keeping a secret from you. If you correctly name your migration (i.e. `AddAttributeNameToModel`) you can append arguments for:

1. the names of the columns you want 
1. the type of data in each column

... and Rails will automatically fill in the migration for you. 

Let's try this new trick. This line will generate a migration that is already written out for you.
```sh
# Terminal
rails g migration AddLandlordToProperties landlord_id:integer
```

Check out the new migration file in `db/migrate/`. The `change` method should be filled in for you already. The code should look familiar. We've been writing these migrations ourselves up to now.

But there's an even better way to generate these kinds of migrations. Assuming you haven't run this migration yet (you haven't `db:migrate`d yet, right?), let's delete this migration.

```sh
# Terminal
rails d migration AddLandlordToProperties
```

`rails d` (short for `rails destroy`) deletes things that Rails has generated. This is only safe to do if the migration hasn't been run yet. **Don't delete migrations after they've been run (with `rake db:migrate`)**.
 
ActiveRecord knows what foreign keys are. If we tell ActiveRecord that, not only is this column an `integer` named `landlord_id`, but it's also a foreign key to the `landlords` table, Rails will generate an even better migration for us.

To generate this new-and-improved migration, run this in your terminal instead:

```sh
# Terminal
rails g migration AddLandlordToProperties landlord:belongs_to
```

or this (which does the same thing, `references` and `belongs_to` are equivalent)

```sh
# Terminal
rails g migration AddLandlordToProperties landlord:references
```

If you check the newly created migration, you'll note that ActiveRecord is referring to this new column as a _reference_. This makes sense! Properties are _referencing_ landlords. Use this migration shortcut for all your foreign key needs. 

If everything looks good, execute this migration

```sh
# Terminal
rake db:migrate
```

Check the `schema.rb` and you should see the newly added column. You should also see some additional lines the database is using to enforce constraints and optimize this foreign key association. We'll talk about that stuff later.

### Bonus 

Great! There's one more model that needs to be generated: `Repair`. You are on your own for this one. 

Think about the relationship between `Property` and `Repair`. What additional columns will be required (and in which table) to link the `properties` and `repairs` tables? Try to get Rails to generate the column-adding code automatically for you.

### Finished!

Verify that you've correctly rebuilt the ERD you originally planned in your drawing.

```sh
# Terminal
bundle exec erd
```

Congratulations. You've modeled your first app!
