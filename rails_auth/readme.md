# Rails Authorization and Authentication
We are going to cover Rails Authentication and Authorization using the 'bcrypt' gem.

## Authentication

### 1. Expected Workflow (2 Scenarios):
  1) New visitor signs up:
  - Visit a Registration/Sign Up page
  - Fill out Form for a user
  - When they submit, they should be logged in
  
2) Existing user visits your site
  - When not logged in, they get redirected to a login page
  - Fill out login form with email(username) & password
  - When they submit, they should be logged in.

These are starting to sound like tests!

### 2. Getting Started
I am going to create a new Rails app and use Rspec for our tests (you don't have to start from here).
  1. In Terminal: `rails new auth_example -T` (the -T option tells rails not to include Test::Unit)
  2. In Gemfile: `gem 'rspec-rails'`
  3. In Terminal: `bundle install` then `rails g rspec:install`

### 3. Visiting Root Test
Okay now let's set up our first test.
Let's make sure that when a user first visits our website (the root path)
that they are redirected to a registration page.
  1. Let's make a directory inside of the existing spec folder: `spec/features`
  2. In there let's make a file `spec/features/visiting_root_spec.rb`
  3. We are going to use `capybara` for our feature tests.
    - In Gemfile: `gem 'capybara'`
    - In Terminal: `bundle`
  4. Now in the `spec/features/visiting_root_spec.rb` let's stub out our tests:
  ```ruby
  require 'rails_helper'

  feature 'Visting Root' do

    it 'when not logged in redirects to a registration page' do
      visit root_path
      expect(current_path).to eq('/register')
    end

    it 'when logged in shows a welcome message'
  end
  ```
  <details>
    <summary>Explanation</summary>
    Very simply, we visit the root path and we expect to be redirected to the registration path. Let's not worry about the behavior we expect when someone is already logged in for now.
  </details>

### 4. Visiting Registration Page
Now let's set up a test for the Registration page:
  1. Make a new file `spec/features/visiting_registration_spec.rb`
  2. In that file:
  ```ruby
  require 'rails_helper'

  feature 'Visiting the Registration Page' do

    it 'displays a link to login' do
      visit register_path
      find_link 'Log In'
    end

    it 'shows a registration form' do
      visit register_path
      find_field 'Name'
      find_field 'Email'
      find_field 'Password'
      find_button 'Register'
    end

    it 'submitting that form logs a user in' do
      visit register_path
      fill_in 'Name', with: 'John Doe'
      fill_in 'Email', with: 'john@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Register'
      expect(current_path).to eq(root_path)
    end
  end
  ```
  <details>
    <summary>Explanation</summary>
    This test is checking that:
    Users with accounts can find a link to login,
    There is a form for users to register,
    & If a user successfully fills out that form they are logged in
  </details>

### 5. Visiting the Login Page
Let's set up our last test (for now) for the Login Page:
<details>
  <summary>Note</summary>
  This test will be a bit different because our test database needs a user already created in order to log them in.
</details>

  1. Make a new file `spec/features/visiting_login_spec.rb`
  2. In that file:
  ```ruby
  require 'rails_helper'

  feature 'Visiting the Login Page' do
    it 'shows a login form' do
      visit login_path
      find_field 'Email'
      find_field 'Password'
      find_button 'Login'
    end

    it 'and submitting that form logs a user in' do
      user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
      expect(current_path).to eq(root_path)
    end
  end
  ```

### 6. Generating our Model
If we try to run these tests, we should get an error about not having a `schema.rb` (basically not having a database).
We know we'll need to keep track of users, so let's quickly scaffold what we need:
  1. In Terminal: `rails g scaffold user name email password:digest`
    - `password:digest` is a special field that `bcrypt` will use.
    - all the other fields are strings
  2. In the Terminal: `rails db:migrate`
    - Rails < 5.0.0 you must use `rake` instead of `rails`
  3. Now before we move any further, let's do a few configuration steps for `bcrypt`
    - In the Gemfile (add or uncomment): `gem 'bcrypt'`
    - In Terminal: `bundle`
    - In `app/models/user.rb` you should have:
  ```ruby
  class User < ApplicationRecord
    has_secure_password
  end
  ```
  <details>
  <summary>Explanation</summary>
  This method will make sure that the `password` field is encrypted so that we can't see a user's password.
  </details>

### 7. Setting up our Routes
Now if we run our tests we should get our first failures because we don't have any paths set up. Let's set up our homepage and a few routes to get rid of these errors. I want a 'homepage' where everyone will go when they login and I want a secret page where only admins can go.
  1. In the Terminal: `rails g controller page index secret`
    - This will generate the controller with the actions we need and the views!
  2. Now let's add some routes to be able to get to these pages.
  Update `config/routes.rb`:
  ```ruby
  Rails.application.routes.draw do
    root 'page#index'

    get '/secret' => 'page#secret'

    get '/register' => 'users#new'
    resources :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  ```

### 8. Login routes
If we run the tests now, we're still getting some errors for the login path.
"undefined local variable or method `login_path` for #<RSpec::ExampleGroups::VisitingTheLoginPage:0x007f89bae598e0>" So let's finish setting our paths. 

We still need somewhere for existing users to login & logout.
This is going to be taken care of by a `SessionsController`.

1. In the Terminal: `rails g controller sessions new create destroy`
2. Update your routes:
  ```ruby
  Rails.application.routes.draw do
    root 'page#index'

    get '/secret' => 'page#secret'

    get '/register' => 'users#new'
    resources :users

    # These routes will be for showing a login form, logging in, and logging out
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  ```
  Great! Now that we've defined our routes the tests are still failing, but because they can't find the form elements.

### 9. Visiting Root
Let's run just the "Visiting Root" spec. `rspec spec/features/visiting_root_spec.rb`
The test is failing because it's visiting the root path as an unregistered user and NOT being redirected.
Let's add some code to make that redirect happen.

In `app/controllers/page_controller.rb` add the following to the `index` method:

```ruby
# ... there is code above this
def index
  redirect_to register_path if session[:user_id].nil?
end
# ... there is code below this
```
Now the test passes!
<details>
  <summary>Explanation</summary>
  This code will redirect everyone to the register path if the session object doesn't contain a `:user_id`.
  You can imagine the session object is like hash that lives within the browser. We're going to use this in the future to store the user's id so that our app remembers them.
</details>


### 10. Visiting the Registration Page
Let's focus just on "Visiting the Registration Page". `rspec spec/features/visiting_registration_spec.rb`
  1. First off we don't have a way to send users who have already registered to the login page, let's add that.
  Change `app/views/users/new.html.erb` to look like:
  ```ruby
  <h1>Register</h1>

  <%= render 'form', user: @user %>
  <!-- Changed the link tag below. -->
  <%= link_to 'Log In', login_path %>
  ```
  That will pass the first test.
  2. The next failure is because our test is looking for a 'Register' button.
  So let's add the text for that `app/views/users/_form.html.erb`:

  ```ruby
    <!-- there is code above this -->
    <div class="actions">
      <%= f.submit 'Register' %>
    </div>
  <% end %>
  ```
  3. Running our tests now gives us a different failure, we're expecting to be sent to the root path, but the `UsersController` is redirecting us to `user#show`. In `app/controllers/users_controller.rb` change your create method:
  ```ruby
  # ... there is code above this
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to register_path
    end
  end
  # ... there is code below this
  ```
  Run the test again, and it should pass.
  <details>
    <summary>Explanation</summary>
    Now as soon as a user is created successfully, we will store their id in this session object.
    We do this so that that the Rails app remembers which user is visiting our site between requests.
  </details>


### 11. Visiting the Login Page
Let's now focus on "Visiting the Login Page". `rspec spec/features/visiting_login_spec.rb`
Of course it fails because we haven't setup a login form yet!
  1. In `app/views/sessions/new.html.erb`
  ```ruby
  <h1>Login</h1>

  <%= form_tag '/login' do %>

    <div class="field">
      <%= label_tag :email %>
      <%= text_field_tag :email %>
    </div>

    <div class="field">
      <%= label_tag :password %>
      <%= password_field_tag :password %>
    </div>
    <%= submit_tag "Login" %>

  <% end %>
  ```
  2. Now it's expecting that after we submit the login form that we are redirected to the root path.
  Remember logging in is being handled by the `SessionsController` and that isn't doing anything yet, so the `PageController` is still redirecting us. In `app/controllers/sessions_controller.rb`:
  ```ruby
  # ... there is code above this
  def new
    # This is just showing us the form!
  end

  def create
    @user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to login_path
    end
  end
  # ... there is code below this
  ```
  <details>
    <summary>Explanation</summary>
    This is very similar to what we do when we create a user. The difference is this time we use the `authenticate` method that verifies the user's password.
  </details>

  3. If storing the user's id in the `session` is how we log them in, then logging
  out should be as easy as deleting their id!
  In `app/controllers/sessions_controller.rb`:

  ```ruby
  # ... there is code above this
  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
  # ... there is code below this
  ```
  Now our test passes.
  <details>
    <summary>Explanation</summary>
    When someone makes a request to 'http://localhost:3000/logout' it will run this code
    and destroy their 'session'.
  </details>

### 12. Finish Visiting Root
We didn't implement the test for what we expect when a user is logged in.
  1. In `spec/features/visiting_root_spec.rb`, update the second test:
  ```ruby
  # ... there is code above this
  it 'when logged in shows a welcome message' do
    user = User.create(name: 'John Doe', email: 'john@me.com', password: 'password')
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
    visit root_path
    expect(current_path).to eq(root_path)
    expect(page).to have_content('Welcome')
  end
  # ... there is code below this
  ```
  <details>
    <summary>Explanation</summary>
    So what we're doing is creating this user with the necessary fields. We then visit our login page and fill
    out the form and login. Finally we visit the login page and now we should _not_ be redirected, so we expect to be
    at root path, and we expect the Welcome text.
  </details>

  2. This test will fail, but not because we are being redirected, but because we never put the Welcome text.
  Let's do that now. In `app/views/page/index.html`:
  ```html
  <h1>Welcome</h1>
  ```
  Now the test passes!

### 13. Current user
Now that we can login we need a way to refer to the _current user_, for things like
blocking or showing content, referring to their name and/or email, etc.
Let's create a `current_user` method. We will place this in the `ApplicationController`
because we want it inherited by all the other controllers.
  1. In `app/controllers/application_controller.rb`:
  ```ruby
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
  end
  ```
  <details>
    <summary>Explanation</summary>
    This method will look up the user based on the user id in the session object
    and store it in `@current_user`, but only if the user id is in the session. Basically protecting us from having a `nil` current user.
    The `helper_method` will make the `current_user` method available in the views!
  </details>

  2. Let's use that to our advantage!
  In `app/views/layouts/application.html.erb`:
  ```html
  <!DOCTYPE html>
  <html>
  <head>
    <%= stylesheet_link_tag    "application", media: "all", "data-turbolinks-track" => true %>
    <%= javascript_include_tag "application", "data-turbolinks-track" => true %>
    <%= csrf_meta_tags %>
  </head>
  <body>

  <!-- added these lines -->
  <% if current_user %>
    Signed in as <%= current_user.name %> | <%= link_to "Logout", logout_path %>
  <% else %>
    <%= link_to 'Login', login_path %> | <%= link_to 'Register', register_path %>
  <% end %>

  <%= yield %>

  </body>
  </html>
  ```
  <details>
    <summary>Explanation</summary>
    Now at the top of every page on our application, the user can see that if they're logged in or not, and they have easy access to the necessary links!
  </details>

## Authorization

Lastly, we are going to take care of _authorization_, when we started we
created a `secret` action in our `PageController` that we only want admins to see.

### 1. Adding an `admin` Attribute
- In Terminal: `rails g migration AddAdminToUser admin:boolean`
- The `admin` attribute will be a flag, either true for admins, or false for non admins.
- In Terminal: `rails db:migrate`

### 2. Testing against non-amdins
Let's write the test for what we expect to happen when NON-admins visit the page.
  - Create `spec/features/visiting_secret_page_spec.rb` and add:
  ```ruby
  require 'rails_helper'

  feature 'Visiting Secret Page' do

    it 'when not an admin, redirects to the root path' do
      user = User.create(name: 'John Doe', email: 'john@me.com', password: 'password', admin: false)
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Login'
      visit secret_path
      expect(current_path).to eq (root_path)
    end

    it 'when an admin, shows them a secret'
  end
  ```
  <details>
    <summary>Explanation</summary>
    This test creates a user, logs them in, then visits the secret page. Because they are not an admin, we expect
    them to be redirect back to the root path.
  </details>

### 3. Setting Redirects
Right now it's failing because we haven't protected this page from non admins. Let's do that now.
  - In `app/controllers/page_controller.rb`:

  ```ruby
  # ... there is code above this
  def secret
    redirect_to root_path unless current_user.admin?
  end
  # ... there is code below this
  ```
  <details>
    <summary>Explanation</summary>
    For any boolean column ActiveRecord gives use a method by the name of that column ending with a ? Meaning we expect a true or false return value. So we're redirecting all users who don't have admin access back to the root path. Great now our test passes and the page is kept secret from non admins.
  </details>

### 4. Testing for Admins
  - Now let's test that admins can actually visit this page. Let's update our tests, `spec/features/visiting_secret_page_spec.rb`:
  ```ruby
  # ... there is code above this
  it 'when an admin, shows them a secret' do
    user = User.create(name: 'Jane Grey', email:  'jane@me.com', password: 'password', admin: true)
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
    visit secret_path
    expect(page).to have_content("Secret")
    expect(current_path).to eq(secret_path)
  end
  # ... there is code below this
  ```
  <details>
    <summary>Explanation</summary>
    This test is very similar to our last one, but we create a user that _is_ an admin. We expect that they are
    allowed to visit this page and that they see the "Secret".
  </details>

  - This will fail only because we haven't put the secret in the view. Let's do that:
  In `app/views/page/secret.html.erb`:
  ```html
  <h1>Secret</h1>
  ```
  Now our test passes.

## Running all the Tests
Let's run all of our feature tests to make sure we haven't broken anything.
- In Terminal: `rspec spec/features/`
