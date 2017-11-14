# Input Calculation

### Miles per Gallon
Let's write a simple program to calculate a car's gas mileage:
- Ask the user to enter the total number of gallons of gas a car can hold.
- Ask the user to enter the number of miles the car can drive on a full tank of gas
- Finally, let the user know the number of miles per gallon

### Test Average
Let's write some code to calculate a student's average over 4 tests.
- Ask the user to give you 4 test scores.
- Calculate the average and display it with two decimal points

# If/else

### Simple Assignment
Create an if/else statement that will:
- Assign 0 to x, if y is equal 10
- Otherwise assign 1 to x

### Min and Max
Create a program that will get 2 numbers from a user.
Then display back to the user which number is smaller and which is larger.

### Special Dates
A date is "special", if the month times the day equals the year.
For example, June 10, 1960 (6/10/60) is special because 6 times 10 equals 60.

Now, create a program that asks the user for a month (as a number), a day, and a year.
Then figure out if the month times the day equals the year.
If it does, then let the user know that the date is special.

# Loops

### While Loop with input
Create a while loop that will run as long as `product` is less than 100.
The loop should ask the user to enter a number.
Multiply that number by 10 and store that in `product`.

### A Penny Please
Your boss tell you he will only pay you in pennies.
You will receive 1 penny the first day, 2 pennies the second day, 4 pennies the third day, and the pay would continue to double each day. How much would you earn after 30 days? The output should be in dollar amount, not pennies.

# Methods

### Retail Markup
Create a method `calculate_retail_cost` that takes two arguments, `wholesale_cost` and `markup_percentage`. The method should return the retail price of the item.
For example:
1) If the wholesale cost of a pair of jeans is $10.00 and the markup percentage is 100%, then the retail price of the jeans is $20.00.
2) If a shirt's wholesale cost is $12.00 and the markup percentage is 50%, then the retail price of the shirt is $18.00.
Bonus: Protect your method from negative values for both the wholesale cost and the markup percentage.

### Division Champ
Let's create a program to determine which division ("North", "South", "East", "West") of a company had the highest sales figures.
We are going to use two methods:
1) `get_sales` will take a division name as an argument. The method will get the sales figure as input from the user and return that value.
2) `highest_sales` will call the `get_sales` method 4 times, once four each division. It will then determine which division had the highest sales and print the name of the division.
Bonus: Do not accept sales figures less than 0

### Heads or Tails
Create a method named `coin_toss` that will simulate tossing a coin. The method should generate a random number between 1 & 2. If the random number is 1 the method should display "Heads", if 2 it should display "Tails". Now let's ask a user how many times they want to flip a coin and then simulate a toss that many times.
