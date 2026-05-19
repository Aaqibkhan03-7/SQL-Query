show databases ;
use sakila;
show tables;

  CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(10),
    Category VARCHAR(50),
    OrderDate DATE,
    OrderValue DECIMAL(10,2)
);
-- Insert rows in table
INSERT INTO Orders (OrderID, CustomerID, Category, OrderDate, OrderValue) VALUES
(1001, 'C201', 'Electronics', '2024-01-05', 12500),
(1002, 'C203', 'Apparel', '2024-01-07', 3200),
(1003, 'C205', 'Home', '2024-01-10', 5800),
(1004, 'C201', 'Electronics', '2024-01-15', 8900),
(1005, 'C207', 'Apparel', '2024-01-18', 2100),
(1006, 'C210', 'Home', '2024-01-22', 4700),
(1007, 'C203', 'Electronics', '2024-02-01', 15300),
(1008, 'C212', 'Apparel', '2024-02-05', 1800),
(1009, 'C205', 'Home', '2024-02-08', 6200),
(1010, 'C214', 'Electronics', '2024-02-12', 9400),
(1011, 'C207', 'Apparel', '2024-02-17', 2900),
(1012, 'C210', 'Electronics', '2024-02-20', 11000),
(1013, 'C212', 'Home', '2024-03-01', 3500),
(1014, 'C201', 'Apparel', '2024-03-05', 4100),
(1015, 'C214', 'Home', '2024-03-10', 7800);
select * from orders;
-- 1
select Category, sum(OrderValue) from orders group by Category;
-- 2
select category , count(OrderID) from orders group by Category;
-- 3
select category, max(orderValue) from orders group by Category;
-- 4
select distinct category from orders order by category;
select * from orders;
SELECT DISTINCT
CustomerID,
Category
FROM Sales_Data
ORDER BY CustomerID, Category;
-- 1 sum
select CustomerID,  Category,
 sum(OrderValue) as total_Revenue 
 from Sales_Data 
 group by CustomerID ,
 Category order by CustomerID , Category;
 -- 2 count
 select CustomerID,  Category, 
 count(OrderValue) as total_count 
 from Sales_Data 
 group by CustomerID ,
 Category order by CustomerID , Category;
 -- Revenue by Category and Month
 
 select Category , Month(order_date) as order_month,
 sum(OrderValue) as total_Revenue
 from Sales_data group by Category ,
 Month(Order_date) order by Month_Order, category ;
 
 -- primary key 


select * from employees;

-- primary defination --> Primary Key is a constraint that uniquely identifies each record in a table.
--                        It does not allow duplicate values and does not allow NULL values.
-- SELF JOIN
-- Same table ko khud ke saath join karte hain.
-- FULL OUTER JOIN
-- Dono tables ke saare records return karta hai

create database joindb;

use joindb;

CREATE TABLE employe (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    salary INT
);

INSERT INTO employe (emp_id, emp_name, department, manager_id, salary) VALUES
(1, 'Amit', 'Management', NULL, 120000),
(2, 'Neha', 'HR', 1, 75000),
(3, 'Raj', 'IT', 1, 90000),
(4, 'Simran', 'Finance', 1, 85000),
(5, 'Karan', 'IT', 3, 70000),
(6, 'Priya', 'IT', 3, 72000),
(7, 'Rohit', 'HR', 2, 50000),
(8, 'Anjali', 'HR', 2, 52000),
(9, 'Vikas', 'Finance', 4, 65000),
(10, 'Sneha', 'Finance', 4, 62000),
(11, 'Arjun', 'IT', 5, 55000),
(12, 'Pooja', 'IT', 5, 53000),
(13, 'Meera', 'HR', 7, 45000),
(14, 'Dev', 'Finance', 9, 48000),
(15, 'Nitin', 'IT', 6, 51000);

select * from employe;

 select e.emp_id , e.emp_name, e.manager_id, m.emp_id , m.emp_name from employe as e join employe as m
 on e.manager_id = m.emp_id;
  select e.emp_id , e.emp_name, e.manager_id, e.department , m.department , m.emp_id , m.emp_name from employe as e join employe as m
 on e.manager_id = m.emp_id and e.department = m.department;
 -- you find the employee name and it slary if its greater then salary of manager
 -- 
 create database subque;
CREATE TABLE Emp (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT);
-- Insert Data
INSERT INTO Emp(EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);
select * from emp;

select avg(salary) from emp ;
select * from emp where salary > (select avg(salary) from emp );

-- select max(salary) from emp
-- select * from emp where salary > (select avg(salary) from emp );


select  min(salary) from emp where department = 'IT' ;

-- multirowSubquery topic
-- MULTIROWSUBQUERY TOPIC

select * from emp where name = 'Alice' or name = 'Bob';

select  department from emp where salary = 80000 or salary = 50000;

select * from emp where department in (select department from emp where name = 'Alice' or name = 'Bob');
-- multisubquery can not be use opretors

