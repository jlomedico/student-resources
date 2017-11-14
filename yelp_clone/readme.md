Let's create a Rails app!

This will be a Yelp like app for businesses!

This will cover using an app with:
- Multiple Models
- Associations
- Authentication & Authorization
- File uploading
- Nested Resources
- API's

## What You Will Need

### User Model (Name, Profile Pic, Email, etc.)
- You should be able to create a user (sign up)
- A user should have many businesses
- A user should have one photo
- A user should be able to edit only their own information

### Business Model (Name, Description, Address, City, State, Zip)
- A business should belong to a user
- A business should have many photos
- A business should have many reviews
- A user should be able to create businesses
- A user should be able to view all the businesses

### Photo Model (URL)
- A photo should belong to user
- A photo should belong to a business
- A photo should belong to a review

### Reviews Model (Title)
- A review should belong to a bsuiness
- A review should belong to a user
- A review should have one photo
- A user should be able to add reviews to any business
- A user should be able to edit only their own reviews
- A user should not be able to delete reviews from their business

### Authorization and Authentication
- To accomplish this we will use bcrypt (if you look at your Gemfile, all you have to do is uncomment the line: 'gem bcrypt')
- Before we do anything read thru this: http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
- Then watch this tutorial closely: https://www.youtube.com/watch?v=zQJtlvlNunw
 - Some things in this tutorial might not look exactly like your app, so take time to understand the context. Don't just type away blindly.
- Use the `current_user` that you setup in the tutorial to authorize who can edit what.
 - i.e `if current_user.id == params[:id] then ...`

## Stretch Goals

### File Uploading
- Use a gem (i.e. paperclip)
- Read thru this tutorial first to get an understanding of how to use the gem: https://devcenter.heroku.com/articles/paperclip-s3
 - Make sure to go thru the prerequisites!
- Make sure to read the documentation on how to use the gem carefully: https://github.com/thoughtbot/paperclip -> scroll down to Installation. (If you have any issues using the gem read from the top of documentation on installing certain software onto your computer)
- Another tutorial that could be useful: https://richonrails.com/articles/getting-started-with-paperclip
- And a youtube video: https://www.youtube.com/watch?v=bTIiKqXgSY0
- Remember, none of these tutorials know how your app is setup, so some things may not mirror your app. Make sure to read carefully and understand what the gem is doing. Don't just type blindly.

### Automated Emailing
- Using ActionMailer set up automated emails for email confirmation, successful registration, etc.
- Read thru this guide and use it as your reference: http://guides.rubyonrails.org/action_mailer_basics.html


### Testing
- If you want to get more comfortable with TDD (Test Driven Development), you can use tests to guide you thru the process of creating this app. Although you might struggle, once you write the first few tests you will get into a flow. Write out some simple tests for the first model (User), they should be all failing. Write just enough code to make them pass. Then try to write out the rest of the tests before you write any more code. It might seem slow at first, but it will make the development process faster because you will know exactly when you've implemented a feature without having to do the steps manually (i.e create a user, login, create a restauarant, create a review, etc.)

### Displaying Businesses on a Map
- Use the Google Maps Api to plot the businesses on your database onto a map. Make sure to use the documentation to guide you. https://developers.google.com/maps/documentation/javascript/
