# Url Shortener
Let's create a rails app that shortens urls.

## User Story
- As a user I should be able to enter a url in a form and receive a shortened url as an integer(id)
- When visiting this shortened url I should be redirected to the original url

Example:
- Given a 'long' url in the form (https://twitter.com/jciancio7), should generate a shortened url (https://YOUR_APP.herokuapp.com/3)
- When I visit https://YOUR_APP.herokuapp.com/3, I should be redirected to https://twitter.com/jciancio7

### Bonus
Instead of just receiving an integer
- As a user I should be able to enter a url in a form and receive a shortened url as a random string
- When visiting this shortened url I should be redirected to the original url

Example:
- Given a 'long' url (https://twitter.com/jciancio7), should generate a shortened url (https://YOUR_APP.herokuapp.com/asdf)
- When I visit https://YOUR_APP.herokuapp.com/asdf, I should be redirected to https://twitter.com/jciancio7
NOTE: Check for uniqueness so that you don't create duplicate shortened urls

### Bonus 2
- As a user I should be able to pass a url as a paramater and receive a shortened url as a random string
- When visiting this shortened url I should be redirected to the original url

Example:
- Visitng https://YOUR_APP.herokuapp.com/https://twitter.com/jciancio7, should return a shortened url (https://YOUR_APP.herokuapp.com/asdf)
- Visitng https://YOUR_APP.herokuapp.com/asdf I should be redirected to https://twitter.com/jciancio7

Here is Joe's implementation of the first two examples
https://joes-shurl.herokuapp.com/

What this means is that the code is on github. We STRONGLY urge you not to look at the code for this, it won't help you.
Take your own approach and don't scaffold!
