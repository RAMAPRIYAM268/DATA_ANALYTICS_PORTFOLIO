CREATE DATABASE joindb;
USE  joindb;

CREATE TABLE department(
dept_id INT PRIMARY KEY,
dept_name VARCHAR(30),
location VARCHAR(50)
);

CREATE TABLE student(
stu_id INT PRIMARY KEY,
stu_name VARCHAR(30),
course VARCHAR(30),
fees INT,
dept_id INT,
FOREIGN KEY(dept_id) REFERENCES department(dept_id)
); 

INSERT INTO department VALUES
(1,'Computer Science','Block A'),
(2,'Electronics','Block B'),
(3,'Mechanical','Block C'),
(4,'Civil','Block D');

INSERT INTO student VALUES
(101,'Arjun','Python',50000,1),
(102,'Priya','Java',60000,2),
(103,'Kavin','Python',55000,1),
(104,'Meena','Data Science',70000,3),
(105,'Raghu','Java',60000,2),
(106,'John','C++',45000,NULL),
(107,'Vidya','Python',50000,NULL);

-- Display dept_id value as dept_name value in student table
SELECT s.stu_id,s.stu_name,s.course,s.fees,d.dept_name
FROM department d INNER JOIN student s
ON d.dept_id = s.dept_id;

-- Display dept_id value as dept_name value and display all in student table
SELECT s.stu_id,s.stu_name,s.course,s.fees,d.dept_name
FROM department d RIGHT JOIN student s
ON d.dept_id = s.dept_id;

-- display  all  departments which is allocated and also not allocated 
SELECT s.stu_id,s.stu_name,s.course,s.fees,d.dept_name
FROM department d LEFT JOIN student s
ON d.dept_id = s.dept_id;

-- Q1
-- Display all students with their departments.
SELECT s.*,dept_name
FROM student s JOIN department d
ON s.dept_id = d.dept_id;

-- Q2
-- Find students not assigned to any department.
SELECT s.*,dept_name
FROM student s LEFT JOIN department d
ON s.dept_id = d.dept_id
WHERE dept_name IS NULL;

-- Q3
-- Display student names and department locations.
SELECT s.stu_name,d.location
FROM student s JOIN department d
ON s.dept_id = d.dept_id;

-- Q4
-- Count total students in each department.
SELECT COUNT(s.stu_id) as total_student,d.dept_name
FROM student s RIGHT JOIN department d
ON s.dept_id = d.dept_id
GROUP BY d.dept_name;

-- Q1
-- Display student name and department name.
SELECT s.stu_name,d.dept_name
FROM student s JOIN department d
ON s.dept_id = d.dept_id;

-- Q2
-- Display student name, course and department location.
SELECT s.stu_name,s.course,d.location
FROM student s JOIN department d
ON s.dept_id = d.dept_id;

-- Q3
-- Display only students who belong to a department.
SELECT s.*,dept_name
FROM student s JOIN department d
ON s.dept_id = d.dept_id
WHERE dept_name IS NOT NULL;

-- Q4
-- Display department name and student fees.
SELECT d.dept_name,s.fees
FROM student s JOIN department d
ON s.dept_id = d.dept_id;

-- Q1
-- Display all departments with students.
SELECT s.stu_name,d.*
FROM student s RIGHT JOIN department d
ON s.dept_id = d.dept_id;

-- Q2
-- Find departments without students.
SELECT s.stu_name,d.*
FROM student s RIGHT JOIN department d
ON s.dept_id = d.dept_id
WHERE s.stu_name IS NOT NULL ;

-- Q3
-- Display department names and student courses.
SELECT d.dept_name,s.course
FROM student s JOIN department d
ON s.dept_id = d.dept_id;

-- Q4
--  Count students in each department.
SELECT COUNT(s.stu_id) as Count_student,d.dept_name
FROM student s RIGHT JOIN department d
ON s.dept_id = d.dept_id
GROUP BY d.dept_name;

-- Display stu_name and dept_name  and to show one student in all department
SELECT s.stu_name,d.dept_name
FROM student s , department d;

-- drop the student table
DROP TABLE student;


CREATE TABLE student(
stu_id INT PRIMARY KEY,
stu_name VARCHAR(30),
course VARCHAR(30),
fees INT,
mentor_id INT
);


INSERT INTO student VALUES
(101,'Arjun','Python',50000,NULL),
(102,'Priya','Java',60000,101),
(103,'Kavin','Python',55000,101),
(104,'Meena','Data Science',70000,102),
(105,'Raghu','Java',60000,102),
(106,'John','C++',45000,103),
(107,'Vidya','Python',50000,NULL);

-- Display studentname and their mentor names(SELF JOIN)
SELECT s.stu_name as student ,m.stu_name as mentor
FROM student s LEFT JOIN student m
ON m.stu_id = s.mentor_id;

drop table student;


