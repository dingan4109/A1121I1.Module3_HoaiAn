create database quan_ly_hang;
use quan_ly_hang;
-- drop database quan_ly_hang;
create table so_dien_thoai(
ma_dien_thoai int primary key,
so_ban varchar(20) not null,
so_hotline varchar(20)
);

create table nha_cung_cap(
ma_nha_cung_cap int primary key,
ten_nha_cung_cap varchar(50) not null,
dia_chi varchar(50),
ma_dien_thoai int,
foreign key(ma_dien_thoai) references so_dien_thoai(ma_dien_thoai)
);

create table don_dat_hang(
so_don_hang int primary key,
ngay_dat_hang datetime not null,
ma_nha_cung_cap int not null,
foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table phieu_nhap(
so_phieu_nhap int primary key,
ngay_nhap datetime not null
);

create table phieu_xuat(
so_phieu_xuat int primary key,
ngay_xuat datetime not null
);

create table vat_tu(
ma_vat_tu int primary key,
ten_vat_tu varchar(50) not null
);

create table chi_tiet_phieu_xuat(
so_phieu_xuat int,
ma_vat_tu int,
don_gia_xuat float,
so_luong_xuat int not null,
primary key(so_phieu_xuat, ma_vat_tu),
foreign key(so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table chi_tiet_phieu_nhap(
so_phieu_nhap int,
ma_vat_tu int,
don_gia_nhap float,
so_luong_nhap float not null,
primary key(so_phieu_nhap, ma_vat_tu),
foreign key (so_phieu_nhap) references phieu_nhap(so_phieu_nhap),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table chi_tiet_don_dat_hang(
so_don_hang int, 
ma_vat_tu int,
primary key(so_don_hang, ma_vat_tu),
foreign key (so_don_hang) references don_dat_hang(so_don_hang),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

