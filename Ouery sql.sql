show databases;
use sakila;
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
department VARCHAR(50),
job_title VARCHAR(60),
salary DECIMAL(10,2),
hire_date DATE,
birth_date DATE,
phone VARCHAR(20),
city VARCHAR(50),
country VARCHAR(50),
is_active CHAR(1)
);

select * from employees;

INSERT INTO employees VALUES
(1,  'Alice',  'Smith',    'alice.smith@gmail.com', 'IT',        'Software Engineer',    85000.00,'2019-03-15','1990-06-20','555-1001','New York',     'USA','Y'),
(2,  'Bob',    'Johnson',  'bob.j@yahoo.com',       'HR',        'HR Manager',           72000.00,'2020-07-01','1985-11-05','555-1002','Chicago',      'USA','Y'),
(3,  'Carol',  'Williams', 'carol.w@gmail.com',     'Finance',   'Accountant',           65000.00,'2018-01-10','1992-03-14','555-1003','Houston',      'USA','Y'),
(4,  'David',  'Brown',    'david.b@outlook.com',   'IT',        'DevOps Engineer',      90000.00,'2021-05-20','1988-09-25','555-1004','Los Angeles',  'USA','Y'),
(5,  'Emma',   'Jones',    'emma.j@gmail.com',      'Marketing', 'Marketing Lead',       78000.00,'2017-11-30','1991-07-08','555-1005','Phoenix',      'USA','Y'),
(6,  'Frank',  'Garcia',   'frank.g@yahoo.com',     'Sales',     'Sales Representative', 55000.00,'2022-02-14','1994-02-28','555-1006','Philadelphia', 'USA','N'),
(7,  'Grace',  'Martinez', 'grace.m@gmail.com',     'IT',        'QA Engineer',          68000.00,'2020-09-01','1993-12-01','555-1007','San Antonio',  'USA','Y'),
(8,  'Henry',  'Davis',    'henry.d@outlook.com',   'Finance',   'Financial Analyst',    76000.00,'2019-06-15','1989-04-17','555-1008','San Diego',    'USA','Y'),
(9,  'Isla',   'Wilson',   'isla.w@gmail.com',      'HR',        'Recruiter',            60000.00,'2021-10-05','1995-08-22','555-1009','Dallas',       'USA','Y'),
(10, 'Jack',   'Moore',    'jack.m@yahoo.com',      'Marketing', 'SEO Specialist',       58000.00,'2023-01-09','1997-01-15','555-1010','San Jose',     'USA','Y'),
(11, 'Karen',  'Taylor',   'karen.t@gmail.com',     'Sales',     'Sales Manager',        82000.00,'2016-04-20','1984-05-30','555-1011','Austin',       'USA','Y'),
(12, 'Liam',   'Anderson', 'liam.a@outlook.com',    'IT',        'Data Scientist',       95000.00,'2020-11-15','1987-10-10','555-1012','Jacksonville', 'USA','Y'),
(13, 'Mia',    'Thomas',   'mia.t@gmail.com',       'Finance',   'Tax Consultant',       71000.00,'2022-06-01','1993-06-15','555-1013','Columbus',     'USA','Y'),
(14, 'Noah',   'Jackson',  'noah.j@yahoo.com',      'IT',        'System Admin',         80000.00,'2018-08-25','1990-02-14','555-1014','Charlotte',    'USA','N'),
(15, 'Olivia', 'White',    'olivia.w@gmail.com',    'HR',        'HR Assistant',         50000.00,'2023-03-20','1998-09-05','555-1015','Indianapolis', 'USA','Y'),
(16, 'Paul',   'Harris',   'paul.h@outlook.com',    'Marketing', 'Content Writer',       52000.00,'2021-07-10','1996-11-20','555-1016','San Francisco','USA','Y'),
(17, 'Quinn',  'Clark',    'quinn.c@gmail.com',     'Sales',     'Sales Representative', 56000.00,'2022-09-15','1995-04-11','555-1017','Seattle',      'USA','Y'),
(18, 'Rachel', 'Lewis',    'rachel.l@yahoo.com',    'Finance',   'Budget Analyst',       73000.00,'2019-12-01','1991-01-30','555-1018','Denver',       'USA','Y'),
(19, 'Sam',    'Robinson', 'sam.r@gmail.com',       'IT',        'Cloud Architect',     105000.00,'2017-05-22','1986-07-19','555-1019','Nashville',    'USA','Y'),
(20, 'Tina',   'Walker',   'tina.w@outlook.com',    'HR',        'Training Manager',     69000.00,'2020-03-08','1988-12-03','555-1020','Baltimore',    'USA','Y'),
(21, 'Uma',    'Hall',     'uma.h@gmail.com',       'Marketing', 'Brand Manager',        77000.00,'2018-10-17','1990-08-25','555-1021','Louisville',   'USA','N'),
(22, 'Victor', 'Young',    'victor.y@yahoo.com',    'Sales',     'Sales Director',       98000.00,'2015-02-10','1980-03-07','555-1022','Portland',     'USA','Y');



