-- basic mathematical funcn
-- rounding funcn
-- trignometric funcn
-- logarithmic and exponential functions
-- bitwise funcn

create database numericFunctionsDb;
use numericFunctionsDB;
create table numbers (
	id INT AUTO_INCREMENT PRIMARY KEY,
    num_value DECIMAL(10, 5)
);
INSERT INTO numbers (num_value) VALUES
(25.8954),
(-17.567),
(100.999),
(-0.4567),
(9.5),
(1234.56789),
(0);
select * from numbers;

-- absolute value/ +ve values
select num_value, ABS(num_value) AS absolute_value from numbers;

-- rounding. roundup-> CEIL, ROUND DOWN-> FLOOR
SELECT num_value, CEIL(num_value) as round_up, FLOOR(num_value) as round_down from numbers;

select num_value, round(num_value, 2) as round_value from numbers; -- rounding upto a specific place


-- retrive a number upto a certan place no rounding
select num_value, TRUNCATE(num_value, 2) from numbers;

-- power of any number
select power(2, 5);

-- square of column
select num_value, power(num_value, 2) as square from numbers; 

-- remainder mod()

-- square root
select num_value, SQRT(ABS(num_value)) as square_root from numbers;

-- exponential
select exp(2);

select num_value,
	case
		when num_value > 709 then "value too large for exp()"
        else exp(num_value)
	end as exp_value
from numbers;

-- log(x,y) log of y with the base of x
-- log10(y) log of y with base 10

select num_value, log(2, abs(num_value)) as logbase2, log10(abs(num_value)) as logbase10 from numbers; -- why abs()? bcz -ve ka log undefined hota hai


-- pi values
select pi();

-- degree to radian
select num_value, radians(num_value) as radian_value, degrees(num_value) as degree_value from numbers;

-- bitwise 
SELECT BIT_AND(num_value) AS bitwise_and
FROM numbers;

select bit_or(num_value) as bitwise_or from numbers;

select bit_xor(num_value) as bitwise_xor from numbers;


-- DATE AND TIME

-- DATE: Format -> 'YYYY-MM-DD'  (Example: '2025-10-23')
-- DATETIME: Format -> 'YYYY-MM-DD HH:MM:SS'  (Example: '2025-10-23 14:35:20')
-- TIMESTAMP: Format -> 'YYYY-MM-DD HH:MM:SS' (stored in UTC, timezone aware)
-- TIME: Format -> 'HH:MM:SS'  (Example: '14:35:20')
-- YEAR: Format -> 'YYYY'  (Example: '2025')


-- for current timestamp
select now();
-- for current date
select curdate();
-- current time
select curtime();

select year(now());
select minute(now());
select second(now());
select day(now());


-- setting a personalized date format
select date_format('2025-04-13', '%W, %M %e, %Y') as formatted_date;

-- increment in date
select date_add('2025-03-13', interval 7 day) as new_date;
select date_add('2025-03-13', interval 7 month) as new_date;

-- decrement
select date_sub('2025-03-13', interval 7 day) as new_date;
select date_sub('2025-03-13', interval 7 month) as new_date;

-- diff between date
select datediff('2025-09-21', '2025-01-25') as date_diff;

-- UNIX_TIMESTAMP(): Converts DATETIME → UNIX seconds (integer)
-- FROM_UNIXTIME(): Converts UNIX seconds → DATETIME

-- Current timestamp (seconds since 1970-01-01)
SELECT UNIX_TIMESTAMP();

-- Convert a specific DATETIME to UNIX timestamp
SELECT UNIX_TIMESTAMP('2025-10-23 14:30:00') AS unix_time;


SELECT FROM_UNIXTIME(1761210600, '%Y-%m-%d %H:%i:%s') AS formatted_time;



create database db24;
use db24;
create table orders (
	order_id int auto_increment primary key, 
    customer_name VARCHAR(100),
    ORDER_DATE DATETIME
);

INSERT INTO orders (customer_name, order_date) VALUES
('Akshat Mishra', '2024-10-23 10:15:00'),
('Riya Sharma', '2025-10-23 11:45:30'),
('Aditya Verma', '2025-10-22 09:20:15'),
('Priya Nair', '2025-10-21 18:00:00'),
('Rahul Mehta', NOW()),               -- current date and time
('Karan Patel', '2023-10-20 08:00:45'),
('Sneha Gupta', '2025-10-19 12:30:25'),
('Isha Singh', '2025-10-18 22:10:00');

SELECT * FROM ORDERS;

-- QUERYING ORDERS IN LAST 7 DAYS
SELECT * FROM ORDERS WHERE ORDER_DATE >= DATE_SUB(NOW(), INTERVAL 7 DAY);

-- aggregate funtion
-- used to perform calculations on multiple rows of data and return a single summarizzed values
-- count() return number of rows
-- sum() return sum of numeric colums
-- avg() avg of numeric column
-- min() returns minimum value
-- max()

create database Companydb2;
use Companydb2;

create table employees (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date date
);

INSERT INTO employees (name, department, salary, hire_date) VALUES
('Amit Sharma', 'HR', 45000.50, '2022-03-15'),
('Neha Singh', 'IT', 75000.00, '2023-01-10'),
('Rahul Verma', 'Finance', 60000.75, '2021-11-30'),
('Priya Nair', 'Marketing', 52000.20, '2022-07-25'),
('Karan Patel', 'IT', 80000.00, '2023-05-14'),
('Sneha Gupta', 'HR', 47000.00, '2020-09-01'),
('Ishan Kumar', 'Sales', 55000.40, '2021-04-18'),
('Ritu Mehta', 'Finance', 61000.10, '2023-02-22');


-- count number of rows
select count(*) from employees;
-- withn where clause 
select count(*) from employees where salary > 30000 and department = 'HR';
-- SUM
SELECT SUM(salary) from employees where department = 'HR';

-- AVG 
SELECT AVG(salary) as hr_avg_salary from employees where department = 'HR';

-- MIN()
select min(salary) from employees;

select min(salary) from employees where department = 'HR';

select MAX(salary) from employees;

select min(salary) from employees where department = 'HR';


