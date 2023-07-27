create table Emp
(
id int primary key,
name varchar(30) not null,
salary int not null,
dept_name varchar(30) not null,
address varchar(30) not null,
designation varchar(40) not null
)
alter table Emp add gender varchar(30)
sp_help Emp
alter table Emp add managerid int
alter table Emp add did int

alter table Emp add constraint did_fk foreign key(did) references Dept(did)

--insert the data 
insert into Emp values(101,'snehal', 30000, 'IT', 'Kothrud', 'Software')
insert into Emp values(102, 'swapnil', 35000, 'medical', 'Pune', 'MBBS')
insert into Emp values(103, 'nikita', 25000, 'IT', 'Kharadi', 'Support')
insert into Emp values(104, 'siddhi', 33000, 'Professor', 'Beed', 'Teaching')
insert into Emp values(105, 'smita', 20000, 'IT' , 'Hinjewadi', 'Development')
insert into Emp values(106,'Pankaj', 23000, 'IT' , 'Mumbai', 'Manager', 'male')
insert into Emp values(107, 'Sagar' , 18000, 'IT', 'Bangloar', 'Manager' , 'male')
insert into Emp values(108, 'Sanket' , 19000, 'IT', 'Pune', 'Manager', 'male')
insert into Emp values(109, 'sumit' , 15000, 'HR', 'Mumbai', 'Manager', 'male')
insert into Emp values(110, 'Vishal' , 26000, 'sales-Department', 'Pune', 'Manager', 'male')
insert into Emp values(111, 'anvi' , 19000, 'HR', 'Mumbai', 'Manager', 'female')


--update emp table gender field
update Emp set gender = 'female'  where id in (101,103,104,105)
update Emp set gender = 'male' where id = 102
update Emp set salary = 35000 where id = 102
update Emp set salary = 18000 where id = 108

update Emp set dept_name = 'Admin' where id in (101,103,106)
update Emp set dept_name = 'Testing' where id in (102,104,105)
update Emp set dept_name = 'Development' where id = 107

update Emp set designation = 'Tester' where id =102
update Emp set designation = 'Tester' where id =104
update Emp set designation = 'Developer' where id =105

update Emp set managerid = 101 where id in (102,103,104)
update Emp set managerid = 105 where id in (106,107)
update Emp set managerid = 110 where id in (108,109,111)

select * from Emp

create table Dept
(
did int primary key,
dname varchar(30)
)
sp_help Dept

insert into Dept values(1, 'Admin')
insert into Dept values(2, 'Testing')
insert into Dept values(3, 'Development')
insert into Dept values(4, 'HR')
insert into Dept values(5, 'IT')
insert into Dept values(6, 'sales-Department')

select * from Dept

--update emp table set did
update Emp set did= 1 where id in (101, 103)
update Emp set did= 2 where id in (102, 104)
update Emp set did= 3 where id in (106, 105)
update Emp set did= 4 where id in (108, 107)
update Emp set did= 5 where id =109
update Emp set did= 6 where id in (111, 110)

select * from Emp
select * from Dept

--inner join
select e1. * , d1.dname
from Emp e1
inner join Dept d1 on d1.did = e1.did


--display name salary designation
select name , salary, designation from Emp

--update salary by 10% of Emp who is from Pune
update Emp set salary =salary + (salary * 0.10) where address = 'Pune'

--delete all emp salary less than 20,000 where city is pune
delete from Emp where salary < 20000

--update address of Emp who designation is manager
update Emp set address = 'surat' where designation = 'Manager'

--display all female employee
select * from Emp where gender = 'female'

--display all emp from banglor
select * from Emp where address = 'Bangloar'

--display all emp from HR department where location is mumbai
select * from Emp where dept_name = 'HR' and address = 'Mumbai'

--delete emp from sales-department and salary more than 25k
delete from Emp where dept_name = 'sales-Department' and salary > 25000

--find a employee salary is more than 15k and less than 30k
select * from Emp where salary > 15000 and salary < 30000

--find a employee max salary
select max(salary) as 'Max Salary' from Emp

--find total number of emp
select count(*) as 'Total Count' from Emp

--emp whoose salary less than 50k and working in IT department
select * from Emp where salary < 30000 and dept_name = 'IT'

--to arrange all employee desc order of salary
select * from Emp Order by salary desc

--to display salry is not in range 20k to 25k
select * from Emp where salary not between 20000 and 25000

--display name and designation of emp who is from pune and mumbai
select name , designation from Emp where address in ('Pune', 'Mumbai')

--display all emp whose designation contain e
select * from Emp where designation like '%e%'

--display emp who have 2nd and 3rd highest salary
select * from Emp order by salary desc offset 1 rows fetch next 2 rows only

--Write a query to list the number of jobs available in the employees table.
select count(distinct dept_name) from Emp

--Write a query to get the total salaries payable to employees.
select sum(salary) from Emp

--Write a query to get the minimum salary from employees table.
select min(salary) from Emp

--Write a query to get the maximum salary of an employee working as a Programmer.select  max(salary) from Emp where designation = 'Manager'
--Write a query to get the average salary and number of employees working the department 90.select avg(salary) from Emp where dept_name= 'Testing'--Write a query to get the highest, lowest, sum, and average salary of all employees.select max(salary) as 'highest salary' ,min(salary) as 'lowest salary' , avg(salary) as 'average salary' from Emp--Write a query to get the number of employees with the same jobselect id,count(*) from Emp group by id--Write a query to get the difference between the highest and lowest salaries.select max(salary)- min(salary) from Emp--Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.select managerid , min(salary)from Empgroup by managerid --Write a query to get the department ID and the total salary payable in each department.select did , sum(salary) as 'sum' from Emp group by did--Write a query to get the average salary for each job ID excluding programmerselect dept_name, avg(salary) as 'average salary' from Empgroup by dept_name order by count(id) --Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department name 'HR' only.select id, sum(salary) as 'Total', max(salary) as 'Max', min(salary) as 'Min' , avg(salary) as 'average' from Empwhere dept_name = 'HR'group by id --Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.select id, max(salary) as 'Max' from Emp group by idhaving max(salary) >= 25000--Write a query to get the average salary for all departments employing more than 10 employees.select dept_name,  avg(salary) as 'Average' from Emp group by dept_name--display emp list who have less than the avg salary of emp table
select * from Emp
where salary <
(
select avg(salary) from Emp 
)

--display emp details who have highest salary from their deptselect name from Emp where salary <(select max(salary) from Emp where did =(select did from Dept where dname = ' Testing' ))