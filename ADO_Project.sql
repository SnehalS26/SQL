create table Category
(
cid int primary key identity(1,1),
cname varchar(20)
)

create table Product
(
id int primary key identity(1,1),
name varchar(20),
price int,
cid int,
constraint fk_Cate_Prod foreign key(cid) references Category(cid)
)

insert into Category values('Furniture')
insert into Category values('Electronics')
insert into Category values('Mobile')
insert into Category values('Home Needs')

select * from Category
select * from Product
--------------------------------------------------------------------------------
create table Department
(
dept_id int primary key identity(1,1),
dept_name varchar(50)
)
create table Employee
(
empid int primary key identity(1,1),
ename varchar(40),
salary int,
dept_id int,
constraint fk_Dept_Emp foreign key(dept_id) references Department(dept_id)
)
select * from Department
select * from Employee

insert into Department values( 'Admin')
insert into Department values( 'HR')
insert into Department values( 'Sales')
insert into Department values( 'Manager')
-------------------------------------------------------------------------------------------
create table Branch
(
branch_id int primary key identity(1,1),
branch_name varchar(30)
)
create table Student
(
roll int primary key identity(1,1),
name varchar(30),
branch_id int,
constraint fk_branch_id foreign key(branch_id) references Branch(branch_id)
)
select * from Branch
select * from Student

insert into Branch values('IT')
insert into Branch values('Computer')
insert into Branch values('E&TC')
insert into Branch values('Mechanical')
