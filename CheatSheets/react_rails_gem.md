# React Rails

React has a reputation for being hard to get started with. It feels like you're using a brand new tech stack. But it doesn't have to be. Rails, in particular, makes it easy to start experimenting with React in your existing apps without making a commitment to a brand new way of doing things.

## Make An App

If you don't already have a Rails app, generate one.

```sh
# Terminal
rails new react_rails_example
cd !$
rails g scaffold task name description:text
rails db:migrate
rails s
```

Create some data we can use for later.

## Component-ize Your App

Find a show page (or any page displaying a single item).

Don't think of it as a show _page_ (or whatever you call it). Don't even think of it as a layout with _header_, _content_, and/or _footer_ sections. 

```erb
<!-- header -->
<p id="notice"><%= notice %></p>

<!-- content -->
<p>
  <strong>Name:</strong>
  <%= @task.name %>
</p>
<p>
  <strong>Description:</strong>
  <%= task.description %>
</p>

<!-- footer -->
<%= link_to 'Edit', edit_task_path(@task) %> |
<%= link_to 'Back', tasks_path %>                              
```

Think of it as a page that contains an object. 

```erb
<!-- this is a single task -->
<p>
  <strong>Name:</strong>
  <%= @task.name %>
</p>

<p>
  <strong>Description:</strong>
  <%= task.description %>
</p>
```

That chunk of HTML _means_ something. It has _semantics_. That HTML code _represents an object_.

Maybe you want to display that object on other pages - or maybe not. Either way, it's a good idea to dedicate a separate, reusable file to that object's view.

Every object in your app should have a (or at least one) dedicated _view partial_, a file containing all the HTML code that semantically represents that object.

```erb
<%# app/views/tasks/_task.html.erb %>
<!-- semantic HTML representation of a task -->
<p>
  <strong>Name:</strong>
  <%= task.name %>
</p>

<p>
  <strong>Description:</strong>
  <%= task.description %>
</p>
```

Once you've created this view partial, Rails makes it easy to start using it in your pages via [default case partial rendering](http://api.rubyonrails.org/classes/ActionView/PartialRenderer.html) (a.k.a. semantic partial rendering).

For example, update the `show` page to render a partial.

```erb
<%# app/views/tasks/show.html.erb %>
<p id="notice"><%= notice %></p>

<%= render @task, task: @task %>

<%= link_to 'Edit', edit_task_path(@task) %> |
<%= link_to 'Back', tasks_path %>
```

Test your app (`rails s`) to make sure the show pages work. If the `show` pages don't look good without React, they won't look good with it either.

That `render` line in your _show_ page represents a rudimentary _web component_. Try this for all the objects in your app.


## Setup & Configure

Before we transition this _view partial component_ into a _React component_, let's setup React.

Add the `react-rails` gem to your `Gemfile`.
```sh
# Terminal
bundle add react-rails
```

`react-rails` teaches Rails new generators. Use this one just once to setup React in your app.
```sh
# Terminal
rails g react:install
```

## Replace Rails Partials With React Components

Now let's replace this Rails partial with a React component. The `react-rails` gem comes with a component generator.

```sh
# Terminal
rails g react:component Task task:object --es6
```

What's `--es6`?  
We're going to use the ES6 generator instead of the ES5 default so we can play with the new JavaScript `class` keyword. The Rails asset pipeline will take care of converting this to ES5 via Babel.

