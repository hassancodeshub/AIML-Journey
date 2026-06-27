create database if not exists sample;
// drop database if not exists;
use sample;

create table t1(
id int not null,
name varchar(30)
);

show tables;

alter table t1 add column salary float check (salary>0);

show tables;

create table t2(name varchar(10));
show tables;
drop table t2;
show tables;

create index i1 on t1(id);
drop index i1 on t1;

create table t2(
fkey int primary key);

alter table t1 add constraint keyconstraint foreign key (id) references t2(fkey);

truncate table t2;

alter table t1 drop constraint keyconstraint;

truncate table t2;

alter table t1 change column name naam varchar(30);

insert into t1 values
(1,'hassan',99999),
(2,'Qasim',99998),
(1,'Ganu',99949);

select * from t1;
select naam from t1;

insert into t1 values
(4,'riyan',1);

select * from t1 where(salary>1);
select * from t1 where((salary>1) AND (id<2));
select * from t1 where salary like '9%';
select * from t1 where salary like '%99.00';
select * from t1 where naam like '__s%';

select * from t1 where id in (2,3,4);

select * from t1 order by salary asc;


select id*2 as ids,naam,salary  from t1 order by ids,salary asc;

select count(salary) from t1;
select max(salary) from t1;
select min(salary) from t1;
select avg(salary) from t1;
select sum(salary) from t1;

select id,max(salary) from t1 group by id;


create table demo(
EmpID int primary key,
FirstName varchar (20),
LastName varchar (20),
Department varchar (20),
Salary int,
HireDate date);

insert into demo values
(101,"Alice","Johnson","IT",6500,"2020-03-15"),
(102,"Mark","Rivera","HR",4800,"2019-07-22"),
(103,"Sophia","Lee","Finance",7200,"2021-01-10"),
(104,"Daniel","Kim","IT",5800,"2018-11-05"),
(105,"Emma","Brown","Marketing",5300,"2022-04-18"),
(106,"Liam","Patel","Finance",6900,"2020-09-29"),
(107,"Olivia","Garcia","HR",4600,"2017-06-30"),
(108,"Noah","Thompson","IT",7500,"2023-02-12"),
(109,"Ava","Martinez","Marketing",5100,"2019-12-02"),
(110,"Ethan","Davis","Finance",8000,"2016-05-14");


select Department,avg(salary) from demo group by department;
select Department,avg(salary) from demo group by department HAVING avg(salary)>5100;
select Department,count(*) from demo group by department order by count(*) desc;	

set sql_safe_updates = 0;
update t1 set id = 3,salary=20 where naam='Ganu';
select * from t1;
delete from t1 where naam = 'riyan';

alter table t1 add column age int default 18;
select * from t1;

alter table t1 drop column age;

