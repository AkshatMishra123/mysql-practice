create database db4;
use db4;
create table products (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO products (name, price, category) VALUES
('Laptop', 1200.00, 'Electronics'),
('Mouse', 25.50, 'Accessories'),
('Keyboard', 45.00, 'Accessories'),
('Desk', 300.00, 'Furniture'),
('Chair', 150.00, 'Furniture'),
('Monitor', 250.00, 'Electronics'),
('USB-C Hub', NULL, 'Accessories'),        -- NULL price for practice
('Office Lamp', 59.99, NULL),             -- NULL category for practice
('Smartphone', 899.00, 'Electronics'),
('Headphones', 199.99, 'Electronics');

select * from products;

-- two prodtucts only in sorted id order
select * from products ORDER BY id LIMIT 2;

-- two prodtucts only in sorted id order but by skipping the first three products
-- offset
select * from products ORDER BY id LIMIT 2 OFFSET 3;

-- Pagination
-- Pagination is the process of splitting query results into smaller, manageable chunks (pages) 
-- instead of fetching everything at once.

-- suppose 9 rows , 3 pages, page size is 3

-- page 1
select * from products order by id limit 3 offset 0;
-- page 2
select * from products order by id limit 3 offset 3;
-- page 3 
select * from products order by id limit 3 offset 6;

--  shorter syntax to achieve pagination
-- select * from products limit [offset], [row_count];
-- page 1
select * from products LIMIT 0, 3;
-- page 2


-- top 3 most expensive products
select * from products ORDER BY price DESC LIMIT 3;

-- if we want shuffled 5 random rows not in any serial order than we use order by rand() other wise if we use 
-- limit 5 it will give 5 rows in serial order always

select * from products order by rand() limit 5; -- always return a unique result

-- NOTE: Queries using OFFSET and ORDER BY RAND() can be highly inefficient on large tables
--       because MySQL has to scan and sort all rows before applying LIMIT.

