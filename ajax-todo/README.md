# AJAX ToDo List

## Setup & Scaffolding

Create a new Rails app

```sh
# Terminal
rails new toodoo
cd toodoo
```

We want a quick prototype, so let's use scaffolding.

A todo list is an app to manage tasks (**c**reate new tasks, **r**ead lists of tasks, **u**pdate tasks, and **d**elete tasks). So we need a `Task` scaffold.

```sh
# Terminal
rails g scaffold task name --javascript-engine=js
```

This will generate a `Task` model with one attribute (`name`), a `TasksController`, and all the necessary controller actions and views to support basic CRUD operations.

Let's see our work so far. Start the server.

```sh
# Terminal
rails s
```

Visit `http://localhost:3000`. You should see an `ActiveRecord::PendingMigrationError`. We forgot to migrate! 

Rails scaffolding generated a migration (inside `db/migrate/`). We need to run it to sync our database with our models.

```sh
# Terminal
rails db:migrate
```

Start the server again.

```sh
# Terminal
rails s
```

Refresh `http://localhost:3000`. You should see the Rails default homepage. 

The scaffold routes the app to `http://localhost:3000/tasks` by default. To use `http://localhost:3000/` instead, we need to define a `root` path.

Let's point the root path to the `index` action of our `TasksController`.

```ruby
# config/routes.rb (anywhere within the do/end block)
root 'tasks#index'
```

Test the app by creating, reading, updating, and deleting a task. This app is "done"!

But wait, not so fast...

Every time we create, read, or update a task, we're forced to switch to a new page. Using AJAX, we can remove these page changes, making the app appear to work entirely on a single page (to be an SPA - *single page application*).

Every click to a new page represents a new HTTP request *to* the server and response *from* the server. When the response arrives, the "page" we're looking at (the entire HTML contents of the page) changes from one view to another.

