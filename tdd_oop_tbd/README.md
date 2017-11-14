# TDD OOP TBD
_(Or how test driven development and object oriented programming were meant for each other)_

## Overview
In this session, students get first-hand experience following test-driven-development practices with professional tools like RSpec.

## Objectives
Students will be able to:
* Understand and use basic RSpec syntax (`describe`, `it`, `expect`).
* Approach projects by first outlining expectations.
* Utilize the basic building blocks of Ruby's object model including:
  * attribute (`attr_`) access methods
  * `initialize`
  * `@instance` variables and methods
  * `@@class` variables and `self.`methods

## Background
You've been approached by a small bank in a remote island nation that still uses paper to manage their six customer accounts. They don't care about security or durability. They only have a few requirements and after having a meeting to plan for the project we came up with some agile _scenarios_ describing how our BankAccount should work. Scenarios take the form of:

- Given:
- When:
- Then:

Here are the scenarios we'll be implementing today.

### Requirements

#### has a balance
- Given: a bank account
- When: it has been created
- Then: it is a bank account
    + And: it can report it's balance
    
#### making a deposit
- Given: a bank account
- When: deposit is made
- Then: it's balance increases

#### making a withdrawal
- Given: a bank account
- When: withdrawal is made
- Then: it's balance decreases

#### transferring funds
- Given: a bank account
- When: transfering funds
- Then: it's balance decreases
    + And: other account balance increases

#### minimum balance
- Given: a bank account
- When: minimum balance is set
- Then: argument error should be raised if opening balance is too low
    + And: should **NOT** raise an error if opening balance is over minimum balance
    + And: allows the bank owner to change the minimum balance

### Bonus Requirements

1. We heard that bigger banks are making lots of money with overdraft fees. Let's add an overdraft fee whenever customers overdraft their account. We should be able to change that fee for all of our accounts at any time.
1. We want to be able to see a running transaction history.

### Super Bonus Requirements

1. Power goes out quite a bit on our island nation. Bank accounts should write their transaction history to files on the disk as a backup.
1. We should be able to recover a bank account from it's transaction history file.

Let's think about this for a second. This program is similar to your REPL games, but with more complex functionality.  Can you imagine building this right now? It would probably take hundreds of lines of spaghetti code and hours of headaches accomplish.

OOP and TDD will make this project remarkably simpler to tackle.

## Setup
Create a folder to house this project and cd into the folder:

```sh
# terminal
mkdir oop_bank
cd oop_bank
```

First off, RSpec will look for a `spec` folder to find your tests.

```sh
# terminal
# from within oop_bank/
mkdir spec
```

Now, let's think about the challenge. It seems to all revolve around one _thing_. That _thing_ is a bank account. It makes sense then, that we will start with a `BankAccount` class to handle the responsibilities of a bank account.

Let's create a file to hold our tests for this class. RSpec will look for our tests inside our `spec` folder in `_spec.rb` files. Create a `spec/bank_account_spec.rb` file. It's convention to name these files the same as the code they're testing. Open the whole `oop_bank` folder in Atom after that.

```sh
# terminal
# from within oob_bank/
touch spec/bank_account_spec.rb
atom .
```

Let's start preparing our tests. Well-written tests **_describe_** your code. They do this by providing **_examples_** of how the code is **_expected_** to work. Those three words are important.

> RSpec **_describes_** your code with **_examples_** of how your code is **_expected_** to behave.

Enter this in your `bank_account_spec.rb`:

```rb
# spec/bank_account_spec.rb
describe BankAccount do

end
```

Every RSpec test file begins with that `describe` method. It specifies what bit of code this specific file is **_describing_** (testing). It takes two arguments: the class being tested, and a block. That block is where we put our scenarios along with our examples:

