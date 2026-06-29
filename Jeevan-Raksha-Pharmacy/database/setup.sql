-- =====================================================================
-- Complete Database Setup Script for Jeevan Raksha Pharmacy
-- Purpose: Builds the database schema and seeds it with sample data in a single script.
-- =====================================================================

-- Create Database environment
CREATE DATABASE IF NOT EXISTS jeevan_raksha_pharmacy;
USE jeevan_raksha_pharmacy;

-- 1. Create Tables
-- 1.1 Customers Table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    city VARCHAR(50) NOT NULL,
    CONSTRAINT pk_customers PRIMARY KEY (customer_id)
);

-- 1.2 Suppliers Table
CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    CONSTRAINT pk_suppliers PRIMARY KEY (supplier_id)
);

-- 1.3 Medicines Table
CREATE TABLE medicines (
    medicine_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    expiry_date DATE NOT NULL,
    supplier_id INT,
    CONSTRAINT pk_medicines PRIMARY KEY (medicine_id),
    CONSTRAINT fk_medicines_suppliers FOREIGN KEY (supplier_id) 
        REFERENCES suppliers(supplier_id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- 1.4 Orders Table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    payment_mode ENUM('UPI', 'Cash', 'Card') NOT NULL,
    CONSTRAINT pk_orders PRIMARY KEY (order_id),
    CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) 
        REFERENCES customers(customer_id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- 1.5 Order Items Table
CREATE TABLE order_items (
    item_id INT AUTO_INCREMENT,
    order_id INT,
    medicine_id INT,
    quantity INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_order_items PRIMARY KEY (item_id),
    CONSTRAINT fk_order_items_orders FOREIGN KEY (order_id) 
        REFERENCES orders(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_order_items_medicines FOREIGN KEY (medicine_id) 
        REFERENCES medicines(medicine_id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- 2. Insert Sample Data
-- 2.1 Customers
INSERT INTO customers (name, phone, city) VALUES
('Rahul Sharma', '9876543210', 'Mumbai'),
('Priya Verma', '9123456789', 'Delhi'),
('Amit Patel', '9988776655', 'Ahmedabad'),
('Sneha Reddy', '8877665544', 'Hyderabad'),
('Vikram Singh', '7766554433', 'Mumbai');

-- 2.2 Suppliers
INSERT INTO suppliers (supplier_name, contact_person, phone) VALUES
('Apollo Distributors', 'Rajesh Gupta', '022-123456'),
('MedPlus Supply Chain', 'Suresh Nair', '040-987654'),
('Himalaya Wellness', 'Anjali Mehta', '011-456789');

-- 2.3 Medicines
INSERT INTO medicines (name, category, price, stock_quantity, expiry_date, supplier_id) VALUES
('Dolo 650', 'Tablet', 30.00, 500, '2025-12-31', 1),
('Azithral 500', 'Tablet', 120.00, 50, '2024-05-20', 1),
('Benadryl', 'Syrup', 110.00, 20, '2024-11-15', 2),
('Combiflam', 'Tablet', 45.00, 200, '2026-01-01', 3),
('Insulin Pen', 'Injection', 800.00, 5, '2024-03-10', 2);

-- 2.4 Orders
INSERT INTO orders (customer_id, order_date, total_amount, payment_mode) VALUES
(1, '2023-10-01', 150.00, 'UPI'),
(2, '2023-10-02', 240.00, 'Card'),
(3, '2023-10-05', 45.00, 'Cash'),
(1, '2023-10-10', 800.00, 'UPI'),
(4, '2023-10-12', 1200.00, 'Card');

-- 2.5 Order Items
INSERT INTO order_items (order_id, medicine_id, quantity, subtotal) VALUES
(1, 1, 5, 150.00),
(2, 2, 2, 240.00),
(3, 4, 1, 45.00),
(4, 5, 1, 800.00),
(5, 5, 1, 800.00),
(5, 2, 2, 240.00),
(5, 1, 5, 150.00);
