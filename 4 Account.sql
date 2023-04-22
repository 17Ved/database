# CHECK CONSTRAINT

CREATE TABLE Account(
id INT PRIMARY KEY,
NAME VARCHAR(255) UNIQUE,
Balance INT NOT NULL DEFAULT 0
# CONSTRAINT Acc_Bal_Chk CHECK(Balance > 1000)
);

INSERT INTO Account(id, NAME, Balance)
VALUES (100, 'VEDANT', 8000);

SELECT * FROM Account;

# This entry will not get inserted, because we've put UNQUE Constraint on Name 
INSERT INTO Account(id, NAME, Balance)
VALUES (10, 'VEDANT', 8000);


# This entry will not get inserted, because we've put CHECK Constraint on Acc_Bal_Chk i.e. balance should be > 1000
INSERT INTO Account(id, NAME, Balance)
VALUES (200, 'JAYESH', 900);


DROP TABLE Account;

# To check for DEFAULT value, we'll not provide Balance to this entry
INSERT INTO Account(id, NAME)
VALUES (200, 'Rushikesh');

SELECT * FROM Account;
#--------------
# ALTER OPERATIONS -
# ADD NEW COLUMN
ALTER TABLE Account ADD Interest_rate FLOAT NOT NULL DEFAULT 0;


# MODIFY COLUMN DATATYPE
ALTER TABLE Account MODIFY Interest_rate DOUBLE NOT NULL DEFAULT 0;

DESC Account;   -- used to know the datatypes of table/column


# 'CHANGE COLUMN'NME - You can also change newly renamed column datatype here
ALTER TABLE Account CHANGE COLUMN Interest_rate Savings_interest FLOAT NOT NULL DEFAULT 0;

# DROP COLUM - To drop particular column
ALTER TABLE Account DROP COLUMN Savings_interest;

# RENAME TABLE NAME - RENAME TO
ALTER TABLE Account RENAME TO AccountDetails;
DESC AccountDetails;