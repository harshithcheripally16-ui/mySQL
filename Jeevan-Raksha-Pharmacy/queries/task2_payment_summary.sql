-- Task 2: Calculate the total money earned through each payment mode (UPI, Card, Cash).

SELECT payment_mode, SUM(total_amount) AS total_revenue
FROM orders
GROUP BY payment_mode;
