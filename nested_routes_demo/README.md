# Nested Resources Live Coding

## Objective

Demonstrate how to create views for the most common model association - the `has_many`/`belongs_to`.

## Reqs
* Basic Rails MVC
* TAs for live coding support

## Script
This is a demo enterprise human resources management app. As you would expect from the description, it is unnecessarily complicated, which gives us ample opportunity to demo nested resources.

* An `Organization` `has_many` `Department`s
* A `Department` `has_many` `Position`s
* A `Position` `has_many` `Applicant`s
* And so on, as deep as you can go in the time allowed, but this is usually enough.

### Create a Rails app
```
rails new nested_resources_demo
cd !$ <-- the "bang bling", Bryce's fancy "last argument used" trick
```

### Create an `Organization`s scaffold

```sh
rails g scaffold organization name
rake db:migrate
```

### Use the scaffold to create two test `Organization`s

Think of something big and bureaucratic: government agencies, big corporations, etc.

### Create a `Department`s scaffold

```sh
rails g scaffold department name organization:belongs_to
rake db:migrate
```

### Create test `Department`s

Use the scaffold to create two test `Department`s within one of the test `Organization`s. Just specify the `organization_id` into the `departments#new` form. It's probably `1` or `2`.

### List `Department`s by `Organization`

It doesn't make sense to view a list of `Department`s across every `Organization`. I want to be able to _drill-down_ from one `Organization` to see the `Departments` within that `Organization`. That's typically what `has_many`/`belongs_to` apps look like: `Organization` is a container for `Department`s.

```ruby
# app/models/organization.rb
class Organization < ActiveRecord::Base
  has_many :departments
end
```

```erb
<%# app/views/organizations/show.html.erb %>
<h2>Departments</h2>
<ul>
  <% @organization.departments.each do |dept| %>
    <li><%= link_to dept.name, dept %>
  <% end %>
</ul>
```

## Creating New `Organization`/`Department`s

### New `Organization`/`Department` Link

I can _drill-down_ from an `Organization` to the details of every associated `Department`. But I still need to use the `Department` scaffold (and that annoying `organization_id` field) to define a new `Department`. Let's fix that.

```erb
<%# app/views/organizations/show.html.erb %>
<p>
<%= link_to 'New Department', new_department_path %>
</p>
```

This isn't going to work. On the `departments#new` page, I still have to specify the `organization_id`. I need to transfer `@organization` on the `organizations#show` page into the `departments#new` page. Because HTTP is _stateless_, inter-page communication typically happens via the `session` or `cookies`, but today we're going to use the URL.

```ruby
# config/routes.rb

# replace 
#
# resources :organizations 
#
# with
resources :organizations do
  resources :departments
end
```

Running `rake routes` (or visiting a _404_ page), we can examine the newly available routes. Since `Department` is now _nested_ within `Organization`, we have new `organization_department_path` URL helpers.

```erb
<%# app/views/organizations/show.html.erb %>
<p>
<%= link_to 'New Department', new_organization_department_path(@organization) %>
</p>
```

