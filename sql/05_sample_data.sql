1. INSERT INTO customer
2. INSERT INTO staff
3. INSERT INTO account
4. INSERT INTO staffAccount
5. INSERT INTO transactions




INSERT INTO customer
(customerId, customerName, dob, phoneNo, email, address)
VALUES
('C01', 'Customer 01', '1991-02-02', '9800000001', 'cust01@mail.com', '11 Main Road, City01'),
('C02', 'Customer 02', '1992-03-03', '9800000002', 'cust02@mail.com', '12 Main Road, City02'),
('C03', 'Customer 03', '1993-04-04', '9800000003', 'cust03@mail.com', '13 Main Road, City03'),
('C04', 'Customer 04', '1994-05-05', '9800000004', 'cust04@mail.com', '14 Main Road, City04'),
('C05', 'Customer 05', '1995-06-06', '9800000005', 'cust05@mail.com', '15 Main Road, City05'),
('C06', 'Customer 06', '1996-07-07', '9800000006', 'cust06@mail.com', '16 Main Road, City06'),
('C07', 'Customer 07', '1997-08-08', '9800000007', 'cust07@mail.com', '17 Main Road, City07'),
('C08', 'Customer 08', '1998-09-09', '9800000008', 'cust08@mail.com', '18 Main Road, City08'),
('C09', 'Customer 09', '1999-10-10', '9800000009', 'cust09@mail.com', '19 Main Road, City09'),
('C10', 'Customer 10', '1990-11-11', '9800000010', 'cust10@mail.com', '20 Main Road, City10'),
('C11', 'Customer 11', '1991-12-12', '9800000011', 'cust11@mail.com', '21 Main Road, City11'),
('C12', 'Customer 12', '1992-01-13', '9800000012', 'cust12@mail.com', '22 Main Road, City12'),
('C13', 'Customer 13', '1993-02-14', '9800000013', 'cust13@mail.com', '23 Main Road, City13'),
('C14', 'Customer 14', '1994-03-15', '9800000014', 'cust14@mail.com', '24 Main Road, City14'),
('C15', 'Customer 15', '1995-04-16', '9800000015', 'cust15@mail.com', '25 Main Road, City15');



INSERT INTO staff
(staffId, staffName, dob, phoneNo, email, address)
VALUES
('S01', 'Staff 01', '1981-02-02', '9700000001', 'staff01@bank.com', '21 Bank Road, City'),
('S02', 'Staff 02', '1982-03-03', '9700000002', 'staff02@bank.com', '22 Bank Road, City'),
('S03', 'Staff 03', '1983-04-04', '9700000003', 'staff03@bank.com', '23 Bank Road, City'),
('S04', 'Staff 04', '1984-05-05', '9700000004', 'staff04@bank.com', '24 Bank Road, City'),
('S05', 'Staff 05', '1985-06-06', '9700000005', 'staff05@bank.com', '25 Bank Road, City');


INSERT INTO account
(accountId, customerId, accountType, balance, openedAt, currentStatus)
VALUES
('A01', 'C01', 'savings account', 300, '2026-01-01', 'active'),
('A02', 'C02', 'savings account', 150, '2026-02-02', 'active'),
('A03', 'C03', 'savings account', 400, '2026-03-03', 'active'),
('A04', 'C04', 'savings account', 150, '2026-04-04', 'active'),
('A05', 'C05', 'savings account', 400, '2026-05-05', 'active'),
('A06', 'C06', 'savings account', 150, '2026-06-06', 'active'),
('A07', 'C07', 'savings account', 450, '2026-07-07', 'active'),
('A08', 'C08', 'savings account', 200, '2026-08-08', 'active'),
('A09', 'C09', 'savings account', 150, '2026-09-09', 'active'),
('A10', 'C10', 'savings account', 600, '2026-10-10', 'active'),
('A11', 'C11', 'savings account', 250, '2026-11-11', 'active'),
('A12', 'C11', 'savings account', 0, '2026-12-12', 'active'),
('A13', 'C12', 'savings account', 800, '2026-01-13', 'active'),
('A14', 'C12', 'savings account', 300, '2026-02-14', 'active'),
('A15', 'C13', 'children account', 0, '2026-03-15', 'active'),
('A16', 'C13', 'children account', 0, '2026-04-16', 'active'),
('A17', 'C14', 'children account', 0, '2026-05-17', 'frozen'),
('A18', 'C14', 'children account', 0, '2026-06-18', 'frozen'),
('A19', 'C14', 'children account', 0, '2026-07-19', 'closed'),
('A20', 'C15', 'children account', 0, '2026-08-20', 'closed'),
('A21', 'C15', 'children account', 0, '2026-09-21', 'closed'),
('A22', 'C15', 'children account', 0, '2026-10-22', 'closed');


INSERT INTO staffAccount
(staffId, accountId)
VALUES
('S01', 'A01'),
('S01', 'A05'),
('S01', 'A14'),
('S02', 'A03'),
('S02', 'A14'),
('S02', 'A18'),
('S03', 'A07'),
('S04', 'A18');


