create database if not exists quan_ly_diem_thi;
use quan_ly_diem_thi;

-- drop database quan_ly_diem_thi;
create table giao_vien(
ma_giao_vien int primary key auto_increment,
ten_giao_vien varchar(50),
so_dien_thoai varchar(50)
);

create table hoc_sinh(
ma_hoc_sinh int primary key,
ten_hoc_sinh varchar(50),
ngay_sinh date,
lop varchar(50),
giao_trinh varchar(50)
);

create table mon_hoc(
ma_mon_hoc int primary key,
ten_mon_hoc varchar(50)
);

create table bang_diem(
ma_hoc_sinh int,
ma_giao_vien int,
diem_thi float,
ngay_kiem_tra date,
primary key (ma_hoc_sinh, ma_giao_vien),
foreign key(ma_hoc_sinh) references hoc_sinh(ma_hoc_sinh),
foreign key(ma_giao_vien) references giao_vien(ma_giao_vien)
);

alter table mon_hoc add ma_giao_vien int;
alter table mon_hoc
add foreign key (ma_giao_vien) references giao_vien(ma_giao_vien);
