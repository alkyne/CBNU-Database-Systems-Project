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