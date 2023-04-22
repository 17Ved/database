-- We will be solving 50 questions based on the below database
CREATE DATABASE PRACTICE;

USE PRACTICE;

SHOW DATABASES;

-- Creating Worker Table - 
SELECT * FROM Worker;
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(30)    
);


-- INSERTING MULTIPLE VALUES INSIDE Worker Table - 
INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
	VALUES (001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
        (003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
        (004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
        (005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
        (006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
        (007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
        (008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');


-- CREATING BONUS TABLE - 
SELECT * FROM Bonus;
CREATE TABLE Bonus(
WORKER_REF_ID INT,
BONUS_AMOUNT INT(10),
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID)
	REFERENCES Worker(WORKER_ID)
    ON DELETE CASCADE
);

-- INSERTING VALUES INTO Bonus Table - 
INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE)
	VALUES (001, 5000, '16-02-20'),
    (002, 3000, '16-06-11'),
    (003, 4000, '16-02-20'),
    (001, 4500, '16-02-20'),
    (002, 3500, '16-06-11');


-- CREATING TABLE Title -
SELECT * FROM Title;
CREATE TABLE Title(
WORKER_REF_ID INT,
WORKER_TITLE CHAR(50),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID)
	REFERENCES Worker(WORKER_ID)
    ON DELETE CASCADE
);

-- INSERTING VAUES INTO Title Table - 
INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
	VALUES (001, 'Manager', '2016-02-20 00:00:00'),
		(002, 'Executive', '2016-06-11 00:00:00'),
		(008, 'Executive', '2016-02-20 00:00:00'),
		(005, 'Manager', '2016-06-11 00:00:00'),
		(004, 'Asst.Manager', '2016-06-11 00:00:00'),
		(007, 'Executive', '2016-06-11 00:00:00'),
		(006, 'Lead', '2016-06-11 00:00:00'),
		(003, 'Lead', '2016-06-11 00:00:00');


-- NOW WE'LL SOLVE THE QUESTIONS RELATED TO THE ABOVE Worker DATABASE -

-- Q.1  - Write and SQL Query to fetch "FIRST_NAME" from Worker table using alias name as <WORKER_NAME>
SELECT FIRST_NAME FROM Worker AS WORKER_NAME;
-- OR
SELECT FIRST_NAME AS WORKER_NAME FROM Worker;


-- Q.2  - Write an SQL Query to fetch "FIRST_NAME" from Worker table in UPPER CASE
SELECT UPPER(FIRST_NAME) FROM Worker;
SELECT LOWER(FIRST_NAME) FROM Worker;	-- Same query for Lower case with LOWER()


-- Q.3  - Write an SQL Query to fetch unique values of "DEPARTMENT" from Worker table.
SELECT DISTINCT DEPARTMENT FROM Worker;
SELECT DEPARTMENT FROM Worker GROUP BY(DEPARTMENT); 	-- can also use GROUP BY Clause


-- Q.4  - Write an SQL Query to print the first three characters of "FIRST_NAME" from Worker table.
-- For this we use SUBSTRING(Column_name/string_name, Start length, End length)
SELECT SUBSTRING(FIRST_NAME, 1, 3) FROM Worker;



-- Q.5  - Write an SQL Query to find the position of alphabet ('b') in the first name column 'Amitabh' from Worker table.
-- For this we use INSTR() function - returns the position of the first occurrence of a string in another string.
-- INSTR(Column/string name, 'value to be find')     - This function performs case-insensitive search
SELECT INSTR(FIRST_NAME, 'B') FROM Worker WHERE FIRST_NAME = 'Amitabh';		-- Search for 'B' in string 'FIRST_NAME'


-- Q.6 - Write an SQL Query to print the "FIRST_NAME" from Worker table after removing white spaces from the right side
SELECT RTRIM(FIRST_NAME) FROM Worker;


-- Q.7 - Write an SQL Query to print the "FIRST_NAME" from Worker table after removing white spaces from the left side
SELECT LTRIM(FIRST_NAME) FROM Worker;


-- Q.8 - Write an SQL Query that fetches unique values of DEPARTMENT and print its length.
SELECT DISTINCT(DEPARTMENT), LENGTH(DEPARTMENT) FROM Worker;


-- Q.9  - Write an SQL Query to print FIRST_NAME from Worker table after replacing 'a' with 'A' 
SELECT REPLACE(FIRST_NAME,'a', 'A') FROM Worker;		-- REPLACE(COL/stirng name, 'value to be replaced', 'with another value')
-- REPLACE(FIRST_NAME, 'a' with 'A');


-- Q.10  - Write an SQL Query to print the FIRST_NAME AND LAST_NAME from Worker table into a single column COMPLETE_NAME,
-- & space char should separate them.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS COMPLETE_NAME FROM Worker;


-- Q. 11  - Write an SQL Query to print all Worker details from the Worker table ORDER BY 'FIRST_NAME' Ascending
SELECT * FROM Worker ORDER BY FIRST_NAME ASC;
SELECT * FROM Worker ORDER BY FIRST_NAME DESC;  	-- In Descending order


-- Q.12  - Write an SQL Query to print all Worker detials from the Worker table ORDER BY FIRST_NAME Ascending and 
-- 			DEPARTMENT Descending
SELECT * FROM Worker ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;
SELECT * FROM Worker ORDER BY FIRST_NAME, DEPARTMENT DESC;


-- Q.13  - Write an SQL Query to print details for Workers with the first name 'vipul' and 'satish' from Worker table
SELECT * FROM Worker WHERE FIRST_NAME IN ('Vipul', 'Satish');


-- Q.14  - Write an SQL Query to print details for Workers with the first name excluding 'vipul' and 'satish' from Worker table
SELECT * FROM Worker WHERE FIRST_NAME NOT IN ('Vipul', 'Satish');


-- Q.15  - Write and SQL Query to print details of Workers with DEPARTMENT name as ADMIN*
SELECT * FROM Worker WHERE DEPARTMENT = 'Admin';
SELECT * FROM Worker WHERE DEPARTMENT LIKE 'Admin%';


-- Q.16  - Write an SQL Query to print details of the Workers whose first name contains 'a'
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a%';


-- Q.17  - Write an SQL Query to print details of the Workers whose first name ends with 'a'
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a';


-- Q.18  - Write an SQL Query to print details of the Workers whose FIRST_NAME ends with 'h' and contains six alphabets
SELECT * FROM Worker WHERE FIRST_NAME LIKE '_____h';		-- putting 5 underscores
-- underscore replaces one character per underscore (_) 
-- and % replaces any no. of character 


-- Q.19  - Write an SQL Query to print details of workers whose SALARY lies between 100000 to 500000
SELECT * FROM Worker WHERE SALARY BETWEEN 100000 AND 500000;


-- Q.20  - Write an SQL Query to print details of the Workers who have joined in FEB 2014
SELECT * FROM Worker WHERE YEAR(JOINING_DATE) = 2014 AND MONTH(JOINING_DATE) = 02;


-- Q.21  - Write an SQL Query to fetch the count of employees working in the department 'Admin'
SELECT DEPARTMENT, COUNT(*) FROM Worker WHERE DEPARTMENT = 'Admin';


-- Q.22  - Write an SQL query to fetch Worker full name with salaries >= 50000 and <=100000
SELECT CONCAT(FIRST_NAME,' ', LAST_NAME) AS FULL_NAME, SALARY FROM Worker
	WHERE SALARY BETWEEN 50000 AND 100000;


-- Q.23  - Write an SQL Query to fetch the no. of workers for each department in descending order.
SELECT DEPARTMENT, COUNT(WORKER_ID) AS NO_OF_WORKER FROM Worker GROUP BY DEPARTMENT
	ORDER BY COUNT(WORKER_ID) DESC;
    

-- Q. 24  - Write an SQL Query to print details of the Workers who are also Managers.
SELECT * FROM Worker as W INNER JOIN Title AS T ON W.WORKER_ID = T.WORKER_REF_ID 
	WHERE WORKER_TITLE = 'Manager';
-- OR
SELECT * FROM Worker as W INNER JOIN Title AS T ON W.WORKER_ID = T.WORKER_REF_ID 
	WHERE T.WORKER_TITLE = 'Manager';    
-- OR
SELECT W.* FROM Worker as W INNER JOIN Title AS T ON W.WORKER_ID = T.WORKER_REF_ID 
	WHERE T.WORKER_TITLE = 'Manager';



-- Q.25  - Write an SQL Query to fetch number (more than 1) of same titles in the database of different types
SELECT WORKER_TITLE, COUNT(WORKER_TITLE) AS COUNT FROM Title GROUP BY WORKER_TITLE HAVING COUNT(*) >1;
-- OR
SELECT WORKER_TITLE, COUNT(*) AS COUNT FROM Title GROUP BY WORKER_TITLE HAVING COUNT(*) >1;


-- Q.26 - Write an SQL Query to show only odd rows from a table.
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) != 0;
-- <> This sign also works as != sign
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) <> 0;


-- Q.27 - Write an SQL Query to show only even rows from a table.
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) = 0;


-- Q.28 - Write an SQL Query to clone a new table from another table.
CREATE TABLE Worker_Clone LIKE Worker;		-- copies schema only
-- INSERTING ALL DATA FROM Worker Table to Worker_Clone table
INSERT INTO Worker_Clone SELECT * FROM WORKER;		-- copies whole data
SELECT * FROM Worker_Clone;


-- Q.29 - Write an SQL Query to fetch intersecting records of two tables.
SELECT Worker.* FROM Worker INNER JOIN Worker_Clone USING(WORKER_ID);
-- Using INNER JOIN, because MySQL do not provide INTERSECT Keyword


-- Q. 30 - Write an SQL Query to show records from one table that another table does not have.
-- MINUS SET OPERATIONS
SELECT Worker.* FROM Worker LEFT JOIN Worker_Clone USING(WORKER_ID) WHERE Worker_Clone.WORKER_ID IS NULL;


-- Q. 31 - Write an SQL Query to show the current date and time.
-- DUAL
SELECT CURDATE();
SELECT NOW();


-- Q. 32 - Wirte an SQL Query to show the top 'n' (Say 5) records of a table order by descending salary.alter
SELECT * FROM Worker ORDER BY SALARY DESC LIMIT 5; 
-- If I want to list all 5 records/entries, then I'll write something like above


-- Q. 33 - Write an SQL Query to determine the nth (say n = 5) highest salary from a table.
SELECT * FROM Worker ORDER BY SALARY DESC LIMIT 4, 1;		-- LIMIT works as a conditioning here
--    n-1, 1
-- it says like give me the 1st entry after 4th entry in the table
-- And If I want to list only 5th record/entry then, I'll write something like above.



-- Q.34  - Write an SQL Query to determine 5th highest salary without using 'LIMIT' keyword
-- Below query is using Correlated SubQuery
SELECT * FROM Worker w1
WHERE 4 = (
SELECT COUNT(DISTINCT (w2.SALARY))
FROM Worker w2
WHERE w2.SALARY >= w1.SALARY
);



-- Q.35  - Write an SQL Query to fetch the list of employees with the same salary.
SELECT * FROM Worker w1, Worker w2 WHERE w1.SALARY = w2.SALARY AND w1.WORKER_ID != w2.WORKER_ID;
SELECT w1.* FROM Worker w1, Worker w2 WHERE w1.SALARY = w2.SALARY AND w1.WORKER_ID != w2.WORKER_ID;



-- Q.36  - Write an SQL Query to show the second highest salary from the table, but using SUB-QUERY
SELECT * FROM Worker ORDER BY SALARY DESC LIMIT 2, 1;	-- This is using LIMIT keyword
-- Using sub-query
SELECT MAX(SALARY) FROM Worker
	WHERE SALARY NOT IN (SELECT MAX(SALARY) FROM Worker);



-- Q.37  - Write an SQL Query to show one row twice in results from a table.
SELECT * FROM Worker
UNION ALL
SELECT * FROM Worker ORDER BY WORKER_ID;



-- Q.38  - Write an SQL Query to list WORKER_ID who does not get bonus.
SELECT * FROM Worker				-- for detailed information of worker
	WHERE WORKER_ID NOT IN (SELECT WORKER_REF_ID FROM Bonus);
 -- OR
SELECT WORKER_ID FROM Worker
	WHERE WORKER_ID NOT IN (SELECT WORKER_REF_ID FROM Bonus);



-- Q.39  - Write an SQL Query to fetch the first 50% records from a table.
SELECT WORKER_ID FROM Worker 
	WHERE WORKER_ID <= (SELECT COUNT(WORKER_ID)/2 FROM Worker);


-- Q. 40  - Write an SQL Query to fetch the departments that have less than 4 people in it.
SELECT DEPARTMENT, COUNT(DEPARTMENT) AS DEPTCOUNT FROM Worker GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT) < 4;



