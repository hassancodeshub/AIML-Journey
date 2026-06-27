use college;

create table student(
roll int unique,
name varchar(30),
city varchar(30),
marks int check (marks>0)
);

insert into student values
(110,"adam","delhi",76),
(108,"bob","mumbai",65),
(124,"casey","pune",94),
(112,"duke","pune",80);

select * from student;

select * from student where marks>75;

select name,city from student;

select city,count(name) from student group by city;

select city,max(marks) from student group by city;

select avg(marks) from student;

alter table student
add column grade char(2);


set sql_safe_updates=0;

update student
set grade='o'
where marks>=80;

update student
set grade='A'
where marks>=70 AND marks<80;

update student
set grade='B'
where marks>=60 AND marks<70;

select * from student
order by marks desc;