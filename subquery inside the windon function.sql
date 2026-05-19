create database joinpractice;

use joinpractice;


CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);



INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Sales');



INSERT INTO employees VALUES
(101, 'Alice', 70000, 1, NULL),
(102, 'Bob', 60000, 2, 101),
(103, 'Charlie', 55000, 2, 102),
(104, 'David', 50000, 3, 101),
(105, 'Eva', 45000, 4, 104),
(106, 'Frank', 75000, 1, 101),
(107, 'Grace', 80000, 2, 102),
(108, 'Helen', 62000, 3, 104),
(109, 'Ian', 47000, 4, 105),
(110, 'Jack', 53000, 2, 102),
(111, 'Kevin', 49000, 3, 104),
(112, 'Laura', 72000, 1, 101),
(113, 'Mike', 58000, 4, 105),
(114, 'Nina', 61000, 2, 107),
(115, 'Oscar', 52000, NULL, 101);

select * from employees;
select * from departments;

-- Q.1 Display employee names along with their department names.
select e.emp_name, d.dept_name
from employees e inner join departments d on e.dept_id = d.dept_id order by e.emp_name;

-- Q.2 Display all employees and their department names, including employees without departments.
select e.emp_name, d.dept_name from employees e
left join departments d on e.dept_id = d.dept_id  order by e.emp_name;

-- Q. Find the number of employees in each department.
select d.dept_name , count(e.emp_id) from employees e
inner join departments d on e.dept_id = d.dept_id  group by e.dept_id;


-- Q. Display all departments and the total salary paid in each department.

select d.dept_name, sum(e.salary);

-- Q.5 Find how many employees report to each manager.

 -- select manager_id,m.emp_name,count( *) from employees as e join employees as m  e.manager_id group by manager_id;

use sakila;
select * from actor;
select * from film_actor;
select * from film;

-- Q1. select actor_id, actor full name and film id for which actor have worked. 
SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) AS full_name, fa.film_id
FROM actor AS a 
INNER JOIN film_actor AS fa
ON a.actor_id = fa.actor_id;

-- Q2. Get the film_id, the film title and the actor_id.
SELECT f.film_id, f.title, fa.actor_id FROM film AS f
INNER JOIN film_actor AS fa
ON f.film_id = fa.film_id; 
-- Q3. Find the actor_id, actor_name and the movie he has worked.
SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) AS actor_name, f.title AS movie_name
FROM  actor AS a INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id
INNER JOIN film AS f ON fa.film_id = f.film_id;
-- Q4. Find the actor_id, actor_name and film_id only for the movie whose length is greater than 120.
SELECT a.actor_id,CONCAT(a.first_name, ' ', a.last_name) AS actor_name,fa.film_id FROM actor AS a
INNER JOIN film_actor AS fa ON a.actor_id = fa.actor_id
INNER JOIN film AS movie_length ON fa.film_id = movie_length.film_id
WHERE movie_length.length > 120;

-- Q5. Get the actor_id, the actor_name and the total no. of movies he has worked.
select actor_id , actor_name , count(a.title) from actor as a inner join film as m on 
a.title = m.actor;

-- Q6. Get the film_title and the number of actors worked in that film.
use sakila;
select empl.emp_id , empl.emp_name, empl.manager_id, mngr.emp_id , mngr.emp_name from employees as empl join employees as mngr 
where empl.manager_id = mngr.emp_id;


-- subquery topic

-- subquery is type of query where query is present another query

-- this subquery also called as nested subquery 
-- (inner queyr )WILL EXEUTE  first
-- outer query) will  exeute after
create database shadidb;

create table biodata(id int,name varchar(20), age int );

insert into biodata values(1,'RAHUL',28),(2,'anjali',28),(3,'Aishwarya',40),(4,'naina',23);
select * from biodata;
select age from biodata where name = 'RAHUL'; -- find age of rahul
select * from biodata where age = 28;  -- line break

select * from biodata where age = (select age from biodata where name = 'RAHUL');

select max(age) from biodata;
select * from biodata where age = 40;
select * from biodata where age = (select max(age) from biodata);

select char_length(name) from biodata where char_length(name)=5;

select char_length(name)from biodata where char_length(name)=(select char_length(name) 
from biodata where name= 'RAHUL');
-- in subquery
-- single row subquery
-- it is a type of subquery in which the inner query return one query

use sakila;
select * from film;

-- where the rental rate is same for movie of african egg 
select rental_rate from film where title = 'AFRICAN EGG'; -- finding rental_rate 

select title , rental_rate 
from film where  rental_rate = (select rental_rate from film where title = 'AFRICAN EGG'); -- dynamic 
-- get the movie id and movie name where  rental_rate mini mu 
-- get the movie id movie name and the 
-- get the movie id fro the movies where the realse year of the movie 

-- q1 get the movie id & movie name where rental rate is equal to the  

-- q2 get the movie id , movie name & the duration where the duration is 
-- greater than the average of movies

 SELECT film_id,title AS movie_name,length AS duration FROM film
WHERE length > (SELECT AVG(length) FROM film );
-- q3 get the movie id for the movies where the release year 
-- of the movie should be equal to the realsing date of alone trip 
-- and the rating should be same as of the movie apollo teen
SELECT film_id
FROM film
WHERE release_year = (SELECT release_year FROM film WHERE title = 'ALONE TRIP')
AND rating = (SELECT rating FROM film WHERE title = 'APOLLO TEEN');
select release_year from film where title = 'Alone Trip';

select * from film where release_year =(select release_year from film where title = 'Alone Trip')
and rating = (select rating from film where title = 'Apollo Teen');


-- single subquery use to greathen lessthen etc....all
-- multi subquery can not be use Arithmetic opretor
use shadidb;
select age from biodata where name = 'anjali' or name = 'Aishwarya';
select * from biodata where name = 'RAHUL'
and age  in (select age from biodata where name = 'anjali' or name = 'Aishwarya') and name 
-- i need to find the name where the age is not equal to age of anjali and age of aishwarya 





