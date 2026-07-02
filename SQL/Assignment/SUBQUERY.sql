CREATE DATABASE subquerydb;
USE subquerydb;

CREATE TABLE employee(
emp_id INT PRIMARY KEY,
ename VARCHAR(30),
job_desc VARCHAR(20),
salary INT,
branch_id INT
);

INSERT INTO employee VALUES
(1,'Ram','ADMIN',1000000,2),
(2,'Harini','MANAGER',2500000,2),
(3,'George','SALES',2000000,1),
(4,'Ramya','SALES',1300000,2),
(5,'Meena','HR',2000000,3),
(6,'Ashok','MANAGER',3000000,1),
(7,'Abdul','HR',2000000,1),
(8,'Karthik','ENGINEER',1000000,2),
(9,'Raghu','CEO',8000000,3),
(10,'Arvind','MANAGER',2800000,3);

-- Q1. Find employees earning more than average salary. 
SELECT * FROM employee
WHERE salary >(
SELECT AVG(salary)as avg_salary FROM employee) ;

-- Q2. Find employees earning less than average salary. 

SELECT * FROM employee
WHERE salary<(
SELECT AVG(salary) AS average_salary FROM employee);

-- Q3. Find employee(s) with maximum salary. 
SELECT * FROM employee
WHERE salary = (
SELECT MAX(salary) AS maximum_salary FROM employee);

-- Q4. Find employee(s) with minimum salary. 
SELECT * FROM employee
WHERE salary= (
SELECT MIN(salary) AS maximum_salary FROM employee);

-- Q5. Find employees working in the same branch as Ashok. 
SELECT * FROM employee
WHERE branch_id= (
SELECT branch_id FROM employee
WHERE ename='Ashok');

-- Q6. Find employees working in the same branch as Raghu. 
SELECT * FROM employee
WHERE branch_id= (
SELECT branch_id FROM employee
WHERE ename='Raghu');

-- Q7. Find employees earning more than Ram. 
SELECT * FROM employee
WHERE salary > (
SELECT salary FROM employee
WHERE ename = 'Ram');

-- Q8. Find employees having the second highest salary. 
SELECT * FROM employee
WHERE salary = (
SELECT MAX(salary) FROM employee
WHERE salary < (
SELECT MAX(salary) FROM employee
ORDER BY salary DESC 
LIMIT 2));

SELECT *  FROM employee
WHERE salary < (
SELECT MAX(salary) FROM employee)
ORDER BY salary DESC
LIMIT 1;


-- Q9. Find all employees whose salary is greater than the salary of all HR employees. 
SELECT * FROM employee
WHERE salary =(
SELECT MAX(salary) FROM employee
WHERE ename= 'HR' < (
SELECT MAX(salary) FROM employee
));

-- Q10. Find employees from branches where a manager exists. 
SELECT ename,branch_id FROM employee
WHERE job_desc ='MANAGER';

-- Find employees from branches where a HR exists.
SELECT ename,branch_id FROM employee
WHERE job_desc ='HR';

-- Add a record branch4 in company
INSERT INTO  employee(emp_id,branch_id)  VALUES (11,4);

SET SQL_SAFE_UPDATES =0;

SELECT * FROM employee;

#Exists

SELECT emp_id, ename,branch_id,
CASE
WHEN EXISTS(
SELECT 1 FROM employee
WHERE branch_id = 2
)THEN 'YES'
ELSE 'NO' 
END AS branch_id_Exists
FROM employee;
SELECT emp_id, ename, branch_id,
CASE
  WHEN EXISTS(
    SELECT 1 FROM employee e2
    WHERE e2.emp_id = employee.emp_id AND e2.branch_id = 2
  ) THEN 'YES'
  ELSE 'NO' 
END AS branch_id_Exists
FROM employee;

SELECT 1 FROM employee
WHERE branch_id = 2