-- Tạo CSDL --

CREATE DATABASE DEMO_K15full
GO 
USE DEMO_K15full;
GO

--- Tạo Bảng ---
CREATE TABLE Khoa
(
	maKhoa CHAR(10) PRIMARY KEY,
	tenKhoa NVARCHAR(30),
	dienThoai CHAR(10)
)

CREATE TABLE GiangVien
(
	maGV int PRIMARY KEY,
	hoTenGV NVARCHAR(30),
	gioiTinh NVARCHAR(5),
	namSinh int,
	diaChi NVARCHAR(30),
	maKhoa CHAR(10) FOREIGN KEY REFERENCES Khoa
)

CREATE TABLE SinhVien
(
	maSV int PRIMARY KEY,
	hoTenSV NVARCHAR(40),
	gioiTinh NVARCHAR(5),
	namSinh int,
	queQuan NVARCHAR(30),
	maKhoa CHAR(10) FOREIGN KEY REFERENCES Khoa,
)


CREATE TABLE DeTai
(
	maDT CHAR(10) PRIMARY KEY,
	tenDT NVARCHAR(30),
	noiThucTap NVARCHAR(30)
)

CREATE TABLE HuongDan
(
	maSV int PRIMARY KEY,
	maDT CHAR(10) FOREIGN KEY REFERENCES DeTai,
	maGV int FOREIGN KEY REFERENCES GiangVien,
	ketQua DECIMAL(5,2)
)


--- Thêm Dữ Liệu Vào Bảng ---
INSERT INTO Khoa VALUES
('CNTT',N'Công nghệ thông tin',02438541616),
('XD',N'Xây Dựng',02438542529),
('NT',N'Nội Thất',02438541616)

INSERT INTO GiangVien VALUES
(18,N'Nguyễn Mạnh Hùng', N'Nam',1988, N'Hà Nội', 'CNTT'),
(19,N'Nguyễn Thị Nguyệt', N'Nữ',1992, N'Hà Nội', 'CNTT'),
(20,N'Nguyễn Hải Phong', N'Nam',1987, N'Hà Nội', 'CNTT'),
(21,N'Phạm Thanh Mừng', N'Nữ',1993, N'Hà Nam', 'NT'),
(22,N'Lê Trúc Hà', N'Nữ',1992, N'Hưng Yên', 'NT'),
(23,N'Trần Trọng Tuấn', N'Nam',1987, N'Hải Dương', 'XD'),
(24,N'Trần Thị Vân Anh', N'Nữ',1992, N'Hải Phòng', 'XD')


INSERT INTO SinhVien VALUES
(11, N'Cao Tú Anh', N'Nữ',2001, N'Hà Nội', 'CNTT'),
(12, N'Kiều Tuấn Anh', 'Nam',2000, N'Hải Phòng', 'CNTT'),
(13, N'Lê Mai Anh', N'Nữ',2001, N'Hải Phòng', 'CNTT'),
(14, N'Hoàng Văn Tuấn', 'Nam',2001, N'Nam Định', 'NT'),
(15, N'Hoàng Thu Hồng', N'Nữ',2001, N'Hà Nội', 'NT'),
(16, N'Nguyễn Thị Nhung', N'Nữ',2001, N'Thái Bình', 'XD'),
(17, N'Phạm Thanh Tùng', N'Nam',2001, N'Quảng Ninh', 'XD'),
(18, N'Hoàng Thị Uyên', N'Nữ',2001, N'Hà Giang', 'XD'),
(19, N'Trần Quang Vũ', 'Nam',2001, N'Hưng Yên', 'XD'),
(20, N'Nguyễn Đức Toàn', N'Nữ',2001, N'Thái Bình', 'XD')


INSERT INTO DeTai VALUES
('DT01', N'Đề Tài 01','FPT Software'),
('DT02', N'Đề Tài 02','FPT Software'),
('DT03', N'Đề Tài 03','Answer Group'),
('DT04', N'Đề Tài 04', N'Hòa Bình Group'),
('DT05', N'Đề Tài 05', N'Hòa Bình Group')

INSERT INTO HuongDan VALUES
(11, 'DT01', 19,8),
(12, 'DT02', 18,9),
(13, 'DT02', 20,7),
(14, 'DT03', 22,8),
(15, 'DT03', 21,6),
(17, 'DT05', 23,5),
(20, 'DT05', 24,9)


--1.Đưa ra thông tin của Sinh Viên khoa Xây Dựng
SELECT * FROM
SinhVien JOIN Khoa
ON SinhVien.maKhoa=Khoa.maKhoa
Where tenKhoa=N'Xây Dựng '

--2. Đưa ra thông tin gồm: Mã Sinh Viên, Họ tên và tên khoa của tất cả các Sinh Viên
SELECT SinhVien.maSV, Khoa.tenKhoa, SinhVien.hoTenSV
FROM SinhVien
INNER JOIN Khoa ON SinhVien.maKhoa=Khoa.maKhoa;

