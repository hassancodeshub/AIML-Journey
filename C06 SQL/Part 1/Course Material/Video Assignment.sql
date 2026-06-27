create database college;
use college;

create table teacher(
id int PRIMARY KEY,
ism varchar(30),
subjects varchar(10),
salary float
);

insert into teacher values
(23,"ajay","math",50000),
(47,"bharat","english",60000),
(18,"chetan","chemistry",45000),
(9,"divya","physics",75000);

select * from teacher;

alter table teacher change column ism name varchar(30),change column subjects subject varchar(30);

select * from teacher;


select name,salary from teacher where salary>50000;


alter table teacher change column salary ctc float;

set sql_safe_updates=0;
update teacher set ctc=1.25*ctc;

select * from teacher;

alter table teacher add column city varchar(10) default "dhule";

select * from teacher;

alter table teacher drop column ctc;

select * from teacher;

select * from teacher
order by id asc;