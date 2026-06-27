CREATE DATABASE first;

CREATE database new;
DROP database new;

USE first;
create table student(
	roll INT,
    name varchar(30),
    age int
    );
    
insert into student
values
(10,"hassan",13),
(12,"shah",15),
(10,"raza",13);

select * from student 
order by age asc;

select * from student;
select roll,age from student;
select distinct roll from student;

select count(age) from student where age>13;

select * from student
where
age=13
limit 1
;

select * from student
limit 1
;

show databases;

use first;
show tables;

create table new_student(
id int  not null,
name varchar(30) unique,
email varchar (20) default 10,
constraint id_check  check (id>0)
);

insert into new_student
(id,name)
values
(20,"azmna");


select * from new_student;

create table t1(
id int primary key,
name varchar(100)
);

truncate table t2;
truncate table t1;

insert into t1
values
(10,"Hassan");

create table t2(
user varchar(10),
uid int,
foreign key (uid) references t1(id)
);

insert into t2
values
("azmina",10);

create table dt(
	id int,
    name varchar(20),
    age int
);

insert into dt
values
(1,"hassan",19),
(2,"azmina",19),
(3,"qasim",21),
(4,"abhi",21),
(5,"bqr",20);


alter table dt
add column sap int not null;

alter table dt
drop column sap;

alter table dta
rename to dt;

alter table dt
change column id sap_id int;

alter table dt
modify column sap_id float;

select age,avg(id) from dt group by age;

select * from dt;

select age,max(id) from dt group by age having age>19;

set sql_safe_updates = 0;

update dt
set id = 100 
where id>3;

select * from dt;

delete from dt
where age>19;