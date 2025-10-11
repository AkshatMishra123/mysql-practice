-- Step 1: Create a new database named 'test'
-- ------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS test;

-- ------------------------------------------------------------
-- Step 2: Switch to the 'test' database to start using it
-- ------------------------------------------------------------
USE test;

-- ------------------------------------------------------------
-- Step 3: Create a table named 'employees'
-- This table will store information about company employees.
-- ------------------------------------------------------------
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,         -- Unique ID for each employee
    first_name VARCHAR(50) NOT NULL,                    -- Employee's first name
    last_name VARCHAR(50) NOT NULL,                     -- Employee's last name
    hire_date DATE DEFAULT (CURRENT_DATE()),            -- The date employee was hired
    email VARCHAR(100) UNIQUE,                          -- Unique email address
    phone_number VARCHAR(100) UNIQUE,                   -- Unique phone number
    salary DECIMAL(10,2) CHECK (salary > 0.0),          -- Employee's salary, must be > 0
    employment_status ENUM('active', 'on leave', 'terminated') DEFAULT 'active', -- Work status
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,     -- Timestamp when record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Updates automatically
);

-- ------------------------------------------------------------
-- Step 4: Insert sample employee records into the 'employees' table
-- ------------------------------------------------------------

-- Example employee 1
INSERT INTO employees (
    first_name,
    last_name,
    hire_date,
    email,
    phone_number,
    salary,
    employment_status
) VALUES (
    'John',
    'Smith',
    '2024-01-15',
    'john.smith@company.com',
    '+91-555-1234-123',
    75000.00,
    'active'
);

-- Example employee 2
INSERT INTO employees (
    first_name,
    last_name,
    hire_date,
    email,
    phone_number,
    salary,
    employment_status
) VALUES (
    'Emma',
    'Johnson',
    '2023-12-05',
    'emma.johnson@company.com',
    '+91-555-2345-678',
    82000.00,
    'on leave'
);

-- Example employee 3
INSERT INTO employees (
    first_name,
    last_name,
    hire_date,
    email,
    phone_number,
    salary,
    employment_status
) VALUES (
    'Raj',
    'Mehta',
    '2022-09-01',
    'raj.mehta@company.com',
    '+91-555-3456-789',
    95000.00,
    'active'
);

-- Example employee 4
INSERT INTO employees (
    first_name,
    last_name,
    hire_date,
    email,
    phone_number,
    salary,
    employment_status
) VALUES (
    'Sophia',
    'Lee',
    '2021-06-10',
    'sophia.lee@company.com',
    '+91-555-4567-890',
    64000.00,
    'terminated'
);

-- ------------------------------------------------------------
-- Step 5: Modify the 'employees' table to add new columns
-- Adding a 'description' (text type) and an 'emergency_contact' column.
-- ------------------------------------------------------------
ALTER TABLE employees
ADD COLUMN description TEXT,
ADD COLUMN emergency_contact VARCHAR(100);

-- select commands

select * from employees;

select first_name, email from employees;

select * from employees where first_name = 'John';
select * from employees where salary = 64000.00;

-- ORDER BY
select * from employees where employment_status = 'active' ORDER BY salary;

-- descending order 
select * from employees where employment_status = 'active' ORDER BY salary DESC;

-- USING LIMIT TO FIND HIGHEST SALARY GUY
select * from employees where employment_status = 'active' ORDER BY salary DESC LIMIT 1;

SELECT * FROM employees limit 2;

-- distinct -> gives unique items
select distinct employment_status from employees;

-- mathematical operation on a column
select first_name, salary * 1.2  as salary from employees;

-- concat() to merge two columns
select concat(first_name, ' ', last_name) as name from employees;

-- ------------------------------------------------------------
-- 1️⃣ Using ROUND(): Round salary values after applying a raise
-- ------------------------------------------------------------
-- Suppose we want to give everyone a 12.5% bonus and round it to 2 decimals
SELECT 
    first_name,
    last_name,
    salary AS original_salary,
    ROUND(salary * 1.125, 1) AS new_salary  -- ROUND(value, decimal_places)
FROM employees;

-- ------------------------------------------------------------
-- 2️⃣ Using YEAR(): Extract the year from the hire_date column
-- ------------------------------------------------------------
-- This helps find the year in which each employee was hired
SELECT 
    first_name,
    last_name,
    hire_date,
    YEAR(hire_date) AS hire_year  -- Extracts year portion from a date
FROM employees;

-- ------------------------------------------------------------
-- 3️⃣ Using WHERE clause: Filter data based on specific conditions
-- ------------------------------------------------------------
-- Example A: Employees with salary greater than 80,000
SELECT 
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > 80000;

-- Example B: Employees hired after 2023
SELECT 
    first_name,
    last_name,
    hire_date
FROM employees
WHERE YEAR(hire_date) > 2023;

-- Example C: Employees who are 'active' AND earn more than 70,000
SELECT 
    first_name,
    last_name,
    salary,
    employment_status
FROM employees
WHERE employment_status = 'active' AND salary > 70000;

-- Example D: Employees whose name starts with 'S'
SELECT 
    first_name,
    last_name
FROM employees
WHERE first_name LIKE 'S%';   -- % means any string after 'S'


-- employee with second wighest salary
select * from employees ORDER BY salary DESC LIMIT 1 OFFSET 1;

-- another way 
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- AVG()
SELECT AVG(salary) from employees;

-- subquery
-- employee details whose salary is greter than avg 
select * from employees where salary > (SELECT AVG(salary) from employees);
