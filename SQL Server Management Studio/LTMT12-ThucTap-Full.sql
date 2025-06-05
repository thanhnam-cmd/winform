CREATE DATABASE namLTMT1_ThucTap
GO 
USE namLTMT1_ThucTap;
CREATE TABLE Khoa(
	maKhoa int not null PRIMARY KEY, 
	tenKhoa varchar (250),
	dienThoai int ,
)
CREATE TABLE GiangVien(
	maGV int not null PRIMARY KEY,
	tenGV varchar(250),
	gioiTinh varchar (10),
	namSinh int,
	diaChi varchar (250),
	maKhoa int ,
	FOREIGN KEY (maKhoa) REFERENCES Khoa(maKhoa) 
)

CREATE TABLE Detai1 (
maDT int not null primary key,
tenDT varchar(50),
noiThucTap varchar(50),
);
CREATE TABLE SinhVien(
maSV int not null primary key,
hoTen varchar (50),
gioiTinh varchar (50),
namSinh int,
queQuan varchar (50),
maKhoa int,
);
CREATE TABLE HuongDan1 (
maSV int,
maDT int,
maGv int,
ketQua nvarchar (50),
FOREIGN KEY (maDT) REFERENCES Detai1(maDT),
FOREIGN KEY (maSV) REFERENCES SinhVien(maSV),
FOREIGN KEY (maGV) REFERENCES GiangVien(maGV),
);
INSERT INTO HuongDan 
VALUES (111,222,333,'gioi');
INSERT INTO SinhVien1
VALUES (121,'Dương Thành Nam','nam',2005,'Tam Đảo',123 );
