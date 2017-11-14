# Dog-o-thon

In this hackathon, you will be working to attach events to the DOM, build upon our Dog class, link appropriate files, as well as manipulate the DOM with vanilla JS.

## Objectives

The end goal of this exercise is to have your HTML page be semi-styled with the ability to add new dogs as rows to the dog `<table>` element when you complete the form and submit it.

Below is a table of tasks, which are designed to be completed in sequence. Score points by completing tasks successfully, or forego points by seeking help from an instructor or TA.

| Task|      Points   |  Hint |
|----------|-------------|------|
| Link HTML & CSS together, so that the html file reflects the styling rules in the styles.css file. |  1 | You should know how to do this by now |
| Add a link to script.js from index.html file.|    1   | You should know how to do this by now |
| In 'script.js', make it so that the javascript executes on page load | 2 | `window.addEventListener()` |
| Using html, update the id attribute of the dog name input form control.  |    2   | You should know how to do this by now  |
| Attach an event handler to form for when it is submitted  |    5   | "Attach event handler"  |
| _Prevent_ the form from being submitted when the button is clicked |    1   | "form submission is the default behavior" |
| Print to the console a message "I've been clicked" when the button is clicked. |    3   | You will need to figure out how to do this on your own. |
| When the button is clicked, rather than printing "I've been clicked" to the console, print the Dog Name and Dog Breed from the form. |    2   | "get input value with JS" |
| In the 'script.js' file, update Dog class to support breed if it doesn't already |    2   | Ask for help |
| In 'script.js', when the form is submitted, create an instance of a dog with a name and a breed from the values in the form |    5   | You will need to figure out how to do this on your own |
| In 'script.js', write a function newRow() that accepts a dog as an argument, and returns a string of HTML that represents a new row in the table. The row will contain the dog's name and breed. |    5   | Use `document.createElement()`. See "loneliest chatroom" hackathon code for a hint |
| Add row of HTML to table, when the form button is clicked. |    5   | "Update table with new row JS" |
| Clear inputs once the row is in the table |    2   | Look for a way to _reset_ the form.
| After inserting a row with a dog, update the number of dogs value |   3  |  "inspect and increment existing value, or create a class variable that tracks number of dogs"|
| Remove the "No dogs yet!" row when the first dog gets added. | 5 | This is bonus, no hint
