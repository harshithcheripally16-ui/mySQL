# SQL Code Review and Recommendations

This document outlines the recommendations and improvements applied to the SQL files in the **Jeevan Raksha Pharmacy** project. Every SQL file has been reviewed for syntax, formatting, joins, aliasing, performance, and best practices.

---

## 1. Summary of Applied Improvements

The following improvements were made across all database and query scripts:

### Standardized SQL Keyword Capitalization
* **Before**: A mix of uppercase and lowercase was used for clauses and statements (e.g., `CREATE TABLE customers (\ncustomer_id INT AUTO_INCREMENT PRIMARY KEY...`).
* **After**: Standardized all SQL keywords, types, and functions to uppercase (e.g., `CREATE TABLE`, `AUTO_INCREMENT`, `SELECT`, `FROM`, `INNER JOIN`, `GROUP BY`, `SUM`, `CASE`).

### Explicit Foreign Key & Primary Key Constraint Names
* **Before**: Foreign keys were declared inline or anonymously (e.g., `FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)`). This generates arbitrary system names for constraints in the database catalog (e.g., `medicines_ibfk_1`), making them hard to locate and alter.
* **After**: Added explicit names to all primary keys and foreign key constraints (e.g., `CONSTRAINT pk_medicines PRIMARY KEY (medicine_id)`, `CONSTRAINT fk_medicines_suppliers FOREIGN KEY ...`), following enterprise naming patterns.

### Transitioned to Explicit Joins
* **Before**: Queries used the generic `JOIN` syntax.
* **After**: Replaced all occurrences with `INNER JOIN` explicitly. This makes the join types clear to other developers and prevents unintended behavior.

### Table Alias Prefixing
* **Before**: Columns were occasionally called without table alias prefixes in clauses like `GROUP BY`, `SUM`, and `HAVING`.
* **After**: Added explicit prefixes (e.g. `o.payment_mode`, `m.name`) to prevent column ambiguity errors when schema changes occur.

### Reference Integrity Enhancements
* Added `ON DELETE SET NULL ON UPDATE CASCADE` and `ON DELETE CASCADE ON UPDATE CASCADE` options to foreign keys in schema files to ensure the database behaves predictably during record updates or deletions.

---

## 2. File-by-File Review

### `database/schema.sql` and `database/setup.sql`
* **Changes**:
  - Restructured table creations to declare constraints explicitly at the table level rather than inline.
  - Added constraint names: `pk_customers`, `pk_suppliers`, `pk_medicines`, `fk_medicines_suppliers`, `pk_orders`, `fk_orders_customers`, `pk_order_items`, `fk_order_items_orders`, `fk_order_items_medicines`.
  - Added explicit referential actions (`ON DELETE`, `ON UPDATE`) to prevent data blocks and orphan items.
  - Marked all standard fields as `NOT NULL`.

### `queries/task1_customer_orders.sql`
* **Changes**:
  - Explicitly declared `INNER JOIN`.
  - Aligned column selections and formatting.

### `queries/task2_payment_summary.sql`
* **Changes**:
  - Capitalized the `SUM` aggregate function.
  - Added explicit table alias `o` to all column references (`o.payment_mode`, `o.total_amount`).

### `queries/task3_best_selling_medicine.sql`
* **Changes**:
  - Used `INNER JOIN`.
  - Changed `GROUP BY` column list from `oi.medicine_id, m.name` to `m.medicine_id, m.name` to keep join groupings consistent with the selected base table `medicines`.

### `queries/task4_high_value_customers.sql`
* **Changes**:
  - Used `INNER JOIN`.
  - Capitalized `SUM`.
  - Standardized indentations.

### `queries/task5_low_stock_medicines.sql`
* **Changes**:
  - Used `INNER JOIN`.
  - Cleaned indentation and spacing.
