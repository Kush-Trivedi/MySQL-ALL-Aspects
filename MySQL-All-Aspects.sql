--  First List the Databases 

show Databases;

---------------------------------------------------------------------------------------------------------------
-- General command for creating a database:
---------------------------------------------------------------------------------------------------------------
CREATE DATABASE database_name;
-- Example
CREATE DATABASE my_first_database;


---------------------------------------------------------------------------------------------------------------
-- General command for using a database:
---------------------------------------------------------------------------------------------------------------
USE <database_name>;
-- Example
USE my_first_database;


---------------------------------------------------------------------------------------------------------------
-- General command for droping a database: (Do not execute the command: Just for Knowledge)
---------------------------------------------------------------------------------------------------------------
DROP DATABASE database_name;
-- Example
DROP DATABASE my_first_database;


---------------------------------------------------------------------------------------------------------------
-- General command for creating a  Basic table: No Primary Key, No Constraints
---------------------------------------------------------------------------------------------------------------
-- First make sure you have create a database and you use it accordingly to store tables.
CREATE TABLE tablename(
    column_name data_type,
    column_name data_type
);
--  Basic Example we will use NOT Null and much more bellow.
CREATE TABLE Kush(
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    email VARCHAR(255),
    age INT
);

-- To see output 
DESC tablename;
-- Example
DESC Kush;


---------------------------------------------------------------------------------------------------------------
-- General command for creating a table with NOT NULL & Default Constraint: No Primary Key
---------------------------------------------------------------------------------------------------------------
-- First make sure you have create a database and you use it accordingly to store tables
CREATE TABLE tablename(
    column_name data_type,
    column_name data_type
);

CREATE TABLE Kush(
    first_name VARCHAR(40) NOT NULL DEFAULT 'No Firstname Provided',
    last_name VARCHAR(40) NOT NULL DEFAULT 'No Lastname Provided',
    email VARCHAR(255) NOT NULL DEFAULT 'No Email Provided',
    age INT NOT NULL DEFAULT 99
);


---------------------------------------------------------------------------------------------------------------
-- General command for creating a table with Primary Key, NOT NULL & Default Constraint: 
---------------------------------------------------------------------------------------------------------------
-- First make sure you have create a database and you use it accordingly to store tables
CREATE TABLE tablename(
    column_name data_type,
    column_name data_type
);

CREATE TABLE Kush(
    my_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL DEFAULT 'No Firstname Provided',
    last_name VARCHAR(40) NOT NULL DEFAULT 'No Lastname Provided',
    email VARCHAR(255) NOT NULL DEFAULT 'No Email Provided',
    age INT NOT NULL DEFAULT 99,
    PRIMARY KEY (my_id)
);


---------------------------------------------------------------------------------------------------------------
-- General command for inserting data into a table: 
---------------------------------------------------------------------------------------------------------------
INSERT INTO tablename(column_name) VALUES (data);
-- Example
-- Escape the quotes with a backslash: "This text has \"quotes\" in it" or 'This text has \'quotes\' in it'
-- Alternate single and double quotes: "This text has 'quotes' in it" or 'This text has "quotes" in it'

-- CONSTRAINTS PROVIDED
INSERT INTO Kush(first_name,last_name,email,age) VALUES ('Kush','Trivedi','abc@xyz.com',7);

-- CONSTRAINTS PROVIDED BY SETTING VALUE AS 'NULL': Here age will be inserted as NULL 
INSERT INTO Kush(first_name,last_name,email,age) VALUES ('Kush','Trivedi','abc@xyz.com', NULL);

-- NO CONSTRAINT PROVIDED SETS VALUE AS DEFAULT INTO TABLE DATA : Here age will 99 By DEFAULT
INSERT INTO Kush(first_name,last_name,email) VALUES ('Kush','Trivedi','abc@xyz.com');


---------------------------------------------------------------------------------------------------------------
-- General command for selecting & viewing data from a table: 
---------------------------------------------------------------------------------------------------------------
SELECT * FROM tablename;
--Example
SELECT * FROM Kush;


---------------------------------------------------------------------------------------------------------------
-- General command for droping a table: (Do not execute the command: Just for Knowledge)
---------------------------------------------------------------------------------------------------------------
DROP Table <tablename>;
-- Example
DROP Table Kush;


---------------------------------------------------------------------------------------------------------------
-- C-R-U-D commands for creating, reading, updating & deleting a table data 
---------------------------------------------------------------------------------------------------------------
-- First make sure you have create a database and you use it accordingly to store tables.

-- Prepare Table
CREATE TABLE Kush(
    my_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    email VARCHAR(255),
    age INT,
    PRIMARY KEY (my_id)
);
-- Check Table Datatype
DESC Kush;

-- Insert Statement to CREATE data into a Table
INSERT INTO Kush
            (first_name,
             last_name,
             email,
             age)
