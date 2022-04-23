create database sales_management;
use sales_management;
-- drop database sales_management;

create table customer(
customer_id int primary key auto_increment,
customer_name varchar(50) not null,
customer_age int
);

create table `order`(
order_id int primary key auto_increment,
customer_id int not null,
order_date datetime,
order_total_price float,
foreign key(customer_id) references customer(customer_id)
); 

create table product(
product_id int primary key auto_increment, 
product_name varchar(50) not null,
product_price float
);

create table order_detail(
order_id int,
product_id int,
primary key(order_id, product_id),
foreign key (order_id) references `order`(order_id),
foreign key (product_id) references product(product_id)
);