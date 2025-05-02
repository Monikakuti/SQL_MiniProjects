-- CREATING DATABASE
CREATE DATABASE miniproject;

--USING DATABASE
USE miniproject;

--CREATING TABLE
CREATE TABLE employees (id int,name varchar(50),department varchar(50),salary int,join_date date,experience int,city varchar(50))

--INSERTING VALUES
INSERT INTO employees(id, name, department, salary, join_date, experience, city) VALUES
(1, 'Moni', 'IT', 25000, '2022-09-05', 2, 'Tiruchi'),
(2, 'Aswin', 'IT', 30000, '2022-05-05', 4, 'Madurai'),
(3, 'Prithi', 'HR', 40000, '2020-05-03', 3, 'Tiruchi'),
(4, 'Kittu', 'Sales', 20000, '2023-11-30', 4, 'Chennai'),
(5, 'Malu', 'HR', 40000, '2021-01-14', 3, 'Salem'),
(6, 'Janani', 'Sales', 22000, '2023-02-15', 2, 'Madurai'),
(7, 'Kavin', 'IT', 15000, '2024-07-14', 1, 'Chennai'),
(8, 'Bhuva', 'Sales', 22000, '2023-04-05', 2, 'Salem');

--DISPLAY VALUES
SELECT * FROM employees;


--?? 1. List all departments and the total number of employees in each.
SELECT department,COUNT(*) AS total_no_of_emp
FROM employees
GROUP BY department;

--?? 2. Show the average salary per city.
SELECT city, AVG(salary) AS avg_salary
FROM employees
GROUP BY city;

--?? 3. Find the top 3 highest-paid employees.
SELECT TOP 3 * 
FROM employees
ORDER BY salary DESC;

--?? 4. Which departments have an average salary above 60000?
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

--?? 5. Find employees who joined before 2023 and earn more than 30000.
SELECT * FROM employees
WHERE join_date < '2023-01-01'
AND salary > 30000;

--?? 6. Show total salary paid per department, sorted high to low.
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC;

--?? 7. Which city has the highest total salary payout?
SELECT TOP 1 city ,SUM(salary) AS total_salary
FROM employees
GROUP BY city;

--?? 8. Find employees who earn more than the average salary of their department.
SELECT name, salary, department
FROM employees 
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = department
);

--?? 9. Count how many employees have more than 2 years of experience.
SELECT COUNT(*) AS employees_with_experience_above_2
FROM employees
WHERE experience > 2;


--?? 10. Which department has the least number of employees?
SELECT TOP 1 department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
ORDER BY total_employees;



