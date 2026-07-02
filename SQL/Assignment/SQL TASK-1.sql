CREATE DATABASE company_db;
USE company_db;

CREATE TABLE Employees(
Emp_ID INT AUTO_INCREMENT PRIMARY KEY,
Emp_Name VARCHAR(100),
Department VARCHAR(100),
Salary VARCHAR(100),
City VARCHAR(100));

INSERT INTO Employees(EMP_Name,Department,Salary,city)
VALUES("Arun Kumar","HR",25000,"Chennai"),
("Priya","IT",40000,"Bangalore"),
("Ravi","Finance",35000,"Hyderabad"),
("Sneha","IT",42000,"Chennai"),
("Karthik","Sales",30000,"Coimbatore");

SELECT * FROM company_db.Employees;

CREATE TABLE Customers(
Cust_ID INT PRIMARY KEY,
Cust_Name VARCHAR(200),
Product VARCHAR(200),
Amount INT,
City VARCHAR(200));

INSERT INTO Customers(Cust_ID,Cust_Name,Product,Amount,City)
VALUES(201,"Meena","Laptop",55000,"Chennai"),
(202,"Rajesh","Mobile",25000,"Madurai"),
(203,"Divya","Headphone",3000,"Chennai"),
(204,"Harish","Tablet",18000,"Salem"),
(205,"Lakshmi","Printer",12000,"Trichy");

SELECT * FROM company_db.Customers;

CREATE TABLE Students(
Stu_Id INT PRIMARY KEY,
Stu_Name VARCHAR(200),
Course VARCHAR(200),
Fees INT,
Location VARCHAR(200));

INSERT INTO Students(Stu_Id,Stu_Name,Course,Fees,Location)
VALUES(301,"Anitha","Python",15000,"Chennai"),
(302,"Vignesh","SQL",12000,"Erode"),
(303,"Pooja","Power BI",18000,"Coimbatore"),
(304,"Manoj","Java",20000,"Madurai"),
(305,"Keerthana","Data Science",25000,"Chennai");

SELECT * FROM company_db.Students;


