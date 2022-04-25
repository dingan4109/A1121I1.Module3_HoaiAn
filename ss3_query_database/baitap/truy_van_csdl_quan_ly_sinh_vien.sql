create database if not exists bt1_query_student_management;
use bt1_query_student_management;
-- drop database bt1_query_student_management;

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

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student 
where student_name like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12
select * from class 
where month(start_date) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5
select * from `subject` 
where credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2
-- set sql_safe_updates = 0;
update student 
set class_id = 2 
where student_name = 'Hung' and student_id = 1; /*recommend to add in the WHERE clause a KEY-value that matches everything (like a primary-key comparing to 0)
iso deactive sql_safe_updates mode => in this case, student_id is primary key so no more 1175 error*/
/*in case u need to deactive safe update mode, remember to set sql_safe_updates = 1 after done updating*/

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần
select student_name, sub_name, mark
from student
inner join mark on student.student_id = mark.student_id
inner join `subject` on mark.sub_id = `subject`.sub_id
order by mark desc, student_name;