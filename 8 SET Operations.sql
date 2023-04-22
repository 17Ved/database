-- DATABASE is created to understand the SET operations

CREATE DATABASE DEPARTMEN;
USE DEPARTMEN;

-- Department 1 table
CREATE TABLE Dept1(
empid INT,
name CHAR(225),
role VARCHAR(225)
);
SELECT * FROM Dept1;

-- inserting data into department 1
INSERT INTO Dept1(empid, name, role) 
	VALUES(1, 'A', 'engineer'),
		(2, 'B', 'salesman'),
        (3, 'C', 'manager'),
        (4, 'D', 'salesman'),
        (5, 'E', 'engineer');



-- Department 2 table
CREATE TABLE Dept2(
empid INT,
name CHAR(225),
role VARCHAR(225)
);
SELECT * FROM Dept2;

-- inserting data into department 2
INSERT INTO Dept2(empid, name, role) 
	VALUES(3, 'C', 'manager'),
		(6, 'F', 'marketing'),
        (7, 'G', 'salesman');


-- Now performing SET operations on Department 1 and Department 2
-- UNION SET OPERATIONS
-- List out all the employees from Dept1 and Dept2 / Company
SELECT * FROM Dept1
UNION
SELECT * FROM Dept2;


-- List all of the employees in all departments who works as salesman
SELECT * FROM Dept1 WHERE role = 'salesman'
UNION
SELECT * FROM Dept2 WHERE role = 'salesman';


-- INTERSECTION SET OPERATIONS
-- List out all the employees who work for both departments
SELECT Dept1.* FROM Dept1 INNER JOIN Dept2 USING(empid);


-- MINUS SET OPERATIONS
-- List out all the employees working in department 1 and not in department2
SELECT Dept1.* FROM Dept1
	LEFT JOIN Dept2 USING(empid)
WHERE Dept2.empid IS NULL;