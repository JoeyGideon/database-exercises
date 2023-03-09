show databases;
use employees;
select database();
show tables;

select first_name, emp_no
from employees
where first_name in ('Irena','Vidya','Maya');
-- 10200,10397,10610


select first_name, gender
from employees
where first_name in ('Irena','Vidya','Maya')
	or gender = ('M');

select distinct last_name
from employees
where last_name like ('E%');

select distinct last_name
from employees
where last_name like ('E%')
	or last_name like ('%e');
    
select distinct last_name
from employees
where last_name like ('E%')
	and last_name not like ('%e');

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
 
 select emp_no, birth_date, hire_date
 from employees
 where birth_date like ('%12-25')
	and hire_date like ('199%');
    -- 10261,10438,10681
    
select distinct last_name
from employees
where last_name like ('%q%');

select distinct last_name
from employees
where last_name like ('%q%')
	and last_name not like ('%qu%');







