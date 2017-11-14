# Command Line Waiter (aka The Taquiza Experience)


You will be creating a new and improved version of your Tip Calculator, except this time, it will provide you with a menu and take your order.

### Step 1


Recreate [the taquiza menu](http://www.taquizamiami.com/menu.pdf) as a hash (you should have done this for homework already). 

__Hint:__ Use named keys like this:

```
{
	"sections" => 	[
		{
			name: "Appetizers",
			dishes: [
				{
					price: 5.99,
					name: "Taco Locos",
					description: "Crazy Mexican Tacos"
				}
			]
		},
		{
			name: "Deserts",
			...
		}
	]
}
```
### Step 2

Now use that hash along with the `each` method to output the menu to screen when your user tells you to __"show menu"__ your program which should be named `the_taquiza_experience.rb`.

### Step 3
Accept user input to place an order based on the menu when the user tells you __"place order"__. A user should not be able to order something that is not on the menu. You should collect their order until they say __"done ordering"__.

### Step 4
Allow the user to ask for a bill by telling you __"get the check"__. When they do, present a receipt with each dish, the subtotal, the florida state tax & some suggested tips.


### That's it + some hints! 

Finally, if you need a hint, a user should not be able to ask for the check until they have placed an order. here is an array of possible commands in no particular order:

```
[
	"get the check",
	"place order",
	"show menu",
	"done ordering"
]
```
