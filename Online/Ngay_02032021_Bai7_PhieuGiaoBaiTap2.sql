﻿CREATE DATABASE BanHangVer4
USE BanHangVer4
CREATE TABLE HangSX
(
MaHangSX CHAR(5) NOT NULL PRIMARY KEY, 
TenHang NVARCHAR(30) NOT NULL,
DiaChi NVARCHAR(30) NOT NULL,
SoDT CHAR(10) NOT NULL,
Email CHAR(20) NOT NULL
)

Create table SanPham ( 
MaSP char(10) not null primary key,
MaHangSX char(5) not null, 
TenSP nvarchar(30) NOT NULL, 
SoLuong int NOT NULL, 
MauSac nvarchar(20) NOT NULL, 
GiaBan money NOT NULL, 
DonViTinh char(10) NOT NULL, 
MoTa nvarchar(20) NOT NULL, 
Constraint FK_SanPham foreign key (MaHangSX) references HangSX(MaHangSX) on update cascade on delete cascade
) 

create table NhanVien(
MaNV char(5) NOT NULL primary key,
TenNV nvarchar (100) NOT NULL,
GioiTinh char (10) NOT NULL,
DiaChi nvarchar(30) NOT NULL,
SoDT char(10) NOT NULL,
Email char(20) NOT NULL,
TenPhong nvarchar(100) NOT NULL,
)

create table PNhap(
SoHDN char(5) NOT NULL primary key,
NgayNhap datetime NOT NULL,
MaNV char(5) NOT NULL,
constraint fk_PNhap foreign key (MaNV) references NhanVien(MaNV) on update cascade on delete cascade,
)

create table Nhap(
SoHDN char(5) NOT NULL,
MaSP char(10) NOT NULL,
SoLuongN int,
DonGiaN money ,
constraint PK_Nhap primary key(SoHDN,MaSP),
constraint FK_Nhap_MaSP foreign key (MaSP) references SanPham(MaSP) on update cascade on delete cascade,
constraint FK_Nhap_SoHDN foreign key (SoHDN) references PNhap(SoHDN) on update cascade on delete cascade
)

create table PXuat(
SoHDX char(5) NOT NULL primary key,
NgayXuat datetime NOT NULL,
MaNV char(5) NOT NULL,
constraint fk_PXuat_MaNV foreign key (MaNV) references NhanVien(MaNV)
)

create table Xuat(
SoHDX char(5) NOT NULL ,
MaSP char(10) NOT NULL,
SoluongX int NOT NULL,
constraint pk_Xuat PRIMARY KEY (SoHDX, MaSP), 
constraint fk_Xuat_SoHDX foreign key (SoHDX) references PXuat(SoHDX) on update cascade on delete cascade,
constraint fk_Xuat_MaSP foreign key (MaSP) references SanPham(MaSP) on update cascade on delete cascade,
)

insert into HangSX values('HSX1', 'Hang 01', 'Hùng Yến ', '0787878', 'fibcgjf@gmail.com')
insert into HangSX values('HSX2', 'Hang 02', 'Nam Ha ', '0454545', 'Abc@gmail.com')
insert into HangSX values('HSX3', 'Hang 03', 'Tu  Hoang ', '0565656', 'bactuliem@gmail.com')
insert into HangSX values('HSX4', 'Hang 04', 'Dong Anh', '0121212', 'donganhy@gmail.com')
insert into HangSX values('HSX5', 'Hang 05', 'Hai Ba Trung', '0323232', 'haibaisu@gmail.com')
insert into HangSX values('HSX6', 'Samsung', 'Hoan Kiem', '0131313', 'samsung@gmail.com')

Select * From HangSX

