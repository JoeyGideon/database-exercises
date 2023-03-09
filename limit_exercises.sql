-- Q1
show databases;
use employees;
select database();
show tables;

-- Q2   
select distinct last_name
from employees
order by last_name desc
limit 10;
-- Q3
 select first_name, last_name, birth_date, hire_date
 from employees
 where birth_date like ('%12-25')
	and hire_date like ('199%')
order by hire_date
limit 5;
-- Q3. Alselm,Utz,Bouchung,Baocai,Petter

-- Q4
 select first_name, last_name, birth_date, hire_date
 from employees
 where birth_date like ('%12-25')
	and hire_date like ('199%')
order by hire_date desc
limit 5 offset 45;
    
