-- drop database furama_db_management;
-- set sql_safe_updates = 0;
create database if not exists furama_db_management;
use furama_db_management;

-- TABLE VI_TRI
create table vi_tri(
ma_vi_tri int primary key, 
ten_vi_tri varchar(45)
);
insert into vi_tri values (1, 'Quản Lý'), (2,'Nhân Viên');
select * from vi_tri;

-- TABLE TRINH_DO
create table trinh_do(
ma_trinh_do int primary key,
ten_trinh_do varchar(45)
);

insert into trinh_do values (1,'Trung Cấp'), (2, 'Cao Đẳng'), (3, 'Đại Học'), (4, 'Sau Đại Học');
select * from trinh_do;

-- TABLE BO_PHAN
create table bo_phan(
ma_bo_phan int primary key,
ten_bo_phan varchar(45)
);
insert into bo_phan values (1, 'Sale-Marketing'), (2, 'Hành Chính'), (3, 'Phục Vụ'), (4, 'Quản Lý');
select * from bo_phan;

-- TABLE NHAN_VIEN
create table nhan_vien(
ma_nhan_vien int primary key,
ho_ten varchar(45),
ngay_sinh date,
so_cmnd varchar(45),
luong double,
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
ma_trinh_do int, 
ma_bo_phan int,
foreign key(ma_vi_tri) references vi_tri(ma_vi_tri),
foreign key(ma_trinh_do) references trinh_do(ma_trinh_do),
foreign key(ma_bo_phan) references bo_phan(ma_bo_phan)
);
insert into nhan_vien 
values (1, 'Nguyễn Văn An','1970-11-07','456231786',10000000,'0901234121','annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng',1,3,1), 
(2,'Lê Văn Bình','1997-04-09','654231234',7000000,'0934212314','binhlv@gmail.com','22Yên Bái,Đà Nẵng',1,2,2),
(3,'Hồ Thị Yến','1995-12-12','999231723',14000000,'0412352315','thiyen@gmail.com','K234/11 Điện Biên Phủ, Gia Lai',1,3,2),
(4,'Võ Công Toản','1980-04-04',	'123231365',17000000,'0374443232','toan0404@gmail.com','77 Hoàng Diệu, Quảng Trị',1,4,4),
(5,'Nguyễn Bỉnh Phát','1999-12-09','454363232',6000000,'0902341231','phatphat@gmail.com','43 Yên Bái, Đà Nẵng',2,1,1),
(6,'Khúc Nguyễn An Nghi','2000-11-08','964542311',7000000,'0978653213','annghi20@gmail.com','294 Nguyễn Tất Thành, Đà Nẵng',2,2,3),
(7,'Nguyễn Hữu Hà','1993-01-01','534323231',8000000,'0941234553','nhh0101@gmail.com','4 Nguyễn Chí Thanh, Huế',2,3,2),
(8,'Nguyễn Hà Đông','1989-09-03','234414123',9000000,'0642123111','donghanguyen@gmail.com','111 Hùng Vương, Hà Nội',2,4,4),
(9,'Tòng Hoang','1982-09-03','256781231',6000000,'0245144444','hoangtong@gmail.com','213 Hàm Nghi, Đà Nẵng',2,4,4),
(10,'Nguyễn Công Đạo','1994-01-08','755434343',8000000,'0988767111','nguyencongdao12@gmail.com','6 Hoà Khánh, Đồng Nai',2,3,2)
;
-- delete from nhan_vien where ma_nhan_vien > 0;
select * from nhan_vien;

-- TABLE LOAI_KHACH
create table loai_khach(
ma_loai_khach int primary key,
ten_loai_khach varchar(45)
);
insert into loai_khach values (1,'Diamond'),(2,'Platinum'),(3,'Gold'),(4,'Silver'),(5,'Member');
select * from loai_khach;

