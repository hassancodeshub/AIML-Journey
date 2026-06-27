create database employee;
use employee;

create table dt(
EmpID int primary key,
FirstName varchar (20),
LastName varchar (20),
Department varchar (20),
Salary int,
HireDate date);

insert into dt values
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

select * from dt;

select FirstName,LastName,Salary from dt;

select FirstName,LastName from dt where department='IT';

select FirstName,LastName from dt where salary>6000;


select * from dt order by HireDate asc;

select distinct department from dt;

select FirstName from dt where FirstName like ('A%');


select salary from dt where salary between 4000 AND 7000;

select avg(salary) from dt;

select Department,count(Department) from dt group by Department having count(Department)>2;