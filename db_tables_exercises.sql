show databases;
use albums_db;
select database();
show tables;
use employees;
show create table employees;
select database();
show tables;
show create table departments;
-- Which table(s) do you think contain a numeric type column?
-- emp_no
-- Which table(s) do you think contain a string type column?
-- first_name,last_name,
-- Which table(s) do you think contain a date type column?
-- birth_date,hire_date
-- What is the relationship between the employees and the departments tables?
-- employees is the database, but there are also employees and departments tables so no relation
-- question 15 
show create table dept_manager;
/* CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */
