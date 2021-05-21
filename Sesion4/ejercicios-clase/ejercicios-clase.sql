CREATE DATABASE IF NOT EXISTS DataScience;

-- Delete DB
DROP DATABASE DataScience;

USE DataScience;

CREATE TABLE IF NOT EXISTS users (
   id INT PRIMARY KEY, 
   genero VARCHAR(1), 
   edad INT,
   ocup INT,
   cp VARCHAR(20)
);

DROP TABLE IF EXISTS users;
-- ---------------------------------------------------------------------------------------------------------
-- --------------------------------------Reto 1 ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS movies(
	id INT PRIMARY KEY,
    title VARCHAR(80),
    genres VARCHAR(80)
);
DESCRIBE movies;


CREATE TABLE IF NOT EXISTS ratings(
	iduser INT,
    idmovie INT,
    rating 	INT,
    time_stamp BIGINT,
    FOREIGN KEY(iduser) REFERENCES users(id),
    FOREIGN KEY(idmovie) REFERENCES movies(id)
);
DESCRIBE ratings;








