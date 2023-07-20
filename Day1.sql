
--create table
create table Employee
(
id int,
empname varchar(25),
salary numeric(12,2),
email varchar(30) unique
)
--schema
sp_help Employee

--add new column
alter table Employee add qualification varchar(10)

--modify the data type or size
alter table Employee alter column qaulification varchar(15)

--drop column from the table
alter table Employee drop column qualification

--rename column name
sp_rename 'Employee.salary' , 'empsalary'

alter table Employee alter column id int not null
alter table Employee alter column empname varchar(10) not null
alter table Employee alter column empsalary numeric(12,2) not null

alter table Employee add email varchar(20) not null unique
alter table Employee add constraint un_emp unique(email)

alter table Employee add contstraint un_emp unique(id,email)

alter table Employee drop constraint un_emp

alter table Employee add constraint pk_emp primary key(id)

insert into Employee values (1, 'snehal', 10000, 'sneh123@gmail.com')
insert into Employee values (2, 'sneha', 20000, 'sneha123@gmail.com')
insert into Employee values (3, 'sneh', 30000, 'sne123@gmail.com')
insert into Employee values (4, 'sidhhi', 40000, 'sid123@gmail.com')
insert into Employee values (5, 'swapnil', 50000, 'swap123@gmail.com')
insert into Employee values (6, 'nikita', 60000, 'nikita123@gmail.com')
insert into Employee values (7, 'niki', 70000, 'niki123@gmail.com')
insert into Employee values (8, 'neha', 80000, 'neh123@gmail.com')
insert into Employee values (9, 'komal', 90000, 'komal123@gmail.com')
insert into Employee values (10, 'smita', 95000, 'smita123@gmail.com')

select * from Employee

update Employee set empname = 'snehu' where id= 3

delete from Employee where id = 10


create table Book
(
id int primary key,
name varchar(20) not null,
author_name varchar(30) not null,
price int not null
)

sp_help Book

insert into Book values (1, 'abc' , 'xyz' ,400)
insert into Book values (2, 'def' , 'wud' ,300)
insert into Book values (3, 'ghi' , 'rty' ,500)
insert into Book values (4, 'jkl' , 'hhjk', 200)
insert into Book values (5, 'mno' , 'vwx' ,100)
insert into Book values (6, 'pqr' , 'stu' ,800)

select * from Book

create table Dept
(
did int primary key,
dname varchar(15)
)
create table Emp
(
id int primary key,
ename varchar(30) not null,
did int ,
constraint fk_dept_emp foreign key(did) references Dept(did)
)
sp_help Emp

