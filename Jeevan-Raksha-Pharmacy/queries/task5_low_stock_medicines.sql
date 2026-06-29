-- =====================================================================
-- Task 5: Low Stock Alert
-- Purpose: Identifies medicines with less than 50 units remaining in stock, along with their supplier names.
-- =====================================================================

SELECT 
    m.name AS medicine_name, 
    m.stock_quantity, 
    s.supplier_name
FROM medicines m
INNER JOIN suppliers s 
    ON m.supplier_id = s.supplier_id
WHERE m.stock_quantity < 50;
