# Quiz
This is the walkthrough, students should complete this exercise as a quiz on [Socrative](http://b.socrative.com/)

# Getting Started
1. Fork student-resources repository 
2. `git clone`the repo to your local environment
    - If you already have a fork of student-resources locally `git pull https://github.com/wyncode/student-resources.git`
3. `cd partials-message-forum`
4. `bundle install`
5. `rake db:migrate`
6. `rake db:seed` - this loads up our test data from the seeds.rb file
7. `rails s`

# My Steps
1. Create new file 'app/views/messages/_message.html.erb'

2. In 'app/views/messages/_message.html.erb': 
    ```erb
    <ul>
      <li>
        <p>Title: <%= link_to message.topic, message %>
        <p>Body: <%= message.body %>
      </li>
    </ul>
    ```
    
3. Delete entire `<table>.....</table>` from 'app/views/messages/index.html.erb', Replace with `<%= render @messages %>`
Go check out this view '/messages'

4. Create new file 'app/views/comments/_comment.html.erb'

5. In 'app/views/comments/_comment.html.erb':
    ```erb
    <ul>
      <li>
        <p>Body: <%= comment.body %>
      </li>
    </ul>
    ```
    
6. In 'app/views/messages/show.html.erb':
    ```erb
    ...
    <p>
      <strong>Body:</strong>
      <%= @message.body %>
    </p>
    
    ADD:
    <strong>Comments:</strong>
    <%= render @message.comments %>
    <%= render 'comments/form' %>
    ...
    ```
Go check it out

7. In 'app/controllers/messages_controller.rb':

    ```ruby
    ...
    def show
      @comment = Comment.new
    end
    ...
    ```
Otherwise when the Messages Controller renders the comments/_form partial in the 'app/views/messages/show.html.erb', 
@comment will be nil

8. In 'app/views/comments/_form.html.erb':
Add "New Comment" To the label to make it more clear to the user what the form is for.
    ```erb
    ...
      <%= f.label :body, "New Comment:" %><br>
      <%= f.text_area :body %>
    </div>
    <div class="field">
      <%= f.hidden_field :message_id, value: @message.id %>
    </div>
    ...
    ```
New hidden field.
We are setting the foreign key value (message_id) to each comment on creation, hidden from the user.

9. In 'app/controllers/comments_controller.rb':
    ```ruby
    ...
    def comment_params
      params.require(:comment).permit(:body, :message_id)
    end
    ...
    ```
Otherwise the hidden field value we set in step 8 will be rejected, creating an comment with no message (orphan)

10. Test it out, go to '/messages', click on a message topic. Write a comment and create. Go back to the message show, 
for example 'messages/1' and see the new comment.

Advanced:
Notice how after we create the comment we get sent to the comments show view, that's not what the user would expect.
Where would they expect to be? How could you accomplish this?
Answer: In the same message show where they created the comment. AJAX