[AJAX](https://developer.mozilla.org/en-US/docs/AJAX) is a JavaScript technique that allows a browser to send a request to (and receive a response from) a server _in the background_. Instead of arriving at the browser window, the response arrives in your JavaScript code. You can then use JavaScript to update only the sections of the page that need updating. From the web visitor's perspective, the web page's contents will have changed quickly and the webapp will feel easier to use.

Let's "AJAXify" our todo list app.

## AJAX Rails Create Forms

The first page we're going to eliminate is the "New Task" page (the `tasks#new` view). Instead of switching to a new page to add a new `Task`, we're going to allow users to create new `Task`s directly from the homepage.

Examine the "New Task" view.

```erb
<%# app/views/tasks/new.html.erb %>
<h1>New Task</h1>

<%= render 'form', task: @task %>
```

To *DRY* the code, the Rails scaffold places the `<form>`-generating code into a *view partial*. The `Task` form view partial (located at `app/views/tasks/_form.html.erb`) is used in both the "New Task" and "Edit Task" pages. So if you make a change on the "New Task" form, it will automatically be picked up by the "Edit Task" form (and vice versa).

Let's use this same code to add a "New Task" form to our homepage (the `tasks#index` view).

```erb
<%# app/views/tasks/index.html.erb (somewhere above the table) %>
<h2>New Task</h2>
<%= render 'form', task: @task %>
```

Refresh `http://localhost:3000`. You should see a `NoMethodError`, `undefined method 'errors' for nil:NilClass`. The error originated from the form:

```erb
<%# app/views/tasks/_form.html.erb %>
<%= form_with(model: task, local: true) do |form| %>
  <% if task.errors.any? %>
```

As the error describes, the first argument (`task`) in the form (passed to the method `form_with`) cannot be `nil` or empty. The `task` variable inside the form partial corresponds to the `task: @task` we added to the `tasks#index` page. So the problem actually originates with `@task` on the `index` page.

We need `@task` to be defined (not `nil` or empty) on the `tasks#index` page. Variables in views should be defined in their corresponding controllers. In this example, we need to define `@task` exactly the way `tasks#new` does.

```rb
# app/controllers/tasks_controller.rb
def index
  @tasks = Task.all
  @task = Task.new
end
```

There is some repetition in the controller now. `@task = Task.new` appears in two places. As a bonus task, try to DRY this code up. If you want to be sure you have correctly dried up the controller, click view command below.



<details>
  <summary>View refactored controller</summary>
  
  - create a new private method called new_task that will set up our new task: 

```ruby
  ...
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def new_task
      @task = Task.new
    end
    
  ...
end

```

- At the top of the controller, add a `before_action` to call your `new_task` method for both the `new` and `index` actions so that they both have a new task available:

```ruby
class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :new_task, only: [:new, :index]
  
  ...
```

- Make sure you remove the `@task = Task.new` line from both the `new` and `index` actions:

```ruby
  ...
  
  def index
    @tasks = Task.all
  end
  
  ...
  
  def new
  end
  
  ...

```
  
</details>

___

Refresh `http://localhost:3000/`. You should see the "New Task" form on the "Tasks" page now. Test it. It should still work.

Unfortunately, even though it works, users are still redirected to the `tasks#show` page after clicking the "Create Task" button. Let's start changing this regular Rails form into an AJAX Rails form.

```erb
<%# app/views/tasks/_form.html.erb %>
<%= form_with(model: task, remote: true) do |form| %>
```

The code that changed was the removal of `local: true` and addition of a `remote: true` options Hash to the `form_for` arguments.

Back in the tasks controller let's comment out the line that responds to html in our create action:

```ruby
  # in create action in app/controllers/tasks_controller.rb

  # format.html { redirect_to @task, notice: 'Task was successfully created.' }
```

This **prevents** the redirect to the `tasks#show` page after clicking the "Create Task" button.


Now test the form again. It will seem as if nothing changed. But it did! I promise!

There are two places to confirm that this change is working correctly.

First, check your server logs (the tab in your Terminal where you typed `rails s`). The POST request generated by the form should have changed.

Before `remote: true`:
```
Processing by TasksController#create as HTML
```

After `remote: true`:
```
Processing by TasksController#create as JS
```

The regular form submits a request with an HTML `Content-Type`. That means it expects the Rails app to return HTML code. The AJAX form uses a JS `Content-Type`, so it expects the Rails server to respond with JavaScript code.

Another place we can confirm that this is working correctly is within Chrome DevTools. On the homepage, open up DevTools and click on the "Network" tab. While the "Network" tab is open, create a few tasks.

Notice how the Network tab output keeps getting longer and longer? 

When there's a full page change, the Network tab empties and restarts from the top. Hit refresh on your browser and take a look. The Network tab is emptied and all the CSS and JS assets are requested, parsed, and executed again.

But when you submit the AJAX form, the page doesn't change. The Network tab doesn't empty out. The JS and CSS assets aren't reprocessed.

In the "Network" tab, if you click on the POST request, then click on the "Response" tab, you can view the contents of the Rails response.

```js
Turbolinks.clearCache()
Turbolinks.visit("http://localhost:3000/tasks/19", {"action":"replace"}) // your task id number may vary
```

Since the AJAX form requested a JS response (via the `Content-Type: text/javascript` HTTP header), Rails responded, not with HTML code, but with a small bit of JavaScript. Using the [Turbolinks JavaScript library](https://github.com/turbolinks/turbolinks) (which is activated by default in all Rails apps), Rails instructs the browser to make an AJAX request to the `tasks#show` page for your newly created task. Turbolinks then takes that HTML response and "replaces" the page - not by reloading the page, but by injecting the new HTML code into the `<body>` of your page.

With the Network tab still open, click on every link in your app that isn't a form submit button. Notice how the tab never reloads? That's because, by default, *every* regular link (i.e. links that don't submit forms, HTTP GET request links) are already AJAXified for you. A Rails app, by default, has all the performance benefits of AJAX with none of the extra work.

You even get a free AJAX progress bar across the top of your Rails app! But it's only visible if your app is slow (takes longer than half-a-second to load). So, to see it for yourself, you can make your app artificially slow by adding a `sleep` somewhere.

```rb
# app/controllers/tasks_controller.rb
def index
  @tasks = Task.all
  @task = Task.new
  sleep 1
end
```

Now every time you "AJAX" to your `tasks#index` page, you'll see a blue loading bar across the top ([which you can configure the color and height of in your CSS if you'd like](https://github.com/turbolinks/turbolinks#displaying-progress)). This progress bar is useful because your browser doesn't display a "spinner" when it's making an AJAX request, so your app needs another way to let the user know that their request is pending.

This generation of devs is so spoiled. AJAX used to be a thing that required, you know, code.

Now you can remove the "New Task" link from the bottom of the "Tasks" page.

## AJAX Form Responses

All the GET links in our app are AJAX'd by default. All the forms in our app can be converted to AJAX simply by adding the `remote: true` option. What's left?

Even though our todo list is fully AJAX'd, it's not behaving the way we want. Yes, the pages are all loading quickly, but they're not the correct pages. After a task is created, I don't want to AJAX-load the `tasks#show` page. I just want to refresh the `tasks#index` page with my new data in place.

After an HTML form is submitted, the browser typically redirects to a page (i.e. the server responds with HTTP status code `302 Found`). When a Rails AJAX form is submitted, the browser uses Turbolinks JavaScript to simulate a redirect to another page. So a redirect is happening either way. We just need to change the page that is being redirected to. Redirects are the controller's responsibility.

```rb
# app/controllers/tasks_controller.rb
def create
  @task = Task.new(task_params)

  respond_to do |format|
    if @task.save
      #format.html { redirect_to @task, notice: 'Task was successfully created.' }
      format.html { redirect_to tasks_url }
      format.json { render :show, status: :created, location: @task }
    else
      format.html { render :new }
      format.json { render json: @task.errors, status: :unprocessable_entity }
    end 
  end 
end 
```

When a new `Task` is created, the request is routed to the `TasksController#create` action. In the scaffold default, when a `Task` is created and successfully saved, Rails `redirect_to`s the corrresponding `tasks#show` view. By changing the controller to instead redirect to the `tasks#index` page (via the route url helper `tasks_url`), we can achieve the desired result - a single-page app, or an app that feels as if all the features (in this case viewing and creating tasks) are available on a single page.

## Turbolinks and jQuery

Before talking a bit more about how our rails apps work with jQuery and other JavaScript code, let's add **jQuery** to our rails application.

1) Require jQuery in your `application.js` file:

```js
...

//
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require_tree .

```

2) In your Gemfile add `gem 'jquery-rails'`:

```ruby
...

# jQuery
gem 'jquery-rails'

...

```

3) From your command line run `bundle install`.

