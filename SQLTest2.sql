--Course – course id , course name, duration (in months), trainer id , total fees 
--Student - rollno , sname , degree , birthdate , course id , batch id , fees paid , Remark, is placed
--Trainer – Trainer id , trainer name , join date , email , experience in years 

create table Trainer
(
trainer_id int primary key,
trainer_name varchar(40),
join_date date,
email varchar(50),
experience int
)
insert into Trainer values(1, 'Jack' , '2019-08-10' , 'jack@gmail.com' , 10)
insert into Trainer values(2, 'Leo' , '2020-07-10' , 'leo@gmail.com' , 7)
insert into Trainer values(3, 'George' , '2023-01-11' , 'geo@gmail.com' , 1)
insert into Trainer values(4, 'Daniel' , '2022-05-10' , 'neil@gmail.com' , 5)
insert into Trainer values(5, 'Joey' , '2021-04-15' , 'joey@gmail.com' , 6)

update Trainer set trainer_name = 'Jack' where trainer_id = 1
update Trainer set trainer_name = 'Leo' where trainer_id = 2
update Trainer set trainer_name = 'George' where trainer_id = 3
update Trainer set trainer_name = 'Daniel' where trainer_id = 4
update Trainer set trainer_name = 'Joey' where trainer_id = 5

select * from Trainer

create table course
(
course_id int primary key,
course_name varchar(40),
duration int,
trainer_id int,
constraint trainer_id_fk foreign key (trainer_id) references Trainer(trainer_id),
total_fee int
)
alter table course alter column duration varchar(30)
sp_help course
insert into course values(01, 'Java' , '6 month' , 1 , 40000)
insert into course values(02, 'C++' , '3 month' , 2 , 20000)
insert into course values(03, 'C' , '2 month' , 3 , 10000)
insert into course values(04, 'C#' , '4 month' , 4 , 35000)
insert into course values(05, 'MySql' , '1 month' , 5 , 5000)
insert into course values(06, 'Python' , '5 month' ,  3, 30000)

create table Stud
(
course_id int,
constraint course_id_fk foreign key (course_id) references course(course_id),
rollno int primary key,
sname varchar(40),
degree varchar(40),
birthdate date,
batch_id int,
fee_paid int,
balance_fee int,
remark varchar(40)
)
sp_help Stud
alter table Stud add isplaced varchar(20)

insert into Stud values(1,1, 'Anika' , 'BE' , '1998-07-07' , 111, 30000 , 10000 , 'Not Placed') 
insert into Stud values(1,2, 'Daksh' , 'BCom' , '1997-07-07' , 112, 20000 , 20000 , 'Not Placed') 
insert into Stud values(1,3, 'Aarna' , 'MBA' , '2000-01-07' , 113, 40000 , null , 'Placed') 
insert into Stud values(1,4, 'Aahana' , 'BE' , '2001-07-07' , 114, 25000 , 15000 , 'Not Placed') 
insert into Stud values(1,5, 'Ira' , 'MA' , '2001-07-07' , 115, 30000 , 10000 , 'Not Placed') 
insert into Stud values(2,6, 'Aditya' , 'BA' , '1999-07-07' , 116, 30000 , 10000 , 'Not Placed') 
insert into Stud values(2,7, 'Aarush' , 'BEd' , '1995-07-07' , 117, 10000 , 10000 , 'Not Placed') 
insert into Stud values(2,8, 'Parth' , 'MD' , '2003-07-07' , 118, 5000 , 15000 , 'Not Placed') 
insert into Stud values(2,9, 'Kiaan' , 'BCA' , '1998-07-07' , 119, 20000 , null , 'Placed') 
insert into Stud values(2,10, 'Viaan' , 'BCA' , '1998-07-07' , 120, 20000 , null , 'Not Placed') 
insert into Stud values(3,11, 'Ivan' , 'BE' , '1998-07-07' , 121, 10000 , null, 'Placed') 
insert into Stud values(3,12, 'Ishaan' , 'BE' , '1997-07-07' , 122, null , 10000 , 'Not Placed') 
insert into Stud values(3,13, 'Simar' , 'BE' , '1998-07-07' , 123, 5000 , 5000 , 'Not Placed') 
insert into Stud values(4,14, 'Yash' , 'MBA' , '1997-07-07' , 124, 30000 , 5000 , 'Placed') 
insert into Stud values(4,15, 'Nehal' , 'MBA' , '1998-07-07' , 125, null , 35000 , 'Not Placed') 
insert into Stud values(4,16, 'Laksh' , 'BA' , '2000-07-07' , 126, 20000 , 15000 , 'Not Placed') 
insert into Stud values(4,17, 'Neel' , 'BE' , '1996-07-07' , 127, 15000 , 20000 , 'Not Placed') 
insert into Stud values(5,18, 'Kabir' , 'BE' , '1998-07-07' , 128, 5000 , null , 'Placed') 
insert into Stud values(5,19, 'Kedar' , 'MBA' , '1996-07-07' , 129, 5000 , null , 'Not Placed') 
insert into Stud values(5,20, 'Shyam' , 'BE' , '1998-07-07' , 130, 2500 , 2500 , 'Not Placed') 

update Stud set batch_id = 111 where rollno in (2,3,4,5)
update Stud set batch_id = 112 where rollno in (6,7,8,9,10)
update Stud set batch_id = 113 where rollno in (11,12,13)
update Stud set batch_id = 114 where rollno in (14,15,16,17)
update Stud set batch_id = 115 where rollno in (18,19,20)

