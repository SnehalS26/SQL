create table FBUsers
(
user_id int primary key,
user_name varchar(20) not null,
email varchar(20) not null,
ph_no int not null,
total_post int not null
)
sp_help FBUsers

create table Post
(
post_id int ,
user_id int,
constraint user_id_fk foreign key(user_id) references FBUsers(user_id),
postContent varchar(30) not null,
postImage varchar(30) not null,
postVideo varchar(30) not null
)
sp_help Post

create table Friendship
(
status_code int primary key,
user_id int,
constraint user_id_fk1 foreign key(user_id) references FBUsers(user_id),
friend_id int not null

)
sp_help Friendship

create table Friendship_status
(
status_code int,
constraint status_code_fk foreign key (status_code) references Friendship(status_code),
status varchar(30) not null
)
sp_help Friendship_status