# Phase 9 – Constraints and Data Integrity

## Objective

Define the constraints and business rules required to maintain accuracy, consistency, and integrity of the banking database.

The goal is to prevent invalid data from entering the database and preserve transaction history.

---

## 1. Primary Key Constraints

Each entity has a primary key:

- Customer → `customerId`
- Staff → `staffId`
- Account → `accountId`
- Transaction → `transactionId`

The `StaffAccount` junction table uses a composite primary key:

- (`staffId`, `accountId`)

Primary keys must be unique and cannot be NULL.

---

## 2. Foreign Key Constraints

### Account

`customerId` references `Customer.customerId`.

### Transaction

- `fromAccountId` references `Account.accountId`
- `toAccountId` references `Account.accountId`
- `processedByStaffId` references `Staff.staffId`

`fromAccountId` and `toAccountId` are individually nullable.

### StaffAccount

- `staffId` references `Staff.staffId`
- `accountId` references `Account.accountId`

---

## 3. NOT NULL Constraints

Required attributes are NOT NULL.

### Customer

- `customerName`
- `dob`
- `phoneNo`
- `email`
- `address`

### Staff

- `staffName`
- `dob`
- `phoneNo`
- `email`
- `address`

### Account

- `customerId`
- `accountType`
- `balance`
- `openedAt`
- `currentStatus`

### Transaction

- `transactionType`
- `amount`
- `processedByStaffId`
- `executedAt`
- `status`

`fromAccountId` and `toAccountId` may be NULL depending on the transaction type.

---

## 4. UNIQUE Constraints

The following attributes must be unique:

- Customer `email`
- Staff `email`

This prevents multiple customer or staff records from using the same email address.

---

## 5. Account Constraints

### Balance

Account balance cannot be negative.

```text
balance >= 0
```

### Account Type

Allowed values:

- Saving Account
- Children Account

### Current Status

Allowed values:

- Active
- Frozen
- Closed

---

## 6. Transaction Constraints

### Amount

Transaction amount must be greater than zero.

```text
amount > 0
```

### Transaction Type

Allowed values:

- Deposit
- Withdraw
- Transfer

### Transaction Status

The transaction records whether the operation was successful or failed.

Allowed Version 1 statuses:

- Pending
- Complete
- Failed

### Account References

`fromAccountId` and `toAccountId` can individually be NULL, but both cannot be NULL at the same time.

Examples:

- Deposit → `fromAccountId` NULL, `toAccountId` populated
- Withdraw → `fromAccountId` populated, `toAccountId` NULL
- Transfer → both populated

---

## 7. Account State Rules

Only an account with `currentStatus = Active` can participate in transactions.

### Frozen Account

A Frozen account cannot:

- Deposit
- Withdraw
- Send a transfer
- Receive a transfer

### Closed Account

A Closed account cannot:

- Deposit
- Withdraw
- Send a transfer
- Receive a transfer

---

## 8. Transaction History

Every attempted transaction must have a transaction record regardless of whether it succeeds or fails.

Failed transactions are therefore retained with their corresponding failed status.

Transaction history must not be deleted when an account is closed.

---

## 9. Account and Customer Deletion Policy

Customer, account, and staff records are not physically deleted in Version 1.

An account is closed by changing:

```text
currentStatus = Closed
```

rather than deleting the account record.

This preserves the relationship between customers, accounts, and historical transactions.

---

## 10. Constraints vs Business Logic

Some rules can be enforced directly by database constraints, while others require application-level or transaction-level logic.

### Suitable for database constraints

- Primary keys
- Foreign keys
- NOT NULL
- UNIQUE
- `balance >= 0`
- `amount > 0`
- Allowed types/statuses
- Both account IDs cannot be NULL

### Require business/application logic

- Frozen accounts cannot perform transactions
- Closed accounts cannot perform transactions
- Deposit/withdraw/transfer-specific validation
- Processing and recording failed transactions
- Maintaining correct account balances

These rules will be implemented and tested during the MySQL implementation phase.

---

## Phase 9 Conclusion

The Version 1 database constraints and data-integrity rules have been defined.

The design prioritizes:

- Data accuracy
- Consistency
- Transaction history preservation
- Prevention of invalid account balances
- Prevention of invalid transactions
- Referential integrity

**Phase 9 Status: Complete**
