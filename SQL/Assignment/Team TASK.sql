CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE,
    bonus DECIMAL(10,2),
    phone_number VARCHAR(20)
);

INSERT INTO Employees VALUES
(101, ' Arun Kumar ', 'HR', 45000.75, '2022-01-15', 5000, '9876543210'),
(102, 'Priya Sharma', 'IT', 65000.50, '2021-07-10', NULL, '9123456780'),
(103, 'Rahul Verma', 'Finance', 55000.20, '2020-03-22', 7000, NULL),
(104, 'Sneha Iyer', 'IT', 72000.99, '2019-11-01', 8000, '9988776655'),
(105, 'Kiran Das', 'Sales', 39000.40, '2023-05-18', NULL, NULL);

SELECT * FROM employees;

# Display Uppercase for employee_name
select upper (employee_name) from employees;

#The Finance team wants that total_salary of employee the salary is greater than 50,000
select sum(salary) from employees
where salary > 50000;


-- TEAM B 
-- Database: CompanyDB → Employees Table
# Q1. Find the total number of employees in the company.
 select count(*) from employees;
 
# Q2. Find the average salary of employees.
select avg(salary) from employees;

# Q3. Find the highest salary in the company.
select max(salary) from employees;

# Q4. Find the minimum salary in the company.
select min(salary) from employees;

# Q5. Find the total bonus amount given to employees.
select sum(bonus) as total_bonus from employees;

# Q6. Display department-wise employee count.
select department ,count(department) from employees
group by (department);

# Q7. Display average salary department-wise.
select department ,avg(salary) from employees
group by (department);

# Q8. Display departments where average salary is greater than 50000.
select department ,avg(salary) from employees
group by (department)
having avg(salary)>50000;

# Q9. Display departments having more than one employee.
select department ,count(employee_id) from employees
group by department
having count(employee_id) > 1;

# Q10. Display department-wise highest salary.
select department ,max(salary) from employees
group by (department)
order by max(salary) desc;

-- TEAM C
-- Database: CompanyDB → Employees Table

-- Q1. Display employees whose bonus value is NULL.
SELECT  * FROM employees
WHERE bonus IS NULL;

-- Q2. Replace NULL bonus values with 0.
UPDATE employees
SET bonus = 0
WHERE bonus IS  NULL;

SET SQL_SAFE_UPDATES= 0;

SELECT * FROM employees;

-- Q3. Display employees whose phone number is NULL.
SELECT * FROM employees
WHERE phone_number IS NULL;

-- Q4. Categorize employees as:
-- • High Salary
-- • Medium Salary
-- • Low Salary
-- based on salary range.

SELECT employee_name, salary,
CASE
WHEN salary >50000 THEN 'High'
WHEN salary BETWEEN 50000 AND 40000 THEN 'Medium'
ELSE 'Low'
END AS salary_category
FROM employees;

-- Q5. Display:
-- • “Bonus Available”
-- • “No Bonus”
-- based on bonus column.
SELECT employee_name,bonus ,
CASE
WHEN bonus > 0 THEN 'Bonus Available'
ELSE 'No Bonus'
END AS Bonus_category
FROM employees;

-- Q6. Display employees who joined after 2021.
SELECT * FROM employees
WHERE joining_date > '2021-12-31';

-- Q7. Display employee names in lowercase format.
SELECT LOWER(employee_name) AS employee_names FROM employees;

-- Q8. Remove extra spaces from employee names.
SELECT REPLACE(employee_name,' ','')AS EMPLOYEE_NAME FROM employees;

-- Q9. Display salary rounded to nearest integer.
SELECT ROUND(salary) AS salary_rounded FROM employees;

-- Q10. Display employee names containing the letter “a”.
SELECT employee_name FROM employees
WHERE employee_name LIKE "%a%";


-- TEAM A 

-- Database: CompanyDB → Employees Table

-- Q1. Management wants all employee names displayed in uppercase format.
SELECT UPPER(employee_name) AS employee_names FROM employees;

-- Q2. Display employees working in the IT department.
SELECT * FROM employees
WHERE department ='IT';

-- Q3. Find the length of each employee name.
SELECT employee_name,LENGTH(employee_name) AS length_employeename FROM employees
GROUP BY employee_name;

-- Q4. Display employees whose salary is greater than 50000.
SELECT employee_name, salary FROM employees
WHERE salary > 50000;

-- Q5. Display employees whose names start with the letter “S”.
SELECT * FROM employees
WHERE employee_name LIKE "S%";

-- Q6. Display employee names and departments together in a single column.
SELECT CONCAT(employee_name," - ",department) AS EMPLOYEENAME_DEPARTMENT FROM employees;

-- Q7. Find employees whose salary falls between 40000 and 70000.
SELECT employee_name , salary FROM employees
where salary BETWEEN 40000 AND 70000;

-- Q8. Display employees sorted by salary from highest to lowest.
SELECT employee_name ,salary FROM employees
ORDER BY salary DESC;

-- Q9. Display only unique departments available in the company.
SELECT DISTINCT department FROM employees;

-- Q10. Display the current system date and time.
SELECT NOW() AS CURRENT_DATETIME;

-- TEAM D 
-- Database: CompanyDB → Employees Table

-- Q1. Management wants employee names in uppercase only for employees from the IT department.
SELECT UPPER(employee_name) AS employee_name , department FROM employees
 WHERE department = 'IT';

-- Q2. Display employee details where salary is greater than 50000 and department is IT.
SELECT employee_name,salary FROM employees
WHERE department = 'IT' AND salary > 50000;

-- Q3. Display employees whose bonus is not available.
SELECT employee_name, bonus FROM employees
WHERE bonus = 0;

-- Q4. Display employee details sorted by joining date.
SELECT * FROM employees
ORDER BY joining_date ;

-- Q5. Find total salary paid department-wise.
SELECT SUM(salary) AS total_salary ,department FROM employees
GROUP BY department;

-- Q6. Display departments where total salary is greater than 100000.
SELECT SUM(salary) AS total_salary ,department FROM employees
GROUP BY department
HAVING SUM(salary) > 100000;

-- Q7. Display employee name and joining year together.
SELECT CONCAT(employee_name," | " ,YEAR(joining_date)) AS employee_details FROM employees;

-- Q8. Display the top 3 highest-paid employees.
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 3;

-- Q9. Display employees whose names end with the letter “a”.
SELECT employee_name FROM employees
WHERE employee_name LIKE ('%a');

-- Q10. After appraisal, update the bonus of employees in the HR department by adding 2000.
UPDATE employees
SET bonus = bonus + 2000
WHERE department = 'HR';

SET SQL_SAFE_UPDATES= 0;

SELECT * FROM employees;
