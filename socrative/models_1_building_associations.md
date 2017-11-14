# Models 1: Building Associations

## #1
In the Rails console, create a Landlord named "Albert" and two Properties, one in city 33127 and another in city 94101. Select true when you are finished or false to get some help.

<details>
  <summary>View feedback:</summary>
Run `rails c` from the command line 

First create the landlord from the console 

```ruby
Landlord.create(name: "Issac Newton")
```

Next create two properties from the console

```ruby
Property.create(city: 33127)
Property.create(city: 94101)
```
</details>

## #2
Give ownership of a property to a landlord using the `parent.children << child approach`

Select true when you are finished or false to get some help. 

<details>
  <summary>View feedback:</summary>
First we need to find the landlord and property that we want to associate 

`Landlord.find(1)`  and `Property.find(1)`

now that we know we have the correct landlord and property lets associate them 

```ruby
Landlord.find(1).properties << Property.find(1)
```

Run `Landlord.find(1).properties` and you should see the property that was just added
</details>

## #3
Give ownership of the second property to the same landlord by using the `child.parent = parent` approach

Select true when you are finished or false to get some help.

<details>
<summary>View Feedback:</summary>
First lets find the property and the landlord that we are going to associate 

`Property.find(2)` and `Landlord.find(1)` 

Ok now that we have the correct instances lets associate them 

```ruby
Property.find(2).landlord = Landlord.find(1)
```

Run `Landlord.find(1).properties` and you should see the property that was just added
</details>

## #4
Give ownership of a property to a landlord by creating a new instance using the `parent.children.create(child_parameters)` approach

Select true when you are finished or false to get some help.

<details>
<summary>View Feedback:</summary>
First lets find the landlord that we want

`Landlord.find(1)` 

now we can create a new instance of a property

```ruby
Landlord.find(1).properties.create(city: 33458)
```

Run `Landlord.find(1).properties` and you should see the property that was just added
</details>




