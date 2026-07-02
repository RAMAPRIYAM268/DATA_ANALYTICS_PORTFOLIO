CREATE DATABASE hospitaldb;
USE hospitaldb;
-- DOCTORS
CREATE TABLE Doctors(
doctor_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
specialization VARCHAR(100),
experience_years INT
);

INSERT INTO Doctors(name,specialization,experience_years)
VALUES("Dr.Sharma","Cardiologist",12),
("Dr.Mehta","Neurologist",8),
("Dr.Ramesh","Orthopedic",15);

-- PATIENTS
CREATE TABLE Patients(
patient_id INT PRIMARY KEY,
name VARCHAR(100),
age INT,
gender VARCHAR(100)
);

INSERT INTO Patients(patient_id ,name,age,gender)
VALUES(101,"Anjali",45,"F"),
(102,"Rajesh",60,"M"),
(103,"Priya",30,"F"),
(104,"Sunil",55,"M");

-- APPOINMENTS
CREATE TABLE Appoinments(
appoinment_id INT PRIMARY KEY,
Patient_id INT,
doctor_id INT,
appoinment_date VARCHAR(100),
status VARCHAR(100),
FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id));

INSERT INTO Appoinments(appoinment_id,patient_id,doctor_id,appoinment_date,status)
VALUES(201,101,1,"2023-06-01","Completed"),
(202,102,2,"2023-06-05","Pending"),
(203,103,1,"2023-06-07","Completed"),
(204,104,3,"2023-06-10","Pending");

-- TREATMENTS
CREATE TABLE Treatments(
treatment_id INT PRIMARY KEY,
appoinment_id INT,
treatment_details VARCHAR(100),
cost INT,
FOREIGN KEY (appoinment_id) REFERENCES Appoinments(appoinment_id)
);

INSERT INTO Treatments(treatment_id,appoinment_id,treatment_details,cost)
VALUES(301,201,"Heart Checkup",7000),
(302,203,"Blood Pressure Test",1500),
(303,204,"Bone Fracture Care",9000);

--  Display all doctors and their specializations.
SELECT * FROM Doctors;

-- Show all patients older than 40 years. 
 SELECT * FROM Patients
 WHERE "age"< 40 ;
 
-- List all appointments with status = "Pending".  
SELECT * FROM Appoinments
WHERE status ="Pending";

-- Display all patients in ascending order of their age. 
SELECT * FROM Patients
ORDER BY age ASC;

-- Show all treatments costing more than 5000. 
 SELECT * FROM Treatments
 WHERE cost > 5000;
 
-- Display the names of doctors who have more than 10 years of experience.  
SELECT name FROM Doctors
WHERE experience_years > 10;
