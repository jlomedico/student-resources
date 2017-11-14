# MovieFinder

This live coding session revisits the [Siskel](http://github.com/wyncode/siskel) exercise created earlier in the program to build a Sinatra-based web app. This app, _MovieFinder_, will allow users to search for movies and retrieve basic information about them.

Upon completion, we will be able to structure files in our Sinatra application and use ERB to embed Ruby code into our HTML.

## Contents

* [Getting Started](#getting-started)
* [Iteration 1 - Introducing ERB](#iteration-1---introducing-erb)
* [Iteration 2 - Creating the Model](#iteration-2---creating-the-model)
* [Iteration 3 - Passing Variables to ERB Files](#iteraion-3---passing-variables-to-erb-files)
* [Iteration 4 - Using Parameters](#iteration-4---using-parameters)
* [Iteration 5 - Search](#iteration-5---search)
* [Next Steps](#next-steps)

## Getting Started

At this point, we should already be familiar with the basic structure of a Sinatra application. Create a new directory, `moviefinder`, to house this new app.

```sh
$ mkdir moviefinder
$ cd moviefinder
$ touch Gemfile Procfile server.rb
```

```sh
# Procfile
web: ruby server.rb -p $PORT
```

```ruby
# Gemfile
source 'http://rubygems.org'
ruby '2.2.1' # Or whichever Ruby version you are using.

gem 'sinatra'
```

Have the root path simply return "MovieFinder" for now.

```ruby
# server.rb
require 'sinatra'

get '/' do
  "MovieFinder"
end
```

Don't forget to bundle!

```sh
$ bundle install
```

Boot up the server.

```sh
$ ruby server.rb
```

Confirm that all code so far works at http://localhost:4567.

Finally, let's start start tracking this project using git.

```sh
$ git init
$ git add .
$ git commit -m "Initial commit"
```

## Iteration 1 - Introducing ERB

Aside from including static files, we can use a special templating feature built into Ruby known as ERB to embed Ruby code into our web pages.

These ERB files, generally speaking, can be referred to as our _views_, and make up the V in MVC, which we will learn more about later. Sinatra will, by default, look for ERB files in a `views` directory.

Let's create a basic `index.erb` view without any Ruby code yet.

```sh
$ mkdir views
$ touch views/index.erb
```

Now let's add the basic skeleton of an HTML page. Typing `html` followed by the tab key will generate most of this for us in most IDEs. You may need to plug in a `doctype`, `title`, and `charset`.

```html
<!-- views/index.erb -->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>MovieFinder</title>
  </head>
  <body>
    <h1>MovieFinder</h1>
  </body>
</html>
```

Sinatra makes it very simple to serve ERB files. Let's modify `server.rb` to load our index view.

```ruby
# server.rb
get '/' do
  erb :index
end
```

Restart the server to see this in action.

Let's actually embed some Ruby, though, to take advantage of what ERB can do. For now, let's just play around.

```html
<!-- views/index.erb -->
<body>
  <h1>MovieFinder</h1>

  <p><%= 2 + 2 %></p>

  <% ["Snickers", "Starburst", "Twix"].each do |candy| %>
    <p><%= candy %></p>
  <% end %>
</body>
```

We haven't changed our server file, so we don't need to restart our entire application. Refresh the page and take a look at what happened. Anything inside `<%= %>` is evaluated as Ruby code and output to the screen!

Note the missing `=` in our `each` loop. We omit the `=` when we don't want a particular line of Ruby code to be output. Don't forget this!

Now that we've played around, let's clear out the embedded Ruby we just added to `index.erb`. We'll come back to this file later.

Let's commit what we've done so far.

```sh
$ git add .
$ git commit -m "Add index view"
```

## Iteration 2 - Creating the Model

We're going to use our `Siskel` object to retrieve movie data from OMDb. Let's place this class into a directory called `models`. Models are the M in MVC. We'll discuss these in much more detail when we get to Rails, but for now all we need to know is that our _models_ store our application's data and business logic.

```sh
$ mkdir models
$ touch models/siskel.rb
```

Our `Siskel` class will remain entirely unchanged.

```ruby
# siskel.rb
require 'httparty'

class Siskel
  attr_accessor :title, :year, :rating, :plot

  def initialize(title, opts = {})
    @movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}&y=#{opts[:year]}&plot=#{opts[:plot]}?tomatoes=true")
    @rating = @movie["Rated"]
    @title = @movie["Title"] || @movie["Error"]
    @year = @movie["Year"]
    @plot = @movie["Plot"]
    @tomatoes = @movie["tomatoMeter"]
  end

  def concensus
    case @tomatoes.to_i
    when 76..100 then "Two Thumbs Up"
    when 51..75 then "Thumbs Up"
    when 26..50 then "Thumbs Down"
    else "Two Thumbs Down"
    end
  end
end
```

Since this file uses the HTTParty gem, we need to update our Gemfile and bundle.

```ruby
# Gemfile
source 'http://rubygems.org'
ruby '2.2.1' # Or whichever Ruby version you are using.

gem 'sinatra'
gem 'httparty'
```

```sh
$ bundle install
```

Let's add a new route, `/movie`, to our server where we will use `Siskel` to output our movie data. We'll hardcode a movie for now to test this out.

```ruby
# server.rb
get '/movie' do
  movie = Siskel.new("Lion King")
  "This movie title is #{movie.title}"
end
```

Since we've modified our server, we'll need to restart it to view these changes.

```sh
uninitialized constant Siskel
```

Uh oh! Looks like we never included `Siskel` in our application! Let's `require` it and try that again.

```ruby
# server.rb
require 'sinatra'
require './models/siskel.rb'
```

That's much better. We can see that our `/movie` route will spit back out the movie title for _Lion King_. This isn't quite what we want the final result to look like, but it's an encouraging start! Let's commit these updates.

```sh
$ git add .
$ git commit -m "Add Siskel to fetch movie data"
```

## Iteration 3 - Passing Variables to ERB Files

Now that we're able to get our movie data, let's try accessing it in our ERB views. Update `index.erb` view to display this information.

Let's just return the movie's title in the `<h2>` tag.

```html
<!-- views/index.erb -->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>MovieFinder</title>
  </head>
  <body>
    <h1>MovieFinder Search Results</h1>

    <h2><%= movie.title %></h2>

    <p><%= movie.plot %></p>
  </body>
</html>
```

All that's left is to modify our server to return the right file.

```ruby
# server.rb
get '/movie' do
  movie = Siskel.new("Lion King")
  erb :index
end
```

You know the drill. Restart the server and check out `localhost:4567/movie`.

```
undefined local variable or method `movie' for #<Sinatra::Application:0x007ff64cc990d8>
```

Uh oh! It looks like `movie` isn't being recognized as a variable in our view. This error does look familiar, though. It's the same error we get when trying to access an inaccessible variable - a variable that is "out of scope".

As before, this error can be solved by increasing the variable's scope - by making `movie` an instance variable.

```ruby
# server.rb
get '/movie' do
  @movie = Siskel.new("Lion King")
  erb :movie
end
```

```
<!-- views/index.erb -->
<h2><%= @movie.title %></h2>
<p><%= @movie.plot %></p>
```

Restart server. Reload page. _Voilà!_

## Iteration 4 - Using Parameters

Customize the server to display details for any movie we specify.

Confirm that you can pass data into your app via the URL.

```rb
# server.rb
get '/' do
  params.to_s
  #@movie = Siskel.new("Lion King")
  #erb :index
end
```

Test the following URLs:
- `http://localhost:4567/`
- `http://localhost:4567/?asdf=asdf`
- `http://localhost:4567/?title=Jaws`
- `http://localhost:4567/?title=Jaws&plot=full`

Use the `params` hash to display information about whatever movie you want.

```rb
# server.rb
get '/' do
  title = params[:title]
  @movie = Siskel.new(title)
  erb :index
end
```

Test the following URLs:
- `http://localhost:4567/?title=Jaws`
- `http://localhost:4567/?title=pi`
- `http://localhost:4567/?title=clue`
- `http://localhost:4567/?title=go`
- `http://localhost:4567/?title=the matrix` (titles with spaces don't work on Safari)


## Iteration 5 - Search

Create a search form to send the appropriate data to the server.

```html
<!-- inside views/index.erb -->
<form>
  <input type="search" name="title">
</form>
```

This `<form>` defaults to a `GET` action to the current URL.

## Next Steps

Now, there are obviously some problems with this implementation. Had we been using test-driven development, these may have become more apparent. Here are a few ideas for additional iterations of this application to make it more robust.

* Using Minitest or Rspec, add some test coverage to this app.
* If we don't pass in any parameters to `/movie`, an error is thrown. How can we safeguard against this?
* Similarly, if we pass in a movie that doesn't exist, we don't necessarily receive an _error_, but the output isn't quite as expected. Let's change that up.
