create user alkyne@'%' identified by 'alkyne123!@#';
grant all privileges on HairShop.* to alkyne@'%';
flush privileges;

create database HairShop;
use `HairShop`;

DROP TABLE IF EXISTS `designers`;
CREATE TABLE `designers` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `class` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `product_name` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `left_num` int(11) DEFAULT NULL,
  `sold_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL,
  `purchase_method` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_no` int(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `user_no` (`user_no`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`user_no`) REFERENCES `users` (`no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `purchase_history`;
CREATE TABLE `purchase_history` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_num` int(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `user_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `user_no` (`user_no`),
  CONSTRAINT `purchase_history_ibfk_1` FOREIGN KEY (`user_no`) REFERENCES `users` (`no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `treatment_history`;
CREATE TABLE `treatment_history` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `treatment_type` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `treatment_date` date NOT NULL,
  `price` int(11) NOT NULL,
  `user_no` int(11) DEFAULT NULL,
  `designer_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `user_no` (`user_no`),
  KEY `designer_no` (`designer_no`),
  CONSTRAINT `treatment_history_ibfk_1` FOREIGN KEY (`user_no`) REFERENCES `users` (`no`) ON DELETE CASCADE,
  CONSTRAINT `treatment_history_ibfk_2` FOREIGN KEY (`designer_no`) REFERENCES `designers` (`no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `register_date` date NOT NULL,
  `recent_visit` date NOT NULL,
  `point` int(11) DEFAULT NULL,
  `designer_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `designer_no` (`designer_no`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`designer_no`) REFERENCES `designers` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;