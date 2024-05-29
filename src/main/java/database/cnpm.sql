CREATE DATABASE IF NOT EXISTS `cnpm`;
USE `cnpm`;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;


CREATE TABLE IF NOT EXISTS `contentBill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;


CREATE TABLE IF NOT EXISTS `typeBill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `contentBillId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contentBillId` (`contentBillId`),
  CONSTRAINT `contentBill_fk_id` FOREIGN KEY (`contentBillId`) REFERENCES `contentBill` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;


CREATE TABLE IF NOT EXISTS `bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `typeBillId` int(11) NOT NULL,
  `money` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `typeBillId` (`typeBillId`),
  CONSTRAINT `bills_fk_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `bills_fk_typeBillId` FOREIGN KEY (`typeBillId`) REFERENCES `typeBill` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

CREATE TABLE IF NOT EXISTS `recurringBills` (
  `userId` int(11) NOT NULL,
  `typeBillId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `money` int(11) NOT NULL,
  `dateStart` date NOT NULL,
  `unit` varchar(50) NOT NULL,
  `numberUnitcnpm` int(11) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `userId` (`userId`),
  KEY `typeBillId` (`typeBillId`),
  CONSTRAINT `recurringBills_fk_userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `recurringBills_fk_typeBillId` FOREIGN KEY (`typeBillId`) REFERENCES `typeBill` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;












