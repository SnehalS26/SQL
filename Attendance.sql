create table Course
(
cid int primary key,
cname varchar(30) not null,
subject varchar(30) not null,
fee int not null,
duration int not null
)
sp_help Course

create table Student
(
sid int primary key ,
sname varchar(30) not null,
cid int,
constraint cid_fk foreign key (cid) references Course(cid),
ph_no int not null,
email varchar(40) not null,
paidfees int not null
)
sp_help Student