-- Task 3: Find which medicine has been sold the most (in terms of total quantity).

SELECT m.name AS medicine_name, SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN medicines m ON oi.medicine_id = m.medicine_id
GROUP BY oi.medicine_id, m.name
ORDER BY total_quantity_sold DESC
LIMIT 1;