-- Q.41  - Write an SQL Query to show all departments along with the number of people in there.
SELECT DEPARTMENT, COUNT(DEPARTMENT) AS PEOPLE_IN_THERE FROM Worker GROUP BY DEPARTMENT;


-- Q.42  - Write an SQL Query to show the last record from a table. 
-- We can use MAX() function here to get last record from a table.
SELECT * FROM Worker WHERE WORKER_ID = (SELECT MAX(WORKER_ID) FROM Worker);


-- Q.43  - Write an SQL Query to fetch the first row of a table. 
-- Same as above we will MIN() instead of MAX()
SELECT * FROM Worker WHERE WORKER_ID = (SELECT MIN(WORKER_ID) FROM Worker);


-- Q.44  - Write an SQL Query to fetch last five records from a table. 
(SELECT * FROM Worker ORDER BY WORKER_ID DESC LIMIT 5) ORDER BY WORKER_ID;


-- Q.45  - Write an SQL Query to print the name of employees having the highest salary in each department
SELECT W.DEPARTMENT, W.FIRST_NAME, W.SALARY FROM 
(SELECT MAX(SALARY) AS MAXSAL, DEPARTMENT FROM Worker GROUP BY DEPARTMENT) temp
INNER JOIN WORKER W ON temp.DEPARTMENT = W.DEPARTMENT AND temp.MAXSAL = W.SALARY;


