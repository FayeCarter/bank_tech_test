# Bank tech test

Tech test provided on Week 10 of the Makers Course. Instructions for the projects can be found [here](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md). 
The aim of the project is to produce the best code that I can without a strict time limit.

## Requirements

- [ ] You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
- [ ] Deposits, withdrawal.
- [ ] Account statement (date, amount, balance) printing.
- [ ] Data can be kept in memory (it doesn't need to be stored to a database or anything).

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
## Process


### User Story 1
- [X] Complete
```bash
  As a customer,
  So I can save my money,
  I want to be able to deposit money into my account.
```
**Steps taken:**
- [X] Account has initial balance
- [X] Deposit adds to balance
- [X] Deposit increases transaction history
- [X] Deposit is a transaction
  - [X] transactions have date
  - [X] transactions can have credit
  - [X] transactions can have debit
  - [X] transactions can have balance
  - [ ] 


### User Story 2
- [X] Complete
```bash
  As a customer,
  So that I can access my money,
  I want to be able to withdraw money from my account
```
**Steps taken:**
- [X] Withdraw method created that reduces balance
- [X] Withdraw creates a transaction
- [ ] 


### User Story 3
- [ ] Complete
```bash
  As a customer,
  So that I can manage my account,
  I want to be able to print a statement.
```
**Steps taken:**
- [X] Create Statement class with a header
- [X] Transactions should be added to account in reverse chronological order
- [ ] Statement should take transaction history
- [ ] 

### Modelling

![mermaid](https://mermaid-js.github.io/mermaid-live-editor/#/view/eyJjb2RlIjoiY2xhc3NEaWFncmFtXG5cdEFjY291bnQgLS0-IFRyYW5zYWN0aW9uXG5cdEFjY291bnQgLS0-IFN0YXRlbWVudFxuXG5cdGNsYXNzIEFjY291bnR7XG4gICAgK2JhbGFuY2VcbiAgICArdHJhbnNhY3Rpb25faGlzdG9yeVxuICAgICtkZXBvc2l0KClcbiAgICArd2l0aGRyYXcoKVxuICAgICtwcmludF9zdGF0ZW1lbnQoKVxuICB9XG5cdGNsYXNzIFRyYW5zYWN0aW9ue1xuXHRcdCtEYXRlXG4gICAgK2NyZWRpdFxuICAgICtkZWJpdFxuXHR9XG5cdGNsYXNzIFN0YXRlbWVudHtcblx0XHQrZGlzcGxheVxuICAgICtwcmludCgpXG5cdH1cblx0XHRcdFx0XHQiLCJtZXJtYWlkIjp7InRoZW1lIjoibmV1dHJhbCJ9fQ)