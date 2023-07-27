create table province_name
(
province_id int primary key,
province_name varchar(30)
)
insert into province_name values(1, 'Mr')
insert into province_name values(2, 'Mrs')
insert into province_name values(3, 'Ms')

select * from province_name

create table patient
(
patient_id int primary key,
province_id int,
constraint province_id_fk foreign key (province_id) references province_name(province_id),
first_name varchar(50),
last_name varchar(50),
gender char(1),
birth_date date,
city varchar(50),
allergies varchar(50),
height decimal(3,0),
weight decimal(4,0)
)
insert into patient values(101, 3 , 'snehal', 'shirsath' , 'F', '1998-11-12', 'Beed' , 'Weakness', 5.4 ,41)
insert into patient values(102, 1 , 'sagar', 'kawade' , 'M', '2000-01-01', 'Pune' , 'Fever', 100 ,50)
insert into patient values(103, 1 , 'pankaj', 'daundkar' , 'M', '1993-10-27', 'Sangli' , 'Food Poision',159 ,53)
insert into patient values(104, 3 , 'siddhi', 'kharmate' , 'F', '2003-07-10', 'Beed' , 'Cold', 160 ,55)
insert into patient values(105, 3 , 'Nikta', 'kharde' , 'F', '1998-04-12', 'Nagar' , null ,130 ,48)
insert into patient values(106, 3 , 'pooja', 'kendre' , 'F', '1998-05-31', 'Parali' , 'Weakness', 145 ,44)
insert into patient values(107, 2 , 'Kanchan', 'tupe' , 'F', '1998-05-12', 'Aurgabad' , null , 170 ,49)
insert into patient values(108, 3 , 'monika', 'khedkar' , 'F', '1997-03-21', 'Mumbai' , 'Penicillin', 200,47)
insert into patient values(109, 2 , 'kiran', 'sanap' , 'F', '1996-10-05', 'Beed' , 'Morphine', 220 ,57)
insert into patient values(110, 1 , 'amol', 'khedkar' , 'M', '1998-03-06', 'Nagar' , 'Morphine', 250 ,45)

create table doctor
(
doctor_id int primary key,
firstName varchar(50),
lastName varchar(50),
speciality varchar(50)
)
insert into doctor values(1, 'Swapnil', 'shirsat', 'Orthologist')
insert into doctor values(2, 'Vishal', 'sanap', 'Opthalmologist')
insert into doctor values(3, 'Dananajay', 'Karad', 'Neurologist')
insert into doctor values(4, 'Bharat', 'Nipane', 'Dermatologist')
insert into doctor values(5, 'Shubham', 'Avhad', 'psychiatrist')
insert into doctor values(6, 'Saurav', 'Nagargoje', 'Nephrologist')


create table admission
(
patient_id int,
constraint patient_id_fk foreign key (patient_id) references patient (patient_id),
adm_date date,
dis_date date,
diagnosis varchar(50),
attending_doctor_id int,
constraint att_doc_fk foreign key (attending_doctor_id) references doctor(doctor_id)
)
insert into admission values(101, '2023-07-15', '2023-07-22', 'Platelets' , 1 )
insert into admission values(102, '2023-06-01', '2023-06-10', 'Fever' , 1 )
insert into admission values(103, '2022-03-15', '2022-03-22', 'Cold' , 2 )
insert into admission values(104, '2023-01-10', '2023-01-20', 'Pain' , 3 )
insert into admission values(105, '2023-02-25', '2023-03-01', 'Headache' , 4 )
insert into admission values(106, '2023-08-05', '2023-08-15', 'Vomite' , 3 )
insert into admission values(107, '2022-04-15', '2022-04-22', 'Stomach pain' , 5 )

select * from patient
select * from doctor
select * from admission

--1.	Show the first name, last name and gender of patients who’s gender is ‘M’
select first_name , last_name from patient where gender = 'M'

--2.	Show the first name & last name of patients who does not have any allergies
select first_name , last_name from patient where allergies is null

--3.	Show the patients details that start with letter ‘S’
select * from patient where first_name like 's%'

--4.	Show the patients details that height range 100 to 160
select * from patient where height between 100 and 160

--5.	Update the patient table for the allergies column. Replace ‘NKA’ where allergies is null
update patient set allergies = 'NKA' where allergies is null

--6.	Show how many patients have birth year is 2020
select count(*) from patient where birth_date between '1998-05-31' and '2000-01-01'

--7.	Show the patients details who have greatest height
select max(height) as 'Max height' from patient

--8.	Show the total amount of male patients and the total amount of female patients in the patients table.
select gender, count(*) from patient group by gender

--9.	Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.
select first_name, last_name, allergies from patient where allergies = 'Penicillin' or allergies = 'Morphine'
order by first_name, last_name

--10.	Show first_name, last_name, and the total number of admissions attended for each doctor. Every admission has been attended by a doctor
select d.firstName , d.lastName , COUNT(patient_id) as 'total admission'
from admission a, doctor d
where d.doctor_id = a.attending_doctor_id
group by d.firstName , d.lastName

--11.	For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.
select p.first_name, p.last_name
from patient p
inner join admission a
on a.patient_id = p.patient_id
where diagnosis is not null