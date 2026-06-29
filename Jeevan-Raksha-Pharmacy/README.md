# Jeevan Raksha Pharmacy

Jeevan Raksha Pharmacy is a localized pharmaceutical store database case study designed to model inventory tracking and customer transaction billing.

This project is a standalone component of the MySQL learning journey repository.

---

## 1. Project Directory Structure

```text
Jeevan-Raksha-Pharmacy/
├── README.md                  # Project overview and instructions
├── LICENSE                    # MIT License for portfolio usage
├── .gitignore                 # Exclude local build/temp files
├── database/
│   ├── schema.sql             # SQL script containing table creation code
│   ├── sample_data.sql        # SQL script containing raw data insertion
│   └── setup.sql              # Combined database creation and seed script
├── queries/
│   ├── task1_customer_orders.sql
│   ├── task2_payment_summary.sql
│   ├── task3_best_selling_medicine.sql
│   ├── task4_high_value_customers.sql
│   └── task5_low_stock_medicines.sql
├── erd/
│   ├── pharmacy_erd.mmd       # Mermaid.js ER Diagram source
│   └── README.md              # Instructions for rendering/exporting ERD
└── docs/
    ├── project_overview.md    # Detail about logic and scope
    └── assumptions.md         # Database schema constraints & data notes
```

---

## 2. Getting Started

### Database Setup
To build the database and insert the sample records, run the unified setup script in your MySQL client or terminal:

```bash
mysql -u your_username -p < database/setup.sql
```

Alternatively, you can run the files individually:
1. Run `database/schema.sql` to construct the tables and primary/foreign key mappings.
2. Run `database/sample_data.sql` to populate the dataset.

---

## 3. SQL Questions & Tasks

The project includes five solved analytical queries under the `queries/` directory:

1. **[Customer Orders](queries/task1_customer_orders.sql)**: Lists client names, transaction dates, and total amounts.
2. **[Payment Mode Summary](queries/task2_payment_summary.sql)**: Evaluates total earnings grouped by payment method (UPI, Card, Cash).
3. **[Best-Selling Medicine](queries/task3_best_selling_medicine.sql)**: Determines the top-selling inventory item by quantity.
4. **[High-Value Customers](queries/task4_high_value_customers.sql)**: Finds customers whose cumulative spending exceeds 1000 rupees.
5. **[Low Stock Warning](queries/task5_low_stock_medicines.sql)**: Identifies medicines with less than 50 units remaining, along with their supplier details.