--3. Giống câu 2 nhưng Đổi Tên Cột Hiển Thị là: Mã Sinh Viên, Họ Tên, Khoa
SELECT SinhVien.maSV AS'Mã Sinh Viên', Khoa.tenKhoa AS'Khoa', SinhVien.hoTenSV AS'Họ Tên'
FROM SinhVien
INNER JOIN Khoa ON SinhVien.maKhoa=Khoa.maKhoa;

--4. Đưa ra thông tin của Giảng Viên khoa NT
SELECT * FROM
GiangVien JOIN Khoa
ON GiangVien.maKhoa=Khoa.maKhoa
Where tenKhoa=N'Nội Thất'

--5. Đưa ra thông tin gồm: Mã Giảng Viên, Họ tên và tên khoa của tất cả các Giảng Viên
SELECT GiangVien.maGV, Khoa.tenKhoa, GiangVien.hoTenGV
FROM GiangVien
INNER JOIN Khoa ON GiangVien.maKhoa=Khoa.maKhoa;

--6. Giống câu 5 nhưng Đổi Tên Cột Hiển Thị
SELECT GiangVien.maGV AS'Mã Giảng Viên', Khoa.tenKhoa AS'Khoa', GiangVien.hoTenGV AS'Họ Tên'
FROM GiangVien
INNER JOIN Khoa ON GiangVien.maKhoa=Khoa.maKhoa;

--7. Đưa thông tinh Sinh viên Nữ của Khoa Nội Thất
SELECT*FROM
SinhVien JOIN Khoa
ON SinhVien.maKhoa=Khoa.maKhoa 
Where tenKhoa=N'Nội Thất' AND SinhVien.gioiTinh=N'Nữ'
--8. Đưa thông tinh Giảng viên Nữ của Khoa Công nghệ thông tin
SELECT*FROM
GiangVien JOIN Khoa
ON GiangVien.maKhoa=Khoa.maKhoa 
Where tenKhoa=N'Công nghệ thông tin ' AND GiangVien.gioiTinh=N'Nữ'
--7. Danh Sách Sinh Viên Không Tham Gia Thực Tập
SELECT *
FROM SinhVien sv
WHERE sv.maSV NOT IN (
    SELECT hd.maSV
    FROM HuongDan hd
);
--8. Đếm số SV của Khoa XD
SELECT COUNT(*)
FROM SinhVien
WHERE maKhoa = 'Xây Dựng';
--9. Đưa ra danh sách gồm mã số, họ tên và năm sinh của các sinh viên khoa 'Nội Thất'
SELECT maSV, hoTenSV, namSinh
FROM SinhVien
WHERE maKhoa = 'Nội Thất';
--10. Cho biết số giảng viên của khoa 'Xây Dựng'
SELECT COUNT(*)
FROM GiangVien
WHERE maKhoa = 'Xây Dựng';
--11. Đưa ra mã khoa, tên khoa và số giảng viên của mỗi khoa
SELECT k.maKhoa, k.tenKhoa, COUNT(gv.maGV) AS 'soGiangVien'
FROM Khoa k
LEFT JOIN GiangVien gv ON k.maKhoa = gv.maKhoa
GROUP BY k.maKhoa, k.tenKhoa;
--12. Cho biết số điện thoại của khoa mà sinh viên có tên 'Kiều Tuấn Anh' đang theo học
SELECT k.dienThoai
FROM SinhVien sv
JOIN Khoa k ON sv.maKhoa = k.maKhoa
WHERE sv.hoTenSV = N'Kiều Tuấn Anh';

--13. Hiển thị Mã Sinh Viên, họ tên và Năm sinh của 5 sinh viên đầu tiên trong danh sách
SELECT TOP 5 maSV,hoTenSV,namSinh 
FROM SinhVien
--14. Hiển thị Mã Sinh Viên, họ tên và Năm sinh của 20% số lượng sinh viên hiện có trong bảng Sinhvien
SELECT TOP 20 PERCENT maSV, hoTenSV, namSinh
FROM SinhVien
ORDER BY maSV;
--15. Hiển thị thông tin Sinh viên có Kết Quả Thực Tập xếp loại giỏi (KetQua >=8)
SELECT SinhVien.*
FROM SinhVien
JOIN HuongDan ON SinhVien.maSV = HuongDan.maSV
WHERE HuongDan.ketQua >= 8 ; 
--16. Hiển thị thông tin Sinh viên có Kết Quả Thực Tập có điểm trong khoảng 5-7
SELECT *
FROM SinhVien
JOIN HuongDan ON SinhVien.maSV = HuongDan.maSV
WHERE HuongDan.ketQua >=5 and HuongDan.ketQua <=7;