_What's `object`? Are these like Rails database migration column types?_  
No, these are JavaScript types (technically React [`PropTypes`](https://www.npmjs.com/package/prop-types)). Check the documentation in `rails g react:component` for a list of available React component property types.

Now copy your Rails partial into the React component class's `render()` method.
```jsx
// app/assets/javascripts/components/task.es6.jsx
class Task extends React.Component {
  render () {
    return (
      <div>
        <p>
          <strong>Name:</strong>
          <%= task.name %>
        </p>

        <p>
          <strong>Description:</strong>
          <%= task.description %>
        </p>
      </div>
    );
  }
}
// ... propTypes down here ...
```

... and replace the ERB tags referencing `@task` with JSX JavaScript expressions referencing `this.props.task`.

```jsx
// app/assets/javascripts/components/task.es6.jsx
class Task extends React.Component {
  render () {
    return (
      <div>
        <p> 
          <strong>Name:</strong>
          { this.props.task.name }
        </p>

        <p> 
          <strong>Description:</strong>
          { this.props.task.description }
        </p>
      </div>
    );  
  }
}
// ... propTypes down here ...
```

To test that this is working correctly, update the Rails partial.
```erb
<%# app/views/tasks/_task.html.erb %>
<p>
  <strong>Name:</strong>
  <%= task.name %>
</p>

<p>
  <strong>Description:</strong>
  <%= task.description %>
</p>

<%= react_component('Task', task: task) %>
```

Start your server (`rails s`), create a task, and view it. If you see your task details duplicated, then it's working. Otherwise, you might have some errors in your JSX or ERB files.

If it's working, let's remove the duplication by keeping the React component and deleting the Rails partial.

```erb
<%# app/views/tasks/_task.html.erb %>
<%= react_component('Task', task: task) %>
```

Now you should only see the task details once.

## Refactoring Into React

Repeat this process for every object in your app. Then try to do the same with object lists, or create different variations of the same object (e.g. a _show_ version (`_task.html.erb`) and a _list item_ version (i.e. `_task_list_item.html.erb`)). Gradually you'll convert your app's view into a collection of React components.

## Pre-rendering React Components (optional)

The React component isn't rendered until after the page loads. You can see this yourself if you view the HTML source of the response.

```html
<!-- html from 'view source' -->
<div data-react-class="Task" 
data-react-props="{&quot;task&quot;:{&quot;id&quot;:1,&quot;name&quot;:&quot;first&quot;,&quot;description&quot;:&quot;first\r\nfirst&quot;,&quot;created_at&quot;:&quot;2017-07-09T23:33:40.348Z&quot;,&quot;updated_at&quot;:&quot;2017-07-09T23:33:40.348Z&quot;}}">
</div>
```

This mess is your Task HTML's root element and your task's data all mixed together. `react-rails` takes these two pieces of data and combines them to render your view. But search engines don't run JavaScript, so they only see this mess.

If you'd like Rails to render your component in the server, you can change your Rails partial to this.

```erb
<%# app/views/tasks/_task.html.erb %>
<%= react_component('Task', {task: task}, {prerender: true}) %>
```

Now your HTML source code looks like this.

```html
<!-- prerendered html from 'view source' -->
<div data-react-class="Task" 
data-react-props="{&quot;task&quot;:{&quot;id&quot;:1,&quot;name&quot;:&quot;first&quot;,&quot;description&quot;:&quot;first\r\nfirst&quot;,&quot;created_at&quot;:&quot;2017-07-09T23:33:40.348Z&quot;,&quot;updated_at&quot;:&quot;2017-07-09T23:33:40.348Z&quot;}}">
  <div data-reactroot="" data-reactid="1" data-react-checksum="1977047743">
    <p data-reactid="2">
      <strong data-reactid="3">Name:</strong><!-- react-text: 4 -->first<!-- /react-text -->
    </p>
    <p data-reactid="5">
      <strong data-reactid="6">Description:</strong><!-- react-text: 7 -->first
first<!-- /react-text -->
    </p>
  </div>
</div>
```

It's still messy, but the actual data is there (in this example, the task's `name` and `description`). There are some big limitations to [server-side rendering](https://github.com/reactjs/react-rails#server-side-rendering). For example, if you need to use jQuery or other libs, you need to `require` them in `app/assets/javascripts/server_rendering.js`. Also, you can't refer to `document` or `window` in your component code.

## Styling Your React Components (optional)

React doesn't decorate your components with easy `class` or `id` attributes that would make CSS/JS targeting easy. You should add your own. Typically I'd use the `content_tag_for` Rails view helper for this, but since [it has been removed from Rails core](https://github.com/rails/rails/issues/18337), I'll use `dom_class` and `dom_id` instead.

```erb
<%# app/views/tasks/_task.html.erb %>
<%= react_component('Task', {task: task}, {prerender: true, class: dom_class(task), id: dom_id(task) }) %>
```

Now your element will have convenient `class` (e.g. `task`) and `id` (e.g. `task_1`) attributes that you can use for CSS targeting.
