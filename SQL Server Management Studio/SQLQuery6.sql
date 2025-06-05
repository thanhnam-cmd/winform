create database baitapveso2;
go
use Baitapvenhaso2

create table userss(
users_id int not null,
first_name varchar(255),
last_name varchar(255),
address varchar(255),
email varchar(255),
PRIMARY KEY(users_id),
);
create table ordersssss(
orders_id int not null,
users int,
product_ordered int,
total_paid int,
PRIMARY KEY (orders_id),
);
create table productsssss(
product_id int,
product_name varchar(255),
descriptions varchar(255),
price int not null,
PRIMARY KEY (price),
);