/* Create TestDB  */

drop database if exists TestDB ;
create database TestDB ;

use TestDB ;
drop table if exists Customer ;
drop table if exists Discount ;
drop table if exists Product ;
drop table if exists Sales_by_Product ;

create table Customer (Customer_Key integer PRIMARY KEY AUTO_INCREMENT,
	Customer_ID integer,
    Name text,
    State text,
    Country text) ;

create table Discount (Discount_Key integer PRIMARY KEY AUTO_INCREMENT,
	Category_Name text,
    Discount_Type text) ;

create table Product (Product_Key integer PRIMARY KEY AUTO_INCREMENT,
	Product_Code integer,
	Category_Name text) ;

create table Sales_by_Product (Order_Date date,
	Order_Number integer,
    Customer_Key integer,
    Product_Key integer,
    Discount_Key integer,
    Unit_Quantity integer,
    Discount_Dollars real,
    Net_Product_Dollars real,
    Total_Order_Dollars real) ;


 