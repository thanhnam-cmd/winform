CREATE DATABASE rapphimabc;
GO

USE rapphimabc;
GO

CREATE TABLE Customers1 (
    CustomerID INT PRIMARY KEY ,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),
    Phone NVARCHAR(15)
);

CREATE TABLE Movies1 (
    MovieID INT PRIMARY KEY ,
    Title NVARCHAR(200) NOT NULL,
    Duration INT,
    Genre NVARCHAR(50),
    ReleaseDate DATE
);

CREATE TABLE Theaters1 (
    TheaterID INT PRIMARY KEY ,
    Name NVARCHAR(100) NOT NULL,
    Location NVARCHAR(200)
);

CREATE TABLE Showtimes1 (
    ShowtimeID INT PRIMARY KEY ,
    MovieID INT NOT NULL,
    TheaterID INT NOT NULL,
    StartTime DATETIME NOT NULL,
    FOREIGN KEY (MovieID) REFERENCES Movies1(MovieID),
    FOREIGN KEY (TheaterID) REFERENCES Theaters1(TheaterID)
);

CREATE TABLE Tickets1 (
    TicketID INT PRIMARY KEY ,
    ShowtimeID INT NOT NULL,
    CustomerID INT NOT NULL,
    SeatNumber NVARCHAR(10),
    FOREIGN KEY (ShowtimeID) REFERENCES Showtimes1(ShowtimeID),
    FOREIGN KEY (CustomerID) REFERENCES Customers1(CustomerID)
);

INSERT INTO Movies1 (MovieID, Title, Duration, Genre, ReleaseDate)
VALUES 
    (1, 'Mai', 120, 'Tâm lý, Tình cảm', '2024-01-15'),
    (2, 'Lật Mặt 7: Một Điều Ước', 115, 'Hành động, Hài', '2024-03-22'),
    (3, 'Mưa Trên Cánh Bướm', 95, 'Hài, Tâm lý', '2025-01-03'),
    (4, 'Kính Vạn Hoa', 180, 'Học đường, Hài', '2024-12-27'),
    (5, 'Chị Dâu', 110, 'Hài, Tâm lý', '2024-12-20'),
    (6, 'Công Tử Bạc Liêu', 113, 'Hài, Tình cảm', '2024-12-06'),
    (7, 'Linh Miêu: Quỷ Nhập Tràng', 100, 'Kinh dị', '2024-11-10'),
    (8, 'Cô Dâu Hào Môn', 105, 'Tâm lý', '2024-10-18'),
    (9, 'Chúng Ta Của 8 Năm Sau', 51, 'Tâm lý, Tình cảm', '2023-12-10'),
    (10, 'Gia Đình Mình Vui Bất Thình Lình', 68, 'Hài, Gia đình', '2024-02-15');

INSERT INTO Theaters1 (TheaterID, Name, Location)
VALUES
    (1, 'Rạp CGV Vincom', 'Hà Nội'),
    (2, 'Rạp Lotte Landmark', 'Hà Nội'),
    (3, 'Rạp Galaxy Nguyễn Du', 'TP. Hồ Chí Minh'),
    (4, 'Rạp BHD Star Bitexco', 'TP. Hồ Chí Minh'),
    (5, 'Rạp Cinestar Huế', 'Huế');

INSERT INTO Showtimes1 (ShowtimeID, MovieID, TheaterID, StartTime)
VALUES
    (1, 1, 1, '2025-03-27 14:00:00'),
    (2, 2, 2, '2025-03-27 16:30:00'),
    (3, 3, 3, '2025-03-27 19:00:00'),
    (4, 4, 4, '2025-03-28 13:00:00'),
    (5, 5, 5, '2025-03-28 15:30:00'),
    (6, 6, 1, '2025-03-28 18:00:00'),
    (7, 7, 2, '2025-03-29 14:00:00'),
    (8, 8, 3, '2025-03-29 16:30:00'),
    (9, 9, 4, '2025-03-29 19:00:00'),
    (10, 10, 5, '2025-03-30 13:00:00');

INSERT INTO Customers1 (CustomerID, Name, Email, Phone)
VALUES
    (1, 'Nguyễn Văn An', 'an.nguyen@example.com', '0901234567'),
    (2, 'Trần Thị Bình', 'binh.tran@example.com', '0912345678'),
    (3, 'Lê Văn Cường', 'cuong.le@example.com', '0923456789'),
    (4, 'Phạm Thị Dung', 'dung.pham@example.com', '0934567890'),
    (5, 'Hoàng Văn Em', 'em.hoang@example.com', '0945678901');

INSERT INTO Tickets1 (TicketID, ShowtimeID, CustomerID, SeatNumber)
VALUES
    (1, 1, 1, 'A1'),
    (2, 2, 2, 'B5'),
    (3, 3, 3, 'C10'),
    (4, 4, 4, 'D3'),
    (5, 5, 5, 'E7'),
    (6, 6, 1, 'F12'),
    (7, 7, 2, 'G8'),
    (8, 8, 3, 'H4'),
    (9, 9, 4, 'I9'),
    (10, 10, 5, 'J6');

--1. Thêm phim mới (AddMovie)
INSERT INTO Movies1 (MovieID, Title, Duration, Genre, ReleaseDate)
VALUES (11, 'Phim Mới', 130, 'Hành động', '2025-06-01');

--2. Cập nhật thông tin phim (UpdateMovie)
UPDATE Movies1
SET Title = 'Phim Đã Cập Nhật', Duration = 140, Genre = 'Hài', ReleaseDate = '2025-06-10'
WHERE MovieID = 11;

--3. Xóa phim khỏi hệ thống (DeleteMovie)
DELETE FROM Movies1
WHERE MovieID = 11;

--4. Thêm suất chiếu mới (AddShowtime)
INSERT INTO Showtimes1 (ShowtimeID, MovieID, TheaterID, StartTime)
VALUES (21, 2, 1, '2025-07-15 18:00:00');

--5. Lấy danh sách suất chiếu theo phim (GetShowtimesByMovie)
SELECT Showtimes1.ShowtimeID, Showtimes1.StartTime, Theaters1.Name AS TheaterName
FROM Showtimes1
JOIN Theaters1 ON Showtimes1.TheaterID = Theaters1.TheaterID
WHERE Showtimes1.MovieID = 2;

-- 6. BookTicket (Đặt vé xem phim)
INSERT INTO Tickets1(TicketID, ShowtimeID, CustomerID, SeatNumber)
VALUES (101, 21, 11, 'A5');

--7. CheckSeatAvailability (Kiểm tra ghế đã được đặt hay chưa)
SELECT SeatNumber
FROM Tickets1
WHERE ShowtimeID = 21 AND SeatNumber = 'A5';

--8. AddCustomer (Thêm khách hàng mới)
INSERT INTO Customers1 (CustomerID, Name, Email, Phone)
VALUES (11, 'Nguyễn Văn Nam', 'nam.nguyen@example.com', '0987654321');

--9. GetCustomerBookings (Xem lịch sử đặt vé của khách hàng)
SELECT Tickets1.TicketID, Tickets1.SeatNumber, Showtimes1.StartTime, Movies1.Title
FROM Tickets1
JOIN Showtimes1 ON Tickets1.ShowtimeID = Showtimes1.ShowtimeID
JOIN Movies1 ON Showtimes1.MovieID = Movies1.MovieID
WHERE Tickets1.CustomerID = 11;

--10. CancelBooking (Hủy vé đã đặt)
DELETE FROM Tickets1
WHERE TicketID = 101;