-- M.IMP -
-- Q.46  - Write an SQL Query to fetch three max salaries from a table using co-related subquery.
SELECT DISTINCT SALARY FROM Worker w1
WHERE 3 >= (SELECT COUNT(DISTINCT SALARY) FROM WORKER w2 WHERE w1.SALARY <= w2.SALARY)
ORDER BY w1.SALARY DESC;
-- DRY RUN FOR BETTER UNDERSTANDING
-- SAME WE CAN DO USING LIMIT 
SELECT SALARY FROM Worker ORDER BY SALARY DESC LIMIT 3;
 


-- Q.47  - Write an SQL Query to fetch three min salaries from a table using co-related subquery.
SELECT DISTINCT SALARY FROM Worker w1
WHERE 3>= (SELECT COUNT(DISTINCT SALARY) FROM WORKER w2 WHERE w1.SALARY >= w2.SALARY)
ORDER BY w1.SALARY DESC;
-- SAME WE CAN DO USING LIMIT 
SELECT SALARY FROM Worker ORDER BY SALARY LIMIT 3;

 

-- Q.48  - Write an SQL Query to fetch nth max salary from a table.
SELECT DISTINCT SALARY FROM Worker w1
WHERE 6 >= (SELECT COUNT(DISTINCT SALARY) FROM WORKER w2 WHERE w1.SALARY <= w2.SALARY)
ORDER BY w1.SALARY DESC;



-- Q.49  - Write an SQL Query to fetch departments along with the total salaries paid for each of them.
SELECT DEPARTMENT, SUM(SALARY) AS TOTAL_SAL FROM Worker GROUP BY DEPARTMENT 
ORDER BY TOTAL_SAL DESC;


-- Q.50  - Write an SQL Query to fetch the names of workers who earn the highest salary.
SELECT FIRST_NAME, SALARY FROM Worker WHERE SALARY = (SELECT MAX(SALARY) FROM Worker);

