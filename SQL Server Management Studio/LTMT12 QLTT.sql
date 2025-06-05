CREATE DATABASE QLTT;
GO
USE QLTT;
-- 1.3 Cam Van Chien
CREATE table GiangVien(
maGV int,
hoTen varchar(255),
gioiTinh varchar(255),
diaChi varchar(255),
maKhoa int,
);

--1.12 Cao Tuan Huy
CREATE TABLE Khoa(
	maKhoa text,
	tenKhoa varchar(255),
	dienThoai int,
);

--1.15 Hoang Hai Lam 
CREATE TABLE DeTai(
	maDT int,
	tenDT int,
	noiThucTap varchar(255)
);
--1.19 Duong Thanh Nam
CREATE table SinhVien(
maSV int,
hoTen varchar(255),
gioiTinh varchar(255),
queQuan varchar(255),
maKhoa int ,
);
--1.22 Le Dinh Tan
Create table HuongDan(
maSV int,
maDT int,
maGV int,
ketQua nvarchar(255),
);