CREATE DATABASE MovieStreamDB;
USE MovieStreamDB;

-- Movies
CREATE TABLE movies(
movie_id INT AUTO_INCREMENT PRIMARY KEY,
movie_name VARCHAR(100) ,
genre  VARCHAR(100) ,
language  VARCHAR(100) ,
subscription_type  VARCHAR(100) ,
rating INT,
views INT,
release_year YEAR);

INSERT  INTO movies (
movie_name,genre,language,subscription_type,rating,views,release_year )
VALUES ("Dark Code","Sci-Fi","English","Premium",4.8,120000,"2023"),
("Love Beats","Romance","Tamil","Basic",4.1,80000,"2022"),
("Crime Hunt","Thriller","Hindi","Premium",4.7,150000,"2024"),
("Space War","Sci-Fi","English","VIP",4.9,250000,"2024"),
("Funny Days","Comedy","Tamil","Basic",3.9,40000,"2021"),
("Royal Blood","Drama","Hindi","Premium",4.5,95000,"2023"),
("Hidden Truth","Thriller","Malayalam","VIP",4.6,110000,"2022"),
("Future City","Sci-Fi","English","Premium",4.3,70000,"2021");

SELECT * FROM movies;

-- 1.	Display movies with rating greater than 4.5. 
SELECT * FROM movies
WHERE rating > 4.5;

-- 2.	Display English movies with Premium subscription. 
SELECT * FROM movies
WHERE language = "English" AND  subscription_type = "Premium";

-- 3.	Display Tamil or Hindi movies. 
SELECT * FROM movies
WHERE language = "Tamil" OR language= "English";

-- 4.	Display movies released between 2022 and 2024. 
SELECT * FROM movies
WHERE release_year BETWEEN "2022" AND "2024";

-- 5.	Count total movies available in each genre. 
SELECT genre,COUNT(movie_name) AS total_movies FROM movies
GROUP BY  genre;

-- 6.	Display total views for each language. 
SELECT language,SUM(views) AS total_views FROM movies
GROUP BY language;

-- 7.	Find average rating for each subscription type. 
SELECT subscription_type,AVG(rating) AS average_rating FROM movies
GROUP BY subscription_type;

-- 8.	Display genres having more than 1 movie. 
SELECT genre,COUNT(movie_name) AS movie FROM movies
GROUP BY genre 
HAVING COUNT(movie_name) > 1 ;

-- 9.	Display subscription types having average rating greater than 4.5. 
SELECT subscription_type,AVG(rating) AS average_rating FROM movies
GROUP BY subscription_type
HAVING AVG(rating) > 4.5;

-- 10.	Add a new column called WatchTime to the movies table. 
ALTER TABLE movies 
ADD WatchTime TIME;

-- 11.	Update WatchTime values for different movies. 
UPDATE movies 
SET WatchTime = CASE movie_id
WHEN 1 THEN "3:00"
WHEN 2 THEN "2:00"
WHEN 3 THEN "3:00"
WHEN 4 THEN "1:30"
WHEN 5 THEN "3:00"
WHEN 6 THEN "2:30"
WHEN 7 THEN "2:45"
WHEN 8 THEN "2:00" 
END;

-- 12.	Add another column called DirectorName. 
ALTER TABLE movies
ADD COLUMN DirectorName VARCHAR(100);

-- 13.	Update DirectorName with same value for all rows. 
UPDATE movies
SET DirectorName = "Manirathinam";

-- 14.	Rename column movie_name to Movie_Title. 
ALTER TABLE  movies
RENAME COLUMN movie_name TO Movie_Title;

-- 15.	Add default value 1 to a new column called AwardsWon. 
ALTER TABLE movies
ADD COLUMN Awardswon INT DEFAULT 1;

-- 16.	Insert a new movie record without giving AwardsWon value. 
ALTER TABLE movies
DROP COLUMN Awardswon;