This helper takes an `Organization` as an argument and produces a _nested_ URL path that looks like `/organizations/:organization_id/departments/new`. So the `@organization.id` is embedded in the URL (e.g. [http://localhost:3000/organizations/1/departments/new](http://localhost:3000/organizations/1/departments/new)). 

### Nested Routes `params` 

#### `params` in `new`

How do we use this data hidden in the URL?

First, we need to turn the `organization_id` hiding in the URL back into an `Organization` instance. Let's do that in the `DepartmentsController#new`.

```ruby
# app/controllers/departments_controller.rb

# GET /departments/new
def new
  @organization = Organization.find(params[:organization_id])
  @department = Department.new
end
```

The _nested route_ handles the naming convention and injection into the _Parameters_ (`params[:organization_id]`).

#### `params` data in the view

What is `@organization`? It's a variable informing the `departments#new` page that this isn't just _any_ new `Department`, but specifically a new `Department` within the specified `@organization`. Let's update the form to take this context into consideration.

```erb
<%# app/views/departments/new.html.erb %>
<%= render 'form',
  department: @department, organization: @organization %>
```

```erb
<%# app/views/departments/_form.html.erb %>
<%= form_for([organization, department]) do |f| %>
  <%# ... some code in here ... %>
  
  <!-- delete this div -->
  <div class="field">
    <%= f.label :organization_id %><br>
    <%= f.text_field :organization_id %>
  <div>
  
  <%# ... some more code down here ... %>
<% end %>
```

This changes the HTML `form` `action` attribute from `POST /departments` to a `POST /organizations/1/departments`. This new route maps to the same `DepartmentsController#create` as before, but with additional information hiding in the URL.

####`params` in `create`

```ruby
# app/controllers/departments_controller.rb

# POST /departments
# POST /departments.json
def create
  @organization = Organization.find(params[:organization_id])
  @department = Department.new(department_params)
  @department.organization = @organization
```

Just like in `new`, we pull the `params[:organization_id]` to create `@organization`. But this time we inject the `@organization` into the `@department` before saving.

## Homepage

Make the `organizations#index` page your homepage.

```ruby
# config/routes.rb
root 'organizations#index'
```

## Testing

We should now be able to

1. view `organizations#index` on the [homepage](http://localhost:3000)
1. click through to `organizations#show` for each `Organization` to view a list of associated `Department`s
1. on `organizations#show`, click through to `departments#show` for each associated `Department`
1. on `organizations#show`, click through to `departments#new` via a URL like [http://localhost:3000/organizations/1/departments/new](http://localhost:3000/organizations/1/departments/new)
1. successfully create a new `Department` on `departments#new` and confirm it's appearance on the associated `organization#show` page.
1. `organizations#edit` and `departments#edit` should both still work to update names

## Bugs

### Back Links

Fix the `Back` link on the `departments#new` page. We already have a `@organization` available on this page (via `DepartmentsController#new`.

```erb
<%# app/views/departments/new.html.erb %>
<%= link_to 'Back', @organization %>
```

Also fix the `Back` link on the `departments#show` page (either direct or after a successful `departments#create`). Since `@department` exists on this page (via `Department.find`, not `Department.new`), we can directly access its associated `Organization`.

```erb
<%# app/views/departments/show.html.erb %>
<%= link_to 'Back', @department.organization %>
```

### Names

When you create a scaffold with `belongs_to` (or `references`), you get a free `show` page element for that association. But it displays a simple `to_s` of the associated object. Let's fix that on the `departments#show` page by displaying the associated `Organization` `name` instead.

```erb
<%# app/views/departments/show.html.erb %>
<p>
  <strong>Organization:</strong>
  <%= @department.organization.name %>
</p>
```


## Controller Refactoring

### Wet Actions

There's some non-DRY code in `DepartmentsController`, but it's hiding.

```ruby
# app/controllers/departments_controller.rb

def create
  @department = Department.new(department_params)
  @department.organization_id = params[:organization_id]
```

This can be rewritten as

```ruby
# app/controllers/departments_controller.rb

def create
  @department = Department.new(department_params)
  @organization = Organization.find(params[:organization_id])
  @department.organization = @organization
```

Now this line

```ruby
@organization = Organization.find(params[:organization_id]
```

repeats in both `DepartmentsController#new` and `DepartmentsController#create`. Rails Controllers have a good technique for refactoring repeated code across actions.

```ruby
# app/controllers/departments_controller.rb
class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]
  before_action :set_organization, only: [:new, :create]

  # ... some code here ...
  
  # GET /departments/new
  def new
    @department = Department.new
  end

  # ... some code here ...

  def create
    @department = Department.new(department_params)
    @department.organization = @organization

  # ... some code here ...

  private
  # ... some code here ...

  def set_organization
    @organization = Organization.find(params[:organization_id])
  end

  # ... some code here ...
end
```

### Adding New Associations

This pattern can be refactored as well.

```ruby
# app/controllers/departments_controller.rb
def create
  @department = Department.new(department_params)
  @department.organization = @organization
```

These two lines can be combined into one.

```ruby
# app/controllers/departments_controller.rb
def create
  @department = @organization.departments.new(department_params)
```

This pattern is attractive because it looks like our nested URL scheme.
* an `Organization` details page, followed by a new `Department` page _scoped_ to a particular `Organization`
* `/organizations/1/departments/new`
* `@organization.departments.new`

 
## Now You Do It

Now we're going to create a new association. Each `Department` `has_many` available `Position`s. The class will prompt you (the live coding instructor) through this feature [Mob Programming](https://en.wikipedia.org/wiki/Mob_programming) style. Students just yell out next steps.

Start by describing the new feature (`Department has_many Positions`), then ask _Where do I start?_

Share the finished app on GitHub so students have a reference implementation for the app created in class (in case of deviations from this script).
