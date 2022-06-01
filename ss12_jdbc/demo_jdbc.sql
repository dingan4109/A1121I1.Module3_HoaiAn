-- drop database demo_jdbc;
create database if not exists demo_jdbc;
use demo_jdbc;

create table users(
id int(3) primary key auto_increment,
`name` varchar(120) not null,
email varchar(220) not null,
country varchar(120)
);
insert into users (`name`,email,country)
values("Minh","minh@codegym.vn","Vietnam"), ("Kante","kante@che.uk","Kenia");

select * from users;

delimiter //
create procedure get_user_by_id(in user_id int)
begin 
select users.name, users.email,users.country
from users
where users.id = user_id;
end //
delimiter ;

delimiter //
create procedure insert_user(in user_name varchar(50), in user_email varchar(50), in user_country varchar(50))
begin 
insert into users(name, email, country) 
values (user_name, user_email, user_country);
end //
delimiter ;

create table permission(
id int(11) primary key,
name varchar(50)
);
insert into permission(id,name) values(1,"add"),(2,"edit"),(3,"delete"),(4,"view");

create table user_permission(
user_id int(11),
permission_id int(11)
);

delimiter //
create procedure select_all_users()
begin
select * from users;
end //
delimiter ;

delimiter //
create procedure update_user(user_id int,user_name varchar(50),user_email varchar(50),user_country varchar(50))
begin 
update users 
set name = user_name, email = user_email, country = user_country 
where id = user_id;
end //
delimiter ;

delimiter //
create procedure delete_user(user_id int)
begin
delete from users
where id = user_id;
end //
delimiter ;

-- SET SQL_SAFE_UPDATES = 1;