insert into SanPham values('SP1', 'HSX2', 'Banh Bao', 15, 'Trang', 7000, 'cai', 'hinh tron')
insert into SanPham values('SP2', 'HSX3', 'Banh Chung', 25, 'Xanh', 27000, 'cai', 'hinh vuong')
insert into SanPham values('SP3', 'HSX2', 'Banh Tet', 17, 'Xanh', 25000, 'cai', 'hinh tru')
insert into SanPham values('SP4', 'HSX1', 'Banh Dau Xanh', 13, 'Vang', 15000, 'hop', 'hinh vuong')
insert into SanPham values('SP5', 'HSX4', 'Banh Chocopice', 18, 'Den', 30000, 'hop', 'hinh tron')
insert into SanPham values('SP7', 'HSX6', 'Smart Phone', 25, 'Trang', 3000000, 'chiec', 'hinh chu nhat')
insert into SanPham values('SP8', 'HSX1', 'Smart Tivi', 15, 'Xam', 5000000, 'chiec', 'hinh chu nhat')

Select * From SanPham

insert into NhanVien values('NV1', 'Ha Thi Phuong ', 'Nu', 'Cau Giay', '0454545', 'phuongha@gmail.com', 'Thu ngan')
insert into NhanVien values('NV2', 'Bui Thi Hai', 'Nu', 'Hai Ba Trung', '0565656', 'ngochai@gmail.com', 'Thu quy')
insert into NhanVien values('NV3', 'Ha Ngoc Son', 'Nam', 'Kon Tum', '0141414', 'ngocson@gmail.com', 'Bao ve')
insert into NhanVien values('NV4', 'Vu Van Tam', 'Nam', 'Ba Vi', '0898989', 'vantam@gmail.com', 'Thu ngan')
insert into NhanVien values('NV5', 'Nguyen Van Ba', 'Nam', 'Quoc Oai', '0525252', 'vanba@gmail.com', 'Truong phong')
insert into NhanVien values('NV6', 'Vi Hung', 'Nam', 'Thanh Liem', '0484848', 'vihung@gmail.com', 'Truong phong')
insert into NhanVien values('NV7', 'Yen Dung', 'Nu', 'Duy Tien', '0464646', 'yendung@gmail.com', 'Thu Ngan')


Select * From NhanVien

insert into PNhap values('N01', '12/05/2020', 'NV2')
insert into PNhap values('N02', '10/07/2020', 'NV1')
insert into PNhap values('N03', '07/08/2020', 'NV3')
insert into PNhap values('N04', '08/11/2020', 'NV3')
insert into PNhap values('N05', '04/12/2020', 'NV5')
insert into PNhap values('N06', '09/02/2018', 'NV4')
insert into PNhap values('N07', '09/06/2018', 'NV4')
insert into PNhap values('N08', '08/05/2018', 'NV2')
insert into PNhap values('N09', '08/01/2018', 'NV5')
insert into PNhap values('N10', '08/10/020', 'NV6')

Select * From PNhap

insert into Nhap values('N02', 'SP1', 10, 5000)
insert into Nhap values('N05', 'SP2', 11, 7000)
insert into Nhap values('N03', 'SP4', 8, 8000)
insert into Nhap values('N02', 'SP4', 5, 900)
insert into Nhap values('N01', 'SP3', 10, 6000)
insert into Nhap values('N07', 'SP7', 18, 9000)
insert into Nhap values('N06', 'SP1', 17, 7500)
insert into Nhap values('N07', 'SP4', 21, 750)
insert into Nhap values('N08', 'SP3', 25, 35)
insert into Nhap values('N09', 'SP4', 21, 18000)
insert into Nhap values('N07', 'SP5', 8, 45)

Select * From Nhap

insert into PXuat values('X01', '12/07/2020', 'NV3')
insert into PXuat values('X02', '11/08/2020', 'NV4')
insert into PXuat values('X03', '07/03/2020', 'NV2')
insert into PXuat values('X04', '06/12/2020', 'NV5')
insert into PXuat values('X05', '07/08/2020', 'NV1')
insert into PXuat values('X06', '06/09/2018', 'NV1')
insert into PXuat values('X07', '05/12/2018', 'NV2')

Select * From PXuat

