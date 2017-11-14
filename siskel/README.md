# Siskel

During this exercise, you will work in small groups to create _Siskel_, an object that retrieves movie data using the [OMDb API](http://www.omdbapi.com/). To do so, you've been provided with a file, `test.rb`, containing failing tests. It is your job to make as many of these tests pass in the time provided as you can.

Upon completion, you should be able to use a simple API to retrieve data from the web and understand how you can use tests to dictate the design of your projects.

## Getting Started

If you have already cloned this repo, skip this step.

If you haven't already cloned this repo, each member of your team should clone this repo to their Wyncode projects folder. Even though you are working together, each of you should have a copy of the answer.
```sh
cd YOUR_PROJECTS_FOLDER_GOES_HERE
git clone PUT_THIS_REPOS_GIT_CLONE_URL_HERE
```

Enter the cloned directory and use `bundler` to install all the required gems.

```sh
$ cd student-resources/siskel
$ bundle
```

Run the provided tests.

```sh
$ ruby test.rb
Run options: --seed 10217

# Running:

.

Finished in 0.112265s, 8.9075 runs/s, 8.9075 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

You will notice that we have one passing test. To get you started, we have already gone ahead and written some code to make the first test pass.

This first test requires that we retrieve the film *Kill Bill: Vol. 1* using `Siskel.new("Kill Bill")` and assign it to a `movie` variable. Calling `movie.title` should return `"Kill Bill: Vol. 1"`.

```ruby
# test.rb

class TestSiskel < Minitest::Test
  def test_movie_title
    movie = Siskel.new("Kill Bill")
    assert_equal "Kill Bill: Vol. 1", movie.title
  end
end
```

Our `Siskel` object uses HTTParty to access the OMDb API when it is initialized. We will explore this API in more detail shortly. Using the data returned, we can assign `@title` to return our movie's title.

```ruby
# siskel.rb

require 'httparty'

class Siskel
  attr_reader :title

  def initialize(title)
    @movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}")
    @title = @movie["Title"]
  end
end
```

Now that our first test has passed, uncomment the next test in `test.rb`. This new test should fail when we run our tests. Write just enough code for this test to pass. Continue this process until all tests pass.

## Using the OMDb API

The [OMDb API](http://www.omdbapi.com/) is fortunately pretty straightforward. A simple `GET` request to `"http://omdbapi.com/?t=Fargo"` will return by default a JSON object with movie data for _Fargo_. You can even test this in your browser.

```json
{
	Title: "Fargo",
	Year: "1996",
	Rated: "R",
	Released: "5 Apr 1996",
	Runtime: "98 min",
	Genre: "Crime, Drama, Thriller",
	Director: "Joel Coen, Ethan Coen",
	Writer: "Ethan Coen, Joel Coen",
	Actors: "William H. Macy, Steve Buscemi, Peter Stormare, Kristin Rudrüd",
	Plot: "Jerry Lundegaard's inept crime falls apart due to his and his henchmen's bungling and the persistent police work of the quite pregnant Marge Gunderson.",
	Language: "English",
	Country: "USA, UK",
	Awards: "Won 2 Oscars. Another 68 wins & 51 nominations.",
	Poster: "http://ia.media-imdb.com/images/M/MV5BMTgxNzY3MzUxOV5BMl5BanBnXkFtZTcwMDA0NjMyNA@@._V1_SX300.jpg",
	Metascore: "85",
	imdbRating: "8.2",
	imdbVotes: "385103",
	imdbID: "tt0116282",
	Type: "movie",
	Response: "True"
}
```

The `?` in our request indicates the start of a query string. A query string lets us pass any number of key-value pairs to our request, separated by `&`s.

So if we wanted to be more specific, we could search for *Fargo* by both title _and_ year.

```sh
http://omdbapi.com/?t=Fargo&y=1996
```

The OMDb API provides us with a few different parameters we can use to make our query more specific. You can find these all readily available in the OMDb documentation. Play around with them until you feel comfortable.

Not all APIs are as simple as OMDb. Make sure your first step when using a new API is reading through its documentation. This will likely save you tons of time down the road. If you're lucky, an API will be well documented, but that's not always the case.

Now get to work!

## Additional Resources

* [HTTParty Documentation](https://github.com/jnunemaker/httparty) - HTTParty gives us a number of methods we can use to further clean up our project.

* [Bundler](http://bundler.io/) - Bundler makes managing gems and dependencies a breeze. Check out the documentation for a deeper dive into how it works.
