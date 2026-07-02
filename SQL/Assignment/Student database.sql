-- Create Database
CREATE DATABASE StudentDB;
USE StudentDB;

-- create Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    marks INT
);

-- Insert sample Data
INSERT INTO Students (student_name, age, city, marks)
VALUES
('Arun', 20, 'Chennai', 85),
('Priya', 21, 'Bangalore', 92),
('Rahul', 19, 'Hyderabad', 76),
('Sneha', 22, 'Chennai', 88),
('Kiran', 20, 'Mumbai', 67),
('Anjali', 21, 'Pune', 81),
('Vikram', 23, 'Delhi', 73);

-- Ticket #101 — Student Verification Report
-- The training department wants to review complete student details before certification processing.
SELECT * FROM Students;

-- Ticket #102 — Chennai Operations Request
-- The Chennai operations team requested details of students enrolled from Chennai.
SELECT * FROM Students
WHERE city="Chennai"; 

-- Ticket #103 — Performance Review
-- Management wants to review student performance from highest marks to lowest marks.
SELECT * FROM Students
ORDER BY marks DESC;

-- Ticket #104 — Enrollment Analytics
-- The analytics team wants to know the total number of students currently enrolled.
SELECT COUNT(*) FROM Students;

-- Ticket #105 — Regional Analysis
-- The business team wants to identify all unique cities from which students registered.
SELECT  DISTINCT City AS Unique_cities FROM Students;


-- Ticket #106 — Scholarship Eligibility
-- The academic department wants details of students who scored more than 80 marks.
SELECT * FROM Students
WHERE marks > 80;

-- Ticket #107 — Quick Review Request
-- During a review meeting, management requested only the first 3 student records for quick analysis.
SELECT * FROM Students
LIMIT 3;

-- Ticket #108 — Name Pattern Search
-- The HR team wants details of students whose names start with the letter ‘A’.
SELECT * FROM Students
ORDER BY student_name ASC
LIMIT 2;

-- Ticket #109 — Average Performance Report
-- Management requested the average marks scored by students.
SELECT AVG(marks) AS average_marks FROM Students;

-- Ticket #110 — Marks Revaluation Update
-- After revaluation, Arun’s marks were updated to 95 by the academic team.
UPDATE Students
SET  marks = 95
WHERE student_id =1;

SELECT * FROM Students;





