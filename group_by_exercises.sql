-- Q1
use employees;
select database();
show tables;

-- Q2 
select distinct title
from titles;
-- 7

-- Q3 
select last_name
from employees
where last_name like 'e%e'
group by last_name;

-- Q4
select distinct first_name, last_name
from employees
where last_name like 'e%e'
group by first_name, last_name;

-- Q5
select distinct last_name
from employees
where last_name like '%q%'
	and last_name not like '%qu%';
    
-- Q6
select last_name, count(*)
from employees
where last_name like '%q%'
	and last_name not like '%qu%'
group by last_name;
-- Chleq, Lindqvist, Qiwen
-- Q7 
select first_name, gender, count(gender)
from employees
where first_name IN ( 'Irena', 'Vidya', 'Maya')	
group by first_name, gender; 

-- Q8
select lower(concat(substr(first_name,1,1),
substr(last_name,1,4), "_" ,substr(birth_date,6,2),
substr(birth_date,3,2))) as username, count(*)
from employees
group by username
;

-- Q9 

select lower(concat(substr(first_name,1,1),
substr(last_name,1,4), "_" ,substr(birth_date,6,2),
substr(birth_date,3,2))) as username, count(*)
from employees
group by username
having count(*) > 1
order by count(*) DESC
;
-- Bonus: 13251 having duplicate > 1
select count(*)
from
	(select lower(concat(substr(first_name,1,1),
substr(last_name,1,4), "_" ,substr(birth_date,6,2),
substr(birth_date,3,2))) as username, count(*)
from employees
group by username
having count(*) > 1
order by count(*) DESC) as a;

-- Bonus Questions

select emp_no, round(avg(salary),2)
from salaries
group by emp_no
;

select count(emp_no), dept_no
from dept_emp
group by dept_no;

select count(salary), emp_no
from salaries
group by emp_no;

select min(salary), max(salary), emp_no
from salaries
group by emp_no;

select round(stddev(salary),2), emp_no
from salaries
group by emp_no;

select max(salary), emp_no
from salaries
group by emp_no
having max(salary) > '150000';

select round(avg(salary), 2) , emp_no
from salaries
group by emp_no
having round(avg(salary), 2) between 80000 and 90000;


