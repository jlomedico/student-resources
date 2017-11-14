# Week 8 (One on One):

## Problem 1

Please read the following stories and translate them into an app, 

1. Make a new rails app called widget_app
2. This app is going to have 3 models Users, Payments & WidgetForm
3. Users should be able to log in using bcrypt - __Need some help?__ [check this out](https://gist.github.com/thebucknerlife/10090014)
4. Users should have Payments
5. Users should have WidgetForms & only be able to see THEIR OWN widget forms
6. WidgetForm should have a fields called `background_color` & `title_text`
7. You should NOT be able to update payments from a browser
8. I should be able to see this code snippet in a textarea on the show page by clicking a link that says "show embed code" (use jQuery for this):
`<script type="text/javascript" src="http://localhost:3000/widget_form/5/embed.js"></script>`
9. You should be able to get an embed code for a WidgetForm that displays a bar with the title & background color for that WidgetForm when I use the code snippet from above (use pure javascript here) __Need some help?__ Check [this ](http://stackoverflow.com/questions/16693185/how-to-add-custom-routes-to-resource-route) or [this](http://guides.rubyonrails.org/routing.html#generating-paths-and-urls-from-code) out.
