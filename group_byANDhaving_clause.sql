create database group_by_having;
use group_by_having;
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);

-- then insert sample rows
INSERT INTO employees (name, department, salary, joining_date) VALUES
('John', 'IT', 60000.00, '2023-01-15'),
('Alice', 'HR', 85000.00, '2022-11-10'),
('Bob', 'IT', 95000.00, '2023-02-20'),
('David', 'Finance', 65000.00, '2021-07-05'),
('Emma', 'HR', 55000.00, '2022-11-10'),
('Sophia', 'Marketing', 52000.00, '2023-05-25'),
('Liam', 'IT', 60000.00, '2023-01-15'),
('Olivia', 'Finance', 75000.00, '2021-07-05');

-- count no. of employees in each dept
select department, count(*) as department_count from employees group by department;

-- get avg salery per deparment
select department, avg(salary) as avg_salary from employees group by department;

-- get highest and lowest salary per department
select department, max(salary) as max_salary, min(salary) as min_salary from employees group by department;

-- count employees per department and joining year
select department, year(joining_date) as joining_year, count(*) as no_of_employees from employees group by department, year(joining_date);

-- select department by the highest avg salary
select department, avg(salary) as avg_salary from employees group by department ORDER BY avg_salary DESC;

select count(*),
	case
		when salary < 60000 then "low salary"
		when salary between 60000 and 70000 then "medium salary"
		else "high salary"
    end as salary_range
from employees group by salary_range;

-- “List all departments sorted by number of employees.”
select department, count(*) as total_employees from employees group by department order by total_employees desc;

select * from employees;

-- Find department(s) with the maximum number of employees
select department, count(*) as total_employee from employees group by department order by total_employee desc limit 1;

-- find department with more than four employees
select department, count(*) as total_employees from employees group by department having total_employees > 4;

-- find department with more than 2 employees and having avg salary more than 60000
select department, avg(salary) as avg_salary, count(*) as total_employees from employees group by department having total_employees > 2 and avg_salary > 60000;


