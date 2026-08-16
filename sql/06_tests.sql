USE bankingsystem;

-- Test 1: Invalid Customer FK
...

-- Test 2: Negative Balance
...

-- Test 3: Negative Transaction Amount
...

-- Test 4: Both Account IDs NULL
...

-- Test 5: Same From/To Account
...

-- Test 6: Duplicate Customer Email
...

-- Test 7: Invalid Account Type
...

-- Test 8: Invalid Account Status
...

-- Test 9: Invalid Transaction Type
...

-- Test 10: Invalid Transaction Status
...

-- Test 11: Invalid Staff FK
...

-- Test 12: Duplicate StaffAccount Relationship
...



SELECT * FROM customer WHERE customerId LIKE 'TEST%';

SELECT * FROM account WHERE accountId LIKE 'TEST%';

SELECT * FROM transactions WHERE transactionId LIKE 'TEST%';