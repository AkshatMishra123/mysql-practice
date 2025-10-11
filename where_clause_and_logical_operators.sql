CREATE DATABASE bookstore;
use bookstore;
create table books (
	book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    price decimal(10, 2),
    publication_date DATE,
    category VARCHAR(30),
    in_stock INT 
);

--  INSERT
-- Insert 4 books into the books table
INSERT INTO books (book_id, title, author, price, publication_date, category, in_stock) VALUES
(1, 'The Alchemist', 'Paulo Coelho', 299.99, '1988-05-01', 'Fiction', 10),
(2, 'Clean Code', 'Robert C. Martin', 799.50, '2008-08-11', 'Programming', 5),
(3, 'Atomic Habits', 'James Clear', 499.00, '2018-10-16', 'Self-Help', 8),
(4, 'Sapiens', 'Yuval Noah Harari', 599.00, '2014-02-04', 'History', 12);

select * from books;

-- where 
select * from books WHERE category = 'History';

select title, price from books WHERE price < 700.00;

select title, publication_date from books WHERE publication_date > '2010-03-01'; 

INSERT INTO books (book_id, title, author, price, publication_date, category, in_stock) VALUES
(5, 'Introduction to Algorithms', 'Thomas H. Cormen', 1200.00, '2009-07-31', 'Programming', 4),
(6, 'The Pragmatic Programmer', 'Andrew Hunt', 950.00, '1999-10-20', 'Programming', 6);

select * from books;

-- and operator

select * from books WHERE category = 'programming' and price > 800;

-- or 
select * from books WHERE category = 'programming' or price > 800;

-- using both and or 
select * from books WHERE (category = 'programming' or category = 'self-help') and price < 1000; 

-- not operator
select * from books where category != 'programming';

-- other way 
select * from books where not category = 'programming';

-- enter some null value 
-- Insert a book with no author (author is NULL)
INSERT INTO books (book_id, title, author, price, publication_date, category, in_stock) VALUES
(7, 'Mystery of the Unknown', NULL, 350.00, '2025-01-01', 'Mystery', 7);

-- Verify the row
SELECT * FROM books;

-- null cmd
select * from books where author is null; -- note : use 'is' not '='

select * from books where author is not null;

-- pattern matching
-- select the book with code in its title
     -- like keyword
select * from books where title like '%code%';

-- Title ends with "Programmer"
SELECT * FROM books WHERE title LIKE '%programmer';

-- Title starts with "The":
SELECT * FROM books WHERE title LIKE 'The%';

-- case sensitive 
SELECT * FROM books WHERE BINARY title LIKE '%Code%';

-- between operator
select * from books where price between 599 and 800; -- will include the 599 and 800 also

-- in operator 
select * from books where category in (
'Programming', 'hIstory');  -- it is case insensitive 

-- books where price is greater than avg
select avg(price) from books;

-- via subquery 
select * from books where price > (select avg(price) from books);

-- in subquery
select * from books where category in ( select distinct category from books where in_stock > 9 );

-- Insert 3 books
INSERT INTO books (book_id, title, author, price, publication_date, category, in_stock) VALUES
(8, 'Mastering SQL', 'Jane Doe', 650.00, '2023-03-15', 'Programming', 10),
(9, 'AI for Everyone', 'John Doe', 1200.00, '2023-06-10', 'Technology', 7),
(10, 'Modern Web Development', 'Alice Smith', 850.00, '2023-09-01', 'Programming', 5);

-- Verify the inserted rows
SELECT * FROM books;


-- q1
-- find all books published in 2023 that cost less than the avg book price
select * from books where year( publication_date ) = 2023 and price < ( select avg(price) from books); 

-- q2
-- find all programming books with more than and equal to 5 copies in stock
select * from books where category = 'Programming' and in_stock >= 5;

-- optional sort in descending order 
select * from books where category = "Programming" and in_stock >= 5 ORDER BY in_stock DESC; 

-- q3
-- find books that are either in programming category with price < 900 or in fiction with price < 500
select * from books where (category = "Programming" and price < 900 ) or ( category = 'Fiction' and price  < 500 );

-- q4
-- select books where title has either 'the' or 'to' and were published after 1990
select * from books where (title like '%the%' or title like '%to%') and year(publication_date) > 1990;

-- q5
-- SELECT * FROM books WHERE in_stock = 0 OR author IS NULL;
select * from books where ( in_stock = 0 or author is null );

-- q6
-- -- Find the highest priced book per category
select * from books where price = ( select MAX(price) from books where category = books.category );
