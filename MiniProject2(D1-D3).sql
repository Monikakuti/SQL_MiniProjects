--MiniProject 
--From D1,D2,D3

use Practice;


--Step 1: Create the table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    quantity INT,
    price_per_unit DECIMAL(10, 2),
    order_date DATE,
    country VARCHAR(50)
);

-- Step 2: Insert sample data
INSERT INTO orders (order_id, customer_id, product, quantity, price_per_unit, order_date, country) VALUES
(101, 1, 'Laptop', 1, 800.00, '2024-01-10', 'USA'),
(102, 2, 'Mouse', 2, 25.00, '2024-01-12', 'India'),
(103, 3, 'Keyboard', 1, 40.00, '2024-02-01', 'UK'),
(104, 1, 'Headphones', 1, 100.00, '2024-02-05', 'USA'),
(105, 4, 'Laptop', 1, 850.00, '2024-02-10', 'Canada'),
(106, 5, 'Monitor', 1, 200.00, '2024-03-01', 'USA'),
(107, 2, 'Mouse', 1, 25.00, '2024-03-02', 'India'),
(108, 6, 'Laptop', 1, 780.00, '2024-03-10', 'UK'),
(109, 4, 'Keyboard', 2, 40.00, '2024-03-15', 'Canada'),
(110, 3, 'Monitor', 1, 220.00, '2024-04-01', 'UK');


SELECT * FROM orders;



--How many orders are there in total?
SELECT COUNT(order_id) AS total_orders
FROM orders

--What is the total revenue (quantity × price_per_unit) across all orders?
SELECT SUM(quantity * price_per_unit) AS total_revenue
FROM orders;

--Show the total revenue generated from each country.
SELECT SUM(quantity * price_per_unit) AS total_revenue ,country
FROM orders
GROUP BY country;

--List all products that have been ordered more than once.
SELECT COUNT(product) AS no_of_products,product
FROM orders
GROUP BY product
HAVING COUNT(product) > 1;

--Find the average quantity of products ordered per order.
SELECT avg(quantity) AS avg_quantity ,product
FROM orders
GROUP BY product;

--Get the total number of orders placed by each customer.
SELECT COUNT(order_id) AS total_no_orders , customer_id
FROM orders
GROUP BY customer_id;

--Show the details of all orders for products that cost more than 500 per unit.
SELECT * FROM orders
WHERE price_per_unit > 500;

--Display the top 3 most expensive orders (based on total order value).
SELECT TOP 3 order_id, customer_id, (quantity * price_per_unit) AS total_order_value
FROM orders
ORDER BY total_order_value DESC;

--List customers who ordered a 'Laptop'.
SELECT customer_id
FROM orders
WHERE product = 'Laptop';

--Find the total quantity of 'Mouse' sold.
SELECT COUNT(product) AS total_quantity 
FROM orders;

--Show all orders made in February 2024.

--List the countries where total revenue is more than 1000.
SELECT country , SUM(quantity * price_per_unit) AS total_revenue
FROM orders
GROUP BY country
HAVING SUM(quantity * price_per_unit) > 1000;

--Show each product and the total revenue it generated.
SELECT product , SUM(quantity * price_per_unit) AS total_revenue
FROM orders
GROUP BY product;

--List orders where the total order value is between 100 and 300.
SELECT order_id, SUM(quantity * price_per_unit) AS total_order_value
FROM orders
GROUP BY order_id
HAVING SUM(quantity * price_per_unit) BETWEEN 100 AND 300;


--Find the country with the highest number of orders.
SELECT TOP 1 country, COUNT(order_id) AS no_of_orders
FROM orders
GROUP BY country
ORDER BY no_of_orders DESC;


