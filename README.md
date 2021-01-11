# Bank tech test

Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time.  This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Self-assessment

Once you have completed the challenge and feel happy with your solution, here's a form to help you reflect on the quality of your code: https://docs.google.com/forms/d/1Q-NnqVObbGLDHxlvbUfeAC7yBCf3eCjTmz6GOqC9Aeo/edit

## User Stories

The first step in my planing process was to break the requirements and acceptance criteria into user stories and think about how I would expect the user to interact with the code.

```
As a client,
So that I can save my money,
I want to open a bank account.

As a client,
So that I can add money to my account,
I want to be able to make a deposit.

As a client,
So that I can keep track of my money,
I want to be able to view my balance.

As a client,
So that I can spend my money,
I want to be able to make a withdrawal.

As a client,
So that I know when i made a transaction,
I want to see the date the transaction was made,

As a client,
So that I can see a history of my transactions,
I want to be able to print a statement.

As a client,
So that I can easily follow the history of my transactions,
I want to view my statement in reverse chronological order.

```

For User Story 2 & 3, I felt it would be useful to create an Input/Output table to guide the development of my tests and my code.

|Input|Output  |
|--|--|
| account.print_statement| date II credit II debit II balance |
| account.deposit(1000) |  |
| account.print_statement| date II credit II debit II balance |
||11/01/2012 II 1000.00 II II 1000.00 |
| account.deposit(2000) |  |
| account.print_statement| date II credit II debit II balance |
||11/01/2012 II 2000.00 II II 3000.00 |
||11/01/2012 II 1000.00 II II 1000.00 |
| account.withdraw(500) |  |
| account.print_statement| date II credit II debit II balance |
||12/01/2012 II II 500.00 II 2500 |
||11/01/2012 II 2000.00 II II 3000.00 |
||11/01/2012 II 1000.00 II II 1000.00 |
