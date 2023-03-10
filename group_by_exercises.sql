-- Q1
use employees;
select database();
show tables;

-- Q2 
select distinct title
from titles;
-- 7

-- Q3 
select distinct last_name
from employees
where last_name like 'e%e'
group by last_name;

-- Q4
select distinct first_name, last_name
from employees
where last_name like 'e%e'
	and first_name like 'e%e';

-- Q5
select distinct last_name
from employees
where last_name like '%q%'
	and last_name not like '%qu%';
    
-- Q6
select count(distinct last_name)
from employees
where last_name like '%q%'
	and last_name not like '%qu%';
    
-- Q7 
select gender, count(gender)
from employees
where first_name = 'Irena'
	or first_name = 'Vidya'
	or first_name = 'Maya'
group by gender; 

-- Q8
select count( lower(concat(substr(first_name,1,1),
substr(last_name,1,4), "_" ,substr(birth_date,6,2),
substr(birth_date,3,2)))) as username
from employees
;

-- Q9 
select lower(concat(substr(first_name,1,1),
substr(last_name,1,4), "_" ,substr(birth_date,6,2),
substr(birth_date,3,2))) as username, count(*) as duplicate
from employees
group by username
order by duplicate desc
;
-- Bonus: 13251 having duplicate > 1

-- Bonus Questions

select round(avg(salary),2), emp_no
from salaries
group by emp_no;

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
where salary > '150000'
group by emp_no;

select round(avg(salary), 2) , emp_no
from salaries
group by emp_no
having round(avg(salary), 2) between 80000 and 90000;


