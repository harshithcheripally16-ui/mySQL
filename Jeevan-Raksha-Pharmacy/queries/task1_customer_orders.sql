-- =====================================================================
-- Task 1: Customer Order Summary
-- Purpose: Retrieves basic details of every order placed, including the customer's name, order date, and total transaction amount.
-- =====================================================================

SELECT 
    c.name AS customer_name, 
    o.order_date, 
    o.total_amount
FROM orders o
INNER JOIN customers c 
    ON o.customer_id = c.customer_id;
