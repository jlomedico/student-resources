# Array Methods

Use the Ruby Docs to find **methods** to solve each of these! I repeat! Use **methods** to accomplish these. You should not need loops. Don't over think things. Exlore the Ruby Docs to come up with your answers. Play around in irb and check your answers!

### Objective - create a new array
1) Set a = to an empty array. (Do this twice with two different methods.)  

### Objective - add items to array

1) Set `b = [1,2,3]`  
2) Add `4,5,6` to the array using `<<`  
3) Add `7,8,9` to the array using the `push` method  
4) Add `[10,11,12]` to the array using the `(+)` operator  
5) Check `b` to see what values it contains  
6) Add `13,14,15` to b using the `concat` method  


### Objective - return a specific item from an array

`countries = ["Denmark", "Sweden", "Germany", "France", "Spain"]`  

1) return "Germany" by using the `at` method    
2) return "Germany" and "France" by using the `slice` method   
3) return "Spain" using the `fetch` method (do this twice with two different arguments)  
4) return the first two countries using the `take` method  
5) remove "France" and "Spain" using the `drop` method  


### Objective - find the length of an array

`array = [2, 9, 5, 11, 10, 17, 14, 12, 16, 7, 4, 3, 6, 15, 1, 8, 13]`  

1) Find how many items are in the array using three **different** methods.  

### Objectives - See if an array contains an item

`bestsellers = ["Come Rain or Come Shine", "Make Me", "The Girl in the Spider's Web", "Go Set a Watchman", "All the Light We Cannot See", "The Girl on the Train", "X", "Fates and Furies", "Purity", "Devoted in Death"]`

1) See if `bestsellers` includes the title "The Scam".  


### Objective - Delete an item from an array

`bestsellers = ["Come Rain or Come Shine", "Make Me", "The Girl in the Spider's Web", "Go Set a Watchman", "All the Light We Cannot See", "The Girl on the Train", "X", "Fates and Furies", "Purity", "Devoted in Death"]`  

1) Use a method to delete the **first** title "Come Rain or Come Shine" from bestsellers.  


### Objective - Add item to beginning of an array

`bestsellers = ["Make Me", "The Girl in the Spider's Web", "Go Set a Watchman", "All the Light We Cannot See", "The Girl on the Train", "X", "Fates and Furies", "Purity", "Devoted in Death"]`  

1) Use a method to add "Come Rain or Come Shine" back to its former spot at the front of the bestsellers array.


### Objective - Add an item into a specific place in an array.
`superbowl_champs = ["New England Patriots", "Seattle Seahawks", "Baltimore Ravens", "New York Giants", "New Orleans Saints", "Pittsburgh Steelers", "New York Giants", "Indianapolis Colts", "Pittsburgh Steelers"]`

This array should contain the Superbowl winners for the last ten years. However, one team is missing! The Green Bay Packers won in 2011!

1) Insert them into their rightful place **between** the New York Giants and the New Orleans Saints.


### Objective - Take the last item out of an array

`states_start_with_a = ["Alaska", "Arizona", "Arkansas", "Boca Raton"]`

1) Looks like someone's geography is a little off! Leave off the last item "Boca Raton" from the array.

### Objective - remove nil from array

`groceries = ["milk", "cheese", nil, "cookies", "bread", "chicken", nil]`

1)Your grocery list is doing some weird things and storing some nil values. Get rid of all nils on one fell swoop!


### Objective - remove duplicate items from an array

`skills = ["HTML", "CSS", "Ruby", "Rails", "Ruby", "Javascript", "Ruby", "Rails", "Python", "Ruby", "jQuery", "Ruby", "Ruby", "Rails"]`

1) Your LinkedIn profile has taken on a mind of it's own and is apparently trying to emphazise your Ruby and Rails skills. Use a method to remove duplicate elements from the arrray.

### Objective - return a random item from an array

1) Set the variable `my_name` equal to the string `your first name`. Use the split method, (learned in Strings), to convert your name into an array. Find and use a method to return a random letter from the array.

### Objective - sort an array alphabetically

`my_symbols =[:g, :d, :e, :b, :c, :a, :f]`

1) Sort the array of symbols alphabetically.
