CREATE TABLE `customer` (
  `customerID` varchar(10) NOT NULL,
  `customerName` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `phoneNo` varchar(10) NOT NULL,
  `email` varchar(25) NOT NULL,
  `address` varchar(30) NOT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE KEY `email` (`email`)
)



CREATE TABLE `staff` (
  `staffid` varchar(15) NOT NULL,
  `staffName` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `phoneno` varchar(10) NOT NULL,
  `email` varchar(25) NOT NULL,
  `address` varchar(30) NOT NULL,
  PRIMARY KEY (`staffid`),
  UNIQUE KEY `email` (`email`)
)




CREATE TABLE `account` (
  `accountid` varchar(10) NOT NULL,
  `customerID` varchar(10) NOT NULL,
  `accounttype` enum('savings account','children account') NOT NULL,
  `balance` int NOT NULL,
  `openedat` date NOT NULL,
  `currentstatus` enum('active','closed','frozen') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`accountid`),
  KEY `customerID` (`customerID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  CONSTRAINT `account_chk_1` CHECK ((`balance` >= 0))
) 





CREATE TABLE `transactions` (
  `transactionid` varchar(10) NOT NULL,
  `transactiontype` enum('deposit','withdraw','transfer') NOT NULL,
  `amount` int NOT NULL,
  `fromaccountid` varchar(10) DEFAULT NULL,
  `toaccountid` varchar(10) DEFAULT NULL,
  `processedbystaffid` varchar(10) NOT NULL,
  `execuatedAt` datetime NOT NULL,
  `status` enum('pending','complete','failed') NOT NULL,
  PRIMARY KEY (`transactionid`),
  KEY `fromaccountid` (`fromaccountid`),
  KEY `toaccountid` (`toaccountid`),
  KEY `processedbystaffid` (`processedbystaffid`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`fromaccountid`) REFERENCES `account` (`accountid`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`toaccountid`) REFERENCES `account` (`accountid`),
  CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`processedbystaffid`) REFERENCES `staff` (`staffid`),
  CONSTRAINT `transactions_chk_1` CHECK ((`amount` > 0)),
  CONSTRAINT `transactions_chk_2` CHECK (((`fromaccountid` is not null) or (`toaccountid` is not null))),
  CONSTRAINT `transactions_chk_3` CHECK (((`fromaccountId` is null) or (`toaccountid` is null) or (`fromaccountid` <> `toaccountid`)))
)