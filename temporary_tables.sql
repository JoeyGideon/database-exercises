show databases;
use pagel_2177;
show tables;

use employees;
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
LIMIT 100;
-- Q1 

CREATE TEMPORARY TABLE pagel_2177.temp_emp
(SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
LIMIT 100);

select * from temp_emp;
-- Q.a-d 
ALTER TABLE temp_emp add FULL_NAME  varchar(100);
UPDATE temp_emp SET FULL_NAME = concat(first_name,' ',last_name);
ALTER TABLE temp_emp drop column first_name;
ALTER TABLE temp_emp drop column last_name;
select * from temp_emp;

-- drop table temp_emp;

-- Q2 
use sakila;
show tables;
select *
from payment;

create temporary table pagel_2177.payments 
(select floor(amount * 100)
from payment);
use pagel_2177;
select * from payments;
 
-- drop table payments;

-- Q3 

use employees;


select avg(salary), std(salary) from employees.salaries where to_date > now();

create temporary table pagel_2177.overall_aggregates as (
    select avg(salary) as avg_salary, std(salary) as std_salary
    from employees.salaries  where to_date > now()
);
use pagel_2177;

select * from overall_aggregates;

select dept_name, avg(salary) as department_current_average
from employees.salaries
join employees.dept_emp using(emp_no)
join employees.departments using(dept_no)
where employees.dept_emp.to_date > curdate()
and employees.salaries.to_date > curdate()
group by dept_name;

drop table if exists current_info;

use employees;

create temporary table pagel_2177.current_info as (
    select dept_name, avg(salary) as department_current_average
    from employees.salaries
    join employees.dept_emp using(emp_no)
    join employees.departments using(dept_no)
    where employees.dept_emp.to_date > curdate()
    and employees.salaries.to_date > curdate()
    group by dept_name
);
use pagel_2177;

select * from current_info;

alter table current_info add overall_avg float(10,2);
alter table current_info add overall_std float(10,2);
alter table current_info add zscore float(10,2);

select * from current_info;

update current_info set overall_avg = (select avg_salary from overall_aggregates);
update current_info set overall_std = (select std_salary from overall_aggregates);

update current_info 
set zscore = (department_current_average - overall_avg) / overall_std;

SELECT AVG(salary), STDDEV(salary)
FROM employees.salaries;

select * from pagel_2177.current_info
order by zscore desc;