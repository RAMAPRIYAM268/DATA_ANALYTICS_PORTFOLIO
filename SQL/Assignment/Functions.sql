CREATE DATABASE function_db;
USE function_db;
CREATE TABLE employee_details(
emp_id INT,
emp_name VARCHAR(50),
email VARCHAR(100),
salary DECIMAL(10,2),
joining_date DATE,
city VARCHAR(50)
);

INSERT INTO employee_details VALUES
(1,'  ram ','RAM@GMAIL.COM',10000.50,'2024-01-15','chennai'),
(2,'Priya','priya@gmail.com',25000.75,'2023-06-10','CHENNAI'),
(3,'KAVIN','KAVIN@GMAIL.COM',18000.00,'2022-12-01','Coimbatore'),
(4,'meena',NULL,22000.00,'2021-08-15','coimbatore'),
(5,'John','john@gmail.com',30000.00,'2020-05-20','MUMBAI');

SELECT * FROM employee_details;
SELECT emp_name,upper(emp_name) AS EMP_NAME ,city, upper(city) AS CITY FROM  employee_details;
-- Convert all cities to uppercase
SELECT city, upper(city) AS CITY FROM  employee_details;

-- Store all emails in lowercase
SELECT email,lower(email) AS low_email FROM employee_details;

-- Remove unwanted spaces
SELECT trim(emp_name) FROM employee_details;


-- Validate name length  before space --leading(LTRIM) after space --trailing(RTRIM)
SELECT emp_name, LENGTH(TRIM(emp_name)) FROM employee_details;

-- Q1 HR wants employee names without leading or trailing spaces.
SELECT  (TRIM(emp_name)) AS EMP_NAME  FROM employee_details;
SELECT trim((UPPER(LEFT(emp_name,1)),lower(SUBSTRING(emp_name,2)))) AS EMP_NAME FROM employee_details;


-- Q2 Generate all emails in lowercase format.
SELECT 
-- Q3 Find employees whose names exceed 5 characters.
-- Q4 Generate joining dates in DD-MM-YYYY format.
-- Q5 Display current system date and time.
-- Q6 Round employee salaries to nearest whole number.
-- Q7 Display highest salary.
-- Q8 Display average salary.
-- Q9 Generate employee emails.
-- If email missing:
-- Email Not Available
-- Q10 Display city.
-- If city missing:
-- Unknown City
-- Q11 Classify employees:
-- >25000 = High
-- 15000-25000 = Medium
-- <15000 = Low
-- Q12 Classify employees based on experience.
-- Q13 Display unique cities.
-- Q14 Display unique email domains.
-- Q15 Prepare employee names in a consistent format.
-- Q16 Prepare city names in uppercase.
-- Q17 Prepare email addresses in lowercase.




