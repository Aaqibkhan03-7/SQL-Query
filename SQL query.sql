show databases;

use sakila;
show tables;
select * from customer;  

select first_name,customer_id from customer;

select * from customer where customer_id = 2;

select first_name,customer_id from customer where customer_id > 5;

select * from customer where first_name = 'LIAS';

select * from customer where customer_id between 2 and 5;

# where age = 18 or age = 22; 

select * from customer where customer_id in (2,5);

-- in = specfic values

select * from customer where first_name in ('LIAS','PATRICIA');

select * from customer where address_id between 1 and 6; 

select * from customer where customer_id = 2 or customer_id >7;

select * from customer where first_name = 'MARION' AND store_id = 2;

-- AND USE BEFORE  -- OR USE AFTER 

select * from customer where first_name = 'PATRICIA' OR store_id = 2 and active = 1; 

-- write the bracket to first use OR

select * from customer where (first_name = 'PATRICIA' or store_id = 2) and active = 1;

select * from customer where customer_id >= 6 or customer_id < 2 and first_name = 'PATRICIA';

-- not between use 2 and 5 remove the values
select * from customer where customer_id  not between 2 and 5;

-- like opretor -- search for the pattern / character

select * from customer where first_name like 'B%';

# % => zero or more than 1 character
# B% B , BAD , BADSHAH, BAMBRI
select * from customer where first_name like '%Y';

select * from customer where first_name like 'B%Y';

-- two letter  is JO but only 1 character
select * from customer where first_name like 'JO_';
select * from customer where first_name like 'JO_%';
select * from customer where first_name like'B__Y';
select * from customer where first_name like '__Y';
select * from customer where first_name like '%BB%';
select * from customer where first_name not like 'A%';

-- function  code logic /task

select first_name,last_name,
concat(first_name, ' ', last_name);
select * from customer where concat(first_name,' ' ,last_name)= 'MARY SMITH';

select * from actor;

use employees;
use sakila; 

select * from departments;

select customer_id , count(payment_id) from payment group by customer_id;
use sakila;

select customer_id, count(payment_id), sum(amount) from payment where customer_id > 3 group by  customer_id;
use sakila;
select amount , count(*) as occurrence from payment group by amount;
select  sum(amount) from payment;
SELECT MAX(salary) AS second_highest FROM employees WHERE salary < (SELECT MAX(salary) FROM employees); --- I I V

SELECT MAX(salary) FROM employees;

use sakila;
-- 1 5 26

select count(*), count(payment_id) from payment group by customer_id;
select  customer_id, count(payment_id) from payment group by customer_id;
select customer_id from payment where customer_id >= 3 group by customer_id;













