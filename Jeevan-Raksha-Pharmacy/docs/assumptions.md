# Project Assumptions

This document lists the architectural assumptions and data integrity notes for the Jeevan Raksha Pharmacy database project.

## Database & Schema Assumptions

1. **Relational Database Management System (RDBMS)**:
   - Designed for MySQL 8.0+.
   - Utilizes `InnoDB` storage engine to guarantee referential integrity and support foreign keys.

2. **Keys & Constraints**:
   - Every entity has an `AUTO_INCREMENT` surrogate primary key.
   - Cascading or restrictive updates/deletes are not specified, defaulting to standard MySQL foreign key restriction rules.
   - `payment_mode` uses an `ENUM` type restriction containing `('UPI', 'Cash', 'Card')`.

3. **Data Types**:
   - Prices, subtotals, and total amounts are defined as `DECIMAL(10,2)` to avoid float-rounding inaccuracies.
   - `phone` columns are defined as `VARCHAR(15)` to accommodate local and international country code formats.

---

## Data Discrepancies and Integrity Notes

> [!NOTE]
> **Order 5 Discrepancy**:
> The seed data contains a minor mathematical mismatch for Order ID 5:
> * High-level Order Total: `1200.00`
> * Sum of associated Order Items:
>   - 1 x Insulin Pen: `800.00`
>   - 2 x Azithral 500: `240.00`
>   - 5 x Dolo 650: `150.00`
>   - **Sum total of items: 1190.00**
>
> In production environments, database layers or application logic should automatically enforce that `orders.total_amount` equals the sum of its corresponding `order_items.subtotal`. For the purpose of this SQL practice case study, the original data is left unchanged as instructed, but documented here.
