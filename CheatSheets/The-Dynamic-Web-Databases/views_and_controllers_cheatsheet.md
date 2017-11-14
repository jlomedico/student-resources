Views & Controllers 1  The Request/Response Cycle Cheatsheet

```bash
http://localhost:3000/hello
```

In config/routes.rb
```ruby
get 'hello' => 'static#hello'
```
```bash
rails g controller static
```

```bash
 touch app/views/static/hello.html
```

```ruby
<% runs Ruby code. %>
<%= OUTPUTS THE RESULT of Ruby code %>
```bash
 http://localhost:3000/users
```

```ruby
get 'users' => 'users#index' in  config/routes.rb
```

```bash
app/views/users/index.html.erb
```

```ruby
get 'users/:id' => 'users#show'
```

```ruby
image_tag('smiley.png')
```