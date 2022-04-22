create database if not exists student_management_db;
use student_management_db;
create table student(
id int auto_increment,
`name` varchar(45),
age int,
country varchar(45),
primary key(id)
);
insert into student (`name`,age,country)
values ('Nguyen Van B',1,'VN');

-- delete record
delete from student where id is null;

-- display table
select * from student;

create table teacher(
id int,
`name` varchar(45),
age int,
country varchar(45)
);
insert into teacher values (1,'teacher 1',30,"VN");
-- display table
select * from teacher;


-- drop database
drop database student_management_db;