CREATE DATABASE school_db;
USE school_db;
CREATE TABLE faculty
(
faculty_id INT PRIMARY KEY,
name VARCHAR(100),
age INT
);
INSERT INTO faculty(faculty_id,name,age)
VALUES
(1,"Rama",21),
(2,"Priya",20),
(3,"malathi",45),
(4,"Swetha",55),
(5,"Bhuvi",60),
(6,"muthamil",70);
SELECT * FROM school_db.faculty;

CREATE TABLE users(
user_id INT AUTO_INCREMENT PRIMARY KEY,
user_name VARCHAR(50),
user_grade VARCHAR(10)
);

INSERT INTO users(user_name,user_grade)
VALUES
("Divi","A"),
("Ravi","B"),
("Priya","C");
SELECT * FROM school_db.users;