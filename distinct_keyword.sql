create database employeedb;
use employeedb;
create table employees (
	id INT Auto_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
    );
    
-- INSERT ROWS
INSERT INTO employees (name, department, salary)
VALUES
('John Smith', 'HR', 50000.00),
('Emma Johnson', 'Finance', 60000.00),
('Liam Brown', 'IT', 70000.00),
('Emma Johnson', 'Finance', 60000.00),  -- duplicate row
('Olivia Davis', 'HR', 50000.00),       -- same dept & salary as John
('Noah Wilson', 'IT', 70000.00);        -- same dept & salary as Liam

SELECT * FROM employees;

-- Show unique departments
SELECT DISTINCT department FROM employees;

-- Show unique salary values
SELECT DISTINCT salary FROM employees;

-- Show unique department-salary combinations
SELECT DISTINCT department, salary FROM employees;

-- count of distinct department
select count( distinct department ) AS unique_deparments from employees;

-- distinct salaty values in descending order
select distinct salary from employees order by salary desc;

select distinct concat(name, " - ", department) from employees;
