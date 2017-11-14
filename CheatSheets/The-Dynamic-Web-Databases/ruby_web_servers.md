# What You Learned
* How to build an HTTP server with Sinatra.
* How to run your server.
* How to deploy your server to Heroku.

# Installing Heroku Toolbelt
```sh
# Terminal
brew update && brew install heroku-toolbelt
```

# Installing Gems
```sh
# Terminal
gem install sinatra bundler
```

# Creating the Project
```sh
# Terminal
cd YOUR_PROJECT_DIRECTORY
mkdir server
cd server
git init
```

# Creating a Server

```rb
# server.rb
require 'sinatra'

get '/' do
  "Hello world"
end
```

# Sinatra's DSL
## To run code on an HTTP GET
```rb
# server.rb
get '/' do
  # show something
end
```

## To run code on an HTTP POST
```rb
# server.rb
post '/' do
  # create something
end
```

## To run code on an HTTP PUT
```rb
# server.rb
put '/' do
  # replace something
end
```

## To run code on an HTTP DELETE
```rb
# server.rb
delete '/' do
  # annihilate something
end
```

# Running Your Server
```sh
ruby server.rb
```

## Terminal Output
```
[2014-04-30 15:46:31] INFO  WEBrick 1.3.1
[2014-04-30 15:46:31] INFO  ruby 2.1.1 (2014-02-24) [x86_64-darwin13.0]
== Sinatra/1.4.5 has taken the stage on 4567 for development with backup from WEBrick
[2014-04-30 15:46:31] INFO  WEBrick::HTTPServer#start: pid=35720 port=4567
```

## Testing Your Server

### In Another Terminal Tab (`Command+t`)
```sh
curl http://localhost:4567
```

### In the first Terminal tab (where you ran `ruby server.rb`)
This is a web server log.
```
::1 - - [30/Apr/2014 15:55:07] "GET / HTTP/1.1" 200 11 0.0003
localhost - - [30/Apr/2014:15:55:07 EDT] "GET / HTTP/1.1" 200 11
- -> /
```

### In Your Browser
Check out `http://localhost:4567` and `http://localhost:4567/blah`.

### In the Server Terminal
These are what HTTP Status Code 404 (Not Found) errors look like.

```
::1 - - [30/Apr/2014 15:58:36] "GET /blah HTTP/1.1" 404 441 0.0009
localhost - - [30/Apr/2014:15:58:36 EDT] "GET /blah HTTP/1.1" 404 441
- -> /blah
```

# Stopping Your Server
In the server Terminal tab, hold `control+c`.
```
Killing Sinatra
^C== Sinatra has ended his set (crowd applauds)
[2014-04-30 16:03:38] INFO  going to shutdown ...
[2014-04-30 16:03:38] INFO  WEBrick::HTTPServer#start done.
```

## Restarting the server
```sh
# Terminal (typically just up arrow, then Enter/Return)
ruby server.rb
```

# Updating Your Server
```rb
# server.rb
get '/' do
  "Hello world"
end

get "/sinatra" do
  "Hello Sinatra"
end
```

### Test Your Update

```
# Terminal
curl -i http://localhost:4567/sinatra
```
Output:
```
HTTP/1.1 404 Not Found
...
```

In the browser: `http://localhost:4567/sinatra`.

### Why aren't my updates working?
Whenever you change Sinatra Ruby code, you need to _bounce_ the server.

In the server Terminal, `control+c`.
```
Bounce Sinatra
^C== Sinatra has ended his set (crowd applauds)
```

Then restart the server (typically just `up-arrow`, then `enter`).
```
# Terminal
ruby server.rb
```

Output
```
== Sinatra/1.4.5 has taken the stage on 4567 for development with backup from WEBrick
```

### Check Your Updates Again
```sh
# Terminal
curl http://localhost:4567/sinatra
```

Browser: `http://localhsot:4567/sinatra`

# Preparing to Deploy to Heroku

```rb
# Gemfile
source "https://rubygems.org"
ruby "2.3.1" # or whatever your current ruby version is (check "ruby -v" in Terminal)
gem "sinatra"
```

```sh
# terminal
bundle install # or just "bundle", which does the same thing
```

```sh
# Procfile
web: ruby server.rb -p $PORT
```

```sh
git add .
git commit -m "first Heroku commit"
```

# Deploying to Heroku (for the first time)
```sh
# Terminal
heroku create
git push heroku master
```

# Updating and Deploying Again

By convention, all the files and folders in `public/` are public.
```bash
# terminal
mkdir public
echo 'Hello world!' > public/hello.txt
ruby server.rb
```

Browser: `http://localhost:4567/hello.txt`.

## Updating an existing Heroku site
```sh
git add .
git commit -m "Updating site"
git push heroku master
```
