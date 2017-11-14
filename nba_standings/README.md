# NBA Standings
## Description
This activity is designed to expose students to using basic querying, prepare instance variables in a controller, and use those variables in views.

## Getting Started
Fork this repository, then clone it to your desktop so you can work in your local environment.

From your terminal open the nba_standings app in atom by(`cd` into the folder, then run the command `atom .`).

Now that you have the app in your text editor we need to handle a few setup details before we start.

This app has already been halfway completed, the migrations have already been made and those instructions are ready to be handed to the database.

In your terminal run `rails db:migrate`, then check your schema.rb file and notice the changes that have occurred.

The next thing we need to do is populate this database. I have created a seed file that already has the list of all the teams in the NBA and some information about them. We are going to use a rails task to populate out database all at once so we can get to the real challenge of this activity which is passing information into the views.

From your terminal run `rails db:seed`

Lets check and make sure that the rails task worked correctly. Command + T to open a new tab and run rails console(`rails c`).

In the console query `Team.all`, your should see a list of all the teams in the NBA.

Great! Now we are almost ready to start the activity, command + T into a new tab and run a rails server(`rails s`)so we can see what the app looks like in the browser.

There should be three pages to our app. One that has the standings for the whole league, one that has the eastern conference standings, and one that has the western conference standings. Take a quick visit to these pages routes.

It looks like now we just have blank pages. Your task is to create the standings on these pages.

## Your Tasks
- prepare instance variables in your controller that prepares the values you want to pass to each view
- use ERB in your views to display teams you want in each of the views
- use basic querying to sort the teams in order that you would like them to be displayed

## Bonus
- create links to navigate to each of the 3 pages
- use HTML and CSS to style your pages nicely to improve the layout of your pages
- calculate a winning percentage for each team based on wins and losses and display it in your views
