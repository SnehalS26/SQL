

create table Author
(
author_id int primary key,
author_name varchar(40) not null,
ph_no int not null,
email varchar(40) not null,
address varchar(40) not null,
city varchar(40) not null
)
alter table Author drop column address
alter table Author add state varchar(40)
alter table Author alter column email varchar(40)
alter table Author alter column city varchar(40)
alter table Author alter column state varchar(40)

sp_help Author 

insert into Author values(1, 'Chetan Bhagat' , 999999 , 'bhagat@gmail.com', 'Pune' , 'Maharashtra')
insert into Author values(2, 'V.S. Naipaul' , 888888 , 'naipaul@gmail.com', 'Mumbai' , 'Maharashtra')
insert into Author values(3, 'Satish Gujral' , 777777 , 'satish@gmail.com', 'Landon' , 'England')
insert into Author values(4, 'Gita Mehta' , 22222 , 'gita@gmail.com', 'Paris' , 'France')
insert into Author values(5, 'Vikram Seth' , 55555 , 'seth@gmail.com', 'Tokyo' , 'Japan')

select * from Author

create table Book1
(
book_id int primary key,
book_name varchar(40) not null,
author_id int,
constraint author_id_fk foreign key (author_id) references Author(author_id),
price int not null,
published_date date
)
sp_help Book1
insert into Book1 values(1, 'Half Girlfriend', 1 , 500, '2000-10-09')
insert into Book1 values(2, 'One Indian Girl', 1 , 600, '2000-11-08')
insert into Book1 values(3, 'A Million Mutinies Now', 2 , 550, '2001-11-09')
insert into Book1 values(4, 'A Brush with Life', 3 , 750, '2010-10-09')
insert into Book1 values(5, 'A River Sutra', 4 , 450, '2011-08-09')
insert into Book1 values(6, 'A Suitable Boy', 5 , 800, '2002-03-09')
insert into Book1 values(7, 'A House for Mr.Biswas', 2 , 980, '2008-05-09')

update Book1 set price = 750 where book_id = 3
select * from Book1

create table Awards
(
award_id int not null,
award_type_id int primary key,
author_id int,
constraint author_id_fk1 foreign key (author_id) references Author(author_id),
book_id int,
constraint book_id_fk foreign key (book_id) references Book1(book_id),
year int not null
)
insert into Awards values(01, 111, 1 , 1 , 2001)
insert into Awards values(02, 112, 2 , 3 , 2002)
insert into Awards values(03, 113, 2 , 3 , 2003)
insert into Awards values(04, 114, 3 , 4 , 2004)
insert into Awards values(05, 115, 4 , 5 , 2005)
insert into Awards values(06, 116, 5 , 6 , 2001)
insert into Awards values(07, 117, 2 , 7 , 2008)
insert into Awards values(08, 118, 1 , 2 , 2007)

select * from Awards

create table Award_Master
(
award_type_id int,
constraint award_type_id_fk foreign key (award_type_id) references Awards(award_type_id),
award_name varchar(40) not null,
award_price int not null
)
insert into Award_Master values(111, 'Padma Shri' , 20000)
insert into Award_Master values(112, 'Padma Bhushan' , 50000)
insert into Award_Master values(113, 'Bharat Ratna' , 25000)
insert into Award_Master values(114, 'Arjuna award' , 30000)
insert into Award_Master values(115, 'Ashoka Chakra' , 36000)
insert into Award_Master values(116, 'Oscar Awards' , 70000)
insert into Award_Master values(117, 'Padma Shri' , 20000)
insert into Award_Master values(118, 'Padma Vibhushan' , 55000)

select * from Author
select * from Book1
select * from Awards
select * from Award_Master

select b1.* , a1.author_name , a2.award_type_id , a2.year, m1.award_name, m1.award_price
from Book1 b1
inner join Author a1 on a1.author_id = b1.author_id
inner join Awards a2 on a2.book_id = b1.book_id
inner join Award_Master m1 on m1.award_type_id = a2.award_type_id



--1.Write a query to show book name , author name and award name for all books which has received any award. 
 select b.book_name, a.author_name, award_name from Book1 b 
 inner join Awards a1 on b.book_id = a1.book_id
 inner join Author a on a.author_id = b.author_id
 inner join Award_Master aw on aw.award_type_id = a1.award_type_id

