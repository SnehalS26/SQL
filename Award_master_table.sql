
create table Author_table
(
author_id int primary key,
author_name varchar(30) not null,
ph_no int not null,
email varchar not null,
address varchar not null,
city varchar not null
)
sp_help Author_table

create table Book_table
(
book_id int primary key,
book_name varchar(20) not null,
author_id int,
constraint author_id_fk foreign key(author_id) references Author_table(author_id),
price int not null
)
sp_help Book_table

create table Award_table
(
award_id int not null,
award_type_id int primary key,
author_id int,
constraint author_id_fk1 foreign key(author_id) references Author_table(author_id),
book_id int,
constraint book_id_fk foreign key(book_id) references Book_table(book_id),
year int not null
)
sp_help Award_table

create table Award_master_table
(
award_type_id int,
constraint award_type_id foreign key(award_type_id) references Award_table(award_type_id),
award_name varchar(20) not null,
award_price int not null
)
sp_help Award_master_table



