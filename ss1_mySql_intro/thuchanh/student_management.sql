create database if not exists student_management;
use student_management;
create table student(
id int,
`name` varchar(50),
age int,
country varchar(50)
);
select * from student;
