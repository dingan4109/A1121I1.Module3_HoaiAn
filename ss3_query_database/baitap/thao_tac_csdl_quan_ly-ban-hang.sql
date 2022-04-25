create database ss3_sales_management;
use ss3_sales_management;
-- drop database ss3_sales_management;

create table customer(
customer_id int primary key auto_increment,
customer_name varchar(50) not null,
customer_age int
);
insert into customer(customer_name,customer_age)
values('Minh Quan',10),('Ngoc Oanh',20),('Hong Ha',50);

create table `order`(
order_id int primary key auto_increment,
customer_id int not null,
order_date datetime,
order_total_price float,
foreign key(customer_id) references customer(customer_id)
); 
insert into `order`(customer_id,order_date,order_total_price)
values(1,'2006/03/21',null),(2,'2006/03/23',null),(1,'2006/03/16',null);

create table product(
product_id int primary key auto_increment, 
product_name varchar(50) not null,
product_price float
);
insert into product(product_name,product_price)
values ('May Giat',3),('Tu Lanh',5),('Dieu Hoa',7),('Quat',1),('Bep Dien',2);

create table order_detail(
order_id int,
product_id int,
primary key(order_id, product_id),
foreign key (order_id) references `order`(order_id),
foreign key (product_id) references product(product_id)
);
-- alter table order_detail add order_qty int
insert into order_detail
values(1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select order_id,order_date,order_total_price from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer_name, product_name from customer
inner join `order` on customer.customer_id = `order`.customer_id
inner join order_detail on `order`.order_id = order_detail.order_id
inner join product on order_detail.product_id = product.product_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customer_name from customer 
left join `order` on customer.customer_id = `order`.customer_id
where `order`.customer_id is null; 

/* Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
(giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)*/
-- table cần sử dụng order, order_detail,product
select `order`.order_id,order_date,sum(order_qty*product_price) as total_price
from `order`
inner join order_detail on `order`.order_id = order_detail.order_id
inner join product on order_detail.product_id = product.product_id
group by order_id
;
