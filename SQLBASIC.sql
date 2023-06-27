
################################## Retail Mart Management #######################################
Task to be performed:

Write a query to create a database named SQL basics.
Write a query to select the database SQL basics.
Write a query to create a product table with fields as product code, product name, price, stock and category, customer table with the fields as customer id, customer name, customer location, and customer phone number and, sales table with the fields as date, order number, product code, product name, quantity, and price.
Write a query to insert values into the tables.
Write a query to add two new columns such as S_no and categories to the sales table.
Write a query to change the column type of stock in the product table to varchar.
Write a query to change the table name from customer-to-customer details.
Write a query to drop the columns S_no and categories from the sales table.
Write a query to display order id, customer id, order date, price, and quantity from the sales table.
Write a query to display all the details in the product table if the category is stationary.
Write a query to display a unique category from the product table.
Write a query to display the sales details if quantity is greater than 2 and price is lesser than 500 from the sales table.
Write a query to display the customer’s name if the name ends with a.
Write a query to display the product details in descending order of the price.
Write a query to display the product code and category from similar categories that are greater than or equal to 2.
Write a query to display the order number and the customer name to combine the results of the order and the customer tables including duplicate rows.




###########################################################################################

Create database SQLBASIC;
use SQLBASIC;

#########################################################################################

create table Product (

ProductCode INT PRIMARY KEY,
ProductName VARCHAR(100),
Price Decimal(10,2),
Stoke INT,
Category VARCHAR(100)
);

create table customer (

CustomerId INT PRIMARY KEY,
CustomerName VARCHAR(100),
CustomerLocation VARCHAR(100),
CustomerPhoneNUMBER INT
);

create table Sales (

Date DATE,
    OrderNumber INT,
    ProductCode INT,
    ProductName VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (ProductCode) REFERENCES Product(ProductCode)

);

###############################################################################################


INSERT INTO Product ( ProductCode , ProductName , Price , Stoke , Category )
VALUES 
( 1 , 'Product 1 ' , 10.2 , 50 , 'CA' ),
( 2 , 'Product 2' , 13.5 , 20 , 'CB' ),
( 3 , 'Product 3' , 10 , 80 , 'CC' )

DESC Product;

INSERT INTO Customer(CustomerID , CustomerName,CustomerLocation,CustomerPhoneNUMBER )
VALUES 
( 1 ,"MK" , "UK" , 076545678 ),
(2, "CK " ,"USA", 567890) ,
(3, "PP" , "LONDON" , 324565)

DESC Customer;

INSERT INTO Sales ( Date , OrderNumber, ProductName , Quantity , Price )
VALUES 
( 29/12/1996 , "Product 1 " , 34 , 50.6 ),
( 12/3/1334 , "Product 2" , 23, 45.687 ),
( 23/3/4567 , "Product 3" , 34 , 34.5 )

USE SQLBASIC;

######################################################################

ALTER TABLE Sales
ADD S_NO INT,
	ADD Categories VARCHAR(50);
    
####################################################################

ALTER TABLE Product
MODIFY STOKE VARCHAR(50);

##################################################################

ALTER TABLE Sales
DROP COLUMN S_no,
DROP COLUMN Categories;

###############################################################

SELECT OrderNumber, Date, Price, Quantity
From Sales;

#############################################################

SELECT * FROM Product
WHERE Category = 'stationary';

##################################################################

SELECT distinct Category
FROM Product;

######################################################################

SELECT * FROM Sales
WHERE Quantity > 2 AND Price < 500;

#########################################################################

SELECT CustomerName
FROM Customer
WHERE CustomerName LIKE '%a';

#######################################3

SELECT *
FROM Product
ORDER BY Price DESC;

########################################

SELECT ProductCode, Category
FROM Product
GROUP BY ProductCode, Category
HAVING COUNT(*) >= 2;

###################################################

SELECT OrderNumber, CustomerName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;