# This database is created to understand the JOINS in DBMS
CREATE DATABASE Jointable;
USE Jointable;


# Creating EMP table
CREATE TABLE Emp(
	id INT PRIMARY KEY,
    fname CHAR(225),
    lname CHAR(225),
    Age INT,
    emailID VARCHAR(225),
    PhoneNo INT,
    City VARCHAR(225)
);

SELECT * FROM Emp;
# Now inserting data into Emp table -
INSERT INTO Emp(id, fname, lname, Age, emailID, PhoneNo, City) 
	VALUES (1, 'Aman', 'Proto', 32, 'aman@gmail.com', 898, 'Delhi'),
    (2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', 222, 'Palam'),
    (3, 'Rahul', 'BD', 22, 'rahul@gmail.com', 444, 'Kolkata'),
    (4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', 666, 'Raipur'),
    (5, 'PK', 'Pandey', 21, 'pk@gmail.com', 555, 'Jaipur');




# CREATING Client Table - 
CREATE TABLE Client(
client_id INT PRIMARY KEY,
first_name CHAR(225),
last_name CHAR(225),
age INT,
emailID CHAR(225),
phone_no INT,
city CHAR(225),
empID INT,
FOREIGN KEY (empID) REFERENCES Emp(id)
);

SELECT * FROM Client;

# Inserting data into Client Table -
INSERT INTO Client (client_id, first_name, last_name, age, emailID, phone_no, city, empID) 
	VALUES(1, 'Mac', 'Rogers', 47, 'mac@hotmail.com', 333, 'Kolkata', 3),
    (2, 'Max', 'Poirier', 27, 'max@gmail.com', 222, 'Kolkata', 3),
    (3, 'Peter', 'Jain', 24, 'peter@gmail.com', 111, 'Delhi', 1),
    (4, 'Sushant', 'Aggarwal', 23, 'sushant@yahoo.com', 45454, 'Hyderabad', 5),
    (5, 'Pratap', 'Singh', 36, 'p@xyz.com', 77767, 'Mumbai', 2);


# Creating Project table -
CREATE TABLE Project(
project_id INT PRIMARY KEY,
empID INT,
name CHAR(225),
startdate DATE,
cli_id INT,
FOREIGN KEY (empID) REFERENCES Emp(id),
FOREIGN KEY (cli_id) REFERENCES Client(client_id)
);

SELECT * FROM Project;

# Inserting data into Project Table -

INSERT INTO Project (project_id, empID, name, startdate, cli_id) 
VALUES (1, 1,'A', '2021-04-21', 3),
		(2, 2, 'B', '2021-03-12', 1),
        (3, 3, 'C', '2021-01-16', 5),
        (4, 3, 'D', '2021-04-27', 2),
        (5, 5, 'E', '2021-05-01', 4);


-- # ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# So, now we've created the whole database, we'll perform some JOIN operations on the respected database -

# INNER JOIN ---
-- Enlist all the emmployees Id's, names along with the project allocated to them.
SELECT e.id, e.fname, e.lname, p.project_id, p.name FROM Emp AS e 
	INNER JOIN Project AS p ON e.id = p.empID;
-- To enlist all the columns of emp and project table we can write it as following - 
SELECT * FROM Emp AS e 
	INNER JOIN Project AS p ON e.id = p.empID;


# Fetch out all the employee ID's and their contact details who have been working 
-- from Jaipur with the clients name working in Hyderabad.
SELECT e.id, e.emailID, e.PhoneNo, c.first_name, c.last_name FROM Emp AS e
	INNER JOIN Client AS c ON e.id = c.empID WHERE e.City = 'Jaipur' AND c.city = 'Hyderabad';

-- Can we use/perform 'JOIN' operation without using 'JOIN' keyword -
-- YES, we can by following syntax 
-- SELECT * FROM Lefttable, Righttable WHERE Lefttable.id = Righttable.id;    
SELECT * FROM Emp, Project WHERE Emp.id = Project.project_id;

SELECT e.id, e.fname, e.lname, p.project_id, p.name FROM Emp AS e, 
	Project AS p WHERE e.id = p.empID;




# LEFT JOIN 
-- Fetch out each project allocated to each employee
SELECT * FROM Emp AS e
	LEFT JOIN Project AS p ON e.id = p.empID;
    
    


# RIGHT JOIN -
-- List out all the projects along with the employee's name and their respective allocated email ID.
SELECT e.fname, e.emailID, p.project_id, p.name FROM Emp AS e
	RIGHT JOIN Project AS p ON e.id = p.empID;




# CROSS JOIN - Used to find all the possible combinations that can exist - Cartesian Product
-- List out all the combinations possible for the employee's name and projects that can exist.
SELECT e.fname, e.lname, p.project_id, p.name FROM Emp AS e
	CROSS JOIN Project AS p;
    
    
    


-- ------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Now we'll see SUB QUERIES -
-- we'll be using Jointable database to understand sub queries

    
-- WHERE Clause same table - 
-- employees with age > 30 -->
SELECT * FROM Emp WHERE Age IN (SELECT Age FROM Emp WHERE Age > 30);
    

-- WHERE Clause different table - 
-- Employee details working in more than one project
SELECT * FROM Emp WHERE id IN 
	(SELECT empID FROM Project GROUP BY empID HAVING COUNT(empID) > 1);


-- SINGLE SUBQUERY
-- Employee details having age > avg(age)
SELECT * FROM Emp WHERE Age > (SELECT AVG(Age) FROM Emp);
-- calculating average age from employee table -
SELECT AVG(Age) FROM Emp;


-- FROM CLAUSE DERIVED TABLE --
-- Select max age person whose first name contains 'a' -
SELECT MAX(Age) FROM (SELECT * FROM Emp WHERE fname LIKE '%a%') AS tempt;



-- CO-RELATED SUBQUERIES --
-- Find 3rd Oldest Employee --
SELECT * FROM Emp AS e1
WHERE 3 = (
SELECT COUNT(e2.Age)
FROM Emp AS e2
WHERE e2.Age >= e1.Age
);    
    
    
    
    
-- VIEWS IN SQL -
-- Normal View 
SELECT * FROM Emp;

-- CREATING A VIEW 
CREATE VIEW Custom_view AS SELECT id, fname, Age FROM Emp;

-- VIEWING CUSTOM VIEW 
SELECT * FROM Custom_view;

-- ALTERING THE VIEW THAT WE'VE CREATED 
ALTER VIEW Custom_view AS SELECT lname, emailID FROM Emp;
    
-- DROPPING A VIEW - 
DROP VIEW IF EXISTS Custom_view ;   