insert into Xuat values('X03', 'SP3', 10)
insert into Xuat values('X04', 'SP2', 11)
insert into Xuat values('X02', 'SP1', 8)
insert into Xuat values('X02', 'SP4', 5)
insert into Xuat values('X01', 'SP5', 3610)
insert into Xuat values('X05', 'SP3', 15)
insert into Xuat values('X05', 'SP7', 5)
--insert into Xuat values('X01', 'SP6', 11000)
insert into Xuat values('X03', 'SP7', 10010)
insert into Xuat values('X06', 'SP5', 7)
--insert into Xuat values('X07', 'SP6', 479)

Select * From Xuat

Create Function fn_DSSPTheoHangSX(@TenHang nvarchar(20))
Returns @bang Table (
 MaSP char(10),
 TenSP nvarchar(30),
 SoLuong int,
 MauSac nvarchar(20),
 GiaBan money,
 DonViTinh char(10),
 MoTa nvarchar(20)
 )
As
Begin
 Insert Into @bang
 Select MaSP, TenSP, SoLuong, MauSac, GiaBan, DonViTinh, MoTa
 From SanPham Inner join HangSX
 on SanPham.MaHangSX = HangSX.MaHangSX
 Where TenHang = @TenHang
 Return 
 end

 Select * From fn_DSSPTheoHangSX('Samsung')insert into HangSX values('HSX1', 'Hang 01', 'Cau Giay', '0787878', 'caugiay@gmail.com')
insert into HangSX values('HSX2', 'Hang 02', 'Nam Tu Liem', '0454545', 'namtuliem@gmail.com')
insert into HangSX values('HSX3', 'Hang 03', 'Bac Tu Liem', '0565656', 'bactuliem@gmail.com')
insert into HangSX values('HSX4', 'Hang 04', 'Dong Anh', '0121212', 'donganhy@gmail.com')
insert into HangSX values('HSX5', 'Hang 05', 'Hai Ba Trung', '0323232', 'haibatrung@gmail.com')
insert into HangSX values('HSX6', 'Samsung', 'Hoan Kiem', '0131313', 'samsung@gmail.com')

Select * From HangSX

insert into SanPham values('SP1', 'HSX2', 'Banh Bao', 15, 'Trang', 7000, 'cai', 'hinh tron')
insert into SanPham values('SP2', 'HSX3', 'Banh Chung', 25, 'Xanh', 27000, 'cai', 'hinh vuong')
insert into SanPham values('SP3', 'HSX2', 'Banh Tet', 17, 'Xanh', 25000, 'cai', 'hinh tru')
insert into SanPham values('SP4', 'HSX1', 'Banh Dau Xanh', 13, 'Vang', 15000, 'hop', 'hinh vuong')
insert into SanPham values('SP5', 'HSX4', 'Banh Chocopice', 18, 'Den', 30000, 'hop', 'hinh tron')
insert into SanPham values('SP6', 'HSX6', 'Tai Nghe', 80, 'Den', 1200000, 'chiec', 'hinh tron')
insert into SanPham values('SP7', 'HSX6', 'Smart Phone', 25, 'Trang', 3000000, 'chiec', 'hinh chu nhat')
insert into SanPham values('SP8', 'HSX1', 'Smart Tivi', 15, 'Xam', 5000000, 'chiec', 'hinh chu nhat')

Select * From SanPham

insert into NhanVien values('NV1', 'Bui Ngoc Anh', 'Nu', 'Cau Giay', '0454545', 'ngocanhh@gamil.com', 'Thu ngan')
insert into NhanVien values('NV2', 'Bui Thi Hai', 'Nu', 'Hai Ba Trung', '0565656', 'buihai@gamil.com', 'Thu quy')
insert into NhanVien values('NV3', 'Ha Ngoc Son', 'Nam', 'Kon Tum', '0141414', 'ngocson@gamil.com', 'Bao ve')
insert into NhanVien values('NV4', 'Vu Van Tam', 'Nam', 'Ba Vi', '0898989', 'vantam@gamil.com', 'Thu ngan')
insert into NhanVien values('NV5', 'Nguyen Van Ba', 'Nam', 'Quoc Oai', '0525252', 'vanba@gamil.com', 'Truong phong')
insert into NhanVien values('NV6', 'Vi Hung', 'Nam', 'Thanh Liem', '0484848', 'vihung@gamil.com', 'Truong phong')
insert into NhanVien values('NV7', 'Yen Dung', 'Nu', 'Duy Tien', '0464646', 'yendung@gamil.com', 'Thu Ngan')

