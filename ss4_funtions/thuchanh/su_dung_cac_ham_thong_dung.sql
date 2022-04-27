create database if not exists ss4_student_management;
use ss4_student_management;
-- drop database ss4_student_management;

create table class(
class_id int primary key,
class_name varchar(60) not null,
start_date date not null,
`status` bit
);
insert into class
values(1,'A1','2008/12/20',1),(2,'A2','2008/12/22',1),(3,'A3',current_date(),0);

create table student(
student_id int primary key, 
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
`status` bit,
class_id int,
foreign key(class_id) references class(class_id)
);
insert into student 
values (1,'Hung','Ha noi','0912113113',1,1),(2,'Hoa','Hai Phong',null,1,1),(3,'Manh','HCM','0123123123',0,2);

create table `subject`(
sub_id int primary key,
sub_name varchar(30),
credit tinyint not null default 1 check(credit >= 1),
`status` bit default 1
);
insert into `subject`
values (1, 'CF', 5, 1),(2, 'C', 6, 1),(3, 'HDJ', 5, 1),(4, 'RDBMS', 10, 1);

create table mark(
mark_id int primary key auto_increment,
sub_id int not null,
student_id int not null,
mark float default 0 check(mark >=0 and mark <= 100),
exam_times tinyint default 1,
unique(sub_id, student_id),
foreign key(sub_id) references subject(sub_id),
foreign key(student_id) references student(student_id)
);
insert into mark(sub_id, student_id, mark, exam_times)
values (1, 1, 8, 1), (1, 2, 10, 2),(2, 1, 12, 1);

-- Hiển thị số lượng sinh viên ở từng nơi
select count(student_name) as no_of_student, address from student
group by address;

-- Tính điểm trung bình các môn học của mỗi học viên
select student_name, avg(mark) from student
inner join mark on student.student_id = mark.student_id
group by student_name;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
select student_name, avg(mark) as average_grade from student
inner join mark on student.student_id = mark.student_id
group by student_name
having average_grade > 15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất
select student_name, avg(mark) as avg_grade from student
inner join mark on student.student_id = mark.student_id
group by student_name
having avg_grade >= all (select avg(mark) from mark group by mark.student_id);