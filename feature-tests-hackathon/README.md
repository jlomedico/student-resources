# Growing an app with Feature Tests
In this hackathon, you'll use RSpec & Capybara integration testing to help you add new features to a partially complete app. The app we'll be starting with should look familiar, it's a secret notetaking app!


## Introduction
Examine the app in the `secretnotes/` directory, spin it up, and explore it's functionality.

Notice, that it is less than perfect. Firstly, there's no way to register. We have to manually create a user in `rails c` (to do so, simply launch rails c, and use something like`User.create(username: 'whatever', password: 'whatever')`). Secondly, logging in doesn't do much, as we have to manually visit the `/notes` path. The list of things to improve goes on and on:

```md
#Visiting root:

- displays a sign in form
- contains the text 'Welcome'
- displays a 'register' link
- and clicking 'register' goes to registration form

#Registering:

- displays a registration form
- clicking 'Sign Up' creates a new user

#Signing in:

- displays a list of my notes
- displays a button to add a new note
- displays a button to sign out

#Clicking 'new note':

- displays a form for a new note

#Submitting 'new note' form:

- associates that note with the current user
- displays the current users list of notes
```

We are in a familiar position. We are deep into building an app, and have many new features we'd like to add. We've been wanting to incorporate testing, but since we haven't used any tests up to this point, we assume it must be useless or too difficult to start now. This is a wrong assumtion!

## Getting Started
See that list of things we want up there? That's our map. Each line represents a feature. They're grouped by actions, or 'contexts' under which we expect things to be a certain way. Let's start building the first few together, and then we'll leave it to you to both write the tests and implement the features.

First, let's decide where to put these tests. As we said earlier, each of these is a feature that the end user sees, so it's convention to name the associated tests `feature specs`. As such, we put them in a `features` folder in our `spec` folder.

```rb
# In terminal, in secretnotes/ directory
mkdir spec/features
```
Now, let's implement each of these 'contexts' in their own file.

### Setting up tests
Let's create a file for our first context, 'visiting root':

```rb
# In terminal, in secretnotes/ directory
touch spec/features/user_visits_root_path_spec.rb
```

Now, let's prepare the tests:

```rb
# In user_visits_root_path_spec.rb
require 'rails_helper'

feature 'Visiting Root' do

end
```

A couple things to note. 1) You must `requre 'rails_helper'` at the top of each of your spec files. 2) RSpec provides us a `feature` method that takes a name and a block for any feature tests.

Now, let's put placeholders for each of the things we want to test in this scenario:

```rb
# In user_visits_root_path_spec.rb
require 'rails_helper'

feature 'Visiting Root' do
  it 'displays a sign in form'
  it 'displays the text "Welcome"'
  it 'displays a "Register" link'
  it 'and clicking Register goes to registration path'
end
```

If you run your tests by using `rspec` in your terminal, you'll see three pending tests, helpfully named like english sentences describing what they test. This was done on purpose, RSpec names the tests using whichever strings we gave the examples (`it`) and associated example groups (in this case, `feature`).

## Writing the first tests
Let's flesh out that first test. Because Capybara is installed in this app, we can literally command it like a user using our site. Check [here](https://github.com/jnicklas/capybara) for the official documentation, and [here](https://gist.github.com/seansellek/7bfa6700381c12bf5164) for a cheat sheet you should rely heavily on (google 'capybara cheat sheet' for any number of lists of the methods capybara makes available to us).

In order to test if visiting root displays a sign in form. We need to 1) visit root, and 2) check if the sign in form is displayed. Let's see that in action:

```rb
# In user_visits_root_path_spec.rb
it 'displays a sign in form' do
  visit root_path
  find_field('username')
  find_field('password')
end
```

And... boom! It passes. `find_field` checks if a field with a given `name` is displayed.

Now, the second test: `Visiting Root contains the text "Welcome"`. This test needs to 1) visit the root_path, and 2) verify that the text "Welcome" is present. Capybara makes available to us a `page` variable that we can use matchers on. Here's how we would do this:

```rb
# In user_visits_root_path_spec.rb
it 'contains the text "Welcome"' do
  visit root_path
  expect(page).to have_content('Welcome')
end
```

