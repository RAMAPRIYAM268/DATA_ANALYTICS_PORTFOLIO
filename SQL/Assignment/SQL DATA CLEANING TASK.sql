CREATE DATABASE sqldatacleaning;
USE sqldatacleaning;

CREATE TABLE employee_master(
emp_id INT,
emp_name VARCHAR(50),
email VARCHAR(100),
mobile VARCHAR(20),
department VARCHAR(30),
city VARCHAR(50)
);

INSERT INTO employee_master VALUES
(1,'  ram kumar ','RAM@GMAIL.COM','9876543210','IT','chennai'),
(2,'Priya Sharma','PRIYA@YAHOO.COM','9876543211','HR','CHENNAI'),
(3,'kavin raj','kavin@gmail.com','9876543212','IT','Coimbatore'),
(4,'John Peter',NULL,'9876543213','Finance','MUMBAI'),
(5,'MEENA','MEENA@GMAIL.COM','9876543214','HR','coimbatore');

SELECT * FROM employee_master;


#HR Data Cleanup Requests
#DC-01: Generate employee names without leading or trailing spaces.
SELECT TRIM(emp_name) AS EMP_NAME FROM employee_master;

#DC-02: Standardize all employee names into uppercase format.
SELECT upper(emp_name) AS EMPLOYEENAME FROM employee_master;

#DC-03: Standardize all email addresses into lowercase format.
SELECT LOWER(email) AS email_format  FROM employee_master;

#DC-04: Generate a report showing the number of characters in each employee name.
SELECT emp_name, LENGTH(TRIM(emp_name)) AS no_char_emp_name FROM employee_master;

#DC-05: Identify employees whose names exceed 10 characters.
SELECT emp_name, LENGTH(TRIM(emp_name)) AS no_char_emp_name FROM employee_master
WHERE LENGTH(TRIM(emp_name))= 10;

#Employee Verification Requests
#DC-06: Generate a list of employees whose email address belongs to Gmail.
SELECT * FROM employee_master
WHERE email LIKE"%gmail%";

#DC-07: Generate a list of employees whose names begin with the letter M.
SELECT * FROM employee_master
WHERE emp_name LIKE"M%";

#DC-08: Display the first 5 characters of every employee name.
SELECT  LEFT(TRIM(emp_name),5) AS EMP_NAME  FROM employee_master;

#DC-09: Display the last 4 digits of each employee's mobile number.
SELECT RIGHT(mobile,4) AS MOBILE FROM employee_master;

#Data Standardization Requests
#DC-10: Generate a report showing employee name and city in the format EMPLOYEE_NAME - CITY.
SELECT CONCAT(emp_name,' - ',city) AS EMPLOYEE_NAME_CITY FROM employee_master;

#DC-11: Generate an output where the city name CHENNAI is displayed as CHENNAI HQ.
SELECT REPLACE(city,'CHENNAI','CHENNAI HQ') AS CITY FROM employee_master;

#DC-12: Generate employee email addresses. If an email address is missing, display Email Not Available.
SELECT IFNULL(email,'Email Not Available') AS EMAIL  FROM employee_master;

#DC-13: Generate a unique list of cities available in the employee database.
SELECT DISTINCT city FROM employee_master;

#DC-14: Identify employees whose email address is missing.
SELECT * FROM employee_master
WHERE email IS NULL;

#HR Migration Readiness Report
#DC-15: Generate a migration-ready employee report containing Employee Name, Email Address, Department, City, and Email Status.
SELECT emp_name AS EmployeeName,
email As EmailAddress,
department AS  Department,
city AS City,
'Pending Review' AS EmailStatus FROM employee_master;
#OR
SELECT emp_name AS EmployeeName,
email AS EmailAddress,
department AS  Department,
city AS City,
CASE
	WHEN email IS NULL OR email = ''THEN ' NOT Available'
    ELSE ' Available'
END AS EmailStatus FROM employee_master;


#Advanced Reporting Requests
#DC-16: Generate employee initials from employee names. Example: Ram Kumar → RK.
SELECT emp_name,
CONCAT(
   UPPER(LEFT(TRIM(emp_name),1)),
UPPER(LEFT(SUBSTRING_INDEX(TRIM(emp_name
),' ',-1),1))
 )AS initials FROM employee_master;
 
#DC-17: Identify employees whose mobile number contains duplicate digits more than three times.
SELECT mobile FROM employee_master
WHERE mobile REGEXP '(0.*0.*0.*0|1.*1.*1.*1|2.*2.*2.*2|3.*3.*3.*3|4.*4.*4.*4|5.*5.*5.*5|6.*6.*6.*6|7.*7.*7.*7|8.*8.*8.*8|9.*9.*9.*9)';

#DC-18: Generate employee usernames using the first three letters of the employee name and last four digits of the mobile number.
SELECT emp_name, CONCAT(UPPER(LEFT(TRIM(emp_name),3)),
RIGHT(mobile,4))
AS usernames FROM employee_master;

#DC-19: Generate a city-wise employee count report.
SELECT city,COUNT(*) AS employee_count FROM employee_master
GROUP BY city;

#DC-20: Generate a department-wise employee count report.
SELECT department,COUNT(*) AS employee_count FROM employee_master
GROUP BY department;