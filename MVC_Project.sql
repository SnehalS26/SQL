Create table Book
(
id int primary key identity(1,1),
name varchar(30),
price numeric(10,2),
author varchar(20)
)
alter table Book add isActive int
update Book set isActive=1 where id=2
select * from Book

create table Student
(
roll int primary key identity(1,1),
name varchar(30),
percentage numeric(10,2),
isActive int 
)
select * from Student

create table Movie
(
id int primary key identity(1,1),
name varchar(40),
genere varchar(40),
released_date date,
starcast varchar(30),
isActive int
)
select * from Movie

create table Department
(
did int primary key identity(1,1),
dname varchar(40)
)

create table Employee
(
eid int primary key identity(1,1),
ename varchar(40),
salary int,
did int
constraint did_fk foreign key(did) references Department(did)
)
select * from Department
select * from Employee