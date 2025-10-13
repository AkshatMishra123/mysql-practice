-- 1. Create new database
CREATE DATABASE db5;

USE db5;

CREATE TABLE employee (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    hire_date DATE NOT NULL
);

INSERT INTO employee (first_name, last_name, salary, hire_date) VALUES
('John', 'Doe', 50000.00, '2022-01-15'),
('Jane', 'Smith', 60000.00, '2021-06-10'),
('Alice', 'Johnson', 55000.00, '2023-03-25'),
('Bob', 'Williams', 70000.00, '2020-11-05');

SELECT * FROM employee;

--       alias
select concat(first_name, " ", last_name) as full_name from employee;

-- new table department
CREATE TABLE department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL
);

--  Insert rows
INSERT INTO department (dept_name, location) VALUES
('HR', 'New York'),
('Finance', 'London'),
('IT', 'San Francisco'),
('Marketing', 'Chicago');

SELECT * FROM department;

-- make connection between employee and department table
-- ALTER 
ALTER TABLE employee ADD COLUMN dept_id INT;

SELECT * FROM employee;

-- alias in join

SELECT e.first_name, e.last_name, d.dept_name
FROM employee AS e
JOIN department AS d
ON e.dept_id = d.dept_id;

