# The Poke Show JQuery Breakout

Welcome to the Poke Show. A next level idea where we will generate a new rails app and build an awesome pokemon slide show for all of our friends to see.

### Let's get Started
Create a new rails app called pokeshow

`rails new pokeshow`
`cd pokeshow`

We are going to start this app by hand generating a controller and building out our slide show first with JQuery and then we can get to the adding a model for our pokes and update it.

Let's go ahead and generate the controller.

`rails g controller pokemons index`

The index page will be the only page in out app, so lets make it the root

in our routes.rb

```ruby
root 'pokemons#index'

```

Now let's run a rails server and make sure and take a look our page.

If everything is operating as expected, lets add the following to your poke/index.html

```html
<div class= "container">
  <h2>The Pokeshow is LIT </h2>

  <div class="slideShow">
    <ul>
      <li><img src="http://static.giantbomb.com/uploads/scale_small/13/135472/1891758-001bulbasaur.png" alt="onion" /></li>
      <li><img src="http://i.imgur.com/FfFVngN.png" alt="rock" /></li>
      <li><img src="http://cdn.bulbagarden.net/upload/thumb/d/df/013Weedle.png/250px-013Weedle.png" alt="party" /></li>
    </ul>

  </div>

</div>

```
Now that we have some awesome pokemon its time to create a slideshow with them.

First require the JQuery CDN

Ok Now lets get our document ready.

```js
$(function(){

})
```

In our html we have a `<div class="slideShow">` that contains all of the images of the pokemon, we want to take that code and store it in a variable when the page loads.

So our updated JS file should look something like this.

```js
$(function(){
  var slides = $('.slideShow>li');
})
```
The next thing we need to know is how many images we are going to iterate over during the slideshow so that we can create our counter, and we need to create an counter so we can reset when we reach the end of the slideshow.

```js
$(function(){
  var slides = $('.slideShow>ul>li');
  var slideCount = 0;
  var totalSlides = slides.length;
})
```
When the page first loads I don't want any of the images to show up, and then I want the first image to fade in. So to accomplish this I will hide the slides at the start and then create a function that will make them fade in and out one at a time

First lets hide the slides

```js
$(function(){
  var slides = $('.slideShow>ul>li');
  var slideCount = 0;
  var totalSlides = slides.length;

  slides.hide();
})
```

Next let's create our function.
```js
function SlideShow(){
  slides.eq(slideCount).fadeIn(1000).delay(3000).fadeOut(1000, function(){
    slideCount < totalSlides - 1 ? slideCount ++ : slideCount = 0;
    SlideShow();
  })
}
```
Here is the breakdown:

```js
  slides.eq(slideCount)
```
  will select the image at whatever the array index is that the `slideCount` incrementor is currently on, starting at 0

  ```js
    slides.eq(slideCount).fadeIn(1000)
  ```
  will fade in the image of that slide over the span of 1 second

  ```js
    slides.eq(slideCount).fadeIn(1000).delay(3000)
  ```
  will have the function do nothing for 3 seconds

  ```js
    slides.eq(slideCount).fadeIn(1000).delay(3000).fadeOut(1000, ... )
  ```
  will fade out the image in the span of one second. The fade out function in Jquery also allows us to pass a function as the second argument. This function will be called upon the completion of the fade out.

  When the fade out completes we will call the function that increments our counter. If the counter has reached the last image then we will reset the counter back to 0.
  ```js
    slides.eq(slideCount).fadeIn(1000).delay(3000).fadeOut(1000, function(){
      slideCount < totalSlides - 1 ? slideCount ++ : slideCount = 0;
    })
  ```
  Here we are doing this using a ternary statement.

  If we were to just stop here the function would execute, the first image would fade in, pause for 3 seconds, then fade out and call the function that increments the counter then stop. However we want the slide show to continuously run on a loop and show the next image.

  To accomplish this we can recursively call the `slideShow` function so that it runs again using the next value of the counter.

```js
function SlideShow(){
  slides.eq(slideCount).fadeIn(1000).delay(3000).fadeOut(1000, function(){
    slideCount < totalSlides - 1 ? slideCount ++ : slideCount = 0;
    SlideShow();
  })
}
```

So all together our pokes.js file should look like this.

```js
$(function(){
  var slides = $('.slideShow>ul>li');
  var slideCount = 0;
  var totalSlides = slides.length;

  slides.hide();
  function SlideShow(){
    slides.eq(slideCount).fadeIn(1000).delay(3000).fadeOut(1000, function(){
      slideCount < totalSlides - 1 ? slideCount ++ : slideCount = 0;
      SlideShow();
      })
    }
    SlideShow();
  })
```

### Generating a model to store the Pokes

Now that we have a working slide show, lets make this a little more dynamic by adding a Poke model that will store the Pokes information rather than just having it hardcoded in the view.

Lets start by generating a model `rails g model Pokemon name img_url catch_rate:integer lyric`

`rails db:migrate` to give the migration instructions to your db

Now you can add the following to your seed file to populate the database with information

```ruby
Pokemon.create(name:"Onion Turtle", img_url: "http://static.giantbomb.com/uploads/scale_small/13/135472/1891758-001bulbasaur.png", catch_rate: 30, lyric: "Mayonaise Coup, I push Miracle Whips")
Pokemon.create(name:"Punchy Rock", img_url: "http://i.imgur.com/FfFVngN.png", catch_rate: 30, lyric: "Fart in my wallet, call that ga$ money")
Pokemon.create(name:"Party Weiner", img_url: "http://cdn.bulbagarden.net/upload/thumb/d/df/013Weedle.png/250px-013Weedle.png", catch_rate: 30, lyric: "Call me with the deal like f***ing pickle
I just went platinum like a f***ing nickel")
```
Now we need to make our Pokes available in the `index.html.erb` file, so let's prepare the pokes in our `pokes_controller.rb` index action

```ruby
class PokemonsController < ApplicationController
  def index
    @pokes = Pokemon.all
  end
end
```

Great! Now lets update our view so that we show all of the pokes with there information. Copy the following code into your `index.html.erb`.

```html
<div class="container">
  <h2>The Pokeshow is LIT<i class="fa fa-fire" aria-hidden="true"></i></h2>

  <div class="slideShow">
    <% @pokes.each do |poke | %>
      <div class="card">
        <h3 class="name"><%= poke.name %> </h3>

        <div class="image">
          <img src= <%=poke.img_url %> alt="poke image"/>
        </div>

          <h4><%= poke.lyric %></h4>
      </div>
    <% end %>
  </div>
</div>
```

Now to make our slideShow work again, we have to make an update to the `pokes.js` file. We won't be grabbing just a list item now, but rather an whole `div` that contains the pokes information

So make the following update to the slides variable

```js
$(function(){
  var slides = $('.slideShow>div');
  ...
})
```

Now we should have a fully functioning slide show using data that we are storing in our database!
