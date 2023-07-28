create table Customers
(
customerid int primary key,
customername varchar(30),
age int,
city varchar(20),
state varchar(20),
dob date)

insert into Customers values(1,'Snehal',22,'Pune','Maharashtra','1998-1-1')
insert into Customers values(2,'Pankaj',21,'Pune','Maharashtra','1998-1-1')
insert into Customers values(3,'Anjali',23,'Nashik','Maharashtra','1998-1-1')
insert into Customers values(4,'Kishor',21,'Surat','Gaujrat','1998-1-1')
insert into Customers values(5,'Sagar',30,'Noida','UP','1998-1-1')
insert into Customers values(6,'Sanket',20,'Mumbai','Maharashtra','1998-1-1')
insert into Customers values(7,'Swapnil',24,'Beed','Maharashtra','1998-1-1')
insert into Customers values(8,'Sonali',34,'Noida','UP','1998-1-1')
insert into Customers values(9,'Akshata',30,'Pune','Maharashtra','1998-1-1')
insert into Customers values(10,'Nikita',31,'Pune','Maharashtra','1998-1-1')
insert into Customers values(11,'Smita',29,'Nagar','Maharashtra','1998-1-1')
insert into Customers values(12,'Neha',23,'Nagar','Maharashtra','1998-1-1')
insert into Customers values(13 , 'Ankita' , 24, 'Berlin' , 'Germany', '1998-10-02')
insert into Customers values(14 , 'Rutuja' , 25, 'London' , 'England', '1998-09-04')
insert into Customers values(15 , 'Pratiksha' , 24, 'Norway' , 'Europe', '1998-10-06')
insert into Customers values(16 , 'Priyanka' , 26, 'Oslo' , 'Norway', '1999-10-02')

alter table Customers add postalcode int

update Customers set state = 'Norway' where customerid in (9,2)
update Customers set postalcode = 410014 where customerid in(1,2,9,10)
update Customers set postalcode = 400001 where customerid = 6
update Customers set postalcode = 422001 where customerid=3
update Customers set postalcode = 414001 where customerid in (11,12)

create table Orderstatus
(
statusid int primary key,
statusname varchar(20)
)

insert into Orderstatus values(1,'Order')
insert into Orderstatus values(2,'Shipped')
insert into Orderstatus values(3,'Delivered')
insert into Orderstatus values(4, 'Cancel')

create table Orders
(
orderid int primary key,
customerid int,
statusid int,
orderdate date,
shippeddate date,
deliverydate date
)
alter table Orders add canceldate date
insert into Orders values(101, 1,1,'2023-08-18', null , null)
insert into Orders values(102, 2,3, '2022-07-01', '2022-07-3', '2022-07-10')
insert into Orders values(103, 3,2, '2023-08-01', '2023-08-3', null)
insert into Orders values(104, 4,3, '2020-06-01', '2020-06-2', '2020-06-15')
insert into Orders values(105, 5,1, '2022-07-01', null , null)
insert into Orders values(106, 6,3, '2024-07-01', '2024-07-3', '2024-07-10')
insert into Orders values(107, 13,4, '2024-04-02', null , null, '2023-04-03')
select * from Customers
select * from Orderstatus
select * from Orders

--inner join table
select c1.* , o1.orderdate, o1.deliverydate, s1.statusid, s1.statusname
from Customers c1
inner join Orders o1
ON o1.customerid = c1.customerid
inner join Orderstatus s1
ON s1.statusid = o1.statusid

--left join table
select c1.* , o1.orderdate, o1.deliverydate, s1.statusid, s1.statusname
from Customers c1
left join Orders o1
ON o1.customerid = c1.customerid
left join Orderstatus s1
ON s1.statusid = o1.statusid

--right join
select c1.* , o1.orderdate, o1.deliverydate, s1.statusid, s1.statusname
from Customers c1
right join Orders o1
ON o1.customerid = c1.customerid
right join Orderstatus s1
ON s1.statusid = o1.statusid

--full join
select c1.* , o1.orderdate, o1.deliverydate, s1.statusid, s1.statusname
from Customers c1
full join Orders o1
ON o1.customerid = c1.customerid
full join Orderstatus s1
ON s1.statusid = o1.statusid

--1.Write a statement that will select the City column from the Customers table
select city from Customers

--2.Select all the different values from the State column in the Customers table.
select distinct state from Customers

--3.Select all records where the City column has the value "Pune"
select * from Customers where city = 'Pune'

--4.Use the NOT keyword to select all records where City is NOT "Berlin".
select * from Customers where not city = 'Berlin'

--5.Select all records where the CustomerID column has the value 23.
select * from Customers where customerid = 12

--6.Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
select * from Customers where city ='Berlin' and age = 24

--7.Select all records where the City column has the value 'Berlin' or 'London'.
select * from Customers where city in ('Berlin' , 'London')

--8.Select all records from the Customers table, sort the result alphabetically by the column City.
select * from Customers order by city 

--9.Select all records from the Customers table, sort the result reversed alphabetically by the column City.
select * from Customers order by city desc

--10.Select all records from the Customers table, sort the result alphabetically, first by the column state, then, by the column City
select * from Customers order by state, city;

--11.Select all records from the Customers where the PostalCode column is empty.
select * from Customers where postalcode is null