```rb
# spec/bank_account_spec.rb
describe BankAccount do
  context "has a balance"
    it "is created with an opening balance and the name of the client"
    it "can report it's balance"

  context "making a deposit"
    it "balance is increased"

  context "making a withdrawal"
    it "balance is decreased"

  context "transfering funds"
    it "account balance is decreased"
    it "other account balance is increased"

  context "minimum balance"
    it "raises an error if opening balance is too low"
    it "does NOT raise an error if opening balance is over minimum balance"
    it "allows the bank owner to change the minimum balance"
end
```

Now that we've set up our files and compiled a nice little "todo list", it's a good idea to run RSpec to make sure everything is set up properly:

```sh
# terminal
# within oop_bank/
rspec
```

Read the error that came out. Are you surprised by it? 

```
uninitialized constant BankAccount
```

Well duh. RSpec isn't magic. It's just methods, strings, and blocks. There is no `BankAccount` `class`, and yet here we are trying to pass it in as an argument to `describe`.

Let's create that `BankAccount` class.

```sh
# In Terminal (oop_bank/)
touch bank_account.rb
```

In that file, let's define the `BankAccount` class.

```rb
# bank_account.rb
class BankAccount
end
```

Run `rspec` again. Same error. 

RSpec doesn't load all our files for us. It just looks in our `spec` folder for `_spec.rb` files. Our `bank_account_spec.rb` file can't see the `BankAccount` `class` inside `bank_account.rb`. We have to `require` it.

```rb
# spec/bank_account_spec.rb
require './bank_account'

describe BankAccount do
  # ...
end
```

Now try `rspec`. 

```
9 examples, 0 failures, 9 pending
```

Perfect. Everything is in place, and every example is showing as not yet implemented, because they're aren't.

> **Vain detour:** Colors make things easier to read (and seeing real red and green is more fun.) Run `rspec -c -fd` from now on to see the world in Technicolor.

## Walkthrough

That's all the setup you need in order to start a project with RSpec. Let's get to work meeting our client's requirements.

### 1) Creating Bank Accounts

The first feature that we've pulled out from the client's request let's us know that a `BankAccount` "is created with an opening balance and the name of the client". I'll teach by example how you prepare an RSpec example.

First off, you pass a `do`-`end` block to both the `context` and `it` method:

```rb
# spec/bank_account_spec.rb
  context "has a balance" do
    it "is created with an opening balance and the name of the client" do
    end
  end
end
```

Now, we _write the code we wish we had_:

```rb
# spec/bank_account_spec.rb
  context "has a balance" do
    it "is created with an opening balance and the name of the client" do
      account = BankAccount.new(500, "Sarah")
    end
  end
```

And finally, we set our **_expectation_**:

```rb
# spec/bank_account_spec.rb
  context "has a balance" do
    it "is created with an opening balance and the name of the client" do
      account = BankAccount.new(500, "Sarah")
      expect(account).to be_a(BankAccount)
    end
  end
```

What is this sorcery?! It's not magic. A method named `expect` takes an argument. We call `to` on whatever it returns and pass a [**_matcher_**](http://lmgtfy.com/?q=rspec+matcher) to the `to` method.

There are many matchers. You don't need to know them all. We will use a few of them, and that's all you really need. In this case, we want to verify that `account` _is a_ `BankAccount`. Basically, did it work and not blow up?

Run the test. Let's see what RSpec says.

It reports an error: 

```
wrong number of arguments (2 for 0)
```

Why did that happen? Take a few moments to make this test pass (by working on your `BankAccount` class) and we'll continue.

### 2) Reading a Bank Account's balance
The second feature requested of us is to make the `BankAccount` capable of reporting its balance. Once again, let's write the code we wish we had and set our expectation.

Create an account, just like before, and then set the expectation that its `balance` is correct.

```rb
# spec/bank_account_spec.rb
  context "has a balance" do
    it "can report it's balance" do
      account = BankAccount.new(500, "Sarah")
      expect(account.balance).to eq(500)
    end
  end
```

I realize a `balance` method would be helpful here, but we're doing TDD. We write the code we wish we had first, then we write the code to back it up.