Select * From NhanVien

insert into PNhap values('N01', '12/05/2020', 'NV2')
insert into PNhap values('N02', '10/07/2020', 'NV1')
insert into PNhap values('N03', '07/28/2020', 'NV3')
insert into PNhap values('N04', '08/15/2020', 'NV3')
insert into PNhap values('N05', '09/23/2020', 'NV5')
insert into PNhap values('N06', '09/17/2018', 'NV4')
insert into PNhap values('N07', '09/26/2018', 'NV4')
insert into PNhap values('N08', '08/15/2018', 'NV2')
insert into PNhap values('N09', '08/15/2018', 'NV5')
insert into PNhap values('N10', '08/27/2020', 'NV6')

Select * From PNhap

insert into Nhap values('N02', 'SP1', '10', 5000)
insert into Nhap values('N05', 'SP2', '11', 7000)
insert into Nhap values('N03', 'SP4', '8', 8000)
insert into Nhap values('N02', 'SP4', '5', 9000)
insert into Nhap values('N01', 'SP3', '10', 6000)
insert into Nhap values('N07', 'SP3', '18', 9000)
insert into Nhap values('N06', 'SP1', '17', 7500)
insert into Nhap values('N07', 'SP4', '21', 7500)
insert into Nhap values('N08', 'SP3', '25', 21000)
insert into Nhap values('N09', 'SP4', '21', 18000)
insert into Nhap values('N07', 'SP8', '8', 4500000)
insert into Nhap values('N06', 'SP4', 15, 470000)

Select * From Nhap

insert into PXuat values('X01', '12/07/2020', 'NV3')
insert into PXuat values('X02', '11/08/2020', 'NV4')
insert into PXuat values('X03', '07/22/2020', 'NV2')
insert into PXuat values('X04', '06/18/2020', 'NV5')
insert into PXuat values('X05', '07/23/2020', 'NV1')
insert into PXuat values('X06', '06/18/2018', 'NV1')
insert into PXuat values('X07', '05/19/2018', 'NV2')

Select * From PXuat

insert into Xuat values('X03', 'SP3', '10')
insert into Xuat values('X04', 'SP2', '11')
insert into Xuat values('X02', 'SP1', '8')
insert into Xuat values('X02', 'SP4', '5')
insert into Xuat values('X01', 'SP5', '10')
insert into Xuat values('X05', 'SP6', '15')
insert into Xuat values('X05', 'SP7', '5')
insert into Xuat values('X01', 'SP6', '11000')
insert into Xuat values('X03', 'SP7', '10010')
insert into Xuat values('X06', 'SP5', '7')
insert into Xuat values('X07', 'SP6', '9')

Select * From Xuat

--câu a
Create Function fn_DSSPTheoHangSX(@TenHang nvarchar(20))
Returns @bang Table (
 MaSP char(10),
 TenSP nvarchar(30),
 SoLuong int,
 MauSac nvarchar(20),
 GiaBan money,
 DonViTinh char(10),
 MoTa nvarchar(20)
 )
As
Begin
 Insert Into @bang
 Select MaSP, TenSP, SoLuong, MauSac, GiaBan, DonViTinh, MoTa
 From SanPham Inner join HangSX
 on SanPham.MaHangSX = HangSX.MaHangSX
 Where TenHang = @TenHang
 Return
End
Select * From fn_DSSPTheoHangSX('Samsung')

