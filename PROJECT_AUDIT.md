# Project Audit Report

This report contains a comprehensive analysis of the MySQL Course Tasks repository, covering folder structure, file analysis, SQL verification, naming consistency, documentation gaps, and repository health.

---

## 1. Current Folder Structure

Below is the current layout of the workspace:

```text
mySQL/
├── .git/                      # Git repository metadata
├── SQL/                       # Ignored directory containing Jupyter notebook files
│   ├── Project.ipynb          # Jeevan Raksha Pharmacy case study & SQL script
│   ├── day-01.ipynb           # Lecture notes on SQL Basics & ER Models
│   ├── day-02.ipynb           # Lecture notes on File Management Systems
│   ├── day-03.ipynb           # Lecture notes on DDL & DML Commands
│   ├── day-04.ipynb           # Lecture notes on constraints & table structures
│   ├── day-05.ipynb           # Lecture notes on logical operators & updates
│   ├── day-06.ipynb           # Lecture notes on string patterns & Wildcards
│   ├── day-07.ipynb           # Lecture notes on aggregates & scalar functions
│   ├── day-08.ipynb           # Lecture notes on Group By & Having clauses
│   ├── day-09.ipynb           # Lecture notes on Order By & aliases
│   ├── day-10.ipynb           # Lecture notes on LIMIT and OFFSET
│   ├── day-11.ipynb           # Lecture notes on primary and foreign keys
│   ├── day-12.ipynb           # Lecture notes on Joins (Inner, Left, Right)
│   ├── day-13.ipynb           # Lecture notes on Self & Cross Joins
│   ├── day-14.ipynb           # Lecture notes on Subqueries & Nested queries
│   ├── day-15.ipynb           # Lecture notes on Views and Indexes
│   ├── day-16.ipynb           # Lecture notes on Transaction control (COMMIT, ROLLBACK)
│   ├── day-17.ipynb           # Lecture notes on Date & Time functions
│   ├── day-18.ipynb           # Lecture notes on String manipulation functions
│   ├── day-19.ipynb           # Lecture notes on Control Flow functions (IF, CASE)
│   ├── day-20.ipynb           # Lecture notes on User-defined functions & Stored Procedures
│   └── day-21.ipynb           # Lecture notes on Window functions & CTEs
├── Task-1.md                  # Practice task on basics, aliases, updates, deletes
├── Task-2.md                  # Practice task on DISTINCT, IFNULL, logical operations
├── Task-3.md                  # Practice task on arithmetic, BETWEEN, NULL, LIKE
├── Task-4.md                  # Practice task on SQL Numerical Functions (25 Q&A)
└── README.md                  # Main repository documentation (lists Tasks 1-3)
```

---

## 2. Duplicate and Unused Files

* **Duplicate Files**: None. The notebook files are sequentially organized from `day-01.ipynb` to `day-21.ipynb`, and each covers unique database topics.
* **Unused/Untracked Files**:
  - The entire `SQL/` directory is untracked by Git because it is ignored via `.git/info/exclude`. These notebooks contain the core educational notes and the primary pharmacy project. Since they are excluded, this core content will not be pushed to GitHub, making them "invisible" to users cloning the repository.

---

## 3. Missing Files

* **`.gitignore`**: There is no `.gitignore` file in the workspace root. The notebook exclusion is configured in `.git/info/exclude`. This is a local-only configuration and will not be shared with other developers who clone the repository.
* **ERD Folders**: No Entity-Relationship Diagrams (ERD) exist for the Jeevan Raksha Pharmacy project inside `SQL/Project.ipynb`.
* **License & Contributing Guidelines**: Missing files standard for portfolio repositories (`LICENSE`, `CONTRIBUTING.md`).

---

## 4. SQL Verification & Validation

The database schema and sample data script inside `SQL/Project.ipynb` were validated.

### DDL and Constraints
* **`customers` Table**: Autoincrement Primary Key. Correct.
* **`suppliers` Table**: Autoincrement Primary Key. Correct.
* **`medicines` Table**: Autoincrement Primary Key. Correct. Foreign key references `suppliers(supplier_id)`.
* **`orders` Table**: Autoincrement Primary Key. Correct. Foreign key references `customers(customer_id)`. Contains `payment_mode` as an `ENUM('UPI', 'Cash', 'Card')`.
* **`order_items` Table**: Autoincrement Primary Key. Correct. Foreign keys reference `orders(order_id)` and `medicines(medicine_id)`.

