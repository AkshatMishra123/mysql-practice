create database StringFunctionDB;
use StringFunctionDB;
create table employees (
	emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50)
);

-- insert data 
INSERT INTO employees (first_name, last_name, email, department)
VALUES
('John', 'Smith', 'john.smith@company.com', 'HR'),
('Emma', 'Johnson', 'emma.johnson@company.com', 'Finance'),
('Liam', 'Brown', 'liam.brown@company.com', 'IT'),
('Olivia', 'Davis', 'olivia.davis@company.com', 'Marketing'),
('Noah', 'Wilson', 'noah.wilson@company.com', 'IT'),
('Sophia', 'Taylor', 'sophia.taylor@company.com', 'Finance'),
('James', 'Anderson', 'james.anderson@company.com', 'HR'),
('Ava', 'Thomas', 'ava.thomas@company.com', 'Marketing'),
('Isabella', 'Moore', 'isabella.moore@company.com', 'Sales'),
('Mason', 'Jackson', 'mason.jackson@company.com', 'Sales');

select * from employees;

-- Functions

-- concat()
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;

-- length ()
select first_name, length(first_name) AS NameLength from employees;

-- upper and lower case 
SELECT UPPER(first_name), LOWER(last_name) FROM employees;

-- trim()
select upper(("        ok.   "));

select trim(upper(("        ok.   ")));

-- sub string()
SELECT SUBSTRING(first_name, 1, 3) AS short_name FROM employees;

-- locate function
SELECT first_name, LOCATE('a', first_name) AS position
FROM employees;

SELECT email, LOCATE('@', email) AS at_position
FROM employees;

-- replace()
-- will not do the permanent change rather just the modified output 
select first_name, replace(email, "company.com", "google.com") from employees;

use StringFunctionDB;

-- Left(), right() to extract the letters from the left most and right most

-- ascii
select ascii("a");
select ascii("A");

-- char_length
select char_length("hello");

-- sundex()
-- gives a 4 letter code that tells how a string sounds
select soundex("akshat");

-- return the first_names that sound similar to "jane";
select * from employees WHERE SOUNDEX("Jane") = SOUNDEX(first_name);
