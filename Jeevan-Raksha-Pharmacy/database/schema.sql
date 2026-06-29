-- =====================================================================
-- Database Schema for Jeevan Raksha Pharmacy
-- Author: Senior Database Architect
-- Purpose: Defines physical table layout, primary keys, and explicit foreign key constraints.
-- =====================================================================

-- 1. Customers Table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    city VARCHAR(50) NOT NULL,
    CONSTRAINT pk_customers PRIMARY KEY (customer_id)
);

-- 2. Suppliers Table
CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    CONSTRAINT pk_suppliers PRIMARY KEY (supplier_id)
);

-- 3. Medicines Table
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

-- 4. Orders Table
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

-- 5. Order Items Table
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