update Stud set remark = null where rollno between 1 and 20
update Stud set isplaced = 'yes' where rollno in (3,9,11,14,18)

select * from Trainer
select * from course
select * from Stud

--1. Show list of students. List contains roll no , student name , course name , trainer name in order of course name and student name.
select s.rollno , s.sname , c.course_name , t.trainer_name
from course c join Stud s on c.course_id = s.course_id
join Trainer t on t.trainer_id = c.trainer_id
order by course_name ,sname

--2. Show list of students who have pending fees more than 1000rs . List should have student name , course name , balance fees . Show this list in descending order of balance fees.
select s.sname , c.course_name , s.balance_fee as 'Balance fees'from Stud s join course c on c.course_id = s.course_idwhere s.balance_fee >= 15000order by s.balance_fee--3. Append letter ‘_spl’ to all batch ids of trainer ‘Leo’.update Trainer set trainer_name = CONCAT(trainer_name, '_spl') where trainer_name = 'Leo'--4. Update table student. Update ‘remark’ field. Remark should be ‘Eligible for exam’ if fees paid by student is more than 60%.


--5. Create a index to make retrieval faster based on course name.
create index Course_Name on course(course_name)

--6. List name of course for which more than 20 students are enrolled.
select course_name, count(*)
from course group by course_name having count(*) < 10

--7. List name of course for which maximum revenue was generated. ( max fee collection)select course_name, max(total_fee) as 'Total' from course group by course_name--8. Select name of student who are in same batch as ‘Atul’.
select sname from Stud where batch_id = (select batch_id from Stud where sname = 'Kiaan')

--9. Delete all students who are in course which is less than 2 months duration.

--10. Delete all students for whom is placed is ‘yes’ and who have paid all the fees of their course
delete from Stud where fee_paid is not null and isplaced = 'yes'

--11. Create a trigger to add student data in ex-student table if student is deleted from student table.select * from Studselect * from Add_Studcreate table Add_Stud(rollno int primary key identity(1,1),description varchar(60))--trigger---create trigger tr_Stud_Inserton Stud after insertas begindeclare @course_id int;declare @rollno int;declare @sname varchar(40);declare @degree varchar(30);declare @birthdate date;declare @batch_id int;declare @fee_paid int;declare @balance_fee int;declare @remark varchar(40);declare @isplaced varchar(40);select @course_id=course_id, @rollno=rollno,@sname=sname,@degree=degree,@birthdate=birthdate,@batch_id=batch_id,@fee_paid=fee_paid,@balance_fee=balance_fee,@remark=remark,@isplaced=isplaced from insertedinsert into Add_Stud values('new record inserted'+'courseid=' +CAST(@course_id as varchar) +'rollno='+CAST(@rollno as varchar)+'sname='+@sname +'degree='+ @degree +'birthdate=' + cast(@birthdate as varchar) +'batch id=' +cast(@batch_id as varchar)+'fee paid='+cast(@fee_paid as varchar)+'balance fee='+cast(@balance_fee as varchar)+'remark='+@remark+'isplaced='+@isplaced)endinsert into Stud values(5, 21,'Ram', 'BA', '2001-03-19', 115, 5000, null,null , 'yes')insert into Stud values(6, 22,'Raj', 'BA', '2001-03-19', 116, 30000, null,null , 'yes')--delete--create trigger tr_Stud_Deleteon Stud after deleteas begindeclare @course_id int;declare @rollno int;declare @sname varchar(40);declare @degree varchar(30);declare @birthdate date;declare @batch_id int;declare @fee_paid int;declare @balance_fee int;declare @remark varchar(40);declare @isplaced varchar(40);select @course_id=course_id, @rollno=rollno,@sname=sname,@degree=degree,@birthdate=birthdate,@batch_id=batch_id,@fee_paid=fee_paid,@balance_fee=balance_fee,@remark=remark,@isplaced=isplaced from deletedinsert into Add_Stud values('Record deleted'+'courseid=' +CAST(@course_id as varchar) +'rollno='+CAST(@rollno as varchar)+'sname='+@sname +'degree='+ @degree +'birthdate=' + cast(@birthdate as varchar) +'batch id=' +cast(@batch_id as varchar)+'fee paid='+cast(@fee_paid as varchar)+'balance fee='+cast(@balance_fee as varchar)+'remark='+@remark+'isplaced='+@isplaced)enddelete from Stud where rollno = 22--12. Create a view which shows name of trainer and number of students he is training.create view GetStudTrainerasselect s.sname , t.trainer_name , count(t.trainer_id) as 'Total'   from Stud sinner join course c on c.course_id = s.course_idinner join Trainer t on t.trainer_id = c.trainer_idgroup by s.sname , t.trainer_name--modifyalter view GetStudTrainerasselect t.trainer_name , count(t.trainer_name) as 'Total'   from Stud sinner join course c on c.course_id = s.course_idinner join Trainer t on t.trainer_id = c.trainer_idgroup by  t.trainer_nameselect * from GetStudTrainer--13. Show names of students who are more than 20 years old.
select sname,  year(getdate()) - year(birthdate) as 'age'  from Stud 

--14. Show names of students who have paid all the fees.
select sname from Stud where fee_paid is not null

--15. Write a procedure which accepts student id and returns his balance fees.
create proc SP_Student
as begin
select s.sname, c.course_name,(c.total_fee - s.fee_paid) as 'Balance fee'
from Stud s inner join course c on c.course_id = s.course_id
end
--call
exec SP_Student
