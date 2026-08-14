# Phase 10 – Indexing Strategy

## Objective

Define indexes based on the actual query patterns of the Version 1 banking system.

Indexes will not be added to every column. The goal is to improve frequently used queries while avoiding unnecessary indexes and their additional storage and write overhead.

---

## 1. Important V1 Queries

The main queries considered for indexing are:

1. Show all transactions of a particular account.
2. Show all accounts belonging to a particular customer.
3. Show the complete passbook/history of an account.
4. Show the current balance of an account.
5. Show transactions processed by a particular staff member.

---

## 2. Indexes Already Provided by Keys

The following columns are already indexed through primary key or unique constraints:

### Primary Keys

- `Customer.customerId`
- `Staff.staffId`
- `Account.accountId`
- `Transaction.transactionId`

### Composite Primary Key

`StaffAccount(staffId, accountId)`

### Unique Constraints

- `Customer.email`
- `Staff.email`

Therefore, separate indexes will not be created on these columns.

---

## 3. Additional Indexes

### Account

#### `customerId`

An index will be created on `Account.customerId`.

Reason:

The system frequently needs to find all accounts belonging to a particular customer.

Example query pattern:

```text
Find all accounts where customerId = ?
```

---

### Transaction

#### `fromAccountId`

An index will be created on `Transaction.fromAccountId`.

Reason:

An account can appear as the sender of many transactions.

---

#### `toAccountId`

An index will be created on `Transaction.toAccountId`.

Reason:

An account can appear as the receiver of many transactions.

Both indexes are useful because a passbook may need to retrieve transactions in which an account is either the sender or receiver.

---

#### `processedByStaffId`

An index will be created on `Transaction.processedByStaffId`.

Reason:

The system may need to find all transactions processed by a particular staff member.

---

## 4. Columns Not Independently Indexed

### `Account.accountId`

No additional index is required because it is already the primary key.

### `Transaction.executedAt`

A standalone index will not be created in Version 1 because there is currently no sufficiently important independent query requirement for searching by execution time.

Composite indexes involving `executedAt` are also not included at this stage to avoid unnecessary complexity.

If future query requirements demonstrate a performance benefit, the indexing strategy can be revisited.

---

## 5. Final Index Strategy

| Table        | Column(s)              | Reason                            |
| ------------ | ---------------------- | --------------------------------- |
| Customer     | `customerId`           | Primary key                       |
| Customer     | `email`                | Unique constraint                 |
| Staff        | `staffId`              | Primary key                       |
| Staff        | `email`                | Unique constraint                 |
| Account      | `accountId`            | Primary key                       |
| Account      | `customerId`           | Find customer's accounts          |
| Transaction  | `transactionId`        | Primary key                       |
| Transaction  | `fromAccountId`        | Find outgoing transactions        |
| Transaction  | `toAccountId`          | Find incoming transactions        |
| Transaction  | `processedByStaffId`   | Find staff-processed transactions |
| StaffAccount | `(staffId, accountId)` | Composite primary key             |

---

## 6. Indexing Principle

Indexes are selected based on actual query patterns rather than being added to every column.

The project will avoid over-indexing because indexes:

- Require additional storage.
- Increase the cost of INSERT, UPDATE, and DELETE operations.
- Are useful only when they support meaningful query patterns.

The indexing strategy may be revised later if query testing or performance analysis reveals a genuine need.

---

## Phase 10 Conclusion

The Version 1 indexing strategy has been defined based on the planned banking queries.

The database will use existing primary-key and unique indexes wherever possible and add only the additional indexes required for important query patterns.

**Phase 10 Status: Complete**
