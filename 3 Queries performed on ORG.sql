# Queries performed on ORG database
USE ORG;
SELECT * FROM Worker;

# select particular column from table and display it
SELECT FIRST_NAME, SALARY FROM Worker;

# DUAL tables - dummy tables created by MySQL
SELECT 45 + 11;
SELECT NOW();
SELECT UCASE('vedant');
SELECT LCASE('VEDANT');

# WHERE Clause
SELECT * FROM Worker WHERE SALARY > 80000;
SELECT * FROM Worker WHERE DEPARTMENT = 'HR';


# BETWEEN Clause
SELECT * FROM Worker WHERE SALARY BETWEEN 80000 AND 300000;


# IN Clause -
# First we're understanding through OR clause -
# we've to write multiple OR clause for different department
SELECT * FROM Worker WHERE DEPARTMENT = 'HR' OR DEPARTMENT ='Admin';

# example of IN clause - using IN clause, we're reducing OR clauses below
SELECT * FROM Worker WHERE DEPARTMENT IN ('HR', 'Admin');


# NOT IN
SELECT * FROM Worker WHERE DEPARTMENT NOT IN ('Account');
# will give departments other than Account department

# IS NULL 
SELECT * FROM Worker WHERE DEPARTMENT IS NULL;

# Pattern Searching / Wildcard - used to do specific filtering
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%i%';
SELECT * FROM Worker WHERE FIRST_NAME LIKE '_i%';

# ORDER BY - To do sorting 
SELECT * FROM Worker ORDER BY SALARY;
SELECT * FROM Worker ORDER BY SALARY DESC;


# DISTINCT CLAUSE -
SELECT DEPARTMENT FROM Worker;
SELECT DISTINCT DEPARTMENT FROM Worker;


# GROUP BY CLAUSE -
SELECT DEPARTMENT FROM Worker GROUP BY DEPARTMENT; 
# Above query will give output, same as DISTINCT query,
# Now using Aggregation function - COUNT, AVG, MIN, MAX, SUM
SELECT DEPARTMENT, COUNT(Department) FROM Worker GROUP BY DEPARTMENT;
 
# Couning Average salary per department - Applying aggregation function
SELECT DEPARTMENT, AVG(SALARY) FROM Worker GROUP BY DEPARTMENT;

# Per department minimum salary
SELECT DEPARTMENT, MIN(SALARY) FROM Worker GROUP BY DEPARTMENT;

# Per department maximum salary
SELECT DEPARTMENT, MAX(SALARY) FROM Worker GROUP BY DEPARTMENT;

# Per department total salary
SELECT DEPARTMENT, SUM(SALARY) FROM Worker GROUP BY DEPARTMENT;

# GROUP BY HAVING - CLAUSE
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT HAVING COUNT(Department) > 2;