-- TABLE KHACH_HANG
create table khach_hang(
ma_khach_hang int primary key,
ma_loai_khach int,
ho_ten varchar(45),
ngay_sinh date,
gioi_tinh bit(1),
so_cmnd varchar(45),
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
foreign key(ma_loai_khach) references loai_khach(ma_loai_khach)
);
insert into khach_hang 
values(1,5,'Nguyễn Thị Hào','1970-11-07',0,'643431213','0945423362','thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng'),
(2,3,'Phạm Xuân Diệu','1992-08-08',1,'865342123','0954333333','xuandieu92@gmail.com','K77/22 Thái Phiên, Quảng Trị'),
(3,1,'Trương Đình Nghệ','1990-02-27',1,'488645199','0373213122','nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh'),
(4,1,'Dương Văn Quan','1981-07-08',1,'543432111','0490039241','duongquan@gmail.com','K453/12 Lê Lợi, Đà Nẵng'),
(5,4,'Hoàng Trần Nhi Nhi','1995-12-09',0,'795453345','0312345678','nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai'),
(6,4,'Tôn Nữ Mộc Châu','2005-12-06',0,'732434215','0988888844','tonnuchau@gmail.com','37 Yên Thế, Đà Nẵng'),
(7,1,'Nguyễn Mỹ Kim','1984-04-08',0,'856453123','0912345698','kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh'),
(8,3,'Nguyễn Thị Hào','1999-04-08',0,'965656433','0763212345','haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum'),
(9,1,'Trần Đại Danh','1994-07-01',1,'432341235','0643343433','danhhai99@gmail.com','24 Lý Thường Kiệt, Quảng Ngãi'),
(10,2,'Nguyễn Tâm Đắc','1989-07-01',1,'344343432','0987654321','dactam@gmail.com','22 Ngô Quyền, Đà Nẵng');
update khach_hang
set ma_loai_khach = 3 where ma_khach_hang = 2;
select * from khach_hang;

-- TABLE LOAI_DICH_VU
create table loai_dich_vu(
ma_loai_dich_vu int primary key, 
ten_loai_dich_vu varchar(45)
);
insert into loai_dich_vu values (1,'Villa'), (2,'House'), (3,'Room');
select * from loai_dich_vu;

-- TABLE KIEU_THUE
create table kieu_thue(
ma_kieu_thue int primary key, 
ten_kieu_thue varchar(45)
);
insert into kieu_thue values (1,'year'), (2, 'month'), (3,'day') , (4, 'hour');
select * from kieu_thue;

-- TABLE DICH_VU_DI_KEM
create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key, 
ten_dich_vu_di_kem varchar(45),
gia double, 
don_vi varchar(10),
trang_thai varchar(45)
);
insert into dich_vu_di_kem 
values (1,'Karaoke',10000,'giờ','tiện nghi, hiện tại'),
(2,'Thuê xe máy',10000,'chiếc','hỏng 1 xe'),
(3,'Thuê xe đạp',20000,'chiếc','tốt'),
(4,'Buffet buổi sáng',15000,'suất','đầy đủ đồ ăn, tráng miệng'),
(5,'Buffet buổi trưa',90000,'suất','đầy đủ đồ ăn, tráng miệng'),
(6,'Buffet buổi tối',16000,'suất','đầy đủ đồ ăn, tráng miệng');
select * from dich_vu_di_kem;

-- TABLE DICH_VU
create table dich_vu(
ma_dich_vu int primary key,
ten_dich_vu varchar(45),
dien_tich int,
chi_phi_thue double, 
so_nguoi_toi_da int, 
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45), 
dien_tich_ho_boi double,
so_tang int,
ma_kieu_thue int,
ma_loai_dich_vu int,
foreign key(ma_kieu_thue) references kieu_thue(ma_kieu_thue),
foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu) 
);
insert into dich_vu 
values (1,'Villa Beach Front',25000,10000000,10,'vip','Có hồ bơi',500,4,3,1),
(2,'House Princess 01',14000,5000000,7,'vip','Có thêm bếp nướng',null,3,2,2),
(3,'Room Twin 01',5000,1000000,2,'normal','Có tivi',null,null,4,3),
(4,'Villa No Beach Front',22000,9000000,8,'normal','Có hồ bơi',300,3,3,1),
(5,'House Princess 02',10000,4000000,5,'normal','Có thêm bếp nướng',null,2,3,2),
(6,'Room Twin 02',3000,900000,2,'normal','Có tivi',null,null,4,3);
select * from dich_vu;

