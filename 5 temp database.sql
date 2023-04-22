CREATE DATABASE temp;
USE temp;

CREATE TABLE Customer(
id INT PRIMARY KEY,
cname VARCHAR(225),
Address VARCHAR(225),
Gender CHAR(2),
City VARCHAR(225),
Pincode INT
);

SELECT * FROM Customer;
# Now the no. of ways you can INSERT entries into Customer table is as follows - 
# 1. Inserting single query with following syntax -
INSERT INTO Customer(id, cname, Address, Gender, City, Pincode) VALUES (111, 'Vedant', 'Jalgaon', 'M', 'Jalgaon', 425001);

# 2. Inserting multiple entries with following syntax - 
INSERT INTO Customer (id, cname, Address, Gender, City, Pincode) 
	VALUES (222, 'Rushikesh', 'Nashik', 'M', 'Nashik', 123453),
			(333, 'Jayesh', 'Pune', 'M', 'Pune', 836291),
            (444, 'Harshal', 'Pune', 'M', 'Pune', 987721),
            (555, 'Mayur', 'Jalgaon', 'M', 'Jalgaon', 427991);
            
            
# 3. Directly inserting into columns, just by providing its values only - you've to provide values in sequence, in which you've specified column names
INSERT INTO Customer VALUES (666, 'Kunal', 'Mumbai', 'M', 'Mumbai', 100000);

# 4. Specifying column names which are available, rest will get replace with its default values (NULL) like below -
INSERT INTO Customer (id, cname) 
	VALUES (777, 'Somesh');
    
# ---------------------------------------------------------------------------------
# Now the no. of ways you can UPDATE entries into Customer table is as follows -

# 1. Updating Single Row - 
UPDATE Customer SET Address = 'Delhi', Gender = 'M', Pincode = 238913 WHERE id = 777; 

# 2. Updating Multiple Rows - 
SET SQL_SAFE_UPDATES = 0; 				# By default SQL has security of not to update multiple rows at a time, we've to disable it by provided query first
SET SQL_SAFE_UPDATES = 1;
UPDATE Customer SET City = 'Jalgaon';

# 3. Updating and incrementing Pincode column
UPDATE Customer SET Pincode = 425000 + 1;


#-----------------------------------------------------------------------------------------

# Now the no. of ways you can DELETE entries into Customer table is as follows -

# 1. Deleting Specific Row -
DELETE FROM Customer WHERE id = 444;

# 2. Deleting All Rows -
DELETE FROM Customer;



# Now we'll see REPLACE -
# 1.
REPLACE INTO Customer (id, City) 
	VALUES (777, 'Jalgaon');
 # This query will replace all the data corresponding to the id = 777 with City = 'Jalgaon'.

# 2. This query will act as insert query, because there is no id = 999, so this query will insert a new entry with id = 999
REPLACE INTO Customer (id, Cname, City)
	VALUES (999, 'Somesh', 'Jalgaon');

# 3. Different Syntax - of REPLACE 
REPLACE INTO Customer SET id = 666, cname = 'Bharambe', Address = 'Pune', Pincode = 111982; 

# 4. Different Syntax - of REPLACE - column - id, cname, City will remain same, but all the other values will get set to NULL
REPLACE INTO Customer (id, cname, City)
	SELECT id, cname, City 
    FROM Customer WHERE id = 555;

SELECT * FROM Customer;