select * from employees;

select * from employees;

-- 1
select emp_id,first_name,last_name,department,salary from employees where salary between 65000 and 85000;
select emp_id,first_name,last_name,department,salary from employees where salary>=65000 and salary<=85000;

-- 2
select emp_id,first_name,last_name,department,job_title from employees where department in ('IT','finance'); 
select emp_id,first_name,last_name,department,job_title from employees where department ='IT' or department ='finance';

-- 3
select emp_id,first_name,last_name,department from employees where last_name like '%son';	
select emp_id,first_name,last_name, substr(last_name,-3) from employees where substr(last_name,-3)='son';

-- 4
select emp_id,first_name,last_name,salary,job_title from employees where is_active='Y' and department='IT';

-- 5
use sakila;
select * from employees where department='Finance';
select emp_id,upper(first_name)as aaqib,lower(last_name) as last_name_lower,salary from  employees where department='Finance';

-- 6
select emp_id,first_name,length(first_name) as name_length ,department  from employees where LENGTH(first_name)  > 4;
select emp_id,first_name,length(first_name) as name_length ,department  from employees where first_name like '_____%';

-- 7
select emp_id,concat(first_name,' ',last_name) as full_name,length(concat(first_name,' ',last_name)) as full_name_length ,department
 from employees where department='marketing';
 
-- 8
select emp_id first_name,last_name,hire_date,year(hire_date) as hire_year,
year(now()) - year(hire_date) as years_ago from employees where department = 'Finance';
    
 -- 9   
SELECT first_name,last_name,salary,ROUND(salary, -4) AS rounded_salary,Mod(ROUND(salary, -4),salary) AS remainder
FROM employees WHERE department = 'IT';

-- 10
 select emp_id,first_name,last_name, email from employees where email like '%@outlook.com';
 
-- 12 
 SELECT emp_id,first_name,last_name,email,SUBSTRING_INDEX(email, '@', 1) AS username
FROM employees 
WHERE department = 'HR';

 -- 13
SELECT concat(first_name,' ',last_name)as full_name,department,salary FROM employees
WHERE department NOT IN ('IT', 'Finance')AND salary NOT BETWEEN 60000 AND 80000;
 
SELECT concat(first_name,' ',last_name)as full_name,department,salary FROM employees WHERE department NOT IN ('IT', 'Finance')
AND (salary < 60000 OR salary > 80000);	

-- 14
SELECT emp_id,first_name,last_name, email,UPPER(SUBSTRING_INDEX(email, '@', 1)) AS username_upper ,LENGTH(SUBSTRING_INDEX(email, '@', 1)) 
as username_length FROM employees
WHERE LENGTH(SUBSTRING_INDEX(email, '@', 1)) > 6;

-- 15

select emp_id,concat(first_name,' ',last_name) as full_name,birth_date,timestampdiff(year, birth_date, now())as age,salary,department 
from employees where timestampdiff(year, birth_date, now()) between 30 and 38 and salary > 650;

select * from customer where customer_id = 2 or customer_id > 7;

select first_name ,char_length(first_name)as first_name_length from customer ;

# order by -- use case star from small -- and big value desc use 
select * from employees
order by salary desc ;

select first_name , department, salary from employees order by department,salary;

select salary, hire_date, year(hire_date) from employees 
order by year(hire_date),salary desc;

select distinct department , salary from employees;

select count(department) from employees;

select count(first_name) from employees;

select count(district ),count(address_id), count(address2) from address;

select  * from employees;

select count(department),count(distinct department) from employees;

select sum(salary),min(salary), avg(salary) from employees;

select max(salary),min(salary),avg(salary)from employees;

select sum(salary),sum(distinct salary) from employees;
-- what is group by topic'

use sakila;
-- count not null count 
select sum(salary),count(salary),avg(salary)
 from employees;

select sum(salary) from employees where department = 'IT';

select count(salary) , sum(salary) from employees where department = 'Finance';

select department from employees group by department;
select email from employees group by  email ;
select department, sum(salary) from employees group by departments;
select  department ,sum(salary), count(department), avg(department) from employees group by department;
 
 select job_title ,count(job_title) from employees group by job_title;
 select * from employees where job_title= 'Marketing Lead';
 select job_title ,sum(salary) from employees group by job_title;

select * from payment;
use sakila;
-- group by question and anwser
-- 1 
select sum(amount),avg(amount)from payment ;
-- 2
select count(payment_id) from payment group by customer_id;

 -- 3
 select sum(payment_id ) from payment where customer_id between 2 AND 5;
 -- 4
 select avg(amount) as avg_amount from payment where  year(payment_date) = 2005;
 -- 5
  select count(payment_id) from payment group by customer_id ;
 -- 6
 select customer_id, count(payment_id), sum(amount) from payment where customer_id > 3 group by  customer_id;
