create database part2;
use part2;


create table accounts(
id int primary key auto_increment,
name varchar(50),
balance decimal(10,2)
);

insert into accounts (name,balance) values
('Adam',500.00),
('Bob',300.00),
('Charlie',1000.00);

select @@autocommit;
set autocommit = 0;
select @@autocommit;

select * from accounts;
start transaction;
update accounts set balance = balance - 50 where id=1;
update accounts set balance = balance + 50 where id=2;
commit;
select * from accounts;


select * from accounts;
start transaction;
update accounts set balance = balance - 50 where id=1;
update accounts set balance = balance + 50 where id=2;
# Undo the uncommmitted changes only
rollback;
select * from accounts;


# SAVEPOINT : Check-Points

start transaction;
update accounts set balance = balance - 50 where id=1;
SAVEPOINT id_1_bal_update;
update accounts set balance = balance + 50 where id=2;
ROLLBACK to id_1_bal_update;
commit;
select * from accounts;

create table t1(
customer_id int,
name varchar(50),
city varchar(50)
);

create table t2(
order_id int,
customer_id varchar(50),
amount double(10,2)
);

INSERT INTO t1 (customer_id, name, city)
VALUES
(1, 'Alice', 'Mumbai'),
(2, 'Bob', 'Delhi'),
(3, 'Charlie', 'Bangalore'),
(4, 'David', 'Mumbai');

INSERT INTO t2 (order_id, customer_id, amount)
VALUES
(101, 1, 500),
(102, 1, 900),
(103, 2, 300),
(104, 5, 700);

select * from t1;
select * from t2;

# INNER JOIN :  (Intersection) 
select * from t1 tx INNER JOIN t2 ty on tx.customer_id = ty.customer_id;

# LEFT JOIN :  (AUB) Intersection (B - A)(Complement)
select * from t1 tx LEFT JOIN t2 ty on tx.customer_id = ty.customer_id;

# RIGHT JOIN :  (AUB) Intersection (A-B)(Complement)
select * from t1 tx RIGHT JOIN t2 ty on tx.customer_id = ty.customer_id;


# FULL JOIN :  (AUB) (LEFT JOIN UNIONT RIGHT JOIN)
select * from t1 tx LEFT JOIN t2 ty on tx.customer_id = ty.customer_id
UNION
select * from t1 tx RIGHT JOIN t2 ty on tx.customer_id = ty.customer_id;

# CROSS JOIN :  Maps each row t1 with each row of t2
select * from t1 CROSS JOIN T2;

# SELF JOIN : Maps to same table

create table t3(
order_id int,
customer_id int,
amount double(10,2)
);

INSERT INTO t2 (order_id, customer_id, amount)
VALUES
(101, 1, 500),
(102, 1, 900),
(103, 2, 300),
(104, 5, 700);
select * from t2 as tx JOIN t2 as ty on tx.order_id-100 = ty.customer_id;


# Practice Problem : Exclusive Joins :

# LEFT EXCLUSIVE JOIN : (A - B)
select * from t1 left join t2 on t1.customer_id = t2.customer_id where t2.customer_id IS NULL;

# RIGHT EXCLUSIVE JOIN : (B-A)
select * from t1 right join t2 on t1.customer_id = t2.customer_id where t1.customer_id IS NULL;

# Sub - Queries :

# Inside Where :
select * from t2;
select * from t2 where amount>(select avg(amount) from t2);
# select * from t2 where amount>avg(amount); (WRONG need to use the group by)
select * from t2;
select customer_id,avg(amount) from t2 group by customer_id having AVG(amount)>600;

# Inside Select :
select * from t1;
select * from t2;
select name,
(
	select count(*) 
	from t2 
	where t1.customer_id = t2.customer_id)
as order_count 
from t1;

# Inside From :
select * from t2;
select customer_id,avg(amount) as avg_amount from t2 group by customer_id;

select 
	summary.customer_id,
    summary.avg_amount
from
	(
		select customer_id,avg(amount) as avg_amount from t2 group by customer_id  
	)
    as summary;

# View in SQL :

create view view1 as select customer_id,name from t1;
select * from view1;
set sql_safe_updates = 0;
update view1 set name="Hassan" where customer_id = 1;
select * from view1;
# Changes will be reflected in the original table :
select * from t1; 

select * from t1;
select * from t2;
create view view2 as select t1.name,t1.city,t2.amount from t1 inner join t2 on t1.customer_id = t2.customer_id;
select * from view2;

# INDEX : (Default Index : Primary Key)
-- Faster in retrival or reading but slow in writing or updation.

create index i1 on t1(name); 
alter table t1 add constraint c1 primary key(customer_id);
show index from t1; # (Default Index : Primary Key)
select * from t1 where name="Alice";
drop index i1 on t1;
show index from t1;

# COMPOSITE INDEX :

create index composite_idx on t1(name,city);
show index from t1;


# STORED PROCEDURE :

DELIMITER $$

CREATE PROCEDURE check_balance(IN acc_id INT)
BEGIN
	SELECT name
    FROM t1
    WHERE customer_id = acc_id;
END $$

DELIMITER ;

drop procedure check_balance;

CALL check_balance(1);

# WITH OUT : (Like Return Statement)

select * from t1 order by customer_id asc;

DELIMITER $$

CREATE PROCEDURE check_name(IN ac_id int, OUT nm varchar(50))
BEGIN
	select name into nm from t1 where customer_id = ac_id;
END $$

DELIMITER ;

CALL check_name(1,@NAAM);
select @NAAM;

select * from t1 where name = @naam;