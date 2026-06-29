-- Task 1: List the customer name, order date, and total amount for every order placed.

SELECT c.name AS customer_name, o.order_date, o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;
