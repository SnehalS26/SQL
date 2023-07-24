create table Movies
(
movie_id int primary key,
movie_name varchar(20) not null,
release_year int not null,
box_office_collection int not null
)
sp_help Movies

create table Roles
(
roll_id int primary key,
roll_name varchar(20) not null
)
sp_help Roles

create table Celebrity
(
celebrity_id int primary key,
celebrity_name varchar(20) not null,
birthdate varchar(20) not null,
ph_no int not null,
email varchar(20) not null
)
sp_help Celebrity

create table BollywoodData
(
bollywood_data_id int not null,
celebrity_id int,
constraint celebrity_id_fk foreign key(celebrity_id) references Celebrity(celebrity_id),
movie_id int,
constraint movie_id_fk foreign key(movie_id) references Movies(movie_id),
roll_id int,
constraint roll_id_fk foreign key(roll_id) references Roles(roll_id)
)
sp_help BollywoodData