-- TABLE HOP_DONG
create table hop_dong(
ma_hop_dong int primary key,
ngay_lam_hop_dong datetime, 
ngay_ket_thuc datetime,
tien_dat_coc double,
ma_nhan_vien int,
ma_khach_hang int, 
ma_dich_vu int,
foreign key(ma_nhan_vien) references nhan_vien(ma_nhan_vien),
foreign key(ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key(ma_dich_vu) references dich_vu(ma_dich_vu)
);
-- insert by import excel/csv
select * from hop_dong;

-- TABLE HOP_DONG_CHI_TIET
create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key,
ma_hop_dong int, 
ma_dich_vu_di_kem int,
so_luong int,
foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem) 
);
insert into hop_dong_chi_tiet
values (1,2,4,5),(2,2,5,8),(3,2,6,15),(4,3,1,1),(5,3,2,11),(6,1,3,1),(7,1,2,2),(8,12,2,2);
select * from hop_dong_chi_tiet;

-- BAI TAP---------
-- câu 2:
/*2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự*/
select * from nhan_vien where ho_ten like 'h%' or ho_ten like 't%' or ho_ten like 'k%' and length(ho_ten) < 16;

-- câu 3:
/*Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”*/
select * from khach_hang where (dia_chi like '%đà nẵng' or dia_chi like '%quảng trị%') and ((year(current_date()) - year(ngay_sinh)) > 18 and (year(current_date()) - year(ngay_sinh)) < 50);
-- select * from khach_hang where (dia_chi like '%đà nẵng' or dia_chi like '%quảng trị%') and (datediff(current_date(),ngay_sinh)/365 > 18 or datediff(current_date(),ngay_sinh)/365 < 50);

-- câu 4
/*Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
 Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”*/
select hop_dong.ma_khach_hang, ho_ten, count(hop_dong.ma_khach_hang) as so_lan_dat_phong
from khach_hang
inner join hop_dong
on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where khach_hang.ma_loai_khach = 1
group by hop_dong.ma_khach_hang
order by so_lan_dat_phong;

-- câu 5
/*Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: 
Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
(những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra)*/
-- table cần sử dụng: khach_hang/loai_khach/hop_dong/hop_dong_chi_tiet/dich_vu/dich_vu_di_kem
select khach_hang.ma_khach_hang, ho_ten,ten_loai_khach,hop_dong.ma_hop_dong,ten_dich_vu,ngay_lam_hop_dong,ngay_ket_thuc,
dich_vu.chi_phi_thue + ifnull(dich_vu_di_kem.gia * hop_dong_chi_tiet.so_luong,0) as tong_tien
from khach_hang
left join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
where khach_hang.ma_khach_hang is not null
group by hop_dong.ma_hop_dong
order by khach_hang.ma_khach_hang, hop_dong.ma_hop_dong desc;

-- câu 6:
/*Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ 
chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3)*/
-- table cần sử dụng: dich_vu/loai_dich_vu/hop_dong
select dich_vu.ma_dich_vu,ten_dich_vu,dien_tich,chi_phi_thue,ten_loai_dich_vu, hop_dong.ngay_lam_hop_dong
from dich_vu
left join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
left join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where hop_dong.ma_dich_vu not in (select hop_dong.ma_dich_vu from hop_dong where quarter(ngay_lam_hop_dong) = 1)
group by hop_dong.ma_dich_vu;

-- câu 7
/*Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ 
đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021*/
-- table cần sử dụng: dich_vu,loai_dich_vu,hop_dong
select dich_vu.ma_dich_vu,ten_dich_vu,dien_tich,so_nguoi_toi_da,chi_phi_thue,ten_loai_dich_vu
from dich_vu 
left join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
left join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where hop_dong.ma_dich_vu not in (select hop_dong.ma_dich_vu from hop_dong where year(ngay_lam_hop_dong) = 2021)
group by dich_vu.ma_dich_vu;

-- câu 8
/*Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên*/
-- cách 1
select distinct ho_ten from khach_hang;
-- cách 2
select ho_ten from khach_hang
group by ho_ten;
-- cách 3
select ho_ten from khach_hang group by ho_ten having count(ho_ten) < 2 or exists
(select ho_ten from khach_hang group by ho_ten having count(ho_ten) > 1);