--2.Write a query to update author name of authors whose book price is > 100. Prefix author name with ‘Honourable’ .
update Author set author_name= CONCAT('Honorable ' , author_name) where author_id in(select author_id from Book1 where price < 500)

--3.	Write a query to display authors and number of books written by that author. Show author who has written maximum books at the top.
select a.author_name , count(b.book_id) as 'count' from Author a 
inner join Book1 b on b.author_id = a.author_id
group by a.author_name
order by count desc

--4.	Write a query to select book name with 5 th highest price.
select book_name, price from Book1 
order by price desc
offset 4 rows
fetch next 1 rows only

--5.	Select list of books which have same price as book ‘Diary of Ann Frank’.
select book_name from Book1 where price =
( select price from Book1 where book_name = 'A Brush with Life')

--6.	Increase price of all books written by Mr. Chetan Bhagat by 5%.
update b set b.price = b.price + (b.price * 0.2) from Book1 b 
join Author a on b.author_id = a.author_id 
where a.author_name = 'Chetan Bhagat'
update Book1 set price = price + (price *0.2)
where author_id in (select author_id from Author where author_name = 'Chetan Bhagat')

--7.	find the all auther name who got an award
select author_name from Author where author_id in 
(select author_id from Awards )
--using join
select author_name from author a join Awards a1 on a.author_id = a1.author_id 

-- Show award names and number of books which got these awards
select award_name, count(*) from Award_Master m, Book1 b, Awards a where m.award_type_id = a.award_type_id
and a.book_id = b.book_id group by award_name

--8.	Delete all books written by ‘Chetan Bhagat’ 
delete b from Book1 b , Author a where b.author_id= a.author_id and author_name = 'Chetan Bhagat'

--join
delete b from Book1 b , Author a where a.author_id = b.author_id and a.author_name = 'Chetan Bhagat'

sp_help Awards
alter table Awards drop constraint book_id_fk 
alter table Awards add constraint bid_fk foreign key( book_id_fk) references Book1(book_id_fk) on delete cascade on update cascade

--9.	Create view to show name of book and year when it has received award. 
create view  GetByBookYear
as
select b.book_name , a.year from Book1 b
inner join Awards a on b.book_id = a.book_id

select * from GetByBookYear

--10.	Create trigger to ensure min price of any book must be Rs. 100. 
--11.	Increase price of book by 10% if that book has received any award.
update Book1 set price = price + (price*0.1) where book_id in (
select book_id from Awards where award_id is not null)

--12.	Show names of author and number of books written by that Author.
select author_id, count(book_id) as 'total' from Book1 where author_id = 
( select author_id from Author where author_name = 'Chetan Bhagat')
group by author_id 

--13.	Show names of authors whose books are published before year 2004.
select book_name from Book1 where author_id =
(select author_id from Awards where year = 2004)

--14.	Show name of books which has published within 1 year after 15 August 2020.
select book_name from Book1 where author_id =
( select author_id from Book1 where published_date >= '2002-03-09')

--15.	Delete all authors whose no book is published in year 2020.
delete from Author where author_id =(select author_id from Awards where year = 2008)

--16. find book name which is written by author chetan 
select book_name from Book1 where author_id =
( select author_id from Author where author_name = 'Chetan Bhagat' )
--using join
select book_name from Book1 b1 join Author a on a.author_id = b1.author_id where author_name = 'Chetan Bhagat'

--17.  find a number of award for each author
select a.author_name , count(*) from Book1 b join Author a on a.author_id = b.author_id group by a.author_name

--18.  find a award name for the book xyz
select award_name from Award_Master where award_type_id in 
( select award_type_id from Awards where book_id =
(select  book_id from Book1 where book_name = 'Half Girlfriend')
)

--19. find a year wise author count
select year, count(author_id) from Awards
group by year 

--20. find the author name who wrote only one book
select a.author_name , count(*) from Book1 b join Author a on a.author_id = b.author_id
group by a.author_name having count(*) =1

--21. find the book name which has max price
select max(price) as 'Max Price' from Book1


