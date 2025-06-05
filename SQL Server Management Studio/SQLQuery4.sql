-- Create the database
CREATE DATABASE ShopGiaySport;
GO

-- Use the database
USE ShopGiaySport;
GO

-- Create Users1 table
CREATE TABLE Users1 (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) NOT NULL ,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    fullName VARCHAR(100) NOT NULL
);
GO

-- Create Products table
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Description VARCHAR(500),
    ImageURL VARCHAR(200),
    Stock INT NOT NULL
);
GO

CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NULL,
    ProductID INT NULL,
    Quantity INT NULL,
    Total DECIMAL(10,2) NULL,
    OrderDate DATETIME NULL,
    CONSTRAINT FK_Orders_Users FOREIGN KEY (UserID) REFERENCES Users1(UserID),
    CONSTRAINT FK_Orders_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO

-- Insert sample data into Users1
INSERT INTO Users1 (username, password, email, fullName)
VALUES 
    ('user1', 'password123', 'user1@example.com', 'Nguyen Van A'),
    ('user2', 'password456', 'user2@example.com', 'Tran Thi B'),
    ('user3', 'password789', 'user3@example.com', 'Le Van C');
GO

-- Insert sample data into Products
INSERT INTO Products (Name, Price, Description, ImageURL, Stock)
VALUES 
    ('Giày Sneaker Trắng', 500000.00, N'Giày thể thao màu trắng, phong cách hiện đại', 'images/sneaker_white.jpg', 50),
    ('Giày Thể Thao Đen', 600000.00, N'Giày thể thao màu đen, bền bỉ và thoải mái', 'images/sneaker_black.jpg', 30),
    ('Giày Cao Gót Đỏ', 450000.00, N'Giày cao gót màu đỏ, sang trọng', 'images/heels_red.jpg', 20),
    ('Giày Sandal Nâu', 300000.00, N'Sandal mùa hè, nhẹ và thoáng khí', 'images/sandal_brown.jpg', 40);
GO

INSERT INTO Orders (UserID, ProductID, Quantity, Total, OrderDate)
VALUES 
    (1, 1, 2, 1000000.00, '2025-05-17 14:07:00'), -- User1 buys 2 Sneaker Trắng
    (1, 2, 1, 600000.00, '2025-05-17 14:08:00'),  -- User1 buys 1 Thể Thao Đen
    (2, 3, 1, 450000.00, '2025-05-17 14:09:00');  -- User2 buys 1 Cao Gót Đỏ
GO
-- Verify the data
SELECT * FROM Users1;
SELECT * FROM Products;
GO