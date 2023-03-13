show databases;
use join_example_db;
select database();
show tables;
-- Q1
select *
from roles;

select *
from users;
-- Q2
select *
from users
join roles on users.id = roles.id;
select *
from users
left join roles on users.id = roles.id;
select *
from users
right join roles on users.id = roles.id;

-- Q3 
select roles.id as list_of_roles, count(*)
from users
join roles on users.id = roles.id
group by roles.id;

-- Q1 Employee Database
use employees;
show tables;
show create table departments;

-- Q2 
select * from departments limit 10;
select * from dept_emp limit 10;
select * from employees limit 10;
select * from dept_manager limit 10;

select concat(e.first_name,' ',e.last_name) as full_name, d.dept_name
from employees as e
join dept_manager as dm
on dm.emp_no = e.emp_no
join departments as d
on d.dept_no = dm.dept_no
where dm.to_date > now()
;

-- Q3

select concat(e.first_name, ' ', e.last_name) as Manager_Name, dept_name
from dept_manager as dm
join employees as e
on dm.emp_no = e.emp_no
join departments as d
on d.dept_no = dm.dept_no
where dm.to_date > now()
and e.gender = 'F';

-- Q4 

select t.title , count(*)
from titles as t
join employees as e
on t.emp_no = e.emp_no
join dept_emp as de
on e.emp_no = de.emp_no
join departments as d
on de.dept_no = d.dept_no
where d.dept_name = 'Customer Service'
and t.to_date > now()
group by t.title
order by title asc;

-- Q5

select d.dept_name as "Department Name", concat(e.first_name,' ',e.last_name) as Name,
s.salary as Salary
from employees as e
join dept_manager as dm
on e.emp_no = dm.emp_no
join salaries as s
on e.emp_no = s.emp_no
join departments as d
on dm.dept_no = d.dept_no
where dm.to_date > now()
and s.to_date > now()
order by d.dept_name asc;

-- Q6 

select d.dept_no, d.dept_name, count(d.dept_name) as num_employees
from dept_emp as de
join departments as d
on de.dept_no = d.dept_no
join employees as e
on de.emp_no = e.emp_no
where de.to_date > now()
group by d.dept_name
order by d.dept_no
;

-- Q7

select d.dept_name, avg(s.salary)
from salaries as s
join dept_emp as de
on s.to_date = de.to_date
join departments as d
on de.dept_no = d.dept_no
where s.to_date > now()
group by d.dept_name;

-- Q8

select e.first_name as first_name, e.last_name as last_name
from employees as e
join salaries as s
on e.emp_no = s.emp_no
join dept_emp as de
on s.emp_no = de.emp_no
join departments as d
on de.dept_no  = d.dept_no
where d.dept_name = 'Marketing'
order by s.salary desc
limit 1;

-- Q9 

select e.first_name, e.last_name, s.salary,  dept_name
from employees as e
join dept_manager as dm
on e.emp_no = dm.emp_no
join departments as d
on d.dept_no = dm.dept_no
join salaries as s
on e.emp_no = s.emp_no
where d.dept_name = 'Marketing'
and dm.to_date > now()
order by s.salary desc
limit 1;

-- Q10

Select d.dept_name as dept_name, round(avg(s.salary),0)
from departments as d
join dept_emp as de
on d.dept_no = de.dept_no
join salaries as s
on de.emp_no = s.emp_no
group by d.dept_name;

-- Bonus 1 