--câu b
Create Function fn_DSSPNhapTheoNgay(@x date,@y date)
Returns @bang Table (
 MaSP char(10),
 TenSP nvarchar(30),
 TenHang nvarchar(30),
 NgayNhap date,
 SoLuongN int,
 DonGiaN money
 )
As
Begin
 Insert Into @bang
 Select SanPham.MaSP, TenSP, TenHang, NgayNhap, SoLuongN, DonGiaN
 From Nhap Inner join SanPham on Nhap.MaSP = SanPham.MaSP
 Inner join HangSX on SanPham.MaHangSX = HangSX.MaHangSX
 Inner join PNhap on PNhap.SoHDN=Nhap.SoHDN
 Where NgayNhap Between @x And @y
 Return
End
Select * From fn_DSSPNhapTheoNgay ('2/9/2018','3/9/2021')

--
insert into SanPham
values('SP06','H02','F1 Plus','0',N'Xám','7000000',N'Chiếc',N'Hàng cận cao cấp'),
('SP07','H01','Galaxy Note12','0',N'Đỏ','19000000',N'Chiếc',N'Hàng cao cấp')
--câu c
Create Function fn_DSSPTheoSL(@TenHang nvarchar(20), @Flag int)
Returns @bang Table (
 MaSP char(10),
 TenSP nvarchar(30),
 TenHang nvarchar(30), 
 SoLuong int,
 MauSac nvarchar(20),
 GiaBan money,
 DonViTinh char(10),
 MoTa nvarchar(20)
 )
As
Begin
 If(@flag=0)
 Insert Into @bang
 Select MaSP,TenSP,TenHang,SoLuong,MauSac,GiaBan,DonViTinh,MoTa
 From SanPham Inner join HangSX
 on SanPham.MaHangSX = HangSX.MaHangSX
 Where TenHang = @TenHang And SoLuong=0
 Else
 If(@flag =1)
 Insert Into @bang
 Select MaSP,TenSP,TenHang,SoLuong,MauSac,GiaBan,DonViTinh,MoTa
 From SanPham Inner join HangSX
 on SanPham.MaHangSX = HangSX.MaHangSX
 Where TenHang = @TenHang And SoLuong >0
 Return
End
Select * From fn_DSSPtheoSL('Samsung',0)
Select * From fn_DSSPtheoSL('Samsung',1)

--câu d
Create Function fn_DSNVTheoTenPhong(@TenPhong nvarchar(30) )
Returns @bang Table
(
	MaNV char(10) primary key,
	TenNV nvarchar(30) not null,
	GioiTinh cahr(10) not null,
	DiaChi nvarchar(30) not null,
	SoDT char(10) not null,
	Email char(20) not null,
	TenPhong nvarchar(100) not null
)
As 
Begin 
 Insert Into @bang
 Select MaNV,TenNV,GioiTinh,DiaChi,SoDT,Email,TenPhong from NhanVien 
 where TenPhong = @TenPhong
 return 
end
select * from fn_DSNVTheoTenPhong(N'Kế toán')

--câu e
Create Function fn_DSHangSX(@DiaChi nvarchar(30) )
Returns @bang Table
(
	MaHangSX char(50) not null primary key,
	TenHang nvarchar(30) not null,
	DiaChi nvarchar(30) not null,
	SoDT char(10) not null,
	Email char(20) not null
)
Begin 
 Insert Into @bang
 select MaHangSX,TenHang,DiaChi,SoDT,Email from HangSX 
 where DiaChi like @DiaChi
 return
end
select * from fn_DSHangSX(N'China')

--câu f:


Create Function fn_DSSPXuatTheoNam(@x int,@y int)
Returns @bang Table (
 MaSP char(10),
 TenSP nvarchar(30),
 TenHang nvarchar(30),
 NgayXuat date,
 SoLuongX int
 )
 As
Begin
 Insert Into @bang
 Select SanPham.MaSP, TenSP, TenHang, NgayXuat, SoLuongX
 From Xuat Inner join SanPham on Xuat.MaSP = SanPham.MaSP
 Inner join HangSX on SanPham.MaHangSX = HangSX.MaHangSX
 Inner join PXuat on PXuat.SoHDX=Xuat.SoHDX
 Where YEAR(NgayXuat) Between @x And @y
 Return
