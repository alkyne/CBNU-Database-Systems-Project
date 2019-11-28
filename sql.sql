create database HairShop;
create user alkyne@'%' identified by 'alkyne123!@#';
grant all privileges on HairShop.* to alkyne@'%';
flush privileges;

create table users (
	`no` int not null auto_increment primary key,
	`name` varchar(50) not null,
	`phone` varchar(50) not null,
	`register_date` date not null,
	`recent_visit` date not null,
	`point` int
);

<<<<<<< HEAD
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
  FOREIGN KEY (`designer_no`) REFERENCES `designers` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `product_name` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `left_num` int(11) DEFAULT NULL,
  `sold_num` int(11) DEFAULT NULL,
  `price` int(11) default null,
  PRIMARY KEY (`product_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL,
  `purchase_method` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_no` int(11) NOT NULL,
  `pay_date` date not null,
  PRIMARY KEY (`no`),
  FOREIGN KEY (`user_no`) REFERENCES `users` (`no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `purchase_history`;
CREATE TABLE `purchase_history` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_num` int(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `user_no` int(11) DEFAULT NULL,
  `product_name` char(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`no`),
  FOREIGN KEY (`user_no`) REFERENCES `users` (`no`) ON DELETE CASCADE,
  FOREIGN KEY (`product_name`) REFERENCES `products` (`product_name`)
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
  FOREIGN KEY (`user_no`) REFERENCES `users` (`no`) ON DELETE CASCADE,
  FOREIGN KEY (`designer_no`) REFERENCES `designers` (`no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
=======
create table designers (
	`no` int not null auto_increment primary key,
	`name` varchar(50) not null,
	`phone` varchar(50) not null,
	`class` char(20) not null,
	`start_date` date
);

create table products (
	`product_name` char(20) not null primary key,
	`left_num` int,
	`sold_num` int
);

create table purchase_history (
	`no` int not null auto_increment primary key,
	`purchase_num` int,
	`purchase_date` date,
	`user_no` int,
	foreign key(user_no) references users(no) on delete cascade
);

create table treatment_history (
	`no` int not null auto_increment primary key,
	`treatment_type` char(20) not null,
	`treatment_date` date not null,
	`price` int not null,
	`user_no` int,
	`designer_no` int,
	foreign key(user_no) references users(no) on delete cascade,
	foreign key(designer_no) references designers(no) on delete cascade
);

create table purchase(
	`no` int not null auto_increment primary key,
	`price` int not null,
	`purchase_method` varchar(20) not null,
	`user_no` int not null,
	foreign key(user_no) references users(no) on delete cascade
);
>>>>>>> parent of 2fd37dd... Modified SQL
