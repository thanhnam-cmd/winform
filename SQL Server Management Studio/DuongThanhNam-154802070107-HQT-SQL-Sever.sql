CREATE DATABASE SINHVIEN3;
GO 
USE SINHVIEN;

-- Câu 1 Tạo cơ sở dữ liệu 
CREATE TABLE SinhVien (
    MaSV CHAR(10) PRIMARY KEY not null,
    HoTen NVARCHAR(50),
    Tuoi INT,
    GioiTinh CHAR(10)
);

CREATE TABLE MonHoc (
    MaMH CHAR(10) PRIMARY KEY not null,
    TenMH NVARCHAR(50)
);

CREATE TABLE Hoc (
    MaSV CHAR(10) not null,
    MaMH CHAR(10) not null,
    Diem INT,
    PRIMARY KEY (MaSV, MaMH),
    FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV),
    FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH)
);

-- Câu 2
INSERT INTO SinhVien (MaSV, HoTen, Tuoi, GioiTinh) VALUES
('SV01', 'Nguyễn Văn A', 20, 'Nam'),
('SV02', 'Tạ Thị B', 19, 'Nữ'),
('SV03', 'Trần Văn C', 21, 'Nam'),
('SV04', 'Bùi Văn D', 22, 'Nam'),
('SV05', 'Quách Thị E', 18, 'Nữ');

INSERT INTO MonHoc (MaMH, TenMH) VALUES
('MH01', 'Môn Học 01'),
('MH02', 'Môn Học 02'),
('MH03', 'Môn Học 03'),
('MH04', 'Môn Học 04'),
('MH05', 'Môn Học 05'),
('MH06', 'Môn Học 06');

INSERT INTO Hoc (MaSV, MaMH, Diem) VALUES
('SV01', 'MH01', 5),
('SV01', 'MH02', 7),
('SV02', 'MH03', 8),
('SV03', 'MH06', 10),
('SV05', 'MH01', 4),
('SV05', 'MH05', 9);

-- Câu 3
--1 Hiển thị toàn bộ thông tin Sinh Viên
SELECT * FROM SinhVien;

--2 Hiển thị thông tin các môn học
SELECT * FROM MonHoc;

--3 Hiển thị Sinh Viên có Giới Tính là 'Nam'
SELECT * FROM SinhVien WHERE GioiTinh = 'Nam';

--4 Hiển thị Sinh Viên chưa học bất kỳ môn nào
SELECT * FROM SinhVien WHERE MaSV NOT IN (SELECT MaSV FROM Hoc);

-- Câu 4
CREATE PROCEDURE TimSinhVienTheoTenMonHoc3
    @TenMH NVARCHAR(50)
AS
BEGIN
    SELECT SV.MaSV, SV.HoTen, H.Diem
    FROM SinhVien SV
    JOIN Hoc H ON SV.MaSV = H.MaSV
    JOIN MonHoc MH ON H.MaMH = MH.MaMH
    WHERE MH.TenMH = @TenMH;
END;
EXEC TimSinhVienTheoTenMonHoc3 'Môn Học 01';



