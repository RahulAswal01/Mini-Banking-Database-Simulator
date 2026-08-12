# Phase 8 – Relational Schema

## Objective

Convert the finalized ER diagram into a relational schema that can later be implemented in MySQL.

The relational schema defines the tables, primary keys, foreign keys, and the structure required to represent the relationships identified in the ER model.

---

## 1. Customer

**Table:** `Customer`

| Column         | Key / Rule  |
| -------------- | ----------- |
| `customerId`   | Primary Key |
| `customerName` | Not Null    |
| `dob`          | Not Null    |
| `phoneNo`      | Not Null    |
| `email`        | Not Null    |
| `address`      | Not Null    |

---

## 2. Staff

**Table:** `Staff`

| Column      | Key / Rule  |
| ----------- | ----------- |
| `staffId`   | Primary Key |
| `staffName` | Not Null    |
| `dob`       | Not Null    |
| `phoneNo`   | Not Null    |
| `email`     | Not Null    |
| `address`   | Not Null    |

---

## 3. Account

**Table:** `Account`

| Column          | Key / Rule                          |
| --------------- | ----------------------------------- |
| `accountId`     | Primary Key                         |
| `customerId`    | Foreign Key → `Customer.customerId` |
| `accountType`   | Not Null                            |
| `balance`       | Not Null                            |
| `openedAt`      | Not Null                            |
| `currentStatus` | Not Null                            |

### Relationship

`Customer` → `Account` is **1:N**.

Therefore, `customerId` is stored as a foreign key in the `Account` table because the foreign key is placed on the N-side of a 1:N relationship.

---

## 4. Transaction

**Table:** `Transaction`

| Column               | Key / Rule                                  |
| -------------------- | ------------------------------------------- |
| `transactionId`      | Primary Key                                 |
| `transactionType`    | Not Null                                    |
| `amount`             | Not Null                                    |
| `fromAccountId`      | Foreign Key → `Account.accountId`, Nullable |
| `toAccountId`        | Foreign Key → `Account.accountId`, Nullable |
| `processedByStaffId` | Foreign Key → `Staff.staffId`               |
| `executedAt`         | Not Null                                    |
| `status`             | Not Null                                    |

### Account Relationships

A transaction can involve an account in two different roles:

- `fromAccountId` → sender account
- `toAccountId` → receiver account

Both foreign keys reference:

`Account.accountId`

### Transaction Rule

`fromAccountId` and `toAccountId` can individually be NULL, but both cannot be NULL at the same time.

Examples:

- Deposit → `fromAccountId` NULL, `toAccountId` populated
- Withdrawal → `fromAccountId` populated, `toAccountId` NULL
- Transfer → both populated

---

## 5. StaffAccount

The relationship between `Staff` and `Account` is **N:N**.

A junction table is therefore required.

**Table:** `StaffAccount`

| Column      | Key / Rule                                      |
| ----------- | ----------------------------------------------- |
| `staffId`   | Primary Key + Foreign Key → `Staff.staffId`     |
| `accountId` | Primary Key + Foreign Key → `Account.accountId` |

### Composite Primary Key

The combination:

`(staffId, accountId)`

forms the composite primary key.

This ensures that the same staff-account association cannot be inserted more than once while still allowing:

- One staff member to manage multiple accounts.
- One account to be managed by multiple staff members.

No additional attribute is required because Version 1 does not need to track when or by whom an account was managed.

---

## Final Relational Structure

```text
Customer
    │
    │ 1:N
    ▼
Account
    │
    ├──────────────┐
    │              │
    │ 1:N          │ 1:N
    ▼              ▼
Transaction    Transaction
(sender)       (receiver)

Staff
    │
    ├── 1:N ──> Transaction
    │
    └── N:N ──> Account
                  │
                  │
             StaffAccount
```
