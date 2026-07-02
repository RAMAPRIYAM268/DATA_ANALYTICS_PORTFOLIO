CREATE DATABASE salesdb;
USE salesdb;

-- Products Table
CREATE TABLE Products(
ProductID INT AUTO_INCREMENT PRIMARY KEY,
ProductName VARCHAR(100),
Category VARCHAR(100),
Price INT);

INSERT INTO Products(ProductName,Category,Price)
VALUES ("Laptop","Electronics",55000),
("Mouse","Accessories",500),
("Chair","Furniture",4500),
("Mobile","Electronics",23000);


-- Sales Table
CREATE TABLE Sales(
SalesID INT PRIMARY KEY,
ProductID INT,
Quantity INT,
SaleAmount INT,
SaleDate DATE,
FOREIGN KEY (ProductID) REFERENCES Products(ProductID));

INSERT INTO Sales(SalesID,ProductID,Quantity,SaleAmount,SaleDate)
VALUES(101,1,2,110000,"2024-04-01"),
(102,2,10,5000,"2024-04-02"),
(103,3,3,13500,"2024-04-05"),
(104,1,1,55000,"2024-04-08");

SELECT * FROM Products;
SELECT * FROM Sales;

#Aggregation Function Queries
#1.Count the total numbers of products-COUNT()
SELECT COUNT(*) AS Total_Products FROM Products;

#2.Highest Price-MAX()
SELECT MAX(Price) AS Highest_Price FROM Products;
#3.Lowest SaleAmount-MIN()
SELECT MIN(SaleAmount) AS Lowest_Sale FROM Sales;

#4.Total SaleAmount-SUM()
SELECT SUM(SaleAmount) AS Total_SaleAmount FROM Sales;
#5.Average of Price-AVG()
SELECT AVG(Price) AS Avg_Price FROM Products;

#6.Find the Unique Categories-DISTINCT 
SELECT DISTINCT Category AS Unique_Category FROM Products;
#7.Retrive the Limit rows -LIMIT
SELECT * FROM Products LIMIT 2;
#8.Rename the Columns -AS
SELECT ProductName As PRODUCTNAME,Category AS CATEGORY,Price AS PRICE FROM Products;

#9.Concatenation in SQL -Combining  - CONCAT()
SELECT CONCAT(ProductName,"-",Category) AS Product_Info FROM Products;

#10.ROUND the Values
SELECT SalesID,ROUND(SaleAmount/3) AS Rounded_SaleAmount FROM Sales;

#11.Increasing each Product Price by 10%
SELECT ProductName, Price*1.10 AS Updated_Price FROM Products;

#12. Find the Length of ProductName - LENGTH()
SELECT ProductName,LENGTH(ProductName) AS Length_Name FROM Products;

#13. Convert the text Columns into Cases- UPPER(), LOWER()
SELECT UPPER(ProductName) AS Upper_ProductName , LOWER(Category) AS Lower_Category FROM Products;

#14.Extract the Year and Month in date column - YEAER(),MONTH()
SELECT SalesID, YEAR(SaleDate) AS SaleYear, MONTH(SaleDate) AS SaleMonth FROM Sales;

#15. Current Date and Time - NOW()
SELECT NOW() As Current_DateTime;

-- ADVANCED QUERY
-- QUALIFIER QUERY - WHERE,AND,OR,BETWEEN,LIKE - perform in row level
#select the Products under Electronics - Qualifier WHERE
SELECT * FROM Products
WHERE Category ="Electronics";

#AND
SELECT * FROM Products
WHERE ProductName ="Laptop" AND Category ="Electronics";

#OR
SELECT * FROM Products
WHERE ProductName ="Laptop" OR Category ="Electronics";

#BETWEEN
SELECT * FROM sales
WHERE SaleDate BETWEEN "2024-04-01"AND "2024-04-05";

#LIKE
SELECT * FROM Products
WHERE ProductName LIKE "%top%";
SELECT * FROM Products
WHERE ProductName LIKE "%Mo%";
SELECT * FROM Products
WHERE ProductName LIKE "%air%";

#HAVING CLAUSE - along with GROUP BY,GROUP BY -categoriesation
#GROUP BY
#Total Sales Amount Per Product
SELECT ProductID,SUM(SaleAmount) AS Total_SaleAmount FROM Sales
GROUP BY ProductID;

#HAVING
SELECT ProductID,SUM(SaleAmount) AS Total_SaleAmount FROM Sales
GROUP BY ProductID
HAVING SUM(SaleAmount) > 100000 ;

#Find the Total  Quantity Per Product 
SELECT ProductID,SUM(Quantity) AS Total_Quantity FROM Sales
GROUP BY ProductID
HAVING SUM(Quantity)>=3 ;

#UPDATE - Modify the existing data
# Modify Mobile into Phone
UPDATE Products
SET ProductName ="Phone"
WHERE ProductID=4;

SELECT * FROM Products;

#Modify the Last Product Quantity From 1 to 5
UPDATE sales
SET Quantity =5
WHERE SalesID = 104;
SELECT * FROM Sales;

#ALTER -Modification of Table structure row + column
-- Add a column -Stock
ALTER TABLE Products
ADD Stock INT;
SELECT * FROM Products;

-- Add or fill Values
UPDATE Products 
SET Stock = 50
WHERE ProductID = 1;

UPDATE Products 
SET Stock =40
WHERE ProductID =2;

UPDATE Products 
SET Stock =100
WHERE ProductID =3;

UPDATE Products 
SET Stock =10
WHERE ProductID =4;

#Supplier Column
ALTER TABLE Products
ADD Supplier VARCHAR(100);

SELECT * FROM Products;

UPDATE Products
SET Supplier ="Walmart";

-- Query to disable Safemode
SET SQL_SAFE_UPDATES = 0;

ALTER TABLE Sales
ADD Updated_Stock INT;

SELECT * FROM Sales;

#Instead of using UPDATE QUERY repeatiy
-- CASE,WHEN, THEN -QUERY
UPDATE Sales
SET Updated_Stock = CASE SalesID
WHEN 101  THEN 10
WHEN 102 THEN 20
WHEN 103 THEN 40
WHEN 104 THEN 50
END;

INSERT INTO Products(ProductName,Category,Price,Stock,Supplier)
VALUES ("Keyboard","Accessories",4500,45,"Walmart");

#SET THE DEFAULT VALUE STOCK
ALTER TABLE Products
ALTER Stock SET DEFAULT 50;

SELECT * FROM Products;

INSERT INTO Products(ProductName,Category,Price,Supplier)
VALUES ("Monitor","Electronics",5500,"Walmart");

INSERT INTO Products(ProductName,Category,Price,Supplier)
VALUES ("Mon","Elec",500,"Walmart");

#RENAME a column
ALTER TABLE Products
RENAME COLUMN Price TO Cost;

SELECT Cost FROM Products;

ALTER TABLE Sales
RENAME TO Sales_Data;

SELECT * FROM Sales_Data;

#DROP -column/table
ALTER TABLE Products 
DROP COLUMN Supplier;

SELECT * FROM Products;

DROP TABLE Sales_Data;
DROP DATABASE salesdb;

-- IS NULL operator
SELECT * FROM Products
WHERE ProductName IS NULL;

-- IS NOT NULL 
SELECT * FROM Products
WHERE ProductName IS NOT NULL;

#IN
SELECT * FROM products
WHERE  ProductName IN ('Laptop','Mobile');

SELECT ProductName IN ('Laptop') FROM Products;

