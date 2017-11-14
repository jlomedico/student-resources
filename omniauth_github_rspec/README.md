# OmniAuth Live Coding

This code along activity will show you how to use the OmniAuth gem to add GitHub authentication to your app. This same process can be used for many of the most popular OAuth SSO (single-sign-on) providers.

## Step 0: Start a Rails app

Please open your Terminal and `cd` over to your wyncode directory.

```sh
# Terminal
rails new omniauth_example
cd !$
atom .
```

## Step 1: Gemfile

We are going to use a gem called [omniauth-github](https://github.com/intridea/omniauth-github), which implements the OmniAuth _strategy_ for GitHub. Since OAuth providers may differ, OmniAuth uses different strategies for each provider.

Add this gem to your `Gemfile`
```sh
# Terminal
bundle add omniauth-github
```

## Step 2: Application Registration

To introduce your app to GitHub, you need to create an _application profile_ for it. Register a new application on your [GitHub Applications Page](https://github.com/settings/applications).

GitHub will generate your application's `Client ID` (aka _username_) and `Client Secret` (aka _password_). Don't ever copy and paste these values into your code. They'll likely end up in a public GitHub repo for everyone to see.

Choose whatever `Application name` you'd like.

The `Homepage URL` is the URL you'd like users to visit to read more information about your app. Just use `http://localhost:3000`.

Leave the `Application description` blank.

The `Authorization callback URL` is the URL GitHub will redirect users to after they login. Use `http://localhost:3000/auth/github/callback`. [More details here](https://developer.github.com/guides/basics-of-authentication/#registering-your-app)

| Field | Value
| --- | ---
| Application Name | My Totally Legit Github OAuth App
| Homepage URL | http://localhost:3000
| Application description |
|  Authorization callback URL | http://localhost:3000/auth/github/callback

## Step 3: Configure OmniAuth

The `config/initializers` folder in Rails contains Ruby files that run when your server starts (during `rails s`). It's a common place to put configuration code that doesn't fit into Rail's default configuration files.

Let's create an initializer for OmniAuth

```sh
# Terminal
touch config/initializers/omniauth.rb
```

```ruby
# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Rails.application.secrets['github_id'], 
    Rails.application.secrets['github_secret'], scope: "user:email"
end
```

Instead of copying our `GITHUB_ID` and `GITHUB_SECRET` into the app (and therefore into GitHub, where it won't be secret anymore), we're using a reference to the `Rails.application.secrets` setting.

The `scope` option defines what extra fields on the GitHub profile we want. In this example, we want the user's email (in addition to his `basic profile` information, like `name`, which we'll get for free).

To test this step, start `rails c` or `rails s`. If it starts up without an error, it works. If you get an error, you need to fix the initializer. Exit `rails s` or `rails c` when you're done.

## Step 4: Configuring the Secrets

There are many options for storing secrets inside a Rails app.
- Your Bash profile (`~/.profile` or `~/.bash_profile`).
- The [dotenv gem](https://github.com/bkeepers/dotenv).
- The [figaro gem](https://github.com/laserlemon/figaro).
- _Not_ `config/secrets.yml` (despite it's name, it's not actually secret).

We'll be using Rails 5.1 encrypted secrets.

First we need to tell Rails to use encrypted secrets in the development environment (it's already set up this way for production).

```ruby
# within config/environments/development.rb, before the final "end"
  config.read_encrypted_secrets = true
end
```

Next we need to setup an encrypted secrets file and key. This only needs to happen once per app.
```sh
# Terminal
rails secrets:setup
```
The `secrets.yml.key` file is important. It will not be stored in GitHub. If you work on a team, you need to share this file with your teammates or they won't be able to read your secrets.

Next we need to edit the secrets. Editing an encrypted file is not as easy as editing a regular file.

```sh
# Terminal
EDITOR="atom --wait" rails secrets:edit
# Sublime users
# EDITOR="subl -n -w" rails secrets:edit
```

Rails will open a new Atom/Sublime window. Enter your secrets into the file that appears.

```yaml
# secrets.yml.enc, in a new Atom/Sublime window
# whitespace is important!
shared:
  github_id: YOUR_GITHUB_APP_ID
  github_secret: YOUR_GITHUB_APP_SECRET
```

Save the file and (_this is important_) **close the editor window**. (Don't close your Rails app code window, just the window that popped up for the secrets.) As soon as you close the window, the file you just edited is encrypted and stored in `secrets.yml.enc`.

Use the `rails console` to test that your secrets are stored correctly.
```rb
# rails c
Rails.application.secrets
=> {:github_id=>"YOUR_GITHUB_APP_ID", :github_secret=>"YOUR_GITHUB_APP_SECRET", :secret_key_base=>"A_REALLY_LONG_STRING", :secret_token=>nil}
```

If you don't see your Github secrets in the output, you did something wrong.

_`rails c` doesn't start. I get an error about Psych (or something)_  
You didn't format the `secrets.yml.enc` correctly. In YaML, whitespace is important. Delete `secrets.yml.enc` and try again (`secrets:edit`).  There should be no space in front of `shared:` and 2 spaces in front of `github_id` and `github_secret`.

_`rails c` doesn't start. I get a syntax error._  
You probably broke the initializer. Fix `config/initializers/omniauth.rb`. Check for commas, colons, and brackets.

_I don't see my GitHub data in the console_   
You probably forgot to update `config/environments/development.rb` (or forgot to update it in the right place). Also, you may not have correctly saved your secrets. Make sure they appear when you use `secrets:edit`.

## Step 5: The User Model

OmniAuth is ready to go, but we still need a place to store the data we get back from the OAuth provider.

Create a `User` model.
```sh
# Terminal
rails g model user name email github_id --no-test-framework
```

field | description
--- | ---
name | the user's name
email | the user's email address
github_id | the user's id on Github

The OAuth provider doesn't care about my internal ids. It doesn't care that my user has `id=1`. It will respond with its own internal ids. So we keep track of how the provider's id (`github_id`) maps to our own `User` `id` column.

Don't forget to create the database and migrate!
```sh
# Terminal
rake db:create db:migrate
```

## Step 6: Creating a User with OmniAuth Data

We need to teach the `User` how to create an instance of itself using OAuth data from Github.

```ruby
# app/models/user.rb
class User < ActiveRecord::Base
  validates :name, :email, presence: true

  def self.create_from_github(auth)
    User.create!(
      github_id: auth['uid'],
      name: auth['info']['name'],
      email: auth['info']['email']
    )
  end
end
```

OmniAuth will populate a `Hash` with all the data received from the OAuth provider. We need to map the fields from the GitHub profile into the columns of our `users` table.


## Step 7: Login/Logout

We're going to create a `SessionsController` to manage logging into and out of our app.

```sh
# Terminal
rails g controller sessions --no-test-framework
```

Define `create` and `destroy` actions in the new controller.
```ruby
# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController

  # login
  def create
    # omniauth middleware stores oauth data in the request.env instead of params
    auth = request.env["omniauth.auth"]

    # even though this is a login action, an OAuth login can be a login *or* a registration
    #
    # if the user exists, log her in
    # if the user doesn't exist, create her, then log her in
    user = User.find_by(github_id: auth['uid']) || User.create_from_github(auth)

    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in!"
  end

  # logout
  def destroy
    reset_session
    redirect_to root_url, notice: "Signed out!"
  end
end
```

## Step 8: Define `current_user`

To make it easy to get the currently logged-in user, create a `current_user` helper in your `ApplicationController`.

```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # make this method accessible in any controller
  def current_user
    # memoization (caching) technique
    # multiple calls to this method will result in only one database query
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # make this method acccessible in any view
  helper_method :current_user
end
```

## Step 9: Create a View

Generate a page we can use to test all this stuff.

 Terminal
```sh
rails g controller users new --no-test-framework
```

Update the generated placeholder view located at: `app/views/users/new.html.erb`

with:  
```erb
<%# app/views/users/new.html.erb %>
<em><%= notice %></em><br>
<% if current_user %>
  Welcome <%= current_user.name %> you have successfully signed in!<br>
  <%= link_to "Sign out", logout_path %>
<% else %>
  You are so not signed in.<br>
  <%= link_to "Sign in with Github", github_login_path %><br>
<% end %>
```

## Step 10: Routes

We need to define some routes to connect all these pieces together

```ruby
# config/routes.rb
root 'users#new'
get 'users/new'

get 'auth/:provider/callback' => 'sessions#create'
get 'auth/github', as: 'github_login'
get 'logout' => 'sessions#destroy'
```

## Step 11: Test it out  

Start your server
```sh
# Terminal
rails s
```

Visit [http://localhost:3000/](http://localhost:3000/).

If everything works (and there are no typos!) you should be able to sign in and out with your GitHub credentials.

The first time you sign in with GitHub, GitHub will ask if you're ok with allowing this application to access your private profile information. If you're ok with that, you'll be redirected back to your Rails app where you should see a successful sign on page.

## Your Turn

Add another social login button (e.g. Facebook) to your app.

There are RSpec tests included in the example app. Create your own RSpec model and feature tests to confirm that your app is working correctly.

## Heroku

When deploying to Heroku, you need to share your key with your dyno so it can decrypt your secrets. You can do that by setting a `config` value.

```sh
# Terminal
heroku config:set RAILS_MASTER_KEY=THE_CONTENTS_OF_config/secrets.yml.key_GOES_HERE
```

You can also change these configuration values in your app settings on Heroku.com.
