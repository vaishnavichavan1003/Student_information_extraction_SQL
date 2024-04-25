# Student Information Extraction

-- create database
CREATE DATABASE student_information_extraction;

-- use database
USE student_information_extraction;

-- create table
CREATE TABLE student(id INT PRIMARY KEY auto_increment, NAME1 VARCHAR(20), mobile_no VARCHAR(10) UNIQUE, address VARCHAR(30));

-- show all records
SELECT * FROM student;

-- Describe table structure
DESC student;

-- insert mulitiple records at a time
INSERT INTO student()
VALUES(1,"Vaishnavi","1234678910","Pune"),
(2,"Ashwini","1234567892","Mumbai"),
(3,"Pooja","1234567899","Satara"),
(4,"Sidhi","1234567345","Pune"),
(5,"Kirti","1234567894","Mumbai"),
(6,"Sonam","1234567893","Satara"),
(7,"Rutuja","1234567898","Pune"),
(8,"Poonam","1234567856","Mumbai"),
(9,"Reva","1234567834","Satara"),
(10,"Minal","1234567837","Pune");


-- records display
SELECT * FROM student;

-- create table
CREATE TABLE marks(m_id INT PRIMARY key,marks1 INT,marks2 INT,marks3 INT,
CONSTRAINT ch1 CHECK(marks1<=100 AND marks1>0),
CONSTRAINT ch2 CHECK(marks2<100 AND marks2>0),
CONSTRAINT ch3 CHECK(marks3<100 AND marks3>0),
CONSTRAINT ch4 FOREIGN KEY(m_id) REFERENCES student(id));

-- describe table
DESC marks;

-- insert record
INSERT INTO marks()
VALUES(1,58,67,89);

-- display all records
SELECT * FROM marks;

-- insert records
INSERT INTO marks()
VALUES(2,67,89,45);

-- insert records
INSERT INTO marks()
VALUES(3,78,89,56),
(4,56,89,56),
(5,89,45,74),
(6,38,56,29),
(7,12,23,23),
(8,67,45,93),
(9,67,89,45),
(10,73,75,78);

-- display all records
SELECT * FROM marks;

-- change column name
-- this line get error because we add constraint we can't rename column name
ALTER TABLE marks
RENAME COLUMN marks1 TO Marathi;


-- first drop constraint
ALTER TABLE marks
DROP CONSTRAINT ch1;

-- rename column
ALTER TABLE marks 
RENAME COLUMN marks1 TO Marathi;

DESC marks;

-- add constraint
ALTER TABLE marks
ADD CONSTRAINT ch1 CHECK (Marathi >= 1 AND Marathi <=100);

-- multiple columns drop constraint
ALTER TABLE marks
DROP CONSTRAINT ch2,
DROP CONSTRAINT ch3;

-- multiple columns rename 
ALTER TABLE marks 
RENAME COLUMN marks2 TO Hindi,
RENAME COLUMN marks3 TO English;

-- add constraint on multiple columns
ALTER TABLE marks
ADD CONSTRAINT ch2 CHECK (Hindi >= 1 AND Hindi <=100),
ADD CONSTRAINT ch3 CHECK(English >=1 AND English<=100);

-- add new column
ALTER TABLE marks 
ADD COLUMN total INT;

-- set values of total column
UPDATE marks
SET total=Marathi+Hindi+English
WHERE total IS NULL;

-- display all records
SELECT * FROM marks;

-- new column add
ALTER TABLE marks
ADD COLUMN Percentage INT;

-- update column values inside the table
UPDATE marks
SET Percentage=total/3
WHERE Percentage IS NULL;

-- add new column
ALTER TABLE marks
ADD COLUMN Pass_or_Fail VARCHAR(10);

-- update records
UPDATE marks
SET Pass_or_Fail = "Pass"
WHERE Percentage > 35;

-- update records
UPDATE marks
SET Pass_or_Fail = "Fail"
WHERE Percentage < 35;

-- display all records
SELECT * FROM marks;


# Inner Join
SELECT st.id,st.name1,mr.Percentage,mr.pass_or_Fail FROM student st
INNER JOIN marks mr
ON st.id=mr.m_id;

-- insert values
INSERT INTO student()
VALUES(11,"abc","1234567456","Pune"),
(12,"PQR","456789137","Satara");

# Left Join
SELECT st.id,st.name1,mr.Percentage,mr.pass_or_fail FROM student st
LEFT JOIN marks mr
ON st.id=mr.m_id; 

-- name column length of all names display
SELECT length(NAME1) AS Length_name FROM student;

-- Maximum percentage display
SELECT MAX(Percentage) FROM marks;

-- second highest percentage
SELECT percentage FROM marks
ORDER BY percentage desc
LIMIT 1 OFFSET 1;

-- another way to second highest percentage
SELECT max(percentage) FROM marks
WHERE percentage < (SELECT MAX(percentage) FROM marks) ;

SELECT * FROM student;

-- JSON Queries

-- convert data into the json format
SELECT JSON_OBJECT('id', id, 'name', name1, 'mobile_no', mobile_no, 'address', address) AS json_data FROM student;
