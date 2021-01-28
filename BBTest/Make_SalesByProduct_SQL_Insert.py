# Make_SalesByProduct_SQL_Insert

# Generate SQL Insert statements to populate Sales_by_Product table for BB Test.
# For an order number, randomly asigns
#   Number of Items
#   Year
#   Month 
#   Customer
#   Product Key
#   Discount Key for a given Product Key 
#   Discount Dollars by Discount Key
#   Quantity
#   Total Dollars
#   Net Dollars = Total Dollars - Discount Dollars
 
# 3/23/2020 drl

import random

# Sales_by_Product Table description
# /* Sales_by_Product (Order_Date date, 	Order_Number integer,     Customer_Key integer,
    # Product_Key integer,     Discount_Key integer,     Unit_Quantity integer,
    # Discount_Dollars real,    Net_Product_Dollars real,    Total_Order_Dollars real) ; */

# Insert statement example.
# /* insert into Sales_by_Product values ('2020-01-01', 505, 1, 
									# 2, null, 1, 
                                    # null, 25.00, 25.00 ) ; */

# for order number up to number
for ONum in range(510,610):
 
    for NI in range(0,random.choice([1, 1, 1, 2, 3, 4])):
        # Choose number of items from 1 to 4

        # Order Year 17, 18, 19
        YY = (random.choice([2017, 2018, 2019]))
        # Order Month 4, 5, 6
        MM = random.choice([4, 5, 6])
        # Order Customer 1 to 6
        CK = random.choice(range(1, 6)) 
        # Product_Key 1 to 3  Category_Name in Product and Discount tables must match.
        PK = random.choice([1, 2, 3])
        # Discount Key None, 1 to 6
        if PK == 1:
            DK = random.choice([1, 1, 1, 1, 2])
        elif PK == 2 :
            DK = random.choice([3, 3, 3, 3, 4])
        elif PK == 3 :
            DK = random.choice([5, 5, 5, 5, 6])



        # Discount Dollars 0 to X.  If Discount Key = 2, 4, 6
        if DK == 2 or DK == 4 or DK == 6:
            DD = random.randrange(1, 30, 2)
        else:
            DD = 0
        # Quantity 1 to 3
        QQ = random.choice([1, 2, 3])
        # Total Dollars 2x Discount to Z.  > Discount.
        TD = random.randrange( (2*DD+100), 4*(2*DD+100), 1)
        # Net Dollars 0 to Y.  = Total - Discount
        ND = TD-DD 

        print('insert into Sales_by_Product values (\''
                + str(YY) +  '-0' + str(MM) + '-01\', ' + str(ONum) + ', ' + str(CK)
                + ', ' + str(PK) + ', ' + str(DK) + ', ' + str(QQ)
                + ', ' + str(DD) + ', ' + str(ND) + ', ' + str(TD) 
                + ');')
