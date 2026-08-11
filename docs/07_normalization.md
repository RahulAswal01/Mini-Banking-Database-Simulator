# Phase 7 – Database Normalization

## Objective

The database is normalized up to Third Normal Form (3NF) to reduce unnecessary data redundancy and prevent insert, update, and delete anomalies.

The project will not be over-normalized beyond 3NF unless a real requirement is discovered later.

---

## 1. First Normal Form (1NF)

The entities satisfy 1NF because:

- Each attribute contains a single value for a record.
- There are no repeating groups.
- Each row represents a single record.
- Repeated values across different rows do not violate 1NF.

For example, `accountType`, `transactionType`, and `status` may contain the same value in multiple rows. This is allowed because each individual cell still contains one value.

The `address` attribute is intentionally stored as one full address because the project does not require separate access to components such as street, city, state, or PIN code. Therefore, it is treated as one atomic value for this project.

### Result

All current entities satisfy 1NF.

---

## 2. Second Normal Form (2NF)

2NF requires:

- The relation must already be in 1NF.
- Every non-key attribute must depend on the entire primary key.
- There must be no partial dependency on part of a composite primary key.

The main entities use single-column primary keys:

- Customer → `customerId`
- Staff → `staffId`
- Account → `accountId`
- Transaction → `transactionId`

Because these primary keys contain only one attribute, partial dependency cannot occur.

The Staff–Account many-to-many relationship will use an association table containing:

- `staffId`
- `accountId`

The combination of `staffId` and `accountId` identifies one Staff–Account association.

There are currently no non-key attributes in this association table, so there is no partial dependency.

### Result

All current relations satisfy 2NF.

---

## 3. Third Normal Form (3NF)

3NF requires:

- The relation must already be in 2NF.
- Non-key attributes must not depend on other non-key attributes.
- There must be no transitive dependency.

The current entities were reviewed for dependencies between non-key attributes.

### Customer

`customerId` determines:

- name
- email
- phoneNo
- dob
- address

No non-key attribute determines another non-key attribute.

### Staff

`staffId` determines:

- name
- email
- phoneNo
- dob
- address

No non-key attribute determines another non-key attribute.

### Account

`accountId` determines:

- balance
- openedAt
- accountType
- currentStatus

No non-key attribute determines another non-key attribute.

### Transaction

`transactionId` determines:

- transactionType
- amount
- fromAccountId
- toAccountId
- executedAt
- status
- processedByStaffId

No non-key attribute determines another non-key attribute.

### Result

No transitive dependencies were identified in the current design.

Therefore, the current relations satisfy 3NF.

---

## Normalization Conclusion

The database design is normalized up to 3NF.

The project intentionally stops at 3NF to avoid unnecessary decomposition and over-normalization.

Final normalization status:

- 1NF → Passed
- 2NF → Passed
- 3NF → Passed

No further normalization is required.