___

As great as Turbolinks is, one of the biggest reasons why people disable it in their Rails apps is because it tends to "break" jQuery (and some other JavaScript) code.

Specifically, it's not Turbolinks, but in fact AJAX that "breaks" jQuery.

And it's not all of jQuery that breaks, just anything related to the page load event.

```js
// app/assets/javascripts/tasks.js
$(function() {
  console.log('document is ready!', new Date());
});
```

This is a typical example of a jQuery document ready event handler. All we want to do is display a message as soon as the HTML page is ready to be manipulated by JavaScript code.

If you open up the DevTools Console and visit `http://locahost:3000`, you'll see the message "document is ready!" appear every time you hit refresh.

However, if you interact with the app in almost any way (clicking links, creating tasks), the console message doesn't change. (If you delete a task, it does change because that's not AJAX yet.) The point of loading pages with AJAX is that you don't reload the entire page. But if you don't reload the entire document, jQuery (and any jQuery plugins that depend on reloading) won't work correctly. They won't "see" the new content.

For example, let's say that, every time the `tasks#index` page loads, I want to move the keyboard focus to the "New Task" form. I want users to be able to enter a bunch of new tasks quickly, without having to click on the text `<input>` over and over again.

This is how you'd do that in regular jQuery.

```js
// app/assets/javascripts/tasks.js
$(function() {
  console.log('document is ready!', new Date()); // this logging is optional
  $('#task_name').focus();
});
```

This works every time you refresh the browser window, but it doesn't work for any of the AJAX interactions. It doesn't work when you click on "Show" and "Back". And, most importantly, it doesn't work after you enter some text and hit "Enter" to submit the "New Task" form.

This is a common symptom of Turbolinks-related bugs. "It works when I hit refresh, but stops working when I click links." We hear it all the time.

To fix this bug, we just need to update our document ready event handler to be "Turbolinks-aware".

```js
// app/assets/javascripts/tasks.js
$(document).on('turbolinks:load', function() {
  console.log('document is ready!', new Date()); // this logging is optional
  $('#task_name').focus();
});
```

With this small change, we now have the ability to very quickly create new tasks from our homepage form, taking advantage of all the speed and flexibility AJAX and Turbolinks provides. Try quickly creating some tasks yourself to see what I mean.

Note: If you're still having trouble mixing jQuery and Turbolinks, try using [jquery.turbolinks](https://github.com/turbolinks/turbolinks-classic#jqueryturbolinks).

## AJAX Bootstrap Popup Forms & SJR

The next page we're going to remove is the "Edit Task" page. Like before, Turbolinks has already AJAXd this page for us - when you switch to the edit page and back again, there isn't a full page refresh. Only the `<body>` element changes. We already get all the performance benefits of AJAX by default.

We just need to change the way our single-page app (SPA) behaves.

We still need the "Edit" link. We just want to change what happens when you click it. Instead of switching to another page, we want to display a popup containing the "Edit Task" form.

### Bootstrap Modal

There are many ways to display popups on the web. Today we're going to use the [Bootstrap Modal](http://getbootstrap.com/javascript/#modals).

