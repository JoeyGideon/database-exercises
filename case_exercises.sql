-- warmup:
-- Using the customer table from sakila database,
-- find the number of active and inactive users
show databases;
use sakila;
show tables;

select count(last_update)
from customer;

select count(create_date)
from customer;

select distinct active, count(active)
from customer
group by active;

-- Q1
use employees;
select *
from employees;

select  concat(e.first_name,' ', e.last_name) as Employee, de.dept_no, e.hire_date, de.to_date,
	CASE
		when de.to_date = '9999-01-01' then True
        else False
	end as is_current_employee
from employees as e
join dept_emp as de using(emp_no)
;

-- Q2 

select concat(e.first_name,' ', e.last_name) as Employee,
	CASE
    when e.last_name like 'A%' or e.last_name like 'B%' or e.last_name like 'C%' or e.last_name like 'D%' or e.last_name like 'E%'
    or e.last_name like 'F%' or e.last_name like 'G%' or e.last_name like 'H%' then 'A-H'
    when e.last_name like 'I%' or e.last_name like 'J%' or e.last_name like 'K%' or e.last_name like 'L%' or e.last_name like 'M%' or e.last_name like 'N%' or
    e.last_name like 'N%' or e.last_name like 'O%' or e.last_name like 'P%' or e.last_name like 'Q%' then 'I-Q'
    else 'R-Z'
    end as alpha_group
from employees as e
;

-- Q3

select 
CASE
when birth_date like '194%' then "40's"
when birth_date like '195%' then "50's"
when birth_date like '196%' then "60's"
when birth_date like '197%' then "70's"
when birth_date like '198%' then "80's"
when birth_date like '199%' then "90's"
else "Dead"
end as Decades, count(*)
from employees
group by Decades;

-- Q4 

SELECT round(avg(s.salary),2) as Avg_Salary,
   CASE
       WHEN d.dept_name IN ('research', 'development') THEN 'R&D'
       WHEN d.dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
       WHEN d.dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
       ELSE d.dept_name
   END AS dept_group
FROM departments as d
join dept_emp as de using(dept_no)
join salaries as s using(emp_no)
where s.to_date > curdate()
group by dept_group;


