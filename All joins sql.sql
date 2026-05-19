create database regexjoin;

use regexjoin;

-- Create first table: customers
CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Insert records into customers
INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Rahul', 'Pune'),
(4, 'Sneha', 'Jaipur'),
(5, 'Karan', 'Chennai');


-- Create second table: orders
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    product_name VARCHAR(50)
);

-- Insert records into orders
-- Duplicate customer_id is present because some customers ordered multiple products
INSERT INTO orders VALUES
(101, 1, 'Laptop'),
(102, 2, 'Mobile'),
(103, 1, 'Keyboard'),
(104, 3, 'Mouse'),
(105, 2, 'Headphones');

select * from orders;
select * from customers;
-- wht use joins
-- answer Normalize problem solve 
-- INNER JOIN
select * from orders as o 
inner join customers as c
on o.customer_id = c.customer_id;

-- LEFT JOIN
select * from orders as o 
left join customers as c
on o.customer_id = c.customer_id;

-- RIGHT JOIN
select * from orders as o 
right join customers as c
on o.customer_id = c.customer_id;


-- FULL JOIN
SELECT *
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name;

select * from Orders;
-- Selfjoin 
SELECT a.column_name, b.column_name
FROM table_name a
JOIN table_name b
ON a.common_column = b.common_column;

-- Natural joins
SELECT *
FROM table1
NATURAL JOIN table2;

-- Cross JOIN
SELECT *
FROM table1
CROSS JOIN table2;





