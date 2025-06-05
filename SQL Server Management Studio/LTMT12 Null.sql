CREATE DATABASE QLTT12;
GO
USE QLTT;
-- 1.3 Cam Van Chien
CREATE table GiangVien(
maGV int not null primary key,
hoTen varchar(255),
gioiTinh varchar(255),
diaChi varchar(255),
maKhoa int ,
);

--1.12 Cao Tuan Huy
CREATE TABLE Khoa(
	maKhoa int,
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
maSV int primary key,
hoTen varchar(255),
gioiTinh varchar(255),
queQuan varchar(255),
maKhoa int ,

);

--1.22 Le Dinh Tan
Create table HuongDan(
maSV int,
maDT int,
maGV int ,
ketQua nvarchar(255),
);

ALTER TABLE SinhVien 
ADD FOREIGN KEY (maKhoa) REFERENCES Khoa(maKhoa);

ALTER TABLE GiangVien
ADD FOREIGN KEY (maKhoa) REFERENCES Khoa(maKhoa);


ALTER TABLE Khoa
ADD CONSTRAINT PK_maKhoa PRIMARY KEY (maKhoa);

Alter table Khoa
ALTER COLUMN maKhoa int NOT NULL;	

ALTER TABLE Khoa
DROP COLUMN maKhoa;

ALTER TABLE Khoa
ADD maKhoa int;

ALTER TABLE SinhVien
ADD CONSTRAINT PK_maSV PRIMARY KEY (maSV);
Alter table SinhVien
ALTER COLUMN maSV int NOT NULL;

ALTER TABLE GiangVien
ADD CONSTRAINT PK_maGV PRIMARY KEY (magV);
Alter table GiangVien
ALTER COLUMN maGV int NOT NULL;

ALTER TABLE DeTai
ADD CONSTRAINT PK_maDT PRIMARY KEY (maDT);
Alter table DeTai
ALTER COLUMN maDT int NOT NULL;

ALTER TABLE HuongDan
ADD FOREIGN KEY (maSV) REFERENCES SinhVien(maSV);
ALTER TABLE HuongDan
ADD FOREIGN KEY (maGV) REFERENCES GiangVien(maGV);
ALTER TABLE HuongDan
ADD FOREIGN KEY (maDT) REFERENCES DeTai(maDT);