We're using a different matcher here. `be_a` verified that the subject was a certain class, `eq` does exactly what it sounds like, it checks that they're equal, like `==` would do.

Run the tests. What does RSpec say? Take a few moments to make this test pass.

Before moving forward, in our test we have some repeated code.

```ruby
  account = BankAccount.new(500, "Sarah")
```

RSpec has some special techniques for DRYing this up.


```ruby
# In spec/bank_account_spec.rb
describe BankAccount do
  context "has a balance" do
    let(:account) do
      account = BankAccount.new(500, "Sarah")
    end

    it "is created with an opening balance and the name of the client" do
      expect(account).to be_a(BankAccount)
    end

    it "can report it's balance" do
      expect(account.balance).to eq(500)
    end
  # ...
  end
```


The `let` method takes in two arguments - a symbol and a code block. It creates a method you can use in your examples. The symbol is the name of the method. The code block should set up the value you want returned when calling the method. In our example, when we call `account` the return value will be the bank account we created.

### 3) Making deposits

Our next task is to make deposits. We are now dealing with our next scenario. The context is making a deposit. Once again, write the code we wish we had.

1) Create an account
2) Make a deposit to that account (let's try calling a `deposit` method)
3) Set the expectation that the balance changed to reflect your deposit.

<details>
  <summary>View the test:</summary>

```rb
# spec/bank_account_spec.rb
# ...
  context "making a deposit" do
    it "balance is increased" do
      account = BankAccount.new(500, "Sarah")
      account.deposit(500)
      expect(account.balance).to eq(1000)
    end
  end
```
</details>
<br>

Notice that we have to create a new bank account. This is because the account we _set up_ in our last context only exists in the context of an account having a balance, and **not** in the context of an account making a deposit.

We can go a head and set up our account for this context by extracting the pieces involved in the "set up" of our account from our example.

```ruby
  context "making a deposit" do
    let(:account) do
      account = BankAccount.new(500, "Sarah")
      account.deposit(500)
      account
    end

    it "balance is increased" do
      expect(account.balance).to eq(1000)
    end
  end
```

If we don't return the account at the end of our `let` the return value will be whatever the result of `account.deposit(500)` would be. So for example, if the account had a balance of `1000` and we called `account.deposit(500)` the return value would be `1500`. We want to deal with an account, not an integer. That's wy we make sure an account is returned at the end of our `let`.

When we run our test, RSpec complains about an undefined method. We'll need to define a `deposit` method, and it will also need to affect the account's balance in order to meet our expectation.

### 4) Making withdrawals

By this point, hopefully you're starting to get the hang of a workflow. You shouldn't have that terrible "where do I begin?!" feeling anymore, because the errors tell you what to do. 

> By the way, read the errors!!

To recap: We broke the problem into specific "features" that we could implement and outlined them using RSpec. One at a time, we wrote **_examples_** of how we wanted our code to work. We then use the errors to guide us to our goal, earning a greenlight when our code meets our **_expectations_**.

This new `withdraw` method is very similar to deposit.

<details>
  <summary>View the test:</summary>

```ruby
# spec/bank_account_spec.rb
  context "making a withdrawal" do
    let(:account) do
      account = BankAccount.new(500, "Sarah")
      account.withdraw(200)
      account
    end

    it "balance is decreased" do
      expect(account.balance).to eq(300)
    end
  end
```
</details>

Once again: red, green, refactor.

<details>
  <summary>Click here to view our code so far:</summary>


