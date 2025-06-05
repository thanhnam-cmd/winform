CREATE DATABASE QLBHfull;
go 
use QLBHfull;
go

-- Tạo bảng Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT
);

-- Tạo bảng Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FullName NVARCHAR(100),
    Position NVARCHAR(50),
    Phone NVARCHAR(20)
);

-- Tạo bảng Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName NVARCHAR(100),
    Phone NVARCHAR(20),
    Email NVARCHAR(100),
    Address NVARCHAR(200)
);

-- Tạo bảng Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Tạo bảng OrderDetails
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Nhập dữ liệu vào bảng Customers
INSERT INTO Customers (CustomerID, FullName, Phone, Email, Address) VALUES
(1, N'Phạm Văn D', '0912345678', 'phamvand@example.com', N'Hoàn Kiếm, Hà Nội'),
(2, N'Nguyễn Thị E', '0923456789', 'nguyenthie@example.com', N'Cầu Giấy, Hà Nội');

-- Nhập dữ liệu vào bảng Products
INSERT INTO Products (ProductID, ProductName, Category, Price, Stock) VALUES
(1, N'Nồi cơm điện', N'Gia dụng', 12000000.00, 50),
(2, N'Máy xay sinh tố', N'Gia dụng', 9000000.00, 30),
(3, N'Bình đun siêu tốc', N'Gia dụng', 5000000.00, 40),
(4, N'Máy sấy tóc', N'Gia dụng', 4000000.00, 35),
(5, N'Lò vi sóng', N'Gia dụng', 20000000.00, 20),
(6, N'Bếp từ', N'Gia dụng', 30000000.00, 25),
(7, N'Quạt điện', N'Gia dụng', 4000000.00, 50),
(8, N'Tủ lạnh mini', N'Gia dụng', 10000000.00, 10),
(9, N'Máy hút bụi', N'Gia dụng', 6000000.00, 15),
(10, N'Bàn ủi hơi nước', N'Gia dụng', 7000000.00, 30);

-- Nhập dữ liệu vào bảng Employees
INSERT INTO Employees (EmployeeID, FullName, Position, Phone) VALUES
(1, N'Nguyễn Văn A', N'Quản lý', '0987654321'),
(2, N'Trần Thị B', N'Nhân viên bán hàng', '0978456123'),
(3, N'Lê Văn C', N'Nhân viên giao hàng', '0967345123');

-- Nhập dữ liệu vào bảng Orders
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, TotalAmount) VALUES
(1, 1, 1, '2025-03-31 08:41:04.880', 32000000.00),
(2, 2, 2, '2025-03-31 08:41:04.880', 4000000.00);

-- Nhập dữ liệu vào bảng OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 1, 12000000.00),
(2, 1, 5, 1, 20000000.00),
(3, 2, 7, 1, 4000000.00);

--1.Lấy tất cả thông tin của khách hàng 
select * from Customers;
--2.Lấy tất car sản phẩm 
select * from Products;
--3.Lấy tất cả đơn hàng 
select * from Employees;
--4. Lấy tất cả nhan viên 
select * from Orders;
--5. Lấy tất cả chi tiết đơn hàng 
select * from OrderDetails;
--6 Lấy sản phẩm có giá trên 1.000.000 VND:
SELECT * FROM Products
WHERE Price > 1000000;
--7 Lọc các sản phẩm thuộc danh mục "Gia dụng":
SELECT * FROM Products
WHERE Category = N'Gia dụng';
--8 Tìm kiếm khách hàng có số đth bắt đầu là '091':
SELECT * FROM Customers
WHERE Phone LIKE '091%';
--9 Lấy danh sách đơn hàng được tạo trong thời gian cụ thể 
SELECT * FROM Orders
WHERE OrderDate BETWEEN '2025-03-01' AND '2025-03-31';
--10 Lấy thông tin nhân viên theo chức vụ cụ thể (ví dụ: "Quản lý"):
SELECT * FROM Employees
WHERE Position = N'Quản lý';

--11 Lấy dan sách đơn hàng kèm theo tên khách hàng 
SELECT Orders.*, Customers.FullName AS CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
--12 Lấy danh sách chi tiết đơn hàng kèm theo tên sản phẩm 
SELECT OrderDetails.*,Products.ProductName AS TenSanPham
FROM OrderDetails
INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID;
--13 Lấy danh sách đơn hàng kèm theo tên nhânn viên bán hàng 
SELECT Orders.*, Employees.FullName AS TenNV
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID;
--14 Lấy danh sách sản phẩm kèm số lượng đã bán 
SELECT Products.ProductName, SUM(OrderDetails.Quantity) AS TongSP
FROM OrderDetails
INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.ProductName;
--15 Tính tổng doanh thu của hàng 
SELECT Products.ProductName, SUM (OrderDetails.UnitPrice) AS TongDoanhThu
FROM OrderDetails
INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
Group by Products.ProductName;
--16 Lấy top 3 sản phẩm bán chạy nhất 
SELECT TOP 3 Products.ProductName, SUM(OrderDetails.Quantity) AS TotalSold
FROM OrderDetails
INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.ProductName
ORDER BY TotalSold DESC;
--17 Lấy thông tin khách hàng đã mua nhiều nhất 
SELECT Customers.*, COUNT(Orders.OrderID) AS TongSPmua
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FullName, Customers.Phone, Customers.Email, Customers.Address
ORDER BY TongSPmua DESC;
--18 Lấy danh sách khách hàng chưa từng mua hàng 
SELECT * 
FROM Customers
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Orders);
--19 Tính tổng số lượng sản phẩm còn trong kho
SELECT SUM(Stock) AS TongSL_tồnkho
FROM Products;
--20 Tìm sản phẩm có giá cao nhất và thấp nhất 
SELECT ProductName, Price
FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products)
   OR Price = (SELECT MIN(Price) FROM Products);