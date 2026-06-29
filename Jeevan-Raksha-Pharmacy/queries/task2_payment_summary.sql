-- =====================================================================
-- Task 2: Payment Summary
-- Purpose: Calculates the total revenue earned grouped by each payment mode (UPI, Cash, Card).
-- =====================================================================

SELECT 
    o.payment_mode, 
    SUM(o.total_amount) AS total_revenue
FROM orders o
GROUP BY o.payment_mode;
