-- =====================================================================
-- Task 3: Best Selling Medicine
-- Purpose: Identifies the medicine that has been sold the most (based on cumulative quantity).
-- =====================================================================

SELECT 
    m.name AS medicine_name, 
    SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
INNER JOIN medicines m 
    ON oi.medicine_id = m.medicine_id
GROUP BY m.medicine_id, m.name
ORDER BY total_quantity_sold DESC
LIMIT 1;