VALUES      ('Kush','Trivedi','abc@xyz.com', 7),
            ('Kush1','Trivedi','abc@xyz.com',8),
            ('Kush2','Trivedi2','abc@xyz.com',9),
            ('Kush3','Trivedi3','abc@xyz.com',10),
            ('Kush4','Trivedi4','abc@xyz.com',11); 

-- SELECT & WHERE Statement to READ data from a Table.
SELECT * FROM Kush;
SELECT my_id FROM Kush;
SELECT first_name FROM Kush;
SELECT last_name FROM Kush; 
SELECT email FROM Kush; 
SELECT age FROM Kush; 
--
SELECT first_name,last_name FROM Kush;
SELECT Firstname, age FROM Kush;
--
SELECT * FROM Kush WHERE age = 7;
SELECT * FROM Kush WHERE last_name = "Trivedi"
-- Side Note if you want to change column name of a table use 'Aliases'.
SELECT my_id AS id, first_name FROM Kush;
SELECT my_id AS id, first_name AS 'First Name', age AS 'AGE';


-- UPDATE Statement to UPDATE data into a Table.
UPDATE Kush SET last_name = 'Trivedi' WHERE last_name = 'Trivedi3';
UPDATE Kush SET age = 24 WHERE first_name = 'Kush4';

-- DELETE Statement to DELETE data into a Table.
DELETE FROM Kush WHERE first_name = 'Kush';
DELETE FROM Kush WHERE age = 10;
-- Delete everything
DELETE FROM Kush;



---------------------------------------------------------------------------------------------------------------
-- General command for STRING in MySQL
---------------------------------------------------------------------------------------------------------------
-- CONCAT: binding two columns to get desire output
SELECT CONCAT(column_name, ' ', column_name) FROM tablename;
-- Example
SELECT CONCAT(first_name, ' ', last_name) AS 'Full Name' FROM Kush;
SELECT first_name AS 'FirstName', last_name AS 'LastName', CONCAT(first_name,last_name) AS 'Fullname' FROM Kush;

--SUB-STRING: first 2 character name from first name etc and followed by ......(Always use double qoutes)
SELECT SUBSTRING(column_name,from,to) FROM Kush;
-- Example
SELECT SUBSTR(first_name,1,2) AS 'Short Name' FROM Kush;
SELECT CONCAT(SUBSTR(first_name,1,2), '....') AS 'Short Name' FROM Kush;

-- REPLACE: Replace character with other specified one.
SELECT REPLACE(column_name,orignal,new) FROM tablename;
--Example: Also you can use substring inside it
SELECT REPLACE(first_name,'K','Kk') FROM Kush;

-- REVERSE
SELECT REVERSE(column_name) FROM Kush;
-- Example: can concat both result combine
SELECT REVERSE(first_name) FROM Kush;
SELECT CONCAT(first_name, REVERSE(first_name)) FROM Kush;

-- CHAR_LENGTH
SELECT CHAR_LENGTH(column_name) FROM Kush;
-- Example: will print according to length and will sort them later bellow
SELECT first_name, CHAR_LENGTH(first_name) AS 'Length of Character' FROM Kush;
SELECT CONCAT(first_name, ' is ', CHAR_LENGTH(first_name), ' Characters Long.') FROM Kush;

-- UPPER & LOWER Case Chracter
SELECT UPPER(column_name) FROM Kush;
SELECT LOWER(column_name) FROM Kush;
-- Example
SELECT UPPER(first_name) FROM Kush;
SELECT CONCAT("IN UPPER CASE",UPPER(first_name)) FROM Kush;
SELECT CONCAT("IN LOWER CASE",LOWER(first_name)) FROM Kush;

-- Side Note
--This works:
SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS "full name in caps" FROM Kush;
--While this does not:
SELECT CONCAT(UPPER(first_name, ' ', last_name)) AS "full name in caps" FROM Kush;
--UPPER only takes one argument and CONCAT takes two or more arguments, so they can't be switched in that way.

-- Good Questions :
-- Reverse & Upper case the column_name or String
-- Replace Concat output
-- Replace a character with another
-- Print column forward and backward in single output
-- Print full name in CAPS
-- Print Full name 'and age is' age
-- Print full name and length of each full name
-- Print short email, fullname(lastname,firstname) and Age



---------------------------------------------------------------------------------------------------------------
-- General command for Refining data from Table
---------------------------------------------------------------------------------------------------------------
-- DISTINCT: Use to remove duplicates and combines into     one
SELECT DISTINCT(column_name) FROM tablename;
-- EXample
SELECT DISTINCT(last_name) FROM Kush;
SELECT DISTINCT CONCAT(first_name, ' ', last_name) FROM Kush;

