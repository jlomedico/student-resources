# Contact Manager

## Introduction
We are going to be creating a simple Contact Manager application. We recommend using TDD, but it is not required. The appliation should allow users to create companies, and add people to those companies. We'll get you started with the first few steps.
[Here](https://joes-contact-manager.herokuapp.com/) is an example of how the application should work.

1. We are going to be uploading this to heroku, so let's get setup with postgres from the start. Also, if you're going to be using Rspec, we can skip over the standard Rails test files.
 - `rails new contact_manager --database=postgresql -T`
 - `cd contact_manager`
2. Let's not worry about all the logic for our first resource (Companies). Go ahead and scaffold it out. 
 - `rails g scaffold Company name description:text` 
 - `rails db:create && rails db:migrate`
3. Now let's create the model, migration, controller, routes, and empty view folder for our next resource (People) using the resource generator.
 - `rails g resource person first_name last_name company:references`
 - `rails db:migrate`

4. Now, we need to finish the association in our class(es).

5. Set the root path to the path that would show all the companies

6. When I'm looking at all the companies, I want to be able to create a new one without changing pages

7. When looking at a specific company, I want to be able to add a person to that company & see all the people belonging to that company in a list

8. When looking at a list of people belonging to a company, I want each person's name to link to their 'profile page' (i.e their show page). Their profile page, should have a link to go back to the company they belong to, a link to edit the person, and a link to delete the person.

9. Complete the logic for editing a person, so when I click that link I get taken to a form that will update the person. After successfully updating the person, I should be taken back to their company.

10. Complete the logic for deleting a person. When I click the delete button, from the person's show page, the person should be removed and I should be taken back to their company.
