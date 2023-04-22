# DELETE 

CREATE DATABASE temp2;
USE temp2;

CREATE TABLE Cust(
id INT PRIMARY KEY,
cname VARCHAR(225),
Address VARCHAR(225),
Gender CHAR(2),
City VARCHAR(225),
Pincode INT
);

SELECT * FROM Cust;
INSERT INTO Cust VALUES (1, 'Ram', 'Buldhana', 'M', 'Mumbai', 999999);


#CREATE TABLE Order_Details(
#Order_id INT PRIMARY KEY,
#delivery_date DATE,
#cust_id INT,
#FOREIGN KEY(cust_id) REFERENCES Cust(id) 
#);

# ON DELETE CASCADE Table 
CREATE TABLE Order_Details(
Order_id INT PRIMARY KEY,
delivery_date DATE,
cust_id INT,
FOREIGN KEY(cust_id) REFERENCES Cust(id) ON DELETE CASCADE 
);


# ON DELETE SET NULL
CREATE TABLE Order_Details(
Order_id INT PRIMARY KEY,
delivery_date DATE,
cust_id INT,
FOREIGN KEY(cust_id) REFERENCES Cust(id) ON DELETE SET NULL
);

INSERT INTO Order_Details
VALUES (3, '2019-03-11', 1);

INSERT INTO Order_Details
VALUES (5, '2019-03-12', 1);

SELECT * FROM Order_Details;

# This query will not delete the cust id = 1, because it is a Foreign key constriant for Cust table
DELETE FROM Cust WHERE id = 1;
# we've all the details corresponding to the cust id = 1, so it cannot be deleted 

# But if you want to delete that customer & order, you can use "ON DELETE CASCADE".
# First we'll drop table (Order_Details) and then apply ON DELETE CASCADE to the table
# If you delete entry inside Parent Table while ON DELETE CASCADE is applied, then corresponding entries will also get deleted
# In this case, we're deleting cust = 1 from Cust table, so after applying ON DELETE CASCADE, their corresponding entries in Order_Details table
# will also get deleted.
 


# But, if you want to delete cust only, and want to preserve the order details of that customer, then we will use "ON DELETE SET NULL"
# This will delete the respective customer, and will set it's FOREIGN KEY (cust_id) as NULL in Order_Details Table, and the remaining records of that 
# customer will get preserved.