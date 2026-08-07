# Phase 0 – Project Planning

## 1. Project Objective

The objective of this project is to design and implement a Mini Banking Database Simulator that demonstrates the practical application of DBMS concepts in a real-world scenario. The project aims to simulate the core operations of a banking system while applying concepts such as ER modeling, normalization, constraints, transactions, indexing, concurrency control, and query optimization.

---

## 2. Project Scope (Version 1)

The first version of the project will include the following banking operations:

- Customer account creation
- Customer account closure (subject to business rules)
- Money deposit
- Money withdrawal
- Direct account-to-account transfer
- Freeze and unfreeze account
- Balance inquiry

---

## 3. Actors

The system will have the following actors:

- Customer
- Bank Staff
- Bank Manager

---

## 4. Functional Requirements

The system should allow:

- Register customers
- Register bank staff
- Update customer information
- Update staff information
- Create customer accounts
- Deposit money
- Withdraw money
- Transfer money between accounts
- Freeze and unfreeze accounts
- View account balance

---

## 5. Non-Functional Requirements

The system should:

- Maintain data security.
- Ensure data accuracy.
- Maintain data consistency.
- Perform operations efficiently.
- Prevent invalid or inconsistent data from entering the database.

---

## 6. Assumptions

For Version 1 of the project:

- All major banking operations are performed by bank staff.
- Customers only request banking operations; they do not directly perform them through the system.
- The project focuses on core banking operations only.

---

## 7. Out of Scope (Version 1)

The following features are intentionally excluded from Version 1:

- Multiple branch management
- ATM system
- Internet banking
- Mobile banking
- Loan management
- Credit card management
- Debit card management
- Cheque processing
- Fixed Deposits (FD)
- Recurring Deposits (RD)
- SMS/Email notifications
- UPI integration
- Interest calculation
- Investment accounts
- Locker management
- Multi-currency accounts