The first step to integrating Bootstrap into your Rails app is to integrate the required CSS and JavaScript. We're going to copy the code from Bootstrap's [Getting Started](http://getbootstrap.com/getting-started/) page and paste it into our app's `<head>` element.

```html
<!-- app/views/layouts/application.html.erb -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
```

Put this code snippet at the end of your `<head>`, underneath the Rails `javascript_include_tag`.

If you've integrated Bootstrap correctly, the first thing you should notice is that your homepage has been restyled. Bootstrap overrides the browser's default _user agent stylesheet_. You can work with Bootstrap to make the site look better, but for now let's move on to the popup.

Again, we're going to copy some sample code from [Bootstrap's Modal documentation](http://getbootstrap.com/javascript/#modals) into our app to get started.

```erb
<%# app/views/tasks/index.html.erb %>
<div class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Edit Task</h4>
      </div>
      <div class="modal-body">
        <p>One fine body&hellip;</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
```

The only change we're going to make to this popup is to update the `modal-title` to "Edit Task". There are other changes necessary to get this looking good, but you can work on that later.

The reason why we're adding this code to our "Tasks" page is because a popup starts as a hidden (CSS `display: none;`) piece of HTML code. When the popup is triggered, Bootstrap will center the HTML element onto the page and make it visible. These aren't the JavaScript `alert` popups used in the early days of the web.

### Links and SJR

The next step is to connect the "Edit" link to the popup. The "Edit" link currently changes the page (via AJAX and Turbolinks) over to the "Edit Task" page.

Previously we updated the controller to change the page that was redirected to after a new task was created. We wanted to render the `tasks#index` page instead of the `tasks#show` page.

In this case, however, we don't want to change the page at all. Instead of grabbing a new page, we want to trigger a popup with JavaScript.

So, to start, let's transform the "Edit" link from HTML to JavaScript using the same trick we've used earlier.

```erb
<%# app/views/tasks/index.html.erb %>
<td><%= link_to 'Edit', edit_task_path(task), remote: true %></td>
```

All we're doing is declaring the "Edit" link to be `remote: true`, just like we did for the "New Task" form earlier. Previously, making a form "remote" meant making the form use AJAX to submit data in the background. Making a link "remote" does the same thing.

But weren't all the links using AJAX already? Isn't making a link "remote" redudant?

Yes, the link was "AJAXed" already. But it was AJAXed by the Turbolinks library. By setting `remote: true`, we're now using a different technique for turning a link into AJAX. This new technique gives us more control over what happens inside of Rails.

Remember that setting `remote: true` on a form changed the `Content-Type` of the form's request from HTML to JS. The same thing is happening here. This link is letting Rails know that it expects a JavaScript response instead of an HTML response.

Let's create that JavaScript response.

```js
// app/views/tasks/edit.js.erb
$('.modal-body').html("<%= j render 'form', task: @task %>");
$('.modal').modal();
```

The Rails `Content-Type` rendering rules are simple. When the browser requests an HTML page, Rails will respond with an HTML page. When the browser requests a JavaScript page, Rails will respond with a JS page. (If no JS page is available, Rails will render an HTML page instead.)

What we've done here is define a JavaScript response. So when the browser requests `http://localhost:3000/tasks/1/edit` and says, as part of its request (in the request headers) that it wants JavaScript in response, Rails will search for a suitable JavaScript view (`app/views/tasks/edit.js.erb`) and return it.

This process of generating JavaScript code inside a Rails app is known as [Server-generated JavaScript Response (SJR)](https://signalvnoise.com/posts/3697-server-generated-javascript-responses). The browser, upon receiving this response, will execute this small piece of JavaScript as soon as it arrives.

There are two things happening in this SJR (`.js.erb`) response. 

In the first line, we need to update the body of the popup. The popup we copied from the Bootstrap site is "empty" (it just has some filler text). So we use jQuery to select the `modal-body` element and fill it in. 

But what did we fill in the body with? 

Since this is an `erb` file, we are using ERB tags to populate the popup body. The `render` method will return the HTML code associated with the `app/views/tasks/_form.html.erb` partial (and the `@task` data). But what you haven't seen before is that `j` method. It's short for `escape_javascript`, and you know it's important because methods don't get 1-letter shorthands unless they're used a lot. Let's try it out in the Rails console `rails c`.

```rb
# inside rails console (rails c)
irb(main):001:0> helper.j '<a href="hello.html">link</a>'
=> "<a href=\\\"hello.html\\\">link<\\/a>"
```

The `escape_javascript` (`j`) method is used to take a long string of text and _encode_ it so that it can be used as a JavaScript String. Characters like quotes (`"`) and slashes (`/`) need to _escaped_ so that they don't break your JavaScript code.

```js
// app/views/tasks/edit.js.erb
$('.modal-body').html("<%= j render 'form', task: @task %>");
$('.modal').modal();
```

So the first line of code `render`s the `form` partial into an String of HTML, then encodes that HTML String into a JavaScript String.

The second line is simpler to explain. It's the jQuery code necessary to launch the Bootstrap popup into the middle of the page.

So to summarize, line 1 populates the popup body, and line 2 launches the popup.

### JavaScript and Forms

One last fix before we wrap this edit popup up. Bootstrap's popup comes with its own "Close" and "Save Changes" links. But Rails generated an "Update Task" link for us as well. Rail's "Update Task" button updates the task, but it doesn't close the popup. Bootstrap's "Close" button works, but the "Save Changes" button does nothing. 

Let's fix the "Save Changes" button.

The "Save Changes" button isn't "inside" the form, but we want it to behave like the form's own submit button. We can link the button to the form with JavaScript.

The first step is to add a click event handler to the button.

```js
// app/assets/javascripts/tasks.js
$(document).on('turbolinks:load', function() {
  $('#task_name').focus();

  $('.modal-footer .btn-primary').click(function() {
    console.log('save the changes!');
  }); 
});
```

First, select the "Save Changes" button. We're using a long selector here. You'd probably add a `class` or `id` to the button HTML to make selecting it easier.

Once you've selected the button, we can attach a `click` event handler function. The function will be called every time the button is clicked. Use the `console.log` to test your code. Every time you click the "Save Changes" button, you should see a message in the JS Console.

When the "Save Changes" button is clicked, we want to grab the form. Let's try that.

```js
// app/assets/javascripts/tasks.js
$(document).on('turbolinks:load', function() {
  $('#task_name').focus();

  $('.modal-footer .btn-primary').click(function() {
    console.log($('.modal-body form'));
  }); 
});
```

The form we want to submit is inside of the bootstrap component with class of `modal-body`.

Now let's tell the form to submit it's data. Can you guess how to do that?

```js
$(document).on('turbolinks:load', function() {
  $('#task_name').focus();

  $('.modal-footer .btn-primary').click(function() {
    $('.modal-body form').submit();
  }); 
});
```

When you now click on "Save Changes", it should submit the form. It should behave exactly like the original "Update Task" button - too exactly. The data is updated correctly, but Rails (Turbolinks) changes to the `tasks#show` page. We don't want that to happen. We just want the index page to refresh. So let's make that change.

When we updated the "New Task" form to be `remote: true`, we also updated the "Edit Task" form as well - both pages share the same `_form.html.erb` view partial. So this form is already "AJAXed". What we need to do is change the way it behaves. This should look familiar.

```rb
# app/controllers/tasks_controller.rb
def update
  respond_to do |format|
    if @task.update(task_params)
      #format.html { redirect_to @task, notice: 'Task was successfully updated.' }
      format.html { redirect_to tasks_url }
      format.json { render :show, status: :ok, location: @task }
    else
      format.html { render :edit }
      format.json { render json: @task.errors, status: :unprocessable_entity }
    end 
  end 
end 
```

We made a similar change to the `TasksController#create` method. We don't need the `tasks#show` page to appear to confirm that our `Task` has been updated correctly. We can just view the new task in the `tasks#index` page.

Confirm that the "Edit Task" popup now works the way you want. Clicking "Save Changes" should save your changes. Even just hitting `Enter` on the form should save your changes.

I'll leave the next step up to you: remove the "Update Task" button from the form.

Bonus task: Do you miss those `flash` confirmation messages? With a little bit of code, you can recover the "Task was successfully created." and "Task was succesfully updated." messages in our app. Do you remember how to do that?

## What We've Learned

* How to copy a Rails scaffold form into a different page.
* How to "AJAXify" a Rails form with `remote: true`.
* Turbolinks means your app has a lot of AJAX by default (including an animated progress bar).
* How to update a controller to `redirect_to` the `index` instead of the `show` page after a `create` and `update`.
* To mix Turbolinks with jQuery, update your jQuery code to listen for the document's `turbolinks:load` event (or use the `jquery.turbolinks` gem).
* How to add Bootstrap's CSS and JS to your Rails app.
* Bootstrap modal popups are just hidden HTML elements that get displayed in the middle of the page when triggered.
* Regular `<a>` links (which are already AJAXed by default by Turbolinks) can be AJAXed differently - and with more control - with `remote: true`.
* How to write SJR JavaScript responses.
* How to submit HTML `<form>`s with JavaScript.