### Data Integrity & Discrepancies
> [!WARNING]
> **Data Discrepancy Found in Order 5 (Jeevan Raksha Pharmacy)**:
> In the `orders` insertion statement, order ID 5 has `total_amount = 1200.00`:
> ```sql
> INSERT INTO orders (customer_id, order_date, total_amount, payment_mode) VALUES
> ...,
> (4, '2023-10-12', 1200.00, 'Card');
> ```
> However, summing the subtotals of the items associated with order 5 in `order_items`:
> * Item 1: `(5, 5, 1, 800.00)` (Insulin Pen)
> * Item 2: `(5, 2, 2, 240.00)` (Azithral 500)
> * Item 3: `(5, 1, 5, 150.00)` (Dolo 650)
>
> **Total Item Sum = 800.00 + 240.00 + 150.00 = 1190.00**.
> This creates a **10.00 discrepancy** between the order total and the itemized subtotal.

---

## 5. Naming Inconsistencies & Formatting Issues

* **Case Inconsistency in Tables**:
  - Root task files contain inconsistently capitalized table names: `Employee` (Task 1), `Products` (Task 2), `employee` (Task 3), and `Employee_Salary` (Task 4).
  - Pharmacy project tables in `SQL/Project.ipynb` are all lowercase (`customers`, `suppliers`, etc.).
* **Case Inconsistency in Columns**:
  - `Task-4.md` uses PascalCase for column names (`Emp_ID`, `Emp_Name`, `Salary`, `Bonus`, `Experience`).
  - Pharmacy tables use snake_case (`customer_id`, `supplier_name`, `stock_quantity`, `expiry_date`).
* **Uneven SQL Formatting**:
  - The script in `SQL/Project.ipynb` has spacing inconsistencies (e.g., double blank lines, wrapping `REFERENCES` and table names across separate lines).

---

## 6. Documentation Gaps

* **`README.md` Outdated**:
  - The main `README.md` only documents Task-1, Task-2, and Task-3. It does not mention the newly added `Task-4.md`.
  - It completely misses references to the `SQL/` directory, the lecture notes, or the `jeevan_raksha_pharmacy` project.
* **Typographical/Spelling Errors in Project Queries**:
  - Question 3 text has `"qunatity"` instead of `"quantity"`.
  - Question 4 text has `"ahve"` instead of `"have"`, and `"thier"` instead of `"their"`.
  - Question 5 text has `"suplier_name"` instead of `"supplier_name"`.

---

## 7. Recommended Improvements

1. **Add standard `.gitignore`**: Move `*.ipynb` and `.ipynb_checkpoints/` from `.git/info/exclude` into a shared root `.gitignore` file.
2. **Correct Data Discrepancy**: Update the total amount of order ID 5 to `1190.00` (or update order item quantities/subtotals to total `1200.00`).
3. **Correct Typographical Errors**: Clean up the query questions in `SQL/Project.ipynb`.
4. **Update Main `README.md`**: Include descriptions and table links for `Task-4.md`, `SQL/Project.ipynb`, and the upcoming Entity-Relationship Diagram.
5. **Standardize SQL formatting**: Apply a consistent SQL formatting style (uppercase keywords, lowercase table/column names, proper indents) across the pharmacy script.

---

## 8. Portfolio Readiness and Health Scores

| Metric | Score | Key Takeaways |
| :--- | :--- | :--- |
| **Repository Health Score** | **78 / 100** | Git tree is clean and tasks are well-formatted. Lost points due to local-only excludes instead of `.gitignore` and data discrepancy in the pharmacy project. |
| **Portfolio Readiness Score** | **70 / 100** | Excellent lecture notes and code tasks. However, the most important showcase project (`Jeevan Raksha Pharmacy`) is ignored in Git and not mentioned in the main `README.md`. Adding an ERD and a repository overview will boost this score. |
