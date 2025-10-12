-- order by clause
create database db3;
use db3;

create table products (
	product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT,
    last_updated TIMESTAMP
);
-- Insert sample data
INSERT INTO products (product_id, product_name, category, price, stock_quantity, last_updated) VALUES
(1, 'MacBook Air M2', 'Electronics', 1099.00, 8, CURRENT_TIMESTAMP),
(2, 'Noise Cancelling Headphones', 'Electronics', 199.99, 15, CURRENT_TIMESTAMP),
(3, 'Standing Desk', 'Furniture', 349.50, 5, CURRENT_TIMESTAMP),
(4, 'Ergonomic Chair', 'Furniture', 289.00, 12, CURRENT_TIMESTAMP),
(5, 'Wireless Mouse', 'Accessories', 29.99, 25, CURRENT_TIMESTAMP);

-- View table
SELECT * FROM products;

-- SORT PRODUCTS BY PRICE IN ASC
select * from products ORDER BY price;

-- desc order
select * from products ORDER BY price DESC;

-- sort by category only
select * from products ORDER BY category ASC; -- alpha batically sort , ASC is optional as default order is always asc

-- sort products of same category price wise
select * from products ORDER BY category ASC, price ASC;

-- sort by column position
select * from products ORDER BY 4; -- will sort as per the 4th column(price)

-- sort along with where clause
select * from products where category = 'Furniture' ORDER BY price DESC;

-- case sensitive shorting.   a, A 
select * from products ORDER BY binary category;

-- length of string
select product_name, length( product_name ) from products;

-- sort by length of str
select product_name, length( product_name ) from products ORDER BY length( product_name ) desc;

-- product details of highest quantity using order by, limit
select * from products order by stock_quantity desc LIMIT 1;

-- custom. shorting
--  we want to sort as such manner in which electronics -> access -> furniture
select * from products order by field(category, 'Electronics', 'Accessories', 'Furniture');

-- also along with price wise in asc
select * from products order by field(category, 'Electronics', 'Accessories', 'Furniture'), price asc;


-- Custom sorting using CASE statement
-- We want order: Electronics → Accessories → Furniture

SELECT *
FROM products
ORDER BY 
  CASE
    WHEN category = 'Electronics' THEN 1   -- first priority
    WHEN category = 'Accessories' THEN 2   -- second priority
    WHEN category = 'Furniture' THEN 3     -- third priority
    ELSE 4                                 -- everything else after these
  END,
  price ASC;   -- secondary sort within each category

-- 📘 CASE STATEMENT SYNTAX (for reference)
-- CASE 
--     WHEN condition1 THEN result1
--     WHEN condition2 THEN result2
--     ...
--     ELSE default_result
-- END
--
-- ▶ In SELECT → used to create conditional columns
-- ▶ In ORDER BY → used to control custom sorting order
-- ==============================================

-- case statements
-- low stock and high price
-- low stock = less than 15 items
-- good price = greater than 250
-- best deal = low stock and good price


SELECT 
    product_name,
    category,
    price,
    stock_quantity,

    CASE
        WHEN stock_quantity < 15 AND price > 250 THEN 'Best Deal'
        WHEN stock_quantity < 15 THEN 'Low Stock'
        WHEN price > 250 THEN 'High Price'
        ELSE 'Normal'
    END

FROM products;

-- Insert 3 rows with NULL values for NULL-handling practice
INSERT INTO products (product_id, product_name, category, price, stock_quantity, last_updated) VALUES
(6, 'USB-C Hub', 'Accessories', NULL, 10, CURRENT_TIMESTAMP),                -- NULL price
(7, 'Office Lamp', NULL, 59.99, NULL, CURRENT_TIMESTAMP),                    -- NULL category and stock
(8, NULL, 'Electronics', 899.00, 6, CURRENT_TIMESTAMP);                      -- NULL product_name

select * from products;

select * from products ORDER BY price; -- null price  will come at top
select * from products ORDER BY price is null; -- null (price) will come at bottom bcz sql will do a boolean check 
-- of is null or not null if it not null then bool -> 0 otherwise -> 1 later order by will sort in asc order 

-- sorting with calculaation column
select *, price * stock_quantity AS total_value from products order by price*stock_quantity desc;

-- explain keyword
explain select * from products order by price;
