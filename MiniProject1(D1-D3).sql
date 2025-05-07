--MiniProject 
--From D1,D2,D3

use Practice;

SELECT * FROM customers;

--Count how many customers are there in the USA.
SELECT COUNT(*) AS total_customers
FROM customers
WHERE country='USA';

--Get the names of customers who spent more than $800.
SELECT name FROM customers
WHERE total_spent > 800;

--Find the total amount spent by customers from India.
SELECT SUM(total_spent) AS total_amt
FROM customers
WHERE country='India';

--Show the names and ages of customers whose name contains the letter "r".
SELECT name , age 
FROM customers
WHERE name LIKE '%r%';

--Find the average spending of all customers.
SELECT AVG(total_spent) AS avg_spend 
FROM customers;

--Display the name, total_spent, and country of customers who spent between $200 and $500.
SELECT name , total_spent ,  country
FROM customers
WHERE total_spent BETWEEN 200 AND 500;

--Get the maximum age and minimum age of customers who are from either USA or Canada.
SELECT MAX(age) AS Max_age ,MIN(age) AS Min_age 
FROM customers
WHERE country IN ('USA','Canada');

--Find the number of customers from each country.
SELECT COUNT(*) AS no_of_Cus,country
FROM customers
GROUP BY country;

--Show the names and total spending of customers from the UK or Australia, but only if they spent more than $1000.
SELECT name,total_spent
FROM customers
WHERE country IN ('UK','Australia') 
AND total_spent > 1000;

--List the countries where the total spending is less than $500.
SELECT country, SUM(total_spent) AS total_spending
FROM customers
GROUP BY country
HAVING SUM(total_spent) < 500;

--Find the country with the highest average age of customers.
SELECT TOP 1 country, AVG(age) AS avg_age
FROM customers
GROUP BY country
ORDER BY avg_age DESC;

--Find the name and country of customers whose names start with 'M' and spent over $300.
SELECT name , country 
FROM customers
WHERE name LIKE 'M%' AND total_spent > 300;


--Show the total number of customers aged between 20 and 40, grouped by their country.
SELECT COUNT(*) AS total_cus ,country FROM customers
WHERE age BETWEEN 20 AND 40
GROUP BY country;

--Display the customers whose age is between 30 and 40 and whose total spending is greater than $700.
SELECT name FROM customers
WHERE age BETWEEN 30 AND 40 AND total_spent > 700;

--Get the name and age of the customer who spent the most.
SELECT TOP 1 name, age, total_spent 
FROM customers
ORDER BY total_spent DESC ;
