-- DATABASEW CREATION 
CREATE DATABASE moviesdb;
USE moviesdb;

-- Table Creation
CREATE TABLE movies(
MovieID INT AUTO_INCREMENT PRIMARY KEY,
MovieName VARCHAR(100),
Language VARCHAR(100),
Rating INT,
CollectionAmount INT);

-- DATA Insertion
INSERT movies(MovieName,Language,Rating,CollectionAmount)
VALUES("Padayaapa","Tamil",5,150000),
("Karuppu","Tamil",4.5,100000),
("Singam","Hindi",3,50000),
("Killi","Tamil",4,100000),
("Premam","Malayalam",5,200000);

-- Request #1
-- Management wants to view all movie details.
SELECT * FROM movies;

-- Request #2
-- The analytics team wants to identify movies with ratings greater than 8.
SELECT * FROM movies 
WHERE Rating >8;

-- Request #3
-- The operations team wants movies sorted based on collection amount from highest to lowest.
SELECT * FROM movies 
ORDER BY CollectionAmount DESC;

-- Request #4
-- The business team wants to know all unique languages available on the platform.
SELECT DISTINCT Language FROM movies;

-- Request #5
-- Management requested the average movie rating.
SELECT AVG(Rating) AS average_movierating FROM movies;

-- Request #6
-- The support team requested movies with collection amounts between a suitable range.
SELECT * FROM movies 
WHERE CollectionAmount BETWEEN 100000 AND 200000;

-- Request #7
-- After review, one movie rating needs to be updated.
UPDATE movies 
SET Rating= 7
WHERE MovieID = 1;

SELECT * FROM movies;