--12.Select all records from the Customers where the PostalCode column is NOT empty.
select * from Customers where not postalcode is null

--13.Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".
update Customers set city = 'Oslo' where state = 'Norway'

--14.Delete all the records from the Customers table where the Country value is 'Norway'.
delete Customers where state = 'Norway'

--20.Select all records where the value of the City column starts with the letter "a".
select * from Customers where customername like 'a%'

--21.Select all records where the value of the City column ends with the letter "a".
select * from Customers where city like '%a'

--22.Select all records where the value of the City column contains the letter "a".
select * from Customers where city like '%a%'

--23.Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
select * from Customers where city like 'a%b'

--24.Select all records where the value of the City column does NOT start with the letter "a".
select * from Customers where city not like 'P%'

--25.Select all records where the second letter of the City is an "a".
select * from Customers where city like '_a%'

--26.Select all records where the first letter of the City is an "a" or a "c" or an "s".
select * from Customers where city like '[acs]%'

--27.Select all records where the first letter of the City starts with anything from an "a" to an "f".
select * from Customers where city like '[a-f]%'

--28.Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".
select * from Customers where city not like '%[acf]'

--29.Use the IN operator to select all the records where the Country is either "Norway" or "France".
select * from Customers where state in ('Norway' , 'France')

--30.Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
select * from Customers where state not in ('Norway' , 'France')

--34.When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
select postalcode as pno from Customers

--35.When displaying the Customers table, refer to the table as Consumers instead of Customers.
select * from Customers as consumers

--36.List the number of customers in each country.
select count(state) as 'total' from Customers

--37.List the number of customers in each country, ordered by the country with the most customers first.
select count(customerid), state from Customers group by state order by COUNT(customerid) desc

-------------------------------------------------------------------------------------------------------
--View---
create view GetCustomerByOrderStatus
as
select c.customerid, c.customername , o.orderid , os.statusid ,os.statusname
from Customers c inner join Orders o on c.customerid= o.customerid
inner join Orderstatus os on os.statusid = o.statusid

select * from GetCustomerByOrderStatus
---------------------------------------------------------------------------------------
--Stored Procedure---
create proc SP_Customer(
@customerid int , 
@customername varchar(40),
@age int,
@city varchar(40),
@state varchar(40),
@dob date,
@postalcode int
)
as begin
insert into Customers values(@customerid,@customername, @age, @city, @state, @dob, @postalcode)
end
--call
exec SP_Customer
@customerid = 17,
@customername = 'Akshata',
@age = 22,
@city = 'nashik',
@state = 'Maharashtra',
@dob = '1999-01-01',
@postalcode = 422001
-------------------------------------------------------------------------------------------------------------------


create table Product 
(
id int primary key,
pname varchar(30) not null,
price int not null)

insert into Product values(01, 'Laptop', 60000)
insert into Product values(02, 'Mobile', 30000)
insert into Product values(03, 'Keyboard', 3500)
insert into Product values(04, 'Mouse', 4000)
insert into Product values(05, 'iPad', 90000)

--15.Use the MIN function to select the record with the smallest value of the Price column.
select min(price) from Product

--16.Use an SQL function to select the record with the highest value of the Price column.
select max(price) from Product

--17.Use the correct function to return the number of records that have the Price value set to 20
--18.Use an SQL function to calculate the average price of all products.
select AVG(price) from Product

--19.Use an SQL function to calculate the sum of all the Price column values in the Products table
select SUM(price) from Product

--31.Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20
select * from Product where price between 3000 and 5000

--32.Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.
select * from Product where not price between 3000 and 5000

--33.Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'.
select * from Product where pname between 'Laptop' and 'Mouse'
--------------------------------------------------------------------------------------------------------------
--function-----
-- create function which accept the price and discount 
--calculate and return the price of each product and discounted price SQL server function
create function GetProdDiscountByInt(@price int, @disc int)
returns int
as begin
declare @disPrice int;
set @disPrice = @price-(@price*@disc/100);
return @disPrice
end

select dbo.GetProdDiscountByInt(price,10) as 'discount price', price, pname from Product
-----------------------------------------------------------------------------------------------------------------------

---Trigger-----

create table Traceproduct
(
id int primary key identity(1,1),
description varchar(200)
)
select * from Traceproduct
--inserted
create trigger tr_Product_Insert
on Product after insert
as begin
declare @id int;
declare @pname varchar(20);
declare @price int;
select @id=id,@pname=pname,@price=price from inserted
insert into Traceproduct values('new recored add '+cast(@id as varchar)+' pname='+
@pname+' price='+cast(@price as varchar)+' date ='+cast (GETDATE()as varchar))
end

insert into Product values(6,'Charger', 1600)
-----------------------------------------------
--deleted
create trigger tr_Product_Delete
on Product after delete
as begin
declare @id int;
declare @pname varchar(20);
declare @price int;
select @id=id,@pname=pname,@price=price from deleted
insert into Traceproduct values('recored delete '+cast(@id as varchar)+' pname='+
@pname+' price='+cast(@price as varchar)+' date ='+cast (GETDATE()as varchar))
end

delete from Product where id = 6
------------------------------------------------------------------------------------------
select * from Product
select * from Customers
select * from Orderstatus
select * from Orders