# Jeevan Raksha Pharmacy - Project Overview

Jeevan Raksha Pharmacy is a localized pharmaceutical store case study designed to model, build, and query an inventory and transaction system in MySQL. The project showcases robust database principles including primary keys, foreign key constraints, data normalization, transaction integrity, and relational schema querying.

## Business Logic Components

1. **Customers**: Local residents who purchase medicine from the store.
2. **Suppliers**: Distributors providing stock and inventory to the pharmacy.
3. **Medicines**: The inventory items (Tablets, Syrups, Injections, etc.) tracked with active expiry dates, stock quantities, and associated suppliers.
4. **Orders (Bills)**: High-level sales transaction records containing total transaction amount, date, and payment mode (UPI, Cash, Card).
5. **Order Items**: Itemized break-downs of individual medicines and quantities sold under a specific order/bill, tracking quantity and subtotal.

## Repository Contents

* `database/`: SQL scripts for schema definition, sample data, and unified setup.
* `queries/`: Standard practice queries to answer core business questions (e.g., revenue summaries, low stock warnings, high-value customers).
* `erd/`: Conceptual database design diagrams created in Mermaid.js.
* `docs/`: Supplemental documentation including project assumptions.