```ruby
require './bank_account.rb'

describe BankAccount do
  context "has a balance" do
    let(:account) do
      account = BankAccount.new(500, "Sarah")
    end

    it "is created with an opening balance and the name of the client" do
      expect(account).to be_a(BankAccount)
    end

    it "can report it's balance" do
      expect(account.balance).to eq(500)
    end
  end

  context "making a deposit" do
    let(:account) do
      account = BankAccount.new(500, "Sarah")
      account.deposit(500)
      account
    end

    it "balance is increased" do
      expect(account.balance).to eq(1000)
    end
  end

  context "making a withdrawal" do
    let(:account) do
      account = BankAccount.new(500, "Sarah")
      account.withdraw(200)
      account
    end

  
  context "transfering funds"
    it "account balance is decreased"
    it "other account balance is increased"

  context "minimum balance"
    it "raises an error if opening balance is too low"
    it "does NOT raise an error if opening balance is over minimum balance"
    it "allows the bank owner to change the minimum balance"
end
```
</details>

### 5) Transferring funds

This feature is interesting, and it gives us our first look at how two objects can interact with each other by "sending messages" to each other. To prepare our example of how we want this method to function, we need to

1. Create two bank accounts
1. Call a `transfer` method on one `BankAccount`, passing it two arguments: an `amount` and the other `BankAccount`.
   * `amount`: How much to transfer
   * `bank_account`: Which account to transfer the money into.
1. Set expectations that both `BankAccount` balances reflect the transfer.

<details>
  <summary>View the test:</summary>

```rb
# spec/bank_account_spec.rb
  context "transfering funds" do
    let(:account) do
      account = BankAccount.new(500, "Sarah")
    end

    let(:other_account) do
      other_account = BankAccount.new(1000, "Todd")
    end

    before :each do
      account.transfer(200, other_account)
    end

    it "account balance is decreased" do
      expect(account.balance).to eq(300)
    end

    it "other account balance is increased" do
      expect(other_account.balance).to eq(1200)
    end
  end
```
</details>

### 6) Minimum opening balance

Here is another interesting one. We need our `BankAccount` to refuse to initialize if we try to create one with too small of a balance. Before we worry about letting the Bank change their minimum balance, let's first just set that default minimum balance to `200`.

One of RSpec's `matchers` is the [`raise_error` matcher](https://www.relishapp.com/rspec/rspec-expectations/v/3-4/docs/built-in-matchers/raise-error-matcher). (notice also on the left all the other matchers it comes with).

We pass it a block of code, and can then expect it to raise an error. For good practice, we should always expect a specific error to be raised. Let's take a look at the list of built-in Ruby errors for us to raise. For this example, let's expect that creating a `BankAccount` with less than 200 opening balance will raise an `ArgumentError`.

<details>
  <summary>View the test:</summary>

```rb
# spec/bank_account_spec.rb
it "throws an error if minimum opening balance of 200 is not met" do
  expect { BankAccount.new(100, "Sarah") }.to raise_error(ArgumentError)
end
```
</details>

### 7) Changing the minimum balance

We were also asked to allow our client to change the minimum balance at any time. It might be tempted to say "it's right there in the code, just change it!", but you can _never_ ask your user to change your code. Even if you are writing code for another developer, you should give them methods that let them configure it rather than make them change your code themselves.

Let's talk through this one. If we need to change the way all `BankAccounts` behave, that change needs to happen at the class level. We should use a **class variable** to store the `minimum_balance` and provide a **class method** to change it.

For our example:

1) Call a class method `self.minimum_balance=` to make the minimum balance higher.
2) Try to create a `BankAccount` with more than 200 but still under our new minimum balance, and expect that to raise an error.
3) And just to be sure, try to create a `BankAccount` with our new minimum balance and expect that `to_not` raise an error.

<details>
  <summary>View the test:</summary>

```rb
# spec/bank_account_spec.rb
context "minimum balance" do
    it "raises an error if opening balance is too low" do
      expect{ BankAccount.new(199, "Terry") }.to raise_error(ArgumentError)
    end

    it "does NOT raise an error if opening balance is over minimum balance" do
      expect{ BankAccount.new(201, "Terry") }.not_to raise_error
    end

    it "allows the bank owner to change the minimum balance" do
      BankAccount.minimum_balance = 100
      expect(BankAccount.minimum_balance).to eq(100)
    end
  end
```
</details>
