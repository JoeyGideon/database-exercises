-- Q1
use employees;
select database();
show tables;
-- Q2
select concat(first_name," ", last_name) as full_name
from employees
where last_name like 'e%'
	and last_name like '%e'
;

-- Q3
select UPPER( concat(first_name," ", last_name))as full_name
from employees
where last_name like 'e%'
	and last_name like '%e'
;
-- Q4
select count(UPPER( concat(first_name," ", last_name)))as full_name
from employees
where last_name like 'e%'
	and last_name like '%e';
    
-- Q5 
 select datediff(hire_date, curdate()) as how_many_days_employed
 from employees
 where birth_date like ('%12-25')
	and hire_date like ('199%');
    
-- Q6 Find the smallest and largest current salary from the salaries table.
show tables;
select min(salary), max(salary)
from salaries;
-- Q7
select concat(substr(first_name,1,1),
substr(last_name,1,4), "_" ,substr(birth_date,6,2),
substr(birth_date,3,2)) as username, first_name, last_name, birth_date
from employees
limit 10;