-- =====================================================================
-- Task 4: High Value Customers
-- Purpose: Identifies customers who have spent more than 1000 rupees in total across all their orders.
-- =====================================================================

SELECT 
    c.name AS customer_name, 
    SUM(o.total_amount) AS total_spent
FROM customers c
INNER JOIN orders o 
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING SUM(o.total_amount) > 1000;