-- ORDER BY: Best and worst case in sorting order (default is asscending) use DESC for decending order
SELECT column_name FROM tablename ORDER BY column_name;
-- Example
SELECT first_name FROM Kush ORDER BY first_name;
SELECT first_name FROM Kush ORDER BY first_name DESC;

-- LIMIT
SELECT column_name FROM Kush LIMIT VALUE;
--Example
SELECT last_name FROM Kush ORDER BY last_name LIMIT 2;


-- LIKE
SELECT column_name FROM Kush WHERE column_name LIKE 'STRING VALUE';
SELECT column_name FROM Kush WHERE column_name LIKE '%STRING VALUE';
SELECT column_name FROM Kush WHERE column_name LIKE 'STRING VALUE%';
SELECT column_name FROM Kush WHERE column_name LIKE '%STRING VALUE%';
-- Example
SELECT first_name FROM Kush WHERE first_name LIKE 'Kush';
-- Letters starting with K and vice versa
SELECT first_name FROM Kush WHERE first_name LIKE '%K';
-- Letters having us results
SELECT first_name FROM Kush WHERE first_name LIKE '%us%'

-- Side not: lets say we want age of 1 digt and 2 digit and 3 digit we will use "%_%","%__%","%___%"
-- if there is a percent sign into it and undersocre in it  use escape character '% \% %', '% \_ %'



---------------------------------------------------------------------------------------------------------------
-- General command for Aggregate data from Table
---------------------------------------------------------------------------------------------------------------
-- COUNT
SELECT COUNT (column_name) FROM tablename;
-- Example
SELECT COUNT(*) FROM Kush;
SELECT COUNT(first_name) FROM Kush;
SELECT COUNT( DISTINCT last_name) FROM Kush;
SELECT COUNT(*) FROM Kush WHERE first_name LIKE '%Ku%';

-- GROUP BY: always use count with that to verify 
SELECT column_name, COUNT(*) FROM tablename GROUP BY column_name;
-- Example
SELECT first_name, COUNT(*) FROM Kush GROUP BY first_name;
SELECT first_name, last_name, COUNT(*) FROM Kush GROUP BY first_name, last_name;
SELECT CONCAT('My ', age, ' ', COUNT(*), ' is years old') AS year FROM GROUP BY age;

-- MAX & MIN: basic way
SELECT MAX(column_name) FROM tablename;
SELECT MIN(column_name) FROM tablename;
-- Example
SELECT MAX(age) FROM Kush;
SELECT MIN(age) FROM Kush;

-- MAX & MIN: Use Sub-quries to find max of particular 
SELECT column_name, column_name FROM tablename WHERE column_name = (SELECT MAX(column_name) FROM tablename);
-- Example (Slow way) to improve speed use order by
SELECT first_name, age FROM Kush WHERE age = (SELECT MAX(age) FROM Kush);
-- Faster way
SELECT * FROM Kush ORDER BY age ASC LIMIT 1;
SELECT * FROM Kush ORDER BY age DESC LIMIT 1;
-- Example MIN & MAX with GROUP BY: should use group by when you want max or min value where one entity has
-- multiple things in it and group them and get max or min value
SELECT column_name, column_name MIN(column_name) FROM tablename GROUP BY column_name, column_name; 
-- More good view   
SELECT Concat(column_name, ' ', column_name) AS AliasName,
       Max(column_name)                      AS 'Max Alias Name'
FROM   tablename
GROUP  BY column_name,column_name; 


-- SUM
SELECT SUM(column_name) FROM tablename;
-- Example
SELECT SUM(age) FROM Kush;
-- SUM + GROUP BY
SELECT first_name, last_name, SUM(age) FROM Kush GROUP BY first_name, last_name;


-- AVG
SELECT AVG(column_name) FROM tablename;
-- Example
SELECT AVG(age) FROM Kush;
SELECT first_name, last_name, AVG(age) FROM Kush GROUP BY first_name, last_name;


---------------------------------------------------------------------------------------------------------------
-- General command for Data Types 
---------------------------------------------------------------------------------------------------------------
-- CHAR for FIXED LENGTH (State Abbrevation, Gender etc) or else use VARCHAR
-- DECIMAL (10,2) 10= TOTAL NUMBER OF DIGITS 2 = DIGITS AFTER DECIMAL
-- FLOAT Stores only first 7 difits then all tens (precisions problem) so use double
-- DATE [YYYY-MM-DD], TIME[HH:MM:SS], DATETIME[YYYY-MM-DD HH:MM:SS]
-- Formating Dates & Time Day(column_name), DAYNAME(), DAYOFWEEK(). MONTHNAME(),DAYOFYEAR() - ONLY FOR DATETIME
-- DATEFORMAR(column_name,'%w/%m/%y), DATEFORMAR(column_name,'%w/%m/%y at %h:%m)








