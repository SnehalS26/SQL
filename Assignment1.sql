create table Author
(
authorid int primary key,
name varchar(20) not null,
city varchar(20) not null,
country varchar(20) not null
)

sp_help Author

create table Category
(
category_id int primary key,
description varchar(30)
)

sp_help Category

create table Book
(
bookid int primary key,
title varchar(30) not null,
authorid int foreign key(authorid) references Author(authorid),
category_id int foreign key(category_id) references Category(category_id),
year int not null,
price int not null ,
publisher varchar(40) not null
)
alter table Book add rating int

sp_help Book

create table Order_Details
(
orderno int not null,
bookid int foreign key(bookid) references Book(bookid),
qty int not null
)
sp_help Order_Details