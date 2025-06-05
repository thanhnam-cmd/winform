create database CD1_19_DuongThanhNam1
go
use CD1_19_DuongThanhNam1;

CREATE TABLE KhachHang (
    maKH CHAR(10) PRIMARY KEY,
    hotenKH NVARCHAR(50),
    diaChi NVARCHAR(100),
    sdt CHAR(10),
    ngaySinh DATE,
    doanhSO FLOAT
);

CREATE TABLE NhanVien (
    maNV CHAR(10) PRIMARY KEY,
    hoTenNV NVARCHAR(60),
    ngaySinh DATE,
    gioiTinh NCHAR(10),
    ngayLamViec DATE,
    sdt CHAR(10),
    email CHAR(30)
);

CREATE TABLE sanPham (
    maSP CHAR(10) PRIMARY KEY,
    tenSP NVARCHAR(50),
    dvTinh NVARCHAR(30),
    nuocSX NVARCHAR(50),
    gia FLOAT,
    soLuong FLOAT
);

CREATE TABLE HoaDon (
    soHD CHAR(10) PRIMARY KEY,
    ngayHD DATE,
    maKH CHAR(10),
    maNV CHAR(10),
    triGia FLOAT,
    FOREIGN KEY (maKH) REFERENCES KhachHang(maKH),
    FOREIGN KEY (maNV) REFERENCES NhanVien(maNV)
);

CREATE TABLE ChiTietHD (
    soHD CHAR(10),
    maSP CHAR(10),
    soluong FLOAT,
    giaBan FLOAT,
    PRIMARY KEY (soHD, maSP),
    FOREIGN KEY (soHD) REFERENCES HoaDon(soHD),
    FOREIGN KEY (maSP) REFERENCES sanPham(maSP)
);
-- Nhập dữ liệu vào bảng KhachHang
INSERT INTO KhachHang (maKH, hotenKH, diaChi, sdt, ngaySinh, doanhSO) VALUES
('KH1', N'Nguyễn THỊ SÁU ', N' HÀ NỘI ', '0123456789', '1999-01-01', 1200000),
('KH2', N'DƯƠNG THÀNH NAM ', N'TAM ĐẢO ', '0123456788', '2000-02-02', 2200000),
('KH3', N'Phạm Văn DŨNG ', N'THỊ TRẤN HƠP CHÂU ', '0123456787', '2003-03-03', 3657000),
('KH4', N'Hoàng Thị ĐIỂM ', N'NGÕ 20 HỒ TÙNG MẬU ', '0918765432', '1987-04-04', 9000000),
('KH5', N'LÊ ANH DŨNG ', N'THÔN 2 THỊ TRẤN TAM ĐẢO ', '0912345682', '1995-05-05', 9990000);

-- Nhập dữ liệu vào bảng NhanVien
INSERT INTO NhanVien (maNV, hoTenNV, ngaySinh, gioiTinh, ngayLamViec, sdt, email) VALUES
('NV1', N'lê văn trường', '2001-01-01', N'Nam', '2025-01-01', '0912345690', 'levantruong@gmail.com'),
('NV2', N'trần văn cương  ', '1978-02-02', N'Nam', '2024-02-02', '0912345691', 'tranvancuong@gmail.com'),
('NV3', N'nguyễn như ý ', '1987-03-03', N'Nam', '2023-03-03', '0912345692', 'nguyennhuy@gmail.com'),
('NV4', N'nguyễn văn sơn ', '1988-04-04', N'Nam', '2022-04-04', '0912345693', 'nguyenvanson@gmail.com'),
('NV5', N'nguyễn văn mạnh ', '1990-05-05', N'Nam', '2025-05-05', '0912345694', 'nguyenvanmanh@gmail.com');

-- Nhập dữ liệu vào bảng sanPham
INSERT INTO sanPham (maSP, tenSP, dvTinh, nuocSX, gia, soLuong) VALUES
('SP1', N'sp1', N'Cái', N'VIỆT NAM ', 10000, 59),
('SP2', N'sp2', N'Cái', N'VIỆT NAM ', 20000, 34),
('SP3', N'sp3', N'Cái', N'VIỆT NAM ', 30000, 23),
('SP4', N'sp4', N'Cái', N'VIỆT NAM ', 40000, 13),
('SP5', N'sp5', N'Cái', N'VIỆT NAM ', 50000, 60);

-- Nhập dữ liệu vào bảng HoaDon
INSERT INTO HoaDon (soHD, ngayHD, maKH, maNV, triGia) VALUES
('HD1', '2023-01-01', 'KH1', 'NV1', 150000),
('HD2', '2023-02-03', 'KH2', 'NV2', 270000),
('HD3', '2023-03-04', 'KH3', 'NV3', 390000),
('HD4', '2023-04-05', 'KH4', 'NV004', 400000),
('HD5', '2023-05-06', 'KH5', 'NV005', 500000);

-- Nhập dữ liệu vào bảng ChiTietHD
INSERT INTO ChiTietHD (soHD, maSP, soluong, giaBan) VALUES
('HD1', 'SP1', 1, 17000),
('HD2', 'SP2', 2, 47000),
('HD3', 'SP3', 3, 18000),
('HD4', 'SP4', 4, 180000),
('HD5', 'SP5', 5, 290000);