INSERT INTO transactions
(transactionId, transactionType, amount, fromAccountId, toAccountId, processedByStaffId, execuatedAt, status)
VALUES
('T01', 'deposit', 500, NULL, 'A01', 'S01', '2026-01-01 09:00:00', 'complete'),
('T02', 'deposit', 300, NULL, 'A02', 'S02', '2026-01-02 09:00:00', 'complete'),
('T03', 'deposit', 700, NULL, 'A03', 'S03', '2026-01-03 09:00:00', 'complete'),
('T04', 'deposit', 400, NULL, 'A04', 'S04', '2026-01-04 09:00:00', 'complete'),
('T05', 'deposit', 600, NULL, 'A05', 'S05', '2026-01-05 09:00:00', 'complete'),
('T06', 'deposit', 250, NULL, 'A06', 'S01', '2026-01-06 09:00:00', 'complete'),
('T07', 'deposit', 800, NULL, 'A07', 'S02', '2026-01-07 09:00:00', 'complete'),
('T08', 'deposit', 350, NULL, 'A08', 'S03', '2026-01-08 09:00:00', 'complete'),
('T09', 'deposit', 700, NULL, 'A09', 'S04', '2026-01-09 09:00:00', 'complete'),
('T10', 'deposit', 550, NULL, 'A10', 'S05', '2026-01-10 09:00:00', 'complete'),
('T11', 'deposit', 650, NULL, 'A11', 'S01', '2026-01-11 09:00:00', 'complete'),
('T12', 'deposit', 600, NULL, 'A12', 'S02', '2026-01-12 09:00:00', 'complete'),
('T13', 'deposit', 750, NULL, 'A13', 'S03', '2026-01-13 09:00:00', 'complete'),
('T14', 'deposit', 500, NULL, 'A14', 'S04', '2026-01-14 09:00:00', 'complete'),

('T15', 'deposit', 400, NULL, 'A15', 'S05', '2026-01-15 10:00:00', 'pending'),
('T16', 'deposit', 300, NULL, 'A16', 'S01', '2026-01-16 10:00:00', 'pending'),
('T17', 'deposit', 200, NULL, 'A01', 'S02', '2026-01-17 10:00:00', 'pending'),
('T18', 'deposit', 150, NULL, 'A04', 'S03', '2026-01-18 10:00:00', 'pending'),
('T19', 'deposit', 250, NULL, 'A07', 'S04', '2026-01-19 10:00:00', 'pending'),

('T20', 'deposit', 500, NULL, 'A18', 'S05', '2026-01-20 10:30:00', 'failed'),

('T21', 'withdraw', 200, 'A01', NULL, 'S01', '2026-02-01 11:00:00', 'complete'),
('T22', 'withdraw', 150, 'A02', NULL, 'S02', '2026-02-02 11:00:00', 'complete'),
('T23', 'withdraw', 300, 'A03', NULL, 'S03', '2026-02-03 11:00:00', 'complete'),
('T24', 'withdraw', 250, 'A04', NULL, 'S04', '2026-02-04 11:00:00', 'complete'),
('T25', 'withdraw', 200, 'A05', NULL, 'S05', '2026-02-05 11:00:00', 'complete'),
('T26', 'withdraw', 100, 'A06', NULL, 'S01', '2026-02-06 11:00:00', 'complete'),
('T27', 'withdraw', 350, 'A07', NULL, 'S02', '2026-02-07 11:00:00', 'complete'),
('T28', 'withdraw', 150, 'A08', NULL, 'S03', '2026-02-08 11:00:00', 'complete'),
('T29', 'withdraw', 300, 'A09', NULL, 'S04', '2026-02-09 11:00:00', 'complete'),
('T30', 'withdraw', 200, 'A10', NULL, 'S05', '2026-02-10 11:00:00', 'complete'),
('T31', 'withdraw', 400, 'A11', NULL, 'S01', '2026-02-11 11:00:00', 'complete'),
('T32', 'withdraw', 300, 'A12', NULL, 'S02', '2026-02-12 11:00:00', 'complete'),
('T33', 'withdraw', 250, 'A13', NULL, 'S03', '2026-02-13 11:00:00', 'complete'),
('T34', 'withdraw', 200, 'A14', NULL, 'S04', '2026-02-14 11:00:00', 'complete'),

('T35', 'withdraw', 100, 'A15', NULL, 'S05', '2026-02-15 12:00:00', 'pending'),
('T36', 'withdraw', 200, 'A16', NULL, 'S01', '2026-02-16 12:00:00', 'pending'),
('T37', 'withdraw', 100, 'A01', NULL, 'S02', '2026-02-17 12:00:00', 'pending'),
('T38', 'withdraw', 100, 'A02', NULL, 'S03', '2026-02-18 12:00:00', 'pending'),
('T39', 'withdraw', 100, 'A03', NULL, 'S04', '2026-02-19 12:00:00', 'pending'),
('T40', 'withdraw', 100, 'A04', NULL, 'S05', '2026-02-20 12:00:00', 'pending'),
('T41', 'withdraw', 100, 'A05', NULL, 'S01', '2026-02-21 12:00:00', 'pending'),
('T42', 'withdraw', 100, 'A06', NULL, 'S02', '2026-02-22 12:00:00', 'pending'),
('T43', 'withdraw', 100, 'A07', NULL, 'S03', '2026-02-23 12:00:00', 'pending'),
('T44', 'withdraw', 100, 'A08', NULL, 'S04', '2026-02-24 12:00:00', 'pending'),

('T45', 'withdraw', 100, 'A17', NULL, 'S02', '2026-02-25 12:30:00', 'failed'),

('T46', 'transfer', 250, 'A09', 'A10', 'S01', '2026-02-26 13:00:00', 'complete'),
('T47', 'transfer', 300, 'A12', 'A13', 'S02', '2026-02-27 13:30:00', 'complete'),

('T48', 'transfer', 400, 'A17', 'A01', 'S03', '2026-02-28 14:00:00', 'failed'),
('T49', 'transfer', 500, 'A19', 'A02', 'S04', '2026-03-01 14:00:00', 'failed'),
('T50', 'transfer', 600, 'A20', 'A21', 'S05', '2026-03-02 14:30:00', 'failed');