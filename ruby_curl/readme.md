# Ruby Curl
Let's do a quick review of how accessing a website works.
In order to get the information we want, we have to **request** it.
There are several tools to make **requests**. Normally you use your _browser_.
Imagine we didn't have a browser, we could use a tool we learned about: `curl`.
You use it just like any other command in your terminal.

For example: `curl -iX GET https://www.twitter.com/jciancio7`
The `-i` includes the protocol headers in the output.
I'm using this so we can see the basics of a request.
The `-X` allows me to specify the _verb_. We'll just use `GET`, which literally
_gets_ information. But there are other verbs you will start using soon.

So in order to _get_ information from a website, we have to properly format a
**request**. Curl will take care of that for us!

So in your mind, you can imagine that when you hit enter in a browser window,
you are using curl.
Just like curl takes care of the **request**, so does your browser.

So the point of the "Ruby Curl" exercise, is to implement the same behavior as curl,
but with Ruby code.

Meaning, in the terminal, we want to be able to write `ruby curl.rb [VERB] [URL]`

Instead of worrying about how to properly format a **request**, we can use a tool
`HTTParty`.
`HTTParty` makes it so easy for us to make requests, we literally just write:
`HTTParty.get(http://www.google.com)`

So let's open a blank ruby file, named `curl.rb`. (Remember: name doesn't matter)
The first thing we should do is `require 'httparty'`.
Now we have access to the tools we need.

We already learned how to get input from the terminal using `ARGV`.
The `ARGV` array begins after the file name.
So at `ARGV[0]` we should expect the user to pass in the verb.
We'll just be using `GET` for now, but I want us to remember that we have other options.

In your file write:

```ruby
method = ARGV[0]
```

Now let's store the url in a variable too:

```ruby
url = ARGV[1]
```

You may have already seen that running a command in the terminal without the proper
arguments outputs some helpful information on how to use the command.
Let's implement that same behavior:

```ruby
if (method != "GET" || url.nil?)
  puts "Usage: ruby curl.rb [HTTP_METHOD] [URL]"
end
```

We're saying, if either of the two things are missing, then let's help out the user.

Now if we run `ruby curl.rb` we should get "Usage: ruby curl.rb [HTTP_METHOD] [URL]"
Of course, this doesn't account for all possibilities, but it's okay for the scope
of this assignment.

Let's take care of what should happen if we do get the proper arguments.

```ruby
if (method != "GET" || url.nil?)
  puts "Usage: ruby curl.rb [HTTP_METHOD] [URL]"
elsif (method == "GET" && url)
  response = HTTParty.get(url)

  puts "\n=== HEADERS ===\n"
  p response.headers
  puts "\n=== BODY ===\n"
  puts response.body
end
```

Let's break this down:

```ruby
elsif (method == "GET" && url)
  response = HTTParty.get(url)
```

If we receive a "GET" argument and a url then let's use the `get` method from
`HTTParty`. It's very simple, all it takes is a url as an argument.
The return value of a proper **request** is a **response** object, just like you would see
in your browser when the page loads. So we appropriately name the variable `response`.

`response` will be an _instance_ of the `HTTParty::Response` class. (`p response.class`)
There's nothing magical going on. This instance has some information about the response,
known as the **headers**. So we show them to the user:

```ruby
puts "\n=== HEADERS ===\n"
p response.headers
```

The meat of what we want, the actual HTML, is held inside the **body**.
So let's show the user:

```ruby
puts "\n=== BODY ===\n"
puts response.body
```
