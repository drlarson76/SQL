/* BBTest.sql */

/* How many customers are from the United States, excluding AK and HI? */
select count(Customer_ID) as Customer_Count
	from Customer
	where Country = 'USA'
		and State <> 'AK' and State <> 'HI' ;

/*  How many orders had a total unit quantity over 10 during June in 2018? */

select count(*) as Orders_Over_10
	from
	(select sum(Unit_Quantity) as Order_Quantity
		from Sales_by_Product
		where year(Order_Date) = '2018'
			and monthname(Order_Date) = 'June'
		group by Order_Number ) Q1
	where Q1.Order_Quantity > 10 ;
	

/* Identify whether any duplicate product codes exist. */

/* Method 1, assumes Product_Key unique and will produce multiple
	entries for Product_Code duplicates */
select p1.Product_Code as Has_Duplicate_Product_Code
	from Product p1
	join Product p2
	on p1.Product_Code = p2.Product_Code
		and p1.Product_Key <> p2.Product_Key ;

/* Method 2, more complicated, but only 1 Product_Code output per duplicate */
select distinct p1.Product_Code as Has_Duplicate_Product_Code_B
	from Product p1, 
		(select p3.Product_Code, count(p3.Product_Code) as Count_Product_Code
			from Product p3
			join Product p4
				on p3.Product_Code = p4.Product_Code
			group by p3.Product_Code) p2
		where p1.Product_Code = p2.Product_Code
			and p2.Count_Product_Code > 1 ;
	

/* 8. What was the total net product dollars in 2018 from 
	Canadian customers who used a “coupon” discount type on 
	any order during 2017? */

select sum(S.Net_Product_Dollars) as Total_Net_Product_Dollars_2017
	from  Sales_by_Product S 
	join  Customer C
		on S.Customer_Key = C.Customer_Key
	where C.Customer_Key in
		(select S2.Customer_Key 
			from  Sales_by_Product S2 
			join  Customer C
				on S2.Customer_Key = C.Customer_Key
			join Discount D
				on S2.Discount_Key = D.Discount_Key
		where D.Discount_Type = 'coupon' 
			and year(S2.Order_Date) = '2017' )
	and C.Country = 'Canada'
	and year(S.Order_Date) = '2018' ;


select sum(S.Net_Product_Dollars) as Total_Net_Product_Dollars_2017_B
	from  Sales_by_Product S 
	join  Customer C
		on S.Customer_Key = C.Customer_Key
	where C.Customer_Key in
		(select S2.Customer_Key 
			from  Sales_by_Product S2 
			join  Customer C
				on S2.Customer_Key = C.Customer_Key
			join Discount D
				on S2.Discount_Key = D.Discount_Key
		where D.Discount_Type = 'coupon' )
	and C.Country = 'Canada'
	and year(S.Order_Date) = '2017' ;
	



/* Question has both '2018' and '2017', I used '2017' */ 
select sum(S.Net_Product_Dollars) as Total_Net_Product_Dollars_2017_C
	from  Sales_by_Product S 
	join  Customer C
		on S.Customer_Key = C.Customer_Key
	join Discount D
		on S.Discount_Key = D.Discount_Key
	where C.Country = 'Canada'
		and Discount_Type = 'coupon'
		and year(S.Order_Date) = '2017' ;

/* 9. What is the average order value of all orders that 
	contained products in the “clothing” category, 
	excluding any major outliers in the average order value amounts? */

/* Method 2, Outlier by Number of Std Deviations from Mean */
set @N_Std_Dev = 2 ; -- Outliers by StdDev
select avg(Q1.Clothes_Order_Value) as Average_Clothes_Order_Value_M2
	from  
		(select S.Order_Number,
			sum(Total_Order_Dollars) as Clothes_Order_Value
		from Sales_by_Product S
		where S.Order_Number in 
			(select S2.Order_Number
				from Sales_by_Product S2
				join Product P
					on S2.Product_Key = P.Product_Key
				where P.Category_Name = 'clothing' )
		group by S.Order_Number
		) Q1,

		(select avg(Sub1.Clothes_Order_Value) as CAve,
			stddev(Sub1.Clothes_Order_Value) as CStd
			from 
			(select S.Order_Number,
				sum(Total_Order_Dollars) as Clothes_Order_Value
				from Sales_by_Product S
				where S.Order_Number in 
					(select S2.Order_Number
						from Sales_by_Product S2
						join Product P
							on S2.Product_Key = P.Product_Key
						where P.Category_Name = 'clothing' )
				group by S.Order_Number ) Sub1
		) Q2
	where abs(Q1.Clothes_Order_Value - Q2.CAve) < @N_Std_Dev*Q2.CStd ;

		select avg(Sub1.Clothes_Order_Value) as CAve,
			stddev(Sub1.Clothes_Order_Value) as CStd
			from 
			(select S.Order_Number,
				sum(Total_Order_Dollars) as Clothes_Order_Value
				from Sales_by_Product S
				where S.Order_Number in 
					(select S2.Order_Number
						from Sales_by_Product S2
						join Product P
							on S2.Product_Key = P.Product_Key
						where P.Category_Name = 'clothing' )
				group by S.Order_Number ) Sub1 ;


/* Method 1, set a fixed outlier threshold */
set @OrderOutlier := 1000 ;  -- Choose Order Outlier Value
select avg(Q1.Clothes_Order_Value) as Average_Clothes_Order_Value_M1
		from 
        (select S.Order_Number, sum(S.Total_Order_Dollars) as Clothes_Order_Value
		from Sales_by_Product S
		where S.Order_Number in 
			(select S2.Order_Number
				from Sales_by_Product S2
				join Product P
					on S2.Product_Key = P.Product_Key
				where P.Category_Name = 'clothing' )
			group by S.Order_Number
		) Q1
		where  Q1.Clothes_Order_Value < @OrderOutlier ;
		-- group by Q1.Order_Number ;



			