-- câu 9
/*Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng*/
-- table cần sử dụng: khach_hang/ hop_dong
select month(ngay_lam_hop_dong),count(khach_hang.ma_khach_hang) as so_khach_dat_phong from khach_hang 
inner join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where year(ngay_lam_hop_dong) = 2021
group by month(ngay_lam_hop_dong)
order by month(ngay_lam_hop_dong);

-- câu 10
/*Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, 
ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem)*/
-- table cần sử dụng: hop_dong/hop_dong_chi_tiet
select hop_dong.ma_hop_dong,ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc,sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem
from hop_dong
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
group by hop_dong.ma_hop_dong;

-- câu 11
/*Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach 
là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”*/
-- table cần sử dụng: dich_vu/dich_vu_di_kem/khach_hang/loai_khach
select dich_vu_di_kem.ten_dich_vu_di_kem,dia_chi,ma_loai_khach from dich_vu_di_kem
join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
where dia_chi like '%Vinh%' or dia_chi like '%Quảng Ngãi%' and ma_loai_khach = 1;

-- câu 12
/*Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
(được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020
 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021*/
 -- table:nhan_vien/khach_hang/hop_dong/dich_vu/dich_vu_di_kem
 select hop_dong.ma_hop_dong,nhan_vien.ho_ten as 'nhân viên',khach_hang.ho_ten as 'khách hàng',khach_hang.so_dien_thoai,dich_vu.ten_dich_vu,tien_dat_coc,ngay_lam_hop_dong, sum(so_luong) as 'số lượng dịch vụ đi kèm' 
 from dich_vu
 join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
 join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
 join nhan_vien on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
 left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
 left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
 where (ngay_lam_hop_dong between '2020-10-01' and '2020-12-31') and ngay_lam_hop_dong not in (select ngay_lam_hop_dong
 where ngay_lam_hop_dong between '2021-01-01' and '2021-06-30')
 group by ma_hop_dong;

-- câu 13: 
/*Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau)*/
select dich_vu_di_kem.ten_dich_vu_di_kem,sum(so_luong) as so_lan_dat
from dich_vu_di_kem
join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
group by dich_vu_di_kem.ma_dich_vu_di_kem
having so_lan_dat >= all (select sum(so_luong) from hop_dong_chi_tiet group by ma_dich_vu_di_kem);

