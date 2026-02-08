CREATE DATABASE deloite;
USE deloite;
CREATE TABLE employee(
employee_id INT PRIMARY KEY,
name VARCHAR(50),
age INT,
salary INT,
department VARCHAR(100),
city VARCHAR(50),
salary_per_year INT
);
INSERT INTO employee
VALUES
(01, "amit", 30, 45000, "IT", "Mysuru", 540000),
(02, "Surya", 20, 43000, "HR", "Bangalore", 516000),
(03, "Surya", 23, 15000, "IT", "Bhadravathi", 180000),
(04, "Navya", 30, 43000, "HR", "Mangalore", 516000),
(05, "Bindu", 40, 1200000, "HR", "Koppal", 14400000),
(06, "Bindu", 40, 20000, "EC", "Koppal", 240000); 
SELECT * FROM employee;
SELECT name, age
FROM employee;
CREATE TABLE temp (
id INT NOT NULL,
name VARCHAR(50),
PRIMARY KEY (id, name)
);
DROP TABLE temp;
INSERT INTO temp
VALUES
(01, "amit"),
(01, "Surya");
SELECT * FROM temp;

CREATE TABLE customer(
id INT PRIMARY KEY,
name VARCHAR (10)
);
CREATE TABLE temp (
cust_id INT,
FOREIGN KEY(cust_id) REFERENCES customer(id)
);

INSERT INTO temp
VALUES
(01);
SELECT * FROM customer;
SELECT * FROM temp;
DROP TABLE customer;
CREATE TABLE customer(
id INT PRIMARY KEY,
name VARCHAR(10),
age INT CHECK(age > 21 AND age < 60),
gender CHAR(1) CHECK (gender IN ('F', 'M')) 
);
INSERT INTO customer
VALUES
(01, "amit", 30, 'F'),
(02, "Surya", 25, 'M');
UPDATE customer
SET gender = 'M'
WHERE id = 01;
SELECT * FROM customer;
SELECT DISTINCT name, age
FROM employee
WHERE age+ 10 = 50;
SELECT DISTINCT name, age
FROM employee
WHERE age="30" AND salary="45000";
SELECT DISTINCT name, age
FROM employee
WHERE age="30" OR salary="45000";
SELECT name, age
FROM employee
WHERE salary BETWEEN 13000 AND 55000;
SELECT name, age
FROM employee
ORDER BY salary ASC
LIMIT 3;
SELECT AVG(salary)
FROM employee;
SELECT name, MAX(age)
FROM employee
GROUP BY name;
SELECT city, AVG(marks)
FROM employee
GROUP BY city
ORDER BY city ASC;
SELECT mode, COUNT(customer)
FROM bank
GROUP BY mode;
SELECT city, COUNT(name)
FROM employee
GROUP BY city 
HAVING max(salary) > 90;

SELECT * FROM employee
WHERE age + 10 = 50;

SELECT DISTINCT name
FROM employee
WHERE salary > 40000;
DELETE FROM employee
WHERE salary < 1000;
SET SQL_SAFE_UPDATES =0;

CREATE TABLE customer(
id INT PRIMARY KEY,
name VARCHAR (10)
);
CREATE TABLE temp (
cust_id INT,
FOREIGN KEY(cust_id) REFERENCES customer(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);
INSERT INTO customer
(id, name)
VALUES
(01, "amit"),
(02, "Surya"),
(03, "navya");
DROP TABLE customer;
DROP TABLE temp;
INSERT INTO temp
VALUES
(01),(02),(03);
SELECT * FROM customer;
DELETE FROM customer
WHERE id = 03;
SELECT * FROM temp;

ALTER TABLE employee
ADD COLUMN weight INT;

ALTER TABLE employee
MODIFY COLUMN weight VARCHAR(2);

ALTER TABLE employee
CHANGE COLUMN weight empl_weight INT;

ALTER TABLE employee
RENAME To Wowww;

ALTER TABLE employee
DROP COLUMN empl_weight;
SELECT * FROM employee;
 DESCRIBE wowww;
SHOW COLUMNS FROM wowww;
SHOW TABLES;
DROP TABLE wowww;
SHOW COLUMNS FROM employee;
TRUNCATE TABLE temp;
SELECT * FROM temp;
ALTER TABLE employee
CHANGE name full_name VARCHAR(50);
DELETE FROM employee
WHERE salary < 1000;

CREATE TABLE employees (
id INT PRIMARY KEY,
name VARCHAR(50),
manager_id INT
);

INSERT INTO employees 
VALUES
(101, "Adam", 103),
(102, "bob", 104),
(103, "casey", null),
(104, "donald", 103);
SELECT * FROM employees;

SELECT a.name as manager_id, b.name
FROM employees as a
JOIN employees as b
ON a.id = b.id;



CREATE TABLE students (
stu_id INT PRIMARY KEY,
name VARCHAR(50)
);
DROP TABLE students;
INSERT INTO students
(stu_id, name)
VALUES
(101, "karan"),
(102, "kiran"),
(103, "manju");

CREATE TABLE course (
stu_id INT PRIMARY KEY,
course VARCHAR(50)
);

INSERT INTO course
(stu_id, course)
VALUES
(102, "english"),
(105, "maths"),
(103, "Kannada");
SELECT * FROM students;
SELECT * FROM course;
SELECT *
FROM students as s
LEFT JOIN course as c
ON s.stu_id = c.stu_id
UNION
SELECT *
FROM students as s
RIGHT JOIN course as c
ON s.stu_id = c.stu_id;

SELECT *
FROM students as s
LEFT JOIN course as c
ON s.stu_id = c.stu_id
WHERE c.stu_id IS NULL;

SELECT full_name, salary
FROM employee
WHERE salary > (SELECT AVG(salary) 
FROM employee);

SELECT full_name, employee_id
FROM employee
WHERE employee_id IN (SELECT employee_id 
FROM employee
WHERE employee_id % 2 = 0); 

SELECT MAX(salary), city
FROM (SELECT * FROM employee
WHERE city = "Mangalore") AS temp;

CREATE VIEW view1 AS
SELECT full_name, salary FROM employee;
SELECT * FROM view1;



