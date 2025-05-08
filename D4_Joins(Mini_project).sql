
SELECT * FROM customer

SELECT *FROM orders


--Show customer names and the names of the products they ordered.
SELECT customer.name , orders.product
FROM customer
INNER JOIN orders
ON customer.customer_id = orders.customer_id;

--List all customer names and their order IDs, even if they have no orders.
SELECT customer.name , orders.order_id
FROM customer
LEFT JOIN orders
ON customer.customer_id = orders.customer_id

--Display all products ordered and the name of the customer who ordered them. Include all orders even if the customer is missing.
SELECT customer.name, orders.product
FROM customer
FULL OUTER JOIN orders
ON customer.customer_id =orders.customer_id

--Show the names of customers who did not place any order.
SELECT customer.name
FROM customer
LEFT JOIN orders
ON customer.customer_id = orders.customer_id
WHERE orders.customer_id IS NULL

--List all products that haven’t been ordered by any customer.
SELECT orders.product
FROM orders
LEFT JOIN customer
ON  orders.customer_id =customer.customer_id 
WHERE customer.customer_id IS NULL 

--For each country, show the total number of customers and their total spending.
SELECT customer.country, COUNT(customer.name) AS total_no_cus, SUM(orders.amount) AS total_spent
FROM customer
LEFT JOIN orders
ON customer.customer_id = orders.customer_id
GROUP BY customer.country
ORDER BY customer.country;

--Show the name of each customer along with the number of orders they placed.
SELECT customer.name , COUNT(order_id) as no_of_orders
FROM customer
LEFT JOIN orders
ON customer.customer_id = orders.customer_id
GROUP BY customer.name

--Display each customer and the average amount they spent per order.
SELECT customer.name , AVG(total_spent) AS avg_amt_spent
FROM customer
LEFT JOIN orders
ON customer.customer_id = orders.customer_id
GROUP BY customer.name , customer.customer_id

--Show the maximum order amount per customer.
SELECT customer.name , MAX(amount) AS max_order_amt
FROM customer
LEFT JOIN orders
ON customer.customer_id = orders.customer_id
GROUP BY customer.name , customer.customer_id

--List customers whose total order amount is more than 800.
SELECT customer.name, SUM(orders.amount) AS total_order_amount
FROM customer
INNER JOIN orders
ON customer.customer_id = orders.customer_id
GROUP BY customer.customer_id, customer.name
HAVING SUM(orders.amount) > 800; 