use employees;
select database();
show tables;

-- Q1
select *
from employees
where emp_no = 101010;

select *
from employees
join dept_emp as de using(emp_no)
where hire_date = (select hire_date
 from employees
 where emp_no = '101010')
 and de.to_date > curdate();
 
-- Q2
select title
from titles;

select first_name
from employees
where first_name = 'Aamod';

select to_date
from dept_emp as de
where to_date > curdate();

select distinct t.title, e.first_name
from titles as t
join employees as e using(emp_no)
join dept_emp as de using(emp_no)
where de.to_date in
	(select to_date
	from dept_emp as de
	where to_date > curdate())
    and e.first_name = 'aamod'; 


-- Q3

select count(*)
from employees;

select to_date
from dept_emp as de
where to_date < curdate();

select count(e.emp_no)
from employees as e
where e.emp_no not in 
	(select distinct emp_no
from dept_emp as de
where to_date > curdate())
;
-- 59900

-- Q4

select concat(e.first_name, ' ', e.last_name) as Manager_Name
from dept_manager as dm
join employees as e
using(emp_no)
join departments as d
using(dept_no)
where dm.to_date > curdate()
and e.gender = 'F';
-- Leon,Isamu,Karsten,Hilary (I'm aware I didn't use a subquery, lazy) :D 

-- Q5
select *
from employees;

select round(avg(salary),0) as avg_salary
from salaries;

select e.first_name,e.last_name , s.salary as 'Max Salary'
from salaries as s
join employees as e using (emp_no)
join dept_emp as de using (emp_no)
where s.salary > (select round(avg(s.salary),0)
from salaries as s)
and s.to_date > curdate()
order by s.salary desc;

-- Q6

select count(salary), max(salary)
from salaries
where to_date > curdate(); -- 158220 


select round(std(salary),0) as standard_deviation
from salaries; -- 16905

select count(*)
from salaries as s
where salary > 
(select max(salary)
from salaries
where to_date > curdate()) - 
(select round(std(salary),0) as standard_deviation
from salaries where to_date > curdate())
and to_date > curdate();

select 
(100 * (select count(*)
from salaries as s
where salary > (select max(salary)
from salaries
where to_date > curdate()) - (select round(std(salary),0) as standard_deviation
from salaries where to_date > curdate())
and to_date > curdate())/ count(emp_no))
from salaries 
where to_date > curdate();
-- 3.46%

-- Bonus 1

select dept_name as 'Department Name'
from dept_manager as dm
join employees as e
using(emp_no)
join departments as d
using(dept_no)
where dm.to_date > curdate()
and e.gender = 'F'
order by dept_name;

-- Bonus 2

select e.first_name, e.last_name
from employees;

select max(salary)
from salaries
where to_date > curdate()
; -- 158220

select e.first_name, e.last_name
from employees as e
join salaries as s using(emp_no)
where salary = (select max(salary)
from salaries where to_date > curdate());

-- Bonus 3

select d.dept_name
from dept_emp
join departments as d using(dept_no)
join salaries as s using(emp_no)
where salary = (select max(salary)
from salaries where to_date > curdate())
group by d.dept_name;

-- Bonus 4 (unfinished)

select e.first_name, d.dept_name
from departments as d
join dept_emp as de using (dept_no)
join salaries as s using (emp_no)
join employees as e using (emp_no)
where salary = (select max(salary)
from salaries where to_date > curdate())
group by d.dept_name
order by d.dept_name;