-- câu 14: 
/*Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu,
ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem)*/
-- table: hop_dong/dich_vu/loai_dich_vu/hop_dong_chi_tiet/dich_vu_di_kem
select hop_dong.ma_hop_dong,ten_loai_dich_vu,ten_dich_vu_di_kem, count(dich_vu_di_kem.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong
join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
group by dich_vu_di_kem.ma_dich_vu_di_kem
having so_lan_su_dung = 1;

-- câu 15: 
/*Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai,
 dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021*/
select nhan_vien.ma_nhan_vien,nhan_vien.ho_ten,ten_trinh_do,ten_bo_phan,so_dien_thoai,dia_chi
from nhan_vien
join trinh_do on nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do
join bo_phan on nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan
join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
where year(ngay_lam_hop_dong) between 2020 and 2021
group by ma_nhan_vien
having count(hop_dong.ma_hop_dong) <= 3;

-- câu 16:
/*Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021*/
delete from nhan_vien
where ho_ten not in (
select * from(
select nhan_vien.ho_ten from nhan_vien
join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
where year(ngay_lam_hop_dong) between 2019 and 2021
group by nhan_vien.ma_nhan_vien
having count(hop_dong.ma_hop_dong) > 0) as test);

-- câu 17: 
/*Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng
đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ*/
update khach_hang 
set ma_loai_khach = 1 
where ho_ten in ( 
select * from(
select ho_ten from khach_hang 
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
where year(ngay_lam_hop_dong) = 2021 and ten_loai_khach = 'platinum'
group by khach_hang.ma_khach_hang
having sum(chi_phi_thue) + sum(dich_vu_di_kem.gia*hop_dong_chi_tiet.so_luong) >= 10000000
) as test);

 -- câu 18: 
 /*Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng)*/
 update khach_hang
 set flag = 0 -- flag = 0 means đã xóa
 where ho_ten in ( select* from(
 select ho_ten from khach_hang
 join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
 where year(ngay_lam_hop_dong ) < 2021) as test);
 
 -- cách delete hẳn data
 delete khach_hang, hop_dong 
 from khach_hang
 join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
 where ma_khach_hang in (select * from (
  select ma_khach_hang from khach_hang
 join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
 where year(ngay_lam_hop_dong ) < 2021) as test);
 
 -- câu 19: 
 /*Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi*/
 update dich_vu_di_kem
 set gia = gia*2
 where ma_dich_vu_di_kem in (select * from (
 select dich_vu_di_kem.ma_dich_vu_di_kem from dich_vu_di_kem
 join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
 join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
 where year(ngay_lam_hop_dong) = 2020
 group by dich_vu_di_kem.ma_dich_vu_di_kem
 having sum(so_luong) > 10) as test);

 -- câu 20:
 /*Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm 
 id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi*/
 select ma_nhan_vien as ma, ho_ten,email,so_dien_thoai,ngay_sinh,dia_chi from nhan_vien
 union
 select ma_khach_hang,ho_ten,email,so_dien_thoai,ngay_sinh,dia_chi from khach_hang;
 
 -- câu 21:
 /*Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
 và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”*/
 create view v_nhan_vien as 
 select nhan_vien.* from nhan_vien 
 join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
 where ngay_lam_hop_dong = '2019-12-12' and nhan_vien.dia_chi like '%Hải Châu%';
 -- drop view v_nhan_vien
 
 -- câu 22: 
 /*Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này*/
 update v_nhan_vien
 set dia_chi = 'Liên Chiểu'
 where ma_nhan_vien is not null;
 
 -- câu 23:
 /*Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang*/
 delimiter //
 -- Dòng đầu tiên DELIMITER $$ dùng để phân cách bộ nhớ lưu trữ thủ tục Cache và mở ra một ô lưu trữ mới. Đây là cú pháp nên bắt buộc bạn phải nhập như vậy
 
 -- cách set flag
 drop procedure if exists sp_xoa_khach_hang //
 create procedure sp_xoa_khach_hang 
 (in ma_khach_hang_param int)
 begin 
 update khach_hang 
 set flag = 0
 where ma_khach_hang = ma_khach_hang_param;
 end//
 delimiter ;
 call sp_xoa_khach_hang(1);
 alter table khach_hang 
 add flag bit;
 
 -- cách set null foreign key
 delimiter //
drop procedure if exists sp_xoa_khach_hang_2 //
 create procedure sp_xoa_khach_hang_2
 (in ma_khach_hang_param int)
 begin 
 update hop_dong 
 set ma_khach_hang = null
 where ma_khach_hang = ma_khach_hang_param;
 delete from khach_hang
 where ma_khach_hang = ma_khach_hang_param;
 end//
 delimiter ;
 call sp_xoa_khach_hang(1);
 call sp_xoa_khach_hang_2(11);
 
 -- câu 24:
 /*Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong 
 phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung,
 với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan*/
 delimiter //
 drop procedure if exists sp_them_moi_hop_dong //
 create procedure sp_them_moi_hop_dong
 (in_ma_hop_dong int, ngay_lam_hop_dong datetime, ngay_ket_thuc datetime,tien_dat_coc float,ma_nhan_vien int,ma_khach_hang int,ma_dich_vu int)
 begin
 if in_ma_hop_dong in (select ma_hop_dong from hop_dong) 
 then 
 select 'ma_hop_dong không hợp lệ';
 else 
 insert into hop_dong
 values(in_ma_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu);
 end if;
 end//
 delimiter ;
 call sp_them_moi_hop_dong(42,'2021-05-27 00:00:00','2021-05-27 00:00:00',1,1,1,1);
 
 -- câu 25:
 /*25.Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại 
 có trong bảng hop_dong ra giao diện console của database.
Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console*/
create table tg_check(so_luong int);
 delimiter //
 drop trigger if exists tr_xoa_hop_dong //
 create trigger tr_xoa_hop_dong 
 after delete 
 on hop_dong
 for each row
begin
declare so_luong int;
set so_luong = (select count(*) from hop_dong);
insert into tg_check values (so_luong);
end//
 delimiter ;
-- show triggers;
delete from hop_dong
where ma_hop_dong = 41;
select * from tg_check;
 
 -- câu 26:
 /*Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không,
 với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, 
 nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.
Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console*/
delimiter //
drop trigger if exists tr_cap_nhat_hop_dong //
create trigger tr_cap_nhat_hop_dong 
before update on hop_dong
for each row 
begin 
DECLARE specialty CONDITION FOR SQLSTATE '25000';
declare in_ngay_lam_hop_dong datetime;
set in_ngay_lam_hop_dong = (select ngay_lam_hop_dong from hop_dong where ma_hop_dong = new.ma_hop_dong);
IF datediff(new.ngay_ket_thuc,in_ngay_lam_hop_dong) < 2 THEN
    SIGNAL SQLSTATE '25000'
	SET MESSAGE_TEXT = 'Sai ngày!';
  END IF;
-- set @show_error = (select 'LỖI');
end// 
delimiter ;
update hop_dong 
set ngay_ket_thuc = '2021-05-29 00:00:00' where ma_hop_dong = 42;
-- select @show_error;

-- câu 27:
/*Tạo Function thực hiện yêu cầu sau:
a.Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ*/
 delimiter //
 drop function if exists func_dem_dich_vu //
 create function func_dem_dich_vu()
 returns int
 deterministic
 begin
declare so_luong int;
set so_luong = (select count(*) from (
select sum(chi_phi_thue) as tong_thue from dich_vu 
join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu 
group by ma_hop_dong 
having tong_thue > 2000000
) as derived_table)
;
return so_luong;
 end//
 delimiter ;
 
 select func_dem_dich_vu() as so_dich_vu;
 
/*b. Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng
 đến lúc kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào
 từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). Mã của khách hàng được 
 truyền vào như là 1 tham số của function này*/
delimiter //
drop function if exists func_tinh_thoi_gian_hop_dong //
create function func_tinh_thoi_gian_hop_dong(in_ma_khach_hang int)
returns int
deterministic
begin
declare thoi_gian_dai_nhat int;
set thoi_gian_dai_nhat = (select max(thoi_gian_hop_dong) from  (
select datediff(ngay_ket_thuc,ngay_lam_hop_dong) as thoi_gian_hop_dong from hop_dong
join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
where hop_dong.ma_khach_hang = in_ma_khach_hang
) as derived_table);
return thoi_gian_dai_nhat;
end //
delimiter ;

select func_tinh_thoi_gian_hop_dong(3) as thoi_gian_dai_nhat;

-- câu 28: 
/*Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room”
 từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng dich_vu)
 và xóa những hop_dong sử dụng dịch vụ liên quan (tức là phải xóa những bản ghi trong bảng hop_dong) và những bản liên quan khác*/
delimiter //
drop procedure if exists sp_xoa_dich_vu_va_hd_room //
create procedure sp_xoa_dich_vu_va_hd_room()
begin 
delete hop_dong, dich_vu
from hop_dong
join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
where dich_vu.ma_dich_vu in (select * from (
select dich_vu.ma_dich_vu from hop_dong
join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
where year(ngay_lam_hop_dong) between 2015 and 2019 and ten_loai_dich_vu = 'room') as test);
end//
delimiter ;

call sp_xoa_dich_vu_va_hd_room();


-- ---------------- TEST------------------
-- câu 17
create view update_table as
select khach_hang.ma_khach_hang, khach_hang.ho_ten,loai_khach.ma_loai_khach, loai_khach.ten_loai_khach, sum(dich_vu.chi_phi_thue+ifnull(hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia,0)) as tong_tien 
from khach_hang
left join loai_khach on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
left join hop_dong on hop_dong.ma_khach_hang =  khach_hang.ma_khach_hang
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
where year(hop_dong.ngay_lam_hop_dong ) = 2021 and khach_hang.ma_loai_khach = 2
group by hop_dong.ma_hop_dong
having tong_tien > 10000000 ;

select *from update_table;

update khach_hang
set khach_hang.ma_loai_khach = 1
where khach_hang.ma_khach_hang in (select update_table.ma_khach_hang from update_table);