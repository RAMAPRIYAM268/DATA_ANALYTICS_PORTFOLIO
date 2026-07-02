CREATE DATABASE ordermanagementDB;
USE ordermanagementDB;

-- CUSTOMER TABLE
CREATE TABLE Customers(
Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(100));

INSERT Customers(Name)
VALUES("Arjun"),
("Priya"),
("Kavin"),
("Meena");


-- ORDER TABLE
CREATE TABLE Orders(
Order_ID INT PRIMARY KEY,
Customer_ID INT,
Order_Date DATE,
FOREIGN KEY(Customer_ID) REFERENCES Customers(Customer_ID));

INSERT Orders(Order_ID,Customer_ID,Order_Date)
VALUES(101,1,"2026-01-10"),
(102,1,"2026-01-15"),
(103,2,"2026-01-18"),
(104,4,"2026-01-20");

-- PRODUCT TABLE
CREATE TABLE Products(
Product_ID INT PRIMARY KEY,
Product VARCHAR(100));

INSERT Products(Product_ID,Product)
VALUES(201,"Laptop"),
(202,"Mobile"),
(203,"Mouse");

-- ORDER DETAILS
CREATE TABLE OrderDetails(
Order_ID INT ,
Product_ID INT,
Quantity INT,
FOREIGN KEY(Order_ID) REFERENCES Orders(Order_ID),
FOREIGN KEY(Product_ID) REFERENCES Products(Product_ID));

INSERT OrderDetails(Order_ID,Product_ID,Quantity)
VALUES(101,201,1),
(101,203,2),
(102,202,1),
(103,203,3);


-- 1.Display customer names with their order IDs. 
SELECT C.Name,O.Order_ID
FROM Customers C INNER JOIN Orders O
ON C.Customer_ID = O.Customer_ID;

-- 2.Show customer names and order dates. 
SELECT C.Name,O.Order_Date
FROM Customers C INNER JOIN Orders O
ON C.Customer_ID = O.Customer_ID;

-- 3.Display all customers who placed orders. 
SELECT DISTINCT C.Name
FROM Customers C INNER JOIN Orders O
ON C.Customer_ID = O.Customer_ID;

-- 4.Show order ID and customer name for each order. 
SELECT O.Order_ID,C.Name
FROM Customers C INNER JOIN Orders O
ON C.Customer_ID = O.Customer_ID;

-- 5.Show product names purchased in each order. 
SELECT O.Order_ID,P.Product
FROM Products P INNER JOIN OrderDetails O 
ON P.Product_ID = O.Product_ID;

-- 6.Display all customers including customers who never placed orders. 
SELECT O.Order_ID,C.Name
FROM  Customers C LEFT JOIN Orders O
ON C.Customer_ID = O.Customer_ID;

-- 7.Find customers without orders.
SELECT C.Name
FROM Customers C LEFT JOIN Orders O
ON C.Customer_ID = O.Customer_ID
WHERE O.Order_ID IS NULL;
 
-- 8.Show all customers and their order dates if available. 
SELECT C.Name,O.Order_Date
FROM Customers C LEFT JOIN Orders O
ON C.Customer_ID = O.Customer_ID;

-- 9.Display all products even if never ordered. 
SELECT P.Product,O.Order_ID
FROM Products P LEFT JOIN OrderDetails O 
ON P.Product_ID = O.Product_ID;

-- 10.Find products that were never purchased. 
SELECT P.Product
FROM Products P LEFT JOIN OrderDetails O 
ON P.Product_ID = O.Product_ID
WHERE O.Product_ID IS NULL;

-- 11.Display all orders including orders with invalid customer IDs. 
SELECT O.Order_ID,C.Customer_ID,C.Name
FROM Customers C RIGHT JOIN Orders O
ON C.Customer_ID = O.Customer_ID;

-- 12.Show all order IDs and customer names.Even unmatched orders must appear.
SELECT O.Order_ID,C.Name
FROM Customers C RIGHT JOIN Orders O
ON C.Customer_ID = O.Customer_ID;

-- 13.Find orders that do not have valid customers. 
SELECT O.Order_ID,C.Customer_ID,C.Name
FROM Customers C RIGHT JOIN Orders O
ON C.Customer_ID = O.Customer_ID
WHERE C.Customer_ID IS NULL;

