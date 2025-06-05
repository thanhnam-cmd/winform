CREATE DATABASE ShopGiay;
GO

USE ShopGiay;

CREATE TABLE Users (
    id INT IDENTITY PRIMARY KEY,
    username NVARCHAR(50) NOT NULL UNIQUE,
    password NVARCHAR(50) NOT NULL,
    isAdmin BIT DEFAULT 0
);

CREATE TABLE Products (
    id INT IDENTITY PRIMARY KEY,
    name NVARCHAR(100),
    description NVARCHAR(255),
    price DECIMAL(10, 2),
    image NVARCHAR(255)
);

CREATE TABLE Cart (
    id INT IDENTITY PRIMARY KEY,
    userId INT,
    productId INT,
    quantity INT,
    FOREIGN KEY (userId) REFERENCES Users(id),
    FOREIGN KEY (productId) REFERENCES Products(id)
);
