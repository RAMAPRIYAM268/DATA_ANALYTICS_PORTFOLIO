CREATE DATABASE traveldb;
USE traveldb;
CREATE TABLE Cities(
City_id INT AUTO_INCREMENT  PRIMARY Key,
City_name VARCHAR(100),
Country VARCHAR(100));

INSERT INTO Cities(City_name,Country)
VALUES("Delhi","India"),
("Dubai","UAE"),
("Paris","France"),
("New York","US");

CREATE TABLE Flights(
Flight_id INT AUTO_INCREMENT  PRIMARY KEY,
From_city INT,
To_city INT,
Flight_date DATE,
--  Data Connection/Table Relationship
FOREIGN KEY(From_city) REFERENCES Cities(City_id),
FOREIGN KEY(To_city) REFERENCES Cities(City_id)
);

INSERT INTO Flights(From_City,To_City,Flight_date)
VALUES(1,2,"2025-09-12"),
(2,3,"2025-09-15"),
(3,4,"2025-09-20");



CREATE TABLE Passengers(
Passenger_id INT AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(100),
Flight_id INT,
FOREIGN KEY (Flight_id) REFERENCES Flights(Flight_id));

INSERT INTO Passengers(Name,flight_id)
VALUES("Bhuvaneshwaran",1),
("Malathi",2),
("Bharathi",1),
("Swetha",3);

-- Display all the columns or Entire table
SELECT * FROM traveldb.Cities;

#Display the city name column
SELECT City_name FROM Cities;
#Display multiple column
SELECT City_name,Country FROM Cities;
#Filter Indian Cities
SELECT * FROM Cities 
WHERE Country = "India";

#Show Delhi and India(AND gate)
SELECT * FROM Cities 
WHERE Country ="India" AND City_name ="Delhi";
#OR gate
SELECT * FROM Cities 
WHERE Country ="India" OR Country = "US";

SELECT * FROM traveldb.Flights;
#Show the Flight after Flightdate
SELECT * FROM Flights
WHERE Flight_date >"2025-09-13";
#Sorting the Desc in Flight_id
SELECT Flight_id FROM Flights
ORDER BY Flight_id Desc;

SELECT * FROM traveldb.Passengers;
#Show Passengers in Flight_id =1
SELECT * FROM Passengers
WHERE Flight_id = 1;
#NOT gate
SELECT * FROM Passengers
WHERE Name !="Malathi";
#Sorting pass name
SELECT Name FROM Passengers
ORDER BY Name Desc;
