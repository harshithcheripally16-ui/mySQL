-- Task 5: List the medicine_name, stock_quantity, and supplier_name for medicines with less than 50 units in stock.

SELECT m.name AS medicine_name, m.stock_quantity, s.supplier_name
FROM medicines m
JOIN suppliers s ON m.supplier_id = s.supplier_id
WHERE m.stock_quantity < 50;
