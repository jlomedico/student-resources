# Week 7 (One on One):

## Problem 1

We're going to create an e-commerce store that has amazing daily deals on crocs. It will have secret urls for special deals that is protected by an email collection form.

1. Create a new rails app called "Crikey Crocs Store"
2. We need a model called `Shoe`, it should have a name, a price, a quantity, the day it starts going on sale and the day it ends being on sale, a slug (like `purple-crocs`), a boolean for if its a special deal or not and a keyword.
3. We want to create a named scope that always gets the deals that are live today but are not special
4. We should not be able to create a shoe without a name and price
5. I should be able to see all the shoes from the root URL as well as `/shoes` 
6. I should be able to see a specific shoe by going to `/shoes/purple-crocs`
7. There should be an `Email` model with a unique validator
8. We want to be able to see an email form that will be available us at the `/special-deals` path that when filled out, will take us a random special deal .
9. When the person fills in the email form and hits submit, if the form is complete, then they should be redirected to a special deal
10. When the person fills in the email form and hits submit, if the form is NOT complete, then they should be redirected to the homepage
11. __Bonus:__ If a person tries to go to a special deal directly (let's say that `purple-crocs` is a special deal) then they should only be able to view that page if they've filled out the email form. Otherwise, they should be redirected to the homepage.