Running the tests should produce a very readable error message: `expected to find text "Welcome" in "Logout Log in Username Password"`. It saw the content of the page, `"Logout Log in Username Password"`, and did not see `Welcome` there.

>**Challenge 1** Make this test pass!

Next, `Visiting Root displays a "Register" link`. Try using `find_link` to prepare this test.

>**Challenge 2** Prepare this test, and make it pass! Hint: notice it doesn't actually matter where this link goes yet!

Now let's pay some attention to that `Register` link. The last spec for our root_path requires us to click the link and verify that it takes us to a path called the registration_path. We'll get you started with the test:

```rb
# In user_visits_root_path_spec.rb
it 'and clicking Register goes to registration path' do
  visit root_path
  find_link("Register").click
  expect(current_path).to eq(registration_path)
end
```
>**Challenge 3** Make this test pass! Hint: The first error you'll get, undefined method 'registration_path', is letting you know that this `path helper` method does not exist. Where are these methods created? (routes).

Once you've done that, you've successfully tested & created all the details of the first feature! You can now move on in any order you choose. We will be giving you hints for each feature but the actual tests and code will come from you!

Resources:
* [Capybara Cheat Sheet](https://gist.github.com/seansellek/7bfa6700381c12bf5164)
* [RSpec matchers](https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers) These are the things on the right hand side of an expectation. For example: in `expect(something).to eq(something_else)`, `eq` is the matcher. (that one tests for equality)

Remember, write each test first, verify it fails, then write your own code to verify it passes.

## Feature by Feature
### Registering
We've got two tests here:

1. Displaying a signup form.
2. That submitting the form creates a user.

First, prepare the file you will write your tests in just like we did above, and add those two lines as pending expectations. Verify that these pending specs show when you run your test suite.

**Displaying a signup form:** Just like we did above, visit the registration path and check that the fields necessary for creating a user are displayed.

**Submitting the form creates a user:** This can be tricky, but there's really not as much to it as it seems. Fill out the form (check a capybara cheat sheet for how to fill in forms), click the button to submit the form, and then check in your database that the user was actually created. For example, `User.find_by(username: )` should return a user. You can say that we _expect `User.find_by(username: )` to return a user_. In test form: `expect(User.find_by(username: 'whatever')).to be_a(User)`.

### Upon signing in
We've got three things to check here. But first we have to actually sign in!

Use a before block in your tests to handle 1) creating a user and 2) signing in for each of these tests. Example:

```ruby
# In spec file for signing in
# Inside feature block
before do
  # some code to create a user
  # some code to sign in with that user
end
```
After you've signed in, you can then test for each of the behaviors here.

**Displays a list of my notes** Keep in mind, we want to see _only that current users notes_. Expect the page to have one of the user's notes in it's content. Expect the page to_not have another user's note in it's content (that was a hint).

**Displays a link to add a new note** No surprises here. We just need to see the link, actually clicking it is tested as another feature.

**Displays a link to sign out** In this case, let's verify that the link is there and verify that it does it's job.

### Clicking 'New Note'
We should have a before block that does the action of signing in and clicking 'new note'.

We should then check for the presence of a form in the only expectation here.

### Submitting 'New Note' form:
Follow the same behavior as above, then fill out and submit the form.

We should expect that there now exists a note in the database with the information we entered into the form, and that it belongs to the user that we signed in as.

We should also expect to be rerouted to the notes index path. There are a multitude of ways to test this (check that you're at the notes' index path, or check for content on the page that verifies that), we'll let you choose how to test this.

## Conclusion
If you made it this far, you should begin to see a routine emerging; a flow that you'll fall into. That flow, my friends, is TDD! You begin to think a bit less and let the errors tell you what to do.

Sure, the tests you're writing at this point are not 'optimal'. We probably see a lot of wetness; behavior that can be organized into 'contexts' with 'before blocks'. Remember red, green, refactor. That refactor includes your tests.

In the near future, you'll use things like _factories_ instead of manually creating records in your database over and over. You'll begin to pay mind to how much coverage your tests suites have and worry about their performance. But for now, you only have to worry about one thing: that you are writting tests!
