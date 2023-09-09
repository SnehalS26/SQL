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
did int,
constraint did_fk foreign key(did) references Department(did)
)
alter table Employee add imageurl varchar(40)
drop table Employe

create table Employee
(
id int primary key identity(1,1),
name varchar(30),
salary numeric(12,2),
imageurl varchar(40),
did int
)

select * from Department
select * from Employee

create table Category
(
cid int primary key identity(1,1),
cname varchar(40)
)

create table Product
(
id int primary key identity(1,1),
name varchar(30),
price numeric(12,2),
imageurl varchar(40),
cid int
)
select * from Category
select * from Product

-------------------------------------------------------------

create table Users
(
id int primary key identity(1,1),
firstName varchar(50),
lastName varchar(50),
email varchar(200),
password varchar(50),
phone varchar(50),
gender varchar(50),
city varchar(50),
state varchar(50),
)
alter table Users add roleid int foreign key(roleid) references Roles(roleid)
select * from Users
update Users set roleid=1 where id=1

create table Roles
(
roleid int primary key,
rolename varchar(40)
)
select * from Roles
insert into Roles values(1,'admin')
insert into Roles values(2,'User')

create table ContactUs
(
name varchar(50),
email varchar(50),
message varchar(300)
)
select * from ContactUs