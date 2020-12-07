# Vending Machine 

![Alt text](https://i.ibb.co/tKY9Qyr/9FPR1Vw.jpg)

### This is a design of a vending machine completed in Ruby, that acts as described below:

* Once an item is selected and the appropriate amount of money is inserted, the vending machine should return the correct product
* It should also return change if too much money is provided, or ask for more money if insufficient funds have been inserted
* The machine should take an initial load of products and change. The change will be of denominations 1p, 2p, 5p, 10p, 20p, 50p, £1, £2
* There should be a way of reloading either products or change at a later point
* The machine should keep track of the products and change what it contains

## User manual:

1) Please clone it repository to your local device (make sure you have Bundler and Ruby installed to start running this application)

2) Once the repository is cloned please run 

```
bundle
```

3) Run the following command in your terminal

```
ruby snack_away.rb
```


5) The vending machine will switch on and you will see the following:

```
"Hey there, someone's hungry?!🍫🍿🙈\nGo on then, make your choice!"
Take a look at our selection: 
"To buy a snack, please insert some coins and then confirm the the item code!"
"Please insert coins, we take 1p, 2p, 5p, 10p, 20p, 50p, 100p and 200p!"

```

6) Please insert the money and type in "yes", if you are happy with the amount or "no" to continue inserting money
```
200
"Please select yes if you have put it enough money, no to continue inserting coins"
yes
```


7) If you have typed "yes", you can then select the item you want
```

"Please select the snack code"
3
"Please collect your Diet-Coke"
"Please, don't forget your change: 50p!"
```


8) If you have selected "no" you can continue inserting money until you do press yes
```
"Please insert coins, we take 1p, 2p, 5p, 10p, 20p, 50p, 100p and 200p!"
200
"Please select yes if you have put it enough money, no to continue inserting coins"
no
"Please insert coins, we take 1p, 2p, 5p, 10p, 20p, 50p, 100p and 200p!"
200
"Please select yes if you have put it enough money, no to continue inserting coins"
no
"Please insert coins, we take 1p, 2p, 5p, 10p, 20p, 50p, 100p and 200p!"
200
"Please select yes if you have put it enough money, no to continue inserting coins"
yes
"Please select the snack code"
7
"Please collect your Skittles"
"Please, don't forget your change: £2, £2, £1, 10p, 5p!"
```

9) If you have inserted money but it is still not enough for the purchase, the vending machine will ask for you to start the process again
```
"Please insert coins, we take 1p, 2p, 5p, 10p, 20p, 50p, 100p and 200p!"
50
"Please select yes if you have put it enough money, no to continue inserting coins"
yes
"Please select the snack code"
7
"Please, start again and insert more money next time ☺️"
```

10) If you have input a wrong coin, the machine will prompt you not to do that again and it won't add the amount to your funds
```
"Please insert coins, we take 1p, 2p, 5p, 10p, 20p, 50p, 100p and 200p!"
300
"Please only used valid coins"
"Please select yes if you have put it enough money, no to continue inserting coins"
yes
"Please select the snack code"
7
"Please, start again and insert more money next time ☺️"
```


#### Restocking Items

* In order to restock an item please open terminal and follow the steps below: 
```
2.7.0 :001 > require "./lib/vending_machine.rb"
 => true 
2.7.0 :002 > machine = VendingMachine.new
2.7.0 :003 > machine.restock_item("Evian",2)
 => 2 
 ```
#### Restocking Change

* In order to restock an item please open terminal and follow the steps below: 

```
2.7.0 :001 > require "./lib/vending_machine.rb"
 => true 
2.7.0 :004 > machine.reload_change(20,2)
 => 32 
  ```
### Preparation, planning, execution:

Analysis
* Breakdown and understand all requirements
* Create user stories for better understanding of the task.

#### User stories:
```
As a user,
So that I know that the vending machine is working, 
I would like to see a welcome message
```

```
As a user,
So that I understand how to purchase an item, 
I would like to see instructions how to do so
```

```
As a user, 
So that I can choose an item I want to buy from a vending machine,
I would like to see a code that the item is related to
```

```
As a user,
So that I know how much I have to pay for an item 
I would like to see a price of an item
```

```
As a user,
So that I know I made an incorrect input,
I would like to get a warning message if I input a wrong item code
```

```
As a user, 
So that I know that I still need to put in more money into machine,
I would like to be notified about more change needed
```

```
As a user, 
So that I know that the item is ready for collection, 
I would like to be notified that the item I bought has been issued
```
```
As a user, 
So that I know that that the change has been issued, 
I would like to be notified that the change and its exact amount is ready to be collected
```

Design

* Identify the actors and functions needed to fulfill requirements.
* Use this to inform the design of classes and methods.
* Tech Design - please refer to tech_design.md file

Implementation

* Follow TDD to develop the vending machine.
* Use IRB to check methods and functionality




