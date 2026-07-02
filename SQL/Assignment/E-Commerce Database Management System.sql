CREATE DATABASE EcommerceDB;
USE EcommerceDB;

-- Customers Data
CREATE TABLE CustomersData(
CustomerID INT AUTO_INCREMENT PRIMARY KEY,
CustomerName VARCHAR(100),
Age INT,
Gender VARCHAR(100),
City VARCHAR(100));

INSERT INTO CustomersData (CustomerName,Age,Gender,City)
VALUES("Arjun",28,"Male","Chennai"),
("Priya",31,"Female","Coimbatore"),
("Rahul",26,"Male","Madurai"),
("Sneha",24,"Female","Salem"),
("Kavin",35,"Male","Trichy");

-- Products Data
CREATE TABLE ProductsData(
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Category VARCHAR(100),
Price INT
);

INSERT INTO ProductsData(ProductID,ProductName,Category,Price)
VALUES(101,"Laptop","Electronics",55000),
(102,"Mobile","Electronics",22000),
(103,"Shoes","Fashion",2500),
(104,"Watch","Accessories",3200),
(105,"Chair","Furniture",4500);

-- Orders Data
CREATE TABLE OrdersData(
OrderID INT PRIMARY KEY,
CustomerID INT,
ProductID INT,
OrderDate DATE,
TotalAmount INT,
FOREIGN KEY (CustomerID) REFERENCES CustomersData(CustomerID),
FOREIGN KEY (ProductID) REFERENCES ProductsData(ProductID));

INSERT INTO OrdersData(OrderID,CustomerID,ProductID,OrderDate,TotalAmount)
VALUES(1001,1,101,"2026-05-10",55000),
(1002,2,103,"2026-05-11",2500),
(1003,3,102,"2026-05-12",22000),
(1004,4,104,"2026-05-13",3200),
(1005,5,105,"2026-05-14",4500);

SELECT * FROM CustomersData;
SELECT * FROM ProductsData;
SELECT * FROM OrdersData;

-- 1.Count total number of customers.
SELECT COUNT(*) AS Total_number_Customers FROM CustomersData;

-- 2.Count total number of products. 
SELECT COUNT(*) AS Total_number_Products FROM ProductsData;

-- 3.	Find highest product price. 
SELECT MAX(Price) AS Highest_ProductPrice FROM ProductsData;
 
-- 4.	Find lowest product price. 
SELECT MIN(Price) AS Lowest_ProductPrice FROM ProductsData;

-- 5.	Calculate total sales amount from Orders table. 
SELECT SUM(TotalAmount) As Total_SalesAmount FROM OrdersData;

-- 6.	Find average product price. 
SELECT AVG(Price) AS Average_ProductPrice FROM ProductsData;

-- 7.	Show unique product categories. 
SELECT DISTINCT Category AS Unique_ProductCategories FROM ProductsData;

-- 8.	Display first 2 products only. 
SELECT * FROM ProductsData
LIMIT 2;

-- 9.	Rename CustomerName as Customer and City as Location. 
SELECT CustomerName AS Customer ,City AS Location FROM CustomersData;

-- 10.	Rename ProductName as Item and Price as Cost.
SELECT  ProductName AS Item ,Price AS Cost FROM ProductsData;

-- 11.	Find length of each product name. 
SELECT ProductName,LENGTH(ProductName) AS Length_ProductName FROM ProductsData;

-- 12.	Display all customer names in uppercase. 
SELECT UPPER(CustomerName) AS Upper_CustomerName FROM CustomersData;

-- 13.	Display all categories in lowercase. 
SELECT LOWER(Category) AS Lower_Category FROM ProductsData;

-- 14.	Divide TotalAmount by 4 and round the value. 
SELECT ROUND(TotalAmount/4) AS RoundValue FROM OrdersData;

-- 15.	Multiply product price by 2. 
SELECT Price *2 AS ProductPrice FROM ProductsData;

-- 16.	Show OrderID with Year and Month from OrderDate. 
SELECT YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth FROM OrdersData;
 
-- 17.	Show current date and time. 
SELECT NOW() AS Current_DateTime;

-- 18.	Show products with price greater than 5000. 
SELECT * FROM ProductsData
WHERE Price > 5000;

-- 19.	Show customers from Chennai. 
SELECT * FROM CustomersData
WHERE City = "Chennai";

-- 20.	Show products under Electronics category. 
SELECT * FROM ProductsData
WHERE Category = "Electronics";

-- 21.	Show orders where TotalAmount above 10000. 
SELECT * FROM OrdersData
WHERE TotalAmount >10000;

-- 22.	Display products by price descending order. 
SELECT * FROM ProductsData
ORDER BY Price DESC ;

-- 23.	Show customers sorted by name.
SELECT * FROM CustomersData
ORDER BY CustomerName ;
 
-- 24.	Count how many products belong to Electronics category. 
SELECT COUNT(Category ="Electronics") AS Electronics_Category FROM ProductsData;

-- 25.	Find average order amount. 
SELECT AVG(TotalAmount) AS OrderAmount FROM OrdersData;

-- 26.	Find maximum order amount. 
SELECT MAX(TotalAmount) AS Maximum_OrderAmount FROM OrdersData;

-- 27.	Find minimum order amount. 
SELECT MIN(TotalAmount) AS Minimum_OrderAmount FROM OrdersData;

-- 28.	Show product price after adding GST 18%. 
SELECT ProductName, Price + 1.18 AS Price_GST FROM ProductsData;

-- 29.	Show customer names with city together
SELECT CONCAT(CustomerName,"-",City) AS CustomerName_City FROM CustomersData;


