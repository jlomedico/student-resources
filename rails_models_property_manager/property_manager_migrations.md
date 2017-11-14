# Property Manager Migrations

Now that you and your teammate have planned out the ERD for the app that will make you the world's next startup billionaires, it's time to start building it! 

The second step of any app, after you finish the ERD, is to start building those models.

We'll walk you through the first few steps to get started.

## Walkthrough


### Creating a New Project

Create a new rails app named `property_manager`.

Change directories into the new `property_manager` folder.

Open the app in your text editor using `atom .` or `subl .`.


### Generating a Model

After you have opened your editor, return to the terminal and generate a `Property` model (in accordance with your ERD):

```sh
# Terminal
rails g model Property
rake db:migrate
```


### Adding Columns to a Model

Your client wants each `Property` to know its `location` and `rent`. But you've already created the `Property` model!

You can use a _migration_ to make changes to a model after it has already been generated.

From the command line, generate an empty migration with the proper naming convention.

```sh
# Terminal
rails g migration AddLocationAndRentToProperties
```

Rails will drop a new, empty migration into your migrations folder: `db/migrate`.

Open that new migration in your text editor. You should see an empty `change` method. You need to fill that in.

Migrations are just instructions to make changes to the database. ActiveRecord transforms your Ruby code into the SQL the database needs to make your desired changes.

```ruby
# db/migrate/LONGTIMESTAMPGOESHERE_add_location_and_rent_to_properties.rb
def change
  add_column :properties, :location, :string
  add_column :properties, :rent, :string
end
```

You've written the database instructions, but you haven’t actually *carried them out*. Run the migration you just wrote.

```sh
# Terminal
rake db:migrate
```

Now go back to your editor and check `db/schema.rb`. The `properties` table should now have both `location` and `rent` fields, and they should both be strings.

You can also verify that everthing is working properly from the Rails console. Jump into `rails c` and try running:

```ruby
# rails c
Property.column_names
```

This should return an array containing `"location"` and `"rent"` (and some other columns).

Great! You've made the first migration of your soon-to-be billion-dollar app!


### Renaming a Column

Only, you've made a mistake! `location` is too vague. You should rename that column to `city`. Time to create another migration!

```sh
# Terminal
rails g migration RenameLocationToCity
```

Jump into that new migration to rename the column.

```ruby
# db/migrate/TIMESTAMP_rename_location_to_city.rb
def change
  rename_column :properties, :location, :city
end
```

Take a look at your schema, located at `db/schema.rb`. Notice that nothing has changed yet though. You need to run this migration.

```sh
# Terminal
rake db:migrate
```

Did the column rename successfully in the schema? Good!


### Changing a Column Type

Oops! You just realized that you made another mistake when you created the `rent` column of the `properties` table. The column is going to store money, but you made the column a string instead of an integer!

Make that change. Generate a new migration on your own. We're not giving you any hints this time.

Once your new migration been generated, use this code to change a column's data type.

```ruby
# db/migrate/TIMESTAMP_YOUR_MIGRATION_NAME.rb
def change
  change_column :properties, :rent, :integer
end
```

Migrate and verify that the change worked by checking your schema.

### Removing a Column

Your property model is finished! At least it was, but now you get a call from your landlord co-founder. He "just realized" that the app should absolutely not track rent for vague legal reasons. Turns out we don't want that `rent` column at all.

On your own, create a migration and look up how to remove the `rent` column from the `properties` table. No hints at all this time.

Migrate and check your schema, did it work?

Great! Good job.
