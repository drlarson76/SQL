/* Initialize TestDB */

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
/* insert into Product (Product_Code, Category_Name )
	values (105, 'Clothing') ;
insert into Product (Product_Code, Category_Name )
	values (108, 'Stuff3') ; */

select * from Product ;

/* Sales_by_Product (Order_Date date, 	Order_Number integer,     Customer_Key integer,
    Product_Key integer,     Discount_Key integer,     Unit_Quantity integer,
    Discount_Dollars real,    Net_Product_Dollars real,    Total_Order_Dollars real) ; */

/* insert into Sales_by_Product values ('2020-01-01', 505, 1, 
									2, null, 1, 
                                    null, 25.00, 25.00 ) ;
insert into Sales_by_Product values ('2018-06-01', 505, 1, 
									2, null, 1, 
                                    null, 25.00, 25.00 ) ;
insert into Sales_by_Product values ('2017-01-01', 505, 1, 
									2, null, 1, 
                                    null, 25.00, 25.00 ) ;
insert into Sales_by_Product values ('2020-01-01', 505, 1, 
									2, null, 1, 
                                    null, 25.00, 25.00 ) ;

select * from Sales_by_Product; */

