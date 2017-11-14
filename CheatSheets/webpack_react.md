# Node

Install node (aka nodejs).

```sh
# Mac Terminal
brew install node

# According to https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
# Linux Terminal
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get update
sudo apt-get install -y nodejs build-essential
```

Confirm that the latest version of node is installed.
```
# Mac Terminal
node --version

# Linux Terminal
nodejs --version
```

# Yarn
Install yarn

```sh
# Mac Terminal
brew install yarn

# according to https://yarnpkg.com/lang/en/docs/install/#linux-tab
# Linux Terminal
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
```

Confirm that the latest version of yarn is installed.
```sh
# Terminal
yarn --version
```

# Webpacker Gem

Add Webpacker to your `Gemfile`.
```rb
# Gemfile
gem 'webpacker'
```

Always `bundle` after updating `Gemfile`
```sh
# Terminal
bundle
```

Install Webpacker files into your app.
```sh
# Terminal
rails webpacker:install
```

# Test Webpacker

First, if you don't already have a page in your app, create one. This line, for example, will create a page at http://localhost:3000/home/index.
```sh
# Terminal
rails g controller home index
```

To integrate the Webpacker gem into your app, add this line inside the `<head>` element of your application layout.
```erb
# app/views/layouts/application.html.erb
<%= javascript_pack_tag 'application' %>
```

To run the test, you need to run both the Rails server and Webpack Dev server in two separate Terminal tabs (or separate Terminal windows).
```
# Terminal tab 1
rails s

# Terminal tab 2
./bin/webpack-dev-server
```

Load any page in your app (or the page you generated earlier at http://localhost:3000/home/index). If you see this message in the JavaScript console (at the bottom of the browser window, `Command`+`Alt`+`j`)...
```
Hello World from Webpacker
```
... then you've passed the test. Welcome to webpack!

Play around with `app/javascript/packs/application.js`. As soon as you save your changes, the browser automatically refreshes. Auto-reloading is a feature of webpack.

# React

Kill both servers (Rails and Webpack) in both Terminal tabs. Then, in any Terminal tab, install React via Webpacker.
```sh
# Terminal
rails webpacker:install:react
```

# Test React

To add the React sample code to your app, edit your application layout one more time.
```erb
# app/views/layouts/application.html.erb
<%= javascript_pack_tag 'application' %><!-- this should already be there -->
<%= javascript_pack_tag 'hello_react' %><!-- this line is new -->
```

Restart both servers in both tabs.
```
# Terminal tab 1
rails s

# Terminal tab 2
./bin/webpack-dev-server
```

Load any page in your app. You should see this text...
```
Hello React!
```
... at the bottom of every page (not in the JavaScript console, but in the HTML page itself). If you see it, then you've passed the test. Welcome to React!

