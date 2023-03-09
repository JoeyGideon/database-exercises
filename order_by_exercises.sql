show databases;
use employees;
select database();
show tables;

select first_name, last_name, emp_no
from employees
where first_name in ('Irena','Vidya','Maya')
order by first_name;
-- Irena Reutenauer,Vidya Simmen


select first_name, last_name
from employees
where first_name in ('Irena','Vidya','Maya')
order by first_name, last_name;
-- Irena Acton, Vidya Zweizig

select distinct last_name
from employees
where last_name like ('E%');

select distinct first_name, last_name, emp_no
from employees
where last_name like ('E%')
	and last_name like ('%e')
order by emp_no;
-- 899, 10021, Ramazi Erde,Tadahiro Erde
    
select distinct first_name, last_name, hire_date, birth_date
from employees
where last_name like ('E%')
	and last_name not like ('%e')
order by hire_date desc, birth_date asc;
-- 1000, Phillip Eppinger, Oldest Vidar Eppinger
select distinct last_name

from employees
where last_name like ('E%')
	and last_name like ('%e');
 
 select emp_no, hire_date, birth_date
 from employees
 where hire_date like ('199%');
 -- 10008,10011,10012
 
 select emp_no, birth_date
 from employees
 where birth_date like ('%12-25');
 -- 10078,10115,10261
 
 select first_name, last_name, birth_date, hire_date
 from employees
 where birth_date like ('%12-25')
	and hire_date like ('199%')
order by birth_date asc, hire_date desc;
    -- 362, Khun Bernini, Douadi Pettis 
    
select distinct last_name
from employees
where last_name like ('%q%');

select distinct last_name
from employees
where last_name like ('%q%')
	and last_name not like ('%qu%');