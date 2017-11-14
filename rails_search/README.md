# Search Forms in Rails

## Time

2hrs

## Summary

In this live coding session, we scaffold a music distribution site, then add a search feature. We can search across multiple models and do partial text matching as well.

## Objectives

Students will learn how to implement a search form in Rails:
- using controllers and actions
- using _model-less_ `form_tag` forms
- using `params`
- knowing the difference between `find_by` and `where`
- knowing to avoid SQL injection
- searching across multiple models
- refactoring to use
  - named scopes
  - model concerns

## Prequisites

- Rails Models
- Rails Views
- Rails Controllers (`params`)

## Required Resources

One TA for every ten students.

## External Planning

none

## Instructions

Create a new application named _MusicDistribution_:
```sh
rails new MusicDistribution
cd !$
```

[`!$` is the last argument of the last command.](https://www.computerhope.com/ushort.htm)

Scaffold an _Artists_ app:
```sh
rails g scaffold Artist name
rake db:create
rake db:migrate
```

Start the app.
```sh
rails s
```
Head over the seeds file to create some test `Artist`s, some whose name shares the same substring (e.g. "The" bands).

```ruby
#/db/seeds.rb
Artist.destroy_all
['The Doors',
 'The Doors',
 'Pink Floyd',
 'Ozzy Osbourne',
 'DJ Dado',
 'The Killers',
 'The Who'].each do |name|
    Artist.create name: name
  end
```
Now run in the console

```sh
rake db:seed
```

This `seeds.rb` file is (mostly) [idempotent](http://www.restapitutorial.com/lessons/idempotency.html), meaning that you can re-run `rake db:seed` multiple times without generating duplicates (besides the ones we want). Every time you run it, it deletes all the `Artist`s and recreates a new list.

Next, generate a `SiteController` with a `search` action:
```sh
rails g controller site search
```

Configure the app to serve this search page at the root.
```ruby
# config/routes.rb
root 'site#search'
get 'site/search'
```

Start your server (`rails s`) and view [http://localhost:3000/](http://localhost:3000/) in your browser. You should see the `site#search` placeholder view.

Delete the view placeholder code and create a search form.
```erb
<%# apps/views/site/search.html.erb %>
<h1>Music Distribution</h1>
<%= form_tag site_search_path do %>
  <%= search_field_tag :term %>
  <%= submit_tag "Go!" %>
<% end %>
```
- Use the `form_tag` _view helper_ to generate a non-model-backed HTML `<form>`.
- Use the `search_field_tag` helper to create a search-styled text `input` field named `term`.
- The `form` should `POST` to `site#search` via the route _URL view helper_ `site_search_path`.

Test the form. You should get an error about a missing POST route. Add the missing route.
```ruby
# config/routes.rb
root 'site#search'
get 'site/search'
post 'site/search'
```

Test the form again. You shouldn't get an error, but nothing should happen. The page should just reload.

Update the view to examine the `params`.
```erb
<%# apps/views/site/search.html.erb %>
<h1>Music Distribution</h1>
<%= form_tag site_search_path do %>
  <%= search_field_tag :term %>
  <%= submit_tag "Go!" %>
<% end %>
<%= params %>
```

Examine how the params change when you search. Update the view again.

```erb
<%# apps/views/site/search.html.erb %>
<h1>Music Distribution</h1>
<%= form_tag site_search_path do %>
  <%= search_field_tag :term %>
  <%= submit_tag "Go!" %>
<% end %>
<%= params[:term] %>
```

The search term is available in `params[:term]`, matching the name of the search `<input>` `name` attribute.

Update the `search` action to find an `Artist` _by name_.

```ruby
# app/controllers/site_controller.rb
def search
  @result = Artist.find_by name: params[:term]
end
```

Display the search result in the view
```erb
<%# apps/views/site/search.html.erb %>
<h2>Search Results</h2>
<% if @result %>
  <%= @result.name %>
<% else %>
  Try your search again.
<% end %>
```

Test with the duplicate artist name. We're only getting one result back. Update the controller to get all the matching results.

```ruby
# app/controllers/site_controller.rb
@results = Artist.where name: params[:term]
```
- Use `.where` instead of `.find_by`.
- Rename `@result` to `@results`.

Update the view to display all the results.
```erb
<%# apps/views/site/search.html.erb %>
<h2>Search Results</h2>

<% if @results.empty? %>
  Try your search again.
<% else %>
  <% @results.each do |result| %>
    <p><%= result.name  %></p>
  <% end %>
<% end %>
```

Turn the search results into links.
```erb
<%# apps/views/site/search.html.erb %>
<%= link_to result.name, result  %>
```

This search form only finds exact matches. Let add support for case-insensitive matching.

```ruby
# app/controllers/site_controller.rb
@results = Artist.where("name LIKE '#{params[:term]}'")
```
The `LIKE` keyword in SQL supports case-insensitive matches.

Test case-insensitive search in the app.

This query is dangerous. Try searching for `'); DROP TABLE artists; --`. This is a _SQL-injection (SQLi)_ attack vector (aka. [Little Bobby Tables](https://xkcd.com/327/)). _Never_ do interpolation into a SQL String. Instead, use a [ _parameterized_ query](http://blog.codinghorror.com/give-me-parameterized-sql-or-give-me-death/).

```ruby
# app/controllers/site_controller.rb
@results = Artist.where("name LIKE ?", "#{params[:term]}")
```

Notice the diference?  
Before:
```ruby
@results = Artist.where("name LIKE '#{params[:term]}'")
```
After:
```ruby
@results = Artist.where("name LIKE ?", "#{params[:term]}")
```

Rails will sanitize the data before inserting it into the SQL query.

We only have case-insensitive matching. Add partial matching.

```ruby
@results = Artist.where("name like ?", "%#{params[:term]}%")
```
The `%` in SQL acts like the wildcard `*` in Command Line (BaSH).

Searching for `the` should return all "The" bands. Searching for nothing should return everything. Entering a non-matching string should return your `try again` message.

_(don't forget to take breaks)_

Generate `Album` and `Label` scaffolds.
```bash
rails g scaffold album name
rails g scaffold label name
rake db:migrate
```

Plug some test data into the seeds file.

```ruby
# db/seeds.rb

# artist seeding up here...

['Universal',
 'Virgin',
 'Atlantic',
 'Geffen'
].each do |name|
  Label.find_or_create_by name: name
end


['The Best of The Doors',
 'Waiting for the Sun',
 'Dark Side of the Moon',
 'Hot Fuss',
 'Battle Born',
 'Who Are You',
 'Live At Leeds',
 'No More Rain',
 'The X Files'
].each do |name|
  Album.find_or_create_by( name: name )
end
```

This seed file is still _idempotent_ because the [find_or_create_by](http://apidock.com/rails/ActiveRecord/Relation/find_or_create_by) method will not create duplicates. We only create a new item if an existing item (with the same name) doesn't exist.

Now in the console:
```sh
rake db:seed
```

Search across multiple models.
```ruby
# app/controllers/site_controller.rb
def search
  artists = Artist.where("name LIKE ?", "%#{params[:term]}%")
  albums = Album.where("name LIKE ?", "%#{params[:term]}%")
  labels = Label.where("name LIKE ?", "%#{params[:term]}%")
end
```

To combine all your results, realize that all of these `ActiveRecord_Relation` instances _quack_ like `Array`s.
```ruby
# app/controllers/site_controller.rb
def search
  artists = Artist.where("name like ?", "%#{params[:term]}%")
  albums = Album.where("name like ?", "%#{params[:term]}%")
  labels = Label.where("name like ?", "%#{params[:term]}%")
  @results = artists + albums + labels
end
```

Confirm that the search now works across all three models. Even the `link_to`s still work, even though they are being passed different types of objects.

## Bonus Refactoring


### _DRY_ refactoring with `each`

Stop repeating that long `where` clause.

```ruby
# app/controllers/site_controller.rb
@results = []
[Artist, Album, Label].each do |model|
  @results += model.where("name LIKE ?", "%#{params[:term]}%")
end
```

### _DRY_ refactoring with `map`

```ruby
@results = [Artist, Album, Label].map do |model|
  model.where("name LIKE ?", "%#{params[:term]}%")
end.flatten
```
This one might be a bit too complicated for some people. (Remember [flatten](http://apidock.com/ruby/Hash/flatten)?) 

If this is too much, use the `each` version instead.

### _Fat model_ refactoring with _named scopes_

Controllers shouldn't care about database details like `where` and `LIKE`. I want to reserve the right to use a better search algorithm later, without having to change any controller code (because this type of text searching is actually very slow).

Let's define a new _named scope_.

```ruby
# app/controllers/site_controller.rb
@results = []
[Artist, Album, Label].each do |model|
  @results += model.search(params[:term])
end
```  
```ruby
# inside each model
def self.search(term)
  where("name LIKE ?", "%#{term}%")
end
```

### _DRY model_ refactoring with _concerns_

Wait... didn't we just refactor away repeated calls to `where`... only to add them back in again?

We need to _DRY_ up our _fat models_. (ref. [How To Use Concerns](http://stackoverflow.com/questions/14541823/how-to-use-concerns-in-rails-4))

In the terminal:
```bash
touch  app/models/concerns/searchable_by_name.rb
``` 
In ```app/models/concerns/searchable_by_name.rb```

```ruby
# app/models/concerns/searchable_by_name.rb
module SearchableByName
  extend ActiveSupport::Concern

  module ClassMethods
    def search(term)
      where("name LIKE ?", "%#{term}%")
    end
  end
end
```
Now inside each model:
```ruby
# app/models/artist.rb
class Artist < ApplicationRecord
  include SearchableByName
end
# app/models/label.rb
class Label < ApplicationRecord
  include SearchableByName
end
# app/models/album.rb
class Album < ApplicationRecord
  include SearchableByName
end
```




### DRY model refactoring with _concerns_ and _scopes_

This `search` method (now shared through the _concern_) is a _named scope_. Refactor to use the new _stabby lambda_ `scope` syntax.

```ruby
# app/models/concerns/searchable_by_name.rb
module SearchableByName
  extend ActiveSupport::Concern
  included do
    scope :search, ->(term) { where("name LIKE ?", "%#{term}%") }
  end
end
```

## Default Search Page

Finally, when you just visit [http://localhost:3000](http://localhost:3000) or search for an empty string, we show all the results. Let's fix that.

```ruby
# app/controllers/site_controller.rb
def search
  term = params[:term]
  return if term.blank? # matches nil and ""

  @results = []
  [Artist, Album, Label].each do |model|
    @results += model.search term
  end
end
```

```erb
<%# app/views/site/search.html.erb %>
<h2>Search Results</h2>

<% if @results.nil? # no search %>
  Search for whatever you'd like.
<% elsif @results.empty? # no results %>
  Try your search again.
<% else %>
  <% @results.each do |result| %>
    <p><%= link_to result.name, result %></p>
  <% end %>
<% end %>
```

## Keep Going

- Create and use `Artist`, `Group`, and `Label` view partials to make each item in the search result look different depending on the object type.
- Create a view partial that allows you to simply `<%= render @results %>`.
- Try to use the [pg_search](https://github.com/Casecommons/pg_search) or [texticle](http://texticle.github.io/texticle/) gems to use PostgreSQL's built-in text search capability.
