-- Q1
show databases;
use employees;
select database();
show tables;

-- Q2
select first_name, last_name, emp_no
from employees
where first_name in ('Irena','Vidya','Maya')
order by first_name;
-- Irena Reutenauer,Vidya Simmen

-- Q3
select first_name, last_name
from employees
where first_name in ('Irena','Vidya','Maya')
order by first_name, last_name;
-- Irena Acton, Vidya Zweizig

-- Q4
select first_name, last_name, emp_no
from employees
where first_name in ('Irena','Vidya','Maya')
order by last_name, first_name;
-- Irena Acton,Maya Zyda

-- Q5
select distinct first_name, last_name, emp_no
from employees
where last_name like ('E%')
	and last_name like ('%e')
order by emp_no;
-- 899, 10021, Ramazi Erde,49946,Tadahiro Erde
    
-- Q6    
select distinct first_name, last_name, hire_date, birth_date
from employees
where last_name like 'e%e'
order by hire_date desc;
-- 899, Teiji Eldridge

 -- Q7
 select first_name, last_name, birth_date, hire_date
 from employees
 where birth_date like ('%12-25')
	and hire_date like ('199%')
order by birth_date asc, hire_date desc;
    -- 362,Khun Bernini,Dauadi Pettis
    


