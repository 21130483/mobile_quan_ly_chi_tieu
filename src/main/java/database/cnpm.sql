CREATE DATABASE IF NOT EXISTS `cnpm`;
USE `cnpm`;

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

INSERT INTO `user` (`id`, `fullName`, `username`, `password`) VALUES
	(1, 'admin', 'admin', '123');


CREATE TABLE IF NOT EXISTS `typeBill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

INSERT INTO `typeBill` (`id`, `name`) VALUES
	(1, 'Chi tiêu'),
	(2, 'Thu nhập');


CREATE TABLE IF NOT EXISTS `contentBill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `typeBillId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `typeBillId` (`typeBillId`),
  CONSTRAINT `typeBill_fk_id` FOREIGN KEY (`typeBillId`) REFERENCES `typeBill` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

INSERT INTO `contentBill` (`id`, `name`, `typeBillId`) VALUES
	(1, 'Đồ ăn', 1),
	(2, 'Xe buýt', 1),
	(3, 'Nhà ở', 1),
	(4, 'Giáo dục', 1),
	(5, 'Quà cáp', 1),
	(6, 'Hằng ngày', 1),
	(7, 'Em bé', 1),
	(8, 'Thú cưng', 1),
	(9, 'Tiền lương', 2),
	(10, 'Đầu tư', 2),
	(11, 'Tiền thưởng', 2),
	(12, 'Bán thời gian', 2);


CREATE TABLE IF NOT EXISTS `bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `contentBillId` int(11) NOT NULL,
  `money` INT(50) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `contentBillId` (`contentBillId`),
  CONSTRAINT `bills_fk_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `bills_fk_contentBillId` FOREIGN KEY (`contentBillId`) REFERENCES `contentBill` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_UNICODE_CI;

CREATE TABLE IF NOT EXISTS `recurringBills` (
  `userId` int(11) NOT NULL,
  `typeBillId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `money` INT(50) NOT NULL,
  `dateStart` date NOT NULL,
  `unit` varchar(50) NOT NULL,
  `numberUnit` int(11) NOT NULL,
  PRIMARY KEY (`userId`),
  KEY `userId` (`userId`),
  KEY `typeBillId` (`typeBillId`),
  CONSTRAINT `recurringBills_fk_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `recurringBills_fk_typeBillId` FOREIGN KEY (`typeBillId`) REFERENCES `typeBill` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

