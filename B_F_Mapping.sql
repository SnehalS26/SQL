create table Countries
(
country_id int primary key,
country_name varchar(30) not null
)
sp_help Countries

create table Format
(
format_id int primary key,
format_name varchar(30) not null
)
sp_help Format

create table Batsman
(
player_id int primary key,
player_name varchar(30) not null,
age int ,
country_id int,
constraint country_id_fk foreign key (country_id) references Countries(country_id),
total_runs int not null,
total_50s int not null,
total_100s int not null,
player_grade varchar(20)
)
sp_help Batsman

create table BFMapping
(
id int,
player_id int,
constraint payer_id_fk foreign key(player_id) references Batsman(player_id),
format_id int,
constraint format_id_fk foreign key(format_id) references Format(format_id)
)
sp_help BFMapping