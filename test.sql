create database test;
use test;
-- drop database test;

create table beverage_type(
id int primary key auto_increment, 
`name` varchar(50)
);
insert into beverage_type(`name`) values('milk tea'),('coffee'),('juices'),('others');
select * from beverage_type;

create table beverage(
id int primary key auto_increment,
`name` varchar(50),
type_id int,
foreign key(type_id) references beverage_type(id)
);
insert into beverage(`name`,type_id) values ('traditional milk tea',1),('americano',2),('espresso',2),('orange',3),('water',4);
select * from beverage;

alter table beverage_type 
add in_charge_by varchar(50) after id;
update beverage_type set in_charge_by = 'an' where id = 1;

