CREATE DATABASE RAPCHIEUPHIM;
GO 
USE RAPCHIEUPHIM;
CREATE TABLE Phim (
    MaPhim INT PRIMARY KEY,
    TieuDe NVARCHAR(100),
    TheLoai NVARCHAR(50),
    DaoDien NVARCHAR(100),
    NgayPhatHanh DATE,
    ThoiLuong INT -- Thời lượng tính bằng phút
);
CREATE TABLE RapChieuPhim (
    MaRap INT PRIMARY KEY,
    TenRap NVARCHAR(100),
    DiaChi NVARCHAR(200),
    SucChua INT
);
CREATE TABLE ManHinhChieu (
    MaManHinh INT PRIMARY KEY,
    MaRap INT,
    SoManHinh INT,
    SucChua INT,
    FOREIGN KEY (MaRap) REFERENCES RapChieuPhim(MaRap)
);
CREATE TABLE LichChieu (
    MaLichChieu INT PRIMARY KEY,
    MaPhim INT,
    MaManHinh INT,
    ThoiGianChieu DATETIME,
    FOREIGN KEY (MaPhim) REFERENCES Phim(MaPhim),
    FOREIGN KEY (MaManHinh) REFERENCES ManHinhChieu(MaManHinh)
);
CREATE TABLE Ve (
    MaVe INT PRIMARY KEY,
    MaLichChieu INT,
    SoGhe NVARCHAR(10),
    GiaVe DECIMAL(10, 2),
    NgayMua DATETIME,
    FOREIGN KEY (MaLichChieu) REFERENCES LichChieu(MaLichChieu)
);
CREATE TABLE KhachHang (
    MaKhachHang INT PRIMARY KEY,
    HoTen NVARCHAR(100),
    Email NVARCHAR(100),
    SoDienThoai NVARCHAR(15)
);
CREATE TABLE DatVe (
    MaDatVe INT PRIMARY KEY,
    MaKhachHang INT,
    MaVe INT,
    NgayDatVe DATETIME,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY (MaVe) REFERENCES Ve(MaVe)
);

