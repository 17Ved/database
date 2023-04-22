#Below command is used to create database -
create database vedantdb;

# 'use' is used to choose which db to be used
use vedantdb;

# to create table
CREATE TABLE student (
id int PRIMARY KEY,
name VARCHAR(255)
);

# to insert value inside student table
INSERT INTO student VALUES(1, 'JAYESH');

# SELECT - to retrieve data
SELECT * FROM student;


# DROP databases - 
DROP DATABASE IF EXISTS vedantdb; 