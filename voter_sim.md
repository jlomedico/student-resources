# Voter Simulation Project

Create a REPL-driven voting simulation program.

## Overview

You are going to build a program that allows a user to create a directory of politicians and voters. Users will be able to Create, List, Update and Delete both voters and politicians from the directory. 

This is a common set of behaviour, and collectively are refered to as CRUD actions. 

Voters and Politicians are both People with names. Voters however, have a _political affliliation_ of either Liberal, Conservative, Tea Party, Socialist, or Neutral, while politicians have a _party affiliation_ either Democrat or Republican.

Once the program starts, you should be greated with a "main menu" that allows you to perform all the CRUD actions on either voter or politicians: (C )reate, (L)ist, (U)pdate, (D)elete.

This is a large project, but it would be _significantly_ more complex to solve without OOP. This is a great opportunity to recognize the value OOP.

> **Tip!** Tests and TDD may help you manage the complexity of this large project.

> **Important!** Read through this entire document! Especially take advantage of the Getting Started section after the project description.

## Outline

Your game should begin with a welcome message followed by a series of questions. The following examples are just suggestions. Rewrite these questions however you'd like. Just be sure to maintain the same outline.

### Main Menu

```sh
What would you like to do?
(C)reate, (L)ist, (U)pdate, or (D)elete
```

### Create

When I type `C`:

```sh
What would you like to create?
(P)olitician or (V)oter
```

#### Create Politician

When I type `P`:

```sh
Name?
```
Allow the user to input any name.

```sh
Party?
(D)emocrat or (R)epublican
```
Then create a `Politician` with the collected data.

#### Create Voter

If instead I type `V`:

```sh
Name?
```
Allow the user to input any name.

```sh
Politics?
(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral
```

Then create a `Voter` with the collected input.

Return to the main menu when you're done.

> **Tip!** When asking a user for input, use abbreviated shortcuts when possible and if they make sense. Here, for example, we suggest allowing users to enter `C` instead of typing out `Create`. Not only does it reduce the likelihood of mistakes, but it also makes the simulation faster, both for your users and for your own testing.

### List

When I type `L`, display a list of all the created characters.

Example:

```sh
* Politician, Marco Rubio, Republican
* Voter, Juha Mikkola, Socialist
```

### Update

When I type `U`:

```sh
Who would you like to update?
Marco Rubio

# If the name matches a known person
New name?

# If that person is a Politician
New Party?

# If that person is just a Voter
New Politics?
```

> **Tip!** After most of these actions, you need to return to your main menu. You may use a loop, but if you use classes and methods correctly, you should be able to _control the flow_ by simply calling a `main_menu` method instead.

### Delete

When I type `D`, I shoud be able to delete a politician or a voter.
> **Tip!** Show a list to the user before deleting.

```sh
Who would you like to delete?
Marco Rubio

# If the name matches a known person
Are you sure?
(Y) es

# It should delete that person.
```

## Getting Started

There are _many_ possible solutions to this problem. We _recommend_ modeling this project using `class`es. If you decide to use OOP techniques, the following are just _suggestions_.

- election should contain a world and add politicians and voters to it
- a politician or a voter should not add itself to world when it is created
- the election module should do that

## Organization

Organize the files for your project however you'd like. We recommend dedicating a single `.rb` file to each `class`. The "world class" should be the only place using `require` to pull every character `class` into the world.

### Code Clarity Tips 
- Your code should be DRY
- Your code should be expressive and easy for another developer to understand. 
- Significant refactoring should have taken place. 
