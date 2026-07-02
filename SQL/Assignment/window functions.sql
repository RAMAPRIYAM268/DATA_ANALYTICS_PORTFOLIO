CREATE DATABASE windowfunctiondb;
USE windowfunctiondb;

CREATE TABLE sales(
sale_id INT,
salesperson VARCHAR(30),
branch VARCHAR(30),
sales_amount INT,
sale_month VARCHAR(20)
);

INSERT INTO sales VALUES
(1,'Ram','Chennai',50000,'Jan'),
(2,'Priya','Chennai',70000,'Jan'),
(3,'Kavin','Chennai',70000,'Jan'),
(4,'Meena','Mumbai',60000,'Jan'),
(5,'John','Mumbai',90000,'Jan'),
(6,'Arjun','Mumbai',60000,'Jan'),
(7,'Ram','Chennai',80000,'Feb'),
(8,'Priya','Chennai',75000,'Feb'),
(9,'Kavin','Chennai',85000,'Feb'),
(10,'Meena','Mumbai',65000,'Feb'),
(11,'John','Mumbai',95000,'Feb'),
(12,'Arjun','Mumbai',70000,'Feb');

SELECT * FROM sales;

-- The Finance wants a unique ranking of salespeople based on sales. 
#ROW_NUMBER()
SELECT distinct salesperson,
row_number() OVER (order by sales_amount DESC) AS Ranks   FROM sales;

#RANK()
SELECT distinct salesperson,sales_amount,
RANK() OVER (order by sales_amount DESC) AS Ranks   FROM sales;

#Tie allowed Gap occurs - DENSE_RANK()
SELECT distinct salesperson,sales_amount,
DENSE_RANK() OVER (order by sales_amount DESC) AS Ranks   FROM sales;

#PARTITION_BY
SELECT distinct salesperson,sales_amount,branch,
DENSE_RANK() OVER ( PARTITION BY branch order by sales_amount DESC) AS Ranks   FROM sales;

