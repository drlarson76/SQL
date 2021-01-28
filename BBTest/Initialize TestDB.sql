/* Initialize TestDB 
	Insert records into Customer, Discount, and Product tables in testdb.
    Tables created by Create TestDB.sql.alter
    
    Sales_by_Product tables initialized in "Initialize Sales.sql"	
    
    August 2020 drl*/

use testdb ;

/* Customer (Customer_Key integer PRIMARY KEY AUTO_INCREMENT,
	Customer_ID integer,
    Name text,
    State text,
    Country text) ; */
insert into customer (Customer_ID, Name, State, Country )
	values (5, 'Joe', 'ND', 'USA') ;
insert into customer (Customer_ID, Name, State, Country )
	values	(6, 'Pete', 'ND', 'USA') ;
insert into customer (Customer_ID, Name, State, Country )
	values	(7, 'Sam', 'HI', 'USA') ;
insert into customer (Customer_ID, Name, State, Country )
	values	(8, 'Harry', 'AK', 'USA') ;
insert into customer (Customer_ID, Name, State, Country )
	values	(9, 'Sam', 'BC', 'Canada') ;
insert into customer (Customer_ID, Name, State, Country )
	values	(10, 'Harry', 'BC', 'Canada') ; 

select * from customer ;

/* Discount (Discount_Key integer PRIMARY KEY AUTO_INCREMENT,
	Category_Name text,
    Discount_Type text) ; */
insert into Discount (Category_Name, Discount_Type )
	values ('Stuff1', 'None') ;
insert into Discount (Category_Name, Discount_Type )
	values ('Stuff1', 'Coupon') ;
insert into Discount (Category_Name, Discount_Type )
	values ('Stuff2', 'None') ;
insert into Discount (Category_Name, Discount_Type )
	values ('Stuff2', 'Coupon') ;
insert into Discount (Category_Name, Discount_Type )
	values ('Clothing', 'None') ;
insert into Discount (Category_Name, Discount_Type )
	values ('Clothing', 'Coupon') ;

select * from Discount ;

/* Product (Product_Key integer PRIMARY KEY AUTO_INCREMENT,
	Product_Code integer,
	Category_Name text) ; */

insert into Product (Product_Code, Category_Name )
	values (107, 'Stuff1') ;
insert into Product (Product_Code, Category_Name )
	values (108, 'Stuff2') ;
insert into Product (Product_Code, Category_Name )
	values (109, 'Clothing') ;

select * from Product ;

/* Sales_by_Product is initiated in seperate script */