select salary from emp where emp_id = 103 or emp_id = 105;

 select * from emp where salary > any (select salary from emp where emp_id = 103 or emp_id = 107);
 
 select * from emp where department = 'HR' ;
 
 select * from emp where salary > any (select salary from emp where department = 'HR');
 
 select * from emp where salary > all (select salary from emp where department = 'HR');
 select * from emp;
 
 select * from emp where department = 'IT';
 
  select * from emp where salary > all (select salary from emp where department = 'IT');
  
  -- find the emp detail who work with it department and have the salary of emp id 101
--   SELECT salary FROM emp WHERE department = 'IT'
--   AND salary in (SELECT salary FROM emp WHERE emp_id = 101);
--   
--   -- find the name of person who slary is > all the salary of HR or  IT department
--   SELECT NAME  FROM emp WHERE salary > ALL (SELECT salary FROM emp
--     WHERE department IN ('HR', 'IT'));
--   -- find the emp id emp name of the user who salary is > the slary of any emp working id 
--   SELECT emp_id, name FROM emp WHERE salary > ANY ( SELECT salary FROM emp
--     WHERE department = 'IT');
--   -- find the secode highest salary from this table
--   select * from emp where emp_id = 101 ;
--   
-- 1
SELECT * FROM emp WHERE department = 'IT' AND salary > (SELECT salary FROM emp WHERE emp_id = 101);

-- 2
SELECT name FROM emp WHERE salary > ALL ( SELECT salary FROM emp WHERE department IN ('HR', 'IT'));

-- 3
SELECT emp_id, name FROM emp WHERE salary > ANY (SELECT salary FROM emp WHERE manager_id = 101);

-- 4
SELECT MAX(salary) FROM emp WHERE salary < (SELECT MAX(salary) FROM emp);
  
  -- Correlated Query only use for interview question can not use working 
  -- seconed
  -- dependent 
  use sakila;
  create database correlated;
  drop database correlated;
  use subque;
  create table departments (dept_id int , dept_name varchar(20), location varchar(20));
  insert into departments value (10,'HR','Mumbai') , (20,'IT','Banglore') , ( 30,'Finace','Delhi');
  
  select * from departments;
  select dept_name from departments where location in ('Mumbai','Delhi');
  
 select * from emp  where department = any (select dept_name from department where location in ('Banglore','Delhi'));
  
  select dept_name from where department = (select dept_name from department where dept_name = 'HR');
  
  -- correlated where inner query is excure for each vlaue of the outer query
  -- so inner query also referce to the colum query
  
  select * from emp where department = 'IT'  ;
 -- muje wo emplouyee chiye jin ki  khud ki sanem as the highest salary 
  select max(salary) from emp where department = 'Finance';
  select  * from emp as eout where salary = (select max(salary) from emp where department = eout.department);
  select * from emp as e where 70000 < all(select salary from emp where  department = e.department); 
  
-- all opretor null max opretor use not use 
-- exist and in defferent
-- topic windo fuction
use sakila;
select * from employees;

select * , sum(salary) over( partition by department), sum(salary) over() from employees ;

select * , sum(salary) over( partition by hire_date ), sum(salary) over() from employees ;

select first_name , salary , department , sum(salary) over(partition by department), (salary/sum(salary) over(partition by department)* 100 from employees;


-- window function

create database windowsdb;
use windowsdb;


-- ============================================
--  Create the employees table
-- ============================================
CREATE TABLE employees (
  emp_id    INT,
  name      VARCHAR(50),
  dept      VARCHAR(30),
  salary    INT,
  hire_year INT
);
 
-- ============================================
--  Insert sample data (12 employees)
-- ============================================
INSERT INTO employees VALUES
  (1,  'Alice',   'IT',      90000, 2019),
  (2,  'Bob',     'IT',      75000, 2020),
  (3,  'Charlie', 'IT',      82000, 2018),
  (4,  'Diana',   'HR',      68000, 2021),
  (5,  'Eve',     'HR',      72000, 2019),
  (6,  'Frank',   'HR',      65000, 2022),
  (7,  'Grace',   'Sales',   55000, 2020),
  (8,  'Henry',   'Sales',   60000, 2021),
  (9,  'Iris',    'Sales',   58000, 2019),
  (10, 'Jack',    'Finance', 95000, 2017),
  (11, 'Karen',   'Finance', 88000, 2018),
  (12, 'Leo',     'Finance', 91000, 2020);



select * from employees;

select * , max(salary) over(partition by dept order by hire_year) from employees;

select * , avg(salary) over(partition by dept) ,
 case 
    when salary > avg(salary) over ( partition by dept) then 'Above avg salary' 
    else 'less than avg salary' end from employees;
    
    select * , row_number() over(order by dept) from employees;
    
    select * , row_number() over(partition by dept) from employees;
    
    select * , rank() over(partition by dept order by salary desc)from employees;
    
-- Learning Assignment
     -- Difference between windows function and group by
     -- Difference between Row number, rank and dense rank
     -- Difference between where and having clause
     -- Types of joins in sql
     -- Natural join and cartesian join
     -- What is super key , primary key foreign key, unique key 
     






















-- 