-- 7
select amount , count(*) as occurrence from payment group by amount;
-- 8
select  sum(amount) from payment;  
-- 9
select avg(amount) from payment group by staff_id;
-- 10
select sum(amount) from payment group by month(payment_date);
-- 11


SELECT MAX(salary) AS second_highest FROM employees WHERE salary < (SELECT MAX(salary) FROM employees); --- I I V

SELECT MAX(salary) FROM employees;


select count(*), count(payment_id) from payment group by customer_id;
select  customer_id, count(payment_id) from payment group by customer_id;
select customer_id from payment where customer_id >= 3 group by customer_id;
use sakila;
CREATE TABLE sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    region VARCHAR(50),
    product VARCHAR(50),
    sales_person VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE
);


INSERT INTO sales (region, product, sales_person, amount, sale_date) VALUES
('North', 'Laptop', 'Amit', 55000, '2025-01-05'),
('North', 'Mobile', 'Amit', 20000, '2025-01-06'),
('South', 'Laptop', 'Ravi', 60000, '2025-01-07'),
('East', 'Tablet', 'Suman', 15000, '2025-01-08'),
('West', 'Laptop', 'Neha', 58000, '2025-01-09'),

('North', 'Tablet', 'Amit', 12000, '2025-01-10'),
('South', 'Mobile', 'Ravi', 22000, '2025-01-11'),
('East', 'Laptop', 'Suman', 50000, '2025-01-12'),
('West', 'Tablet', 'Neha', 14000, '2025-01-13'),
('North', 'Laptop', 'Amit', 57000, '2025-01-14'),

('South', 'Tablet', 'Ravi', 13000, '2025-01-15'),
('East', 'Mobile', 'Suman', 21000, '2025-01-16'),
('West', 'Laptop', 'Neha', 61000, '2025-01-17'),
('North', 'Mobile', 'Amit', 19000, '2025-01-18'),
('South', 'Laptop', 'Ravi', 62000, '2025-01-19'),

('East', 'Tablet', 'Suman', 16000, '2025-01-20'),
('West', 'Mobile', 'Neha', 23000, '2025-01-21'),
('North', 'Tablet', 'Amit', 11000, '2025-01-22'),
('South', 'Mobile', 'Ravi', 25000, '2025-01-23'),
('East', 'Laptop', 'Suman', 52000, '2025-01-24'),

('West', 'Tablet', 'Neha', 13500, '2025-01-25'),
('North', 'Laptop', 'Amit', 59000, '2025-01-26'),
('South', 'Tablet', 'Ravi', 12500, '2025-01-27'),
('East', 'Mobile', 'Suman', 20500, '2025-01-28'),
('West', 'Laptop', 'Neha', 60000, '2025-01-29'),

('North', 'Mobile', 'Amit', 21000, '2025-01-30'),
('South', 'Laptop', 'Ravi', 63000, '2025-01-31'),
('East', 'Tablet', 'Suman', 17000, '2025-02-01'),
('West', 'Mobile', 'Neha', 24000, '2025-02-02'),
('North', 'Tablet', 'Amit', 12500, '2025-02-03'),

('South', 'Mobile', 'Ravi', 26000, '2025-02-04'),
('East', 'Laptop', 'Suman', 54000, '2025-02-05'),
('West', 'Tablet', 'Neha', 15000, '2025-02-06'),
('North', 'Laptop', 'Amit', 61000, '2025-02-07'),
('South', 'Tablet', 'Ravi', 14000, '2025-02-08');

select * from sales;

-- total sales
select sum(amount) as mobile_total_sales from sales where product= 'Mobile';


select sum(amount), avg(amount) from sales where region = 'North' and (product = 'Laptop' or product = 'Mobile');

select max(amount) ,min(amount) from sales where month(sale_date) = 2;

-- find out the totle sales  we have done for each region
-- find the out the avg done by  each person
-- find th total amount the  totla sales dome for each product but th amit should not be sale s person
-- find the num of sale dome by the each for the amount > 10000 /
-- find the s=num of traction of dome from day one to day 7 for any month
-- find the total amoun avg amoun max for each product each region 
-- find the total traction amount for each prosuct where the product should be sold more then  13 times
-- 1
select sum(amount) from sales group by region;
-- 2
select avg(amount)from sales group by sales_person;
-- 3
select  sum(amount) , count(amount) from sales   where sales_person != 'Amit' group by product;
-- 4
select count(amount) from sales where amount > 10000;
use sales;
select * from sales;
-- 5
select count(*) as total_transaction from sales  group by (sale_date) between 1 and 7;
-- 6
select product , region, sum(amount),avg(amount), max(amount) from sales group by  product , region;
-- 7
select product , count(*) as total_times from sales group by product having count(*) > 13;
-- 8


