End
Select * From fn_DSSPXuatTheoNam (2017,2020)

--câu g

Create Function fn_DSSPNhapXuat(@Flag int)
Returns @bang Table 
(
 MaSP char(10),
 TenSP nvarchar(30),
 TenHang nvarchar(30),
 NgayXuat date,
 SoLuongX int
 )
 As
Begin
	If(@flag=0)
		Insert Into @bang
		select SanPham.MaSP,TenSP,TenHang, NgayNhap, SoLuongN 
		from Nhap Inner join SanPham on Nhap.MaSP = SanPham.MaSP
		Inner join HangSX on SanPham.MaHangSX = HangSX.MaHangSX
		Inner join PNhap on PNhap.SoHDN=Nhap.SoHDN
	Else
	If(@flag =1)
		Insert Into @bang
		Select SanPham.MaSP, TenSP, TenHang, NgayXuat, SoLuongX
		From Xuat Inner join SanPham on Xuat.MaSP = SanPham.MaSP
		Inner join HangSX on SanPham.MaHangSX = HangSX.MaHangSX
		Inner join PXuat on PXuat.SoHDX=Xuat.SoHDX
 return 
 end
 select * from fn_DSSPNhapXuat(0)
 select * from fn_DSSPNhapXuat(1)

 --câu h:
Create Function fn_DSNVNhapHangVaoNgay(@NgayNhap Date,@TenSP nvarchar(20))
Returns @bang Table
(
	MaNV char(50) primary key,
	TenNV nvarchar(100) not null,
	GioiTinh char(10) not null,
	DiaChi nvarchar(30) not null,
	SoDT char(10) not null,
	Email char(20) not null,
	TenPhong nvarchar(100) not null
)
As 
Begin 
 Insert Into @bang
 Select NhanVien.MaNV,TenNV,GioiTinh,DiaChi,SoDT,Email,TenPhong from NhanVien 
 inner join PNhap on NhanVien.MaNV=PNhap.MaNV
 inner join Nhap on Nhap.SoHDN=PNhap.SoHDN
 inner join SanPham on SanPham.MaSP=Nhap.MaSP
 where TenSP = @TenSP and NgayNhap=@NgayNhap
return 
end
select * from fn_DSNVNhapHangVaoNgay('04-07-2020','F1 Plus')

-- câu i:
Create Function fn_DSSPTuChon(@x money,@y money,@tenCT nvarchar(20))
Returns @bang Table
(
  MaSP char(10),
 TenSP nvarchar(30),
 SoLuong int,
 MauSac nvarchar(20),
 GiaBan money,
 DonViTinh char(10),
 MoTa nvarchar(20)
)
 As 
Begin 
 Insert Into @bang
 Select MaSP, TenSP, SoLuong, MauSac, GiaBan, DonViTinh, MoTa
 from SanPham inner join HangSX on SanPham.MaHangSX=HangSX.MaHangSX
 where GiaBan between @x and @y
 and TenHang=@tenCT
 return
 end

 select * from fn_DSSPTuChon(7000000,20000000,'Samsung')

 --câu j:Hãy xây dựng hàm không tham biến Đưa ra danh sách các sản phẩm và hãng sản xuất
--tương ứng.
 Create Function fn_DSSPXuat()
Returns @bang Table (
 MaSP char(10),
 TenSP nvarchar(30),
 TenHang nvarchar(30)
 )
 As
Begin
 Insert Into @bang
 Select SanPham.MaSP, TenSP, TenHang
 From Xuat Inner join SanPham on Xuat.MaSP = SanPham.MaSP
 Inner join HangSX on SanPham.MaHangSX = HangSX.MaHangSX
 Inner join PXuat on PXuat.SoHDX=Xuat.SoHDX

 Return
End
select * from fn_DSSPXuat()