-- Tạo cơ sở dữ liệu
CREATE DATABASE MT1_KT2_19_duongthanhnam;
go
USE MT1_KT2_19_duongthanhnam;

-- Tạo bảng SinhVien
CREATE TABLE SinhVien (
    MaSV CHAR(10) NOT NULL,
    HoTen NVARCHAR(50) NOT NULL,
    Tuoi INT NULL,
    GioiTinh NVARCHAR(10) NULL,
    PRIMARY KEY (MaSV)
);

-- Tạo bảng Hoc
CREATE TABLE Hoc (
    MaSV CHAR(10) NOT NULL,
    MaMH CHAR(10) NOT NULL,
    Diem INT NULL,
    PRIMARY KEY (MaSV, MaMH)
);

-- Tạo bảng MonHoc
CREATE TABLE MonHoc (
    MaMH CHAR(10) NOT NULL,
    TenMH NVARCHAR(50) NULL,
    PRIMARY KEY (MaMH)
);

-- Nhập dữ liệu cho bảng SinhVien
INSERT INTO SinhVien (MaSV, HoTen, Tuoi, GioiTinh)
VALUES 
('SV01', N'Kiều Phong', 30, N'Nam'),
('SV02', N'Hư Trúc', 28, N'Nam'),
('SV03', N'Đoàn Dự', 26, N'Nam'),
('SV04', N'Mộ Dung Phục', 26, N'Nam'),
('SV05', N'Tiểu Long Nữ', 18, N'Nữ');

-- Nhập dữ liệu cho bảng Hoc
INSERT INTO Hoc (MaSV, MaMH, Diem)
VALUES 
('SV01', 'MH01', 8),
('SV01', 'MH04', 9),
('SV02', 'MH01', 5),
('SV03', 'MH05', 6),
('SV05', 'MH06', 9);

-- Nhập dữ liệu cho bảng MonHoc
INSERT INTO MonHoc (MaMH, TenMH)
VALUES 
('MH01', N'Túy Quyền'),
('MH02', N'Túy Kiếm'),
('MH03', N'Túy Côn'),
('MH04', N'Hàng Long Thập Bát Chưởng'),
('MH05', N'Lang Tâm Di Bộ'),
('MH06', N'Cửu Âm Chân Kinh');

ALTER TABLE Hoc
ADD CONSTRAINT FK_Hoc_SinhVien FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV);

ALTER TABLE Hoc
ADD CONSTRAINT FK_Hoc_MonHoc FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH);

--câu 1. Hiển thị toàn bộ sinh viên
SELECT * 
FROM SinhVien;
--câu 2. Hiển thị thông tin các môn học
SELECT * 
FROM MonHoc;
--câu 3. Hiển thị thông tin sinh viên có giới tính Nữ
SELECT * 
FROM SinhVien
WHERE GioiTinh = N'Nữ';
--câu 4. Hiển thị thông tin môn học có nhiều sinh viên theo học nhất
SELECT TOP 1 
    MonHoc.MaMH, MonHoc.TenMH, COUNT(Hoc.MaSV) AS SoLuongSinhVien
FROM 
    MonHoc
LEFT JOIN 
    Hoc ON MonHoc.MaMH = Hoc.MaMH
GROUP BY 
    MonHoc.MaMH, MonHoc.TenMH
ORDER BY 
    SoLuongSinhVien DESC;
--câu 5. Hiển thị thông tin sinh viên chưa học bất kì môn học nào
SELECT * 
FROM SinhVien
WHERE MaSV NOT IN (SELECT MaSV FROM Hoc);