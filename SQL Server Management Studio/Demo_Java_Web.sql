CREATE DATABASE springBD;
USE springBD;

DROP TABLE IF EXISTS users;DROP TABLE userss;
CREATE TABLE emp99 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary VARCHAR(100),
    designation VARCHAR(100)
);

CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age VARCHAR(100),
    noisinh VARCHAR(100)
);

CREATE TABLE menu (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100),
    url VARCHAR(100)
);
INSERT INTO menu (name, url) VALUES
    ('Home', '/Demo_JavaWeb_Menu/'),
    ('Employees List', '/BT_Buoi5/viewemp'),
    ('Add New Employees', '/BT_Buoi5/empform');

UPDATE menu
SET url = REPLACE(url, '/BT_Buoi5/', '/Demo_JavaWeb_Menu/')
WHERE url LIKE '%/BT_Buoi5/%';

SELECT*FROM  menu;

CREATE TABLE users (
    ID INT PRIMARY KEY,
    userName VARCHAR(100),
    password VARCHAR(100)
);
Insert into users(ID,userName,password) values
(1,'admin','123456');


SElect *from users;