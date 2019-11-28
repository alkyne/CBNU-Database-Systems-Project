insert into `designers` (name, phone, class, start_date) values 
('Ho', '010-1234-1234', 'master', "2019-01-01"),
('Mo', '010-1234-5678', 'manager', "2019-02-01"),
('Rii', '010-1234-1111', 'staff', "2019-03-01");

insert into `users` (name, phone, register_date, recent_visit, point, designer_no) values
('Kim', '010-1111-2222', "2019-01-30", "2019-11-15", 10000, 1),
('Choi', '010-2222-5552', "2019-02-09", "2019-10-10", 20000, 2),
('Park', '010-3333-4441', "2019-03-30", "2019-09-12", 30000, 3);

insert into `treatment_history` (treatment_type, treatment_date, price, user_no, designer_no) values
('cut', "2019-02-02", 10000, 1, 1),
('cut', "2019-03-02", 10000, 1, 1),
('cut', "2019-04-02", 10000, 1, 1),
('magic', "2019-02-05", 30000, 2, 2),
('perm', "2019-06-05", 50000, 3, 3),
('cut', "2019-11-15", 10000, 1, 1),
('cut', "2019-10-10", 10000, 2, 2),
('cut', "2019-09-12", 10000, 3, 3);

insert into products values 
('shampoo', 10, 2, 10000),
('conditioner', 1, 1, 20000),
('cream', 6, 1, 30000);

insert into purchase_history values
(1, 1, "2019-02-02", 1, "cream"),
(2, 1, "2019-02-05", 2, "shampoo"),
(3, 1, "2019-06-05", 3, "shampoo"),
(4, 1, "2019-09-12", 2, "conditioner");

insert into `pay` (no, price, purchase_method, pay_date, user_no) values
(1, 10000, 'card', "2019-02-02", 1),
(2, 10000, 'cash', "2019-03-02", 1),
(3, 10000, 'point', "2019-04-02", 1),
(4, 30000, 'card', "2019-02-05", 2),
(5, 50000, 'card', "2019-06-05", 3),
(6, 10000, 'card', "2019-11-15", 1),
(7, 10000, 'cash', "2019-10-10", 2),
(8, 10000, 'card', "2019-09-12", 3),

(9, 10000, 'card', "2019-02-02", 1),
(10, 20000, 'card', "2019-02-05", 2),
(11, 20000, 'card', "2019-06-05", 3),
(12, 30000, 'card', "2019-09-12", 2);

