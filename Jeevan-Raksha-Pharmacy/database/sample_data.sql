-- =====================================================================
-- Seed Data for Jeevan Raksha Pharmacy
-- Purpose: Inserts sample records to populate tables for practice queries.
-- =====================================================================

-- 1. Insert Customers
INSERT INTO customers (name, phone, city) VALUES
('Rahul Sharma', '9876543210', 'Mumbai'),
('Priya Verma', '9123456789', 'Delhi'),
('Amit Patel', '9988776655', 'Ahmedabad'),
('Sneha Reddy', '8877665544', 'Hyderabad'),
('Vikram Singh', '7766554433', 'Mumbai');

-- 2. Insert Suppliers
INSERT INTO suppliers (supplier_name, contact_person, phone) VALUES
('Apollo Distributors', 'Rajesh Gupta', '022-123456'),
('MedPlus Supply Chain', 'Suresh Nair', '040-987654'),
('Himalaya Wellness', 'Anjali Mehta', '011-456789');

-- 3. Insert Medicines
INSERT INTO medicines (name, category, price, stock_quantity, expiry_date, supplier_id) VALUES
('Dolo 650', 'Tablet', 30.00, 500, '2025-12-31', 1),
('Azithral 500', 'Tablet', 120.00, 50, '2024-05-20', 1),
('Benadryl', 'Syrup', 110.00, 20, '2024-11-15', 2),
('Combiflam', 'Tablet', 45.00, 200, '2026-01-01', 3),
('Insulin Pen', 'Injection', 800.00, 5, '2024-03-10', 2);

-- 4. Insert Orders
INSERT INTO orders (customer_id, order_date, total_amount, payment_mode) VALUES
(1, '2023-10-01', 150.00, 'UPI'),
(2, '2023-10-02', 240.00, 'Card'),
(3, '2023-10-05', 45.00, 'Cash'),
(1, '2023-10-10', 800.00, 'UPI'),
(4, '2023-10-12', 1200.00, 'Card');

-- 5. Insert Order Items
INSERT INTO order_items (order_id, medicine_id, quantity, subtotal) VALUES
(1, 1, 5, 150.00),
(2, 2, 2, 240.00),
(3, 4, 1, 45.00),
(4, 5, 1, 800.00),
(5, 5, 1, 800.00),
(5, 2, 2, 240.00),
(5, 1, 5, 150.00);
