CREATE DATABASE TAOKHOANGOAI
GO
USE TAOKHOANGOAI

CREATE TABLE GiangVien(
	maGV int,
	tenGV varchar(250),
	gioiTinh varchar(10),
	namSinh int, 
	diaChi varchar (250),
	maKhoa int not null,
	PRIMARY KEY (maKhoa),
	FOREIGN KEY (gioiTinh) REFERENCES SinhVien(gioiTinh)
)

CREATE TABLE SinhVien(
	maSV int not null,
	tenSV varchar(250),
	gioiTinh varchar(10) ,
	namSinh int,
	queQuan varchar (250),
	maKhoa int,
	PRIMARY KEY (gioiTinh),
	FOREIGN KEY (maKhoa) REFERENCES GiangVien(maKhoa)
)

CREATE TABLE Khoa(
	maKhoa int not null PRIMARY KEY,
	tenKhoa varchar (250),
	dienThoai int ,
)

CREATE TABLE DeTai(
	maKhoa int not null PRIMARY KEY,
	maDT int,
	tenDT varchar (250),
	noiThucTap varchar(250),
	FOREIGN KEY (maKhoa) REFERENCES Khoa(maKhoa) 
)
CREATE TABLE HuongDan(
	maSV int ,
	maDT int,
	maGV int not null PRIMARY KEY,
	maKhoa int,
	ketQua varchar (250),
	FOREIGN KEY (maKhoa) REFERENCES  GiangVien(maKhoa), 
	
	
)
