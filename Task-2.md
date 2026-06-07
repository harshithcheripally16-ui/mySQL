# Task 2

## Table Setup

```sql
CREATE TABLE Products (
   product_id INT PRIMARY KEY,
   product_name VARCHAR(50),
   category VARCHAR(30),
   brand VARCHAR(30),
   price DECIMAL(10,2),
   stock INT,
   discount DECIMAL(5,2),
   supplier VARCHAR(50)
);

INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 'Dell', 55000, 10, 5.00, 'Tech World'),
(102, 'Mouse', 'Electronics', 'Logitech', 800, 50, NULL, 'Tech World'),
(103, 'Keyboard', 'Electronics', 'HP', 1200, 30, 10.00, 'ABC Suppliers'),
(104, 'Mobile', 'Electronics', 'Samsung', 25000, 15, NULL, 'XYZ Traders'),
(105, 'Tablet', 'Electronics', 'Apple', 45000, 8, 7.50, 'XYZ Traders'),
(106, 'Chair', 'Furniture', 'IKEA', 3500, 20, NULL, 'Home Needs'),
(107, 'Table', 'Furniture', 'IKEA', 7000, 12, 5.00, 'Home Needs'),
(108, 'Fan', 'Appliances', 'Bajaj', 2500, 25, NULL, 'Cooling Solutions'),
(109, 'AC', 'Appliances', 'LG', 35000, 5, 12.00, 'Cooling Solutions'),
(110, 'Refrigerator', 'Appliances', 'Samsung', 28000, 7, NULL, 'XYZ Traders');
```

## Question 1

Display all unique categories from the Products table.

```sql
SELECT DISTINCT category
FROM Products;
+-------------+
| category    |
+-------------+
| Electronics |
| Furniture   |
| Appliances  |
+-------------+
```

## Question 2

Display all unique brands.

```sql
SELECT DISTINCT brand
FROM Products;
+----------+
| brand    |
+----------+
| Dell     |
| Logitech |
| HP       |
| Samsung  |
| Apple    |
| IKEA     |
| Bajaj    |
| LG       |
+----------+
```

## Question 3

Display all unique suppliers.

```sql
SELECT DISTINCT supplier
FROM Products;
+-------------------+
| supplier          |
+-------------------+
| Tech World        |
| ABC Suppliers     |
| XYZ Traders       |
| Home Needs        |
| Cooling Solutions |
+-------------------+
```

## Question 4

Display unique combinations of category and brand.

```sql
SELECT DISTINCT category, brand
FROM Products;
+-------------+----------+
| category    | brand    |
+-------------+----------+
| Electronics | Dell     |
| Electronics | Logitech |
| Electronics | HP       |
| Electronics | Samsung  |
| Electronics | Apple    |
| Furniture   | IKEA     |
| Appliances  | Bajaj    |
| Appliances  | LG       |
| Appliances  | Samsung  |
+-------------+----------+
```

## Question 5

Count the total number of distinct brands.

```sql
SELECT COUNT(DISTINCT brand) AS Total_Brands
FROM Products;
+--------------+
| Total_Brands |
+--------------+
|            8 |
+--------------+
```

## Question 6

Display product names and replace NULL discounts with 0.

```sql
SELECT product_name,
       IFNULL(discount, 0) AS Discount
FROM Products;
+--------------+----------+
| product_name | Discount |
+--------------+----------+
| Laptop       |     5.00 |
| Mouse        |     0.00 |
| Keyboard     |    10.00 |
| Mobile       |     0.00 |
| Tablet       |     7.50 |
| Chair        |     0.00 |
| Table        |     5.00 |
| Fan          |     0.00 |
| AC           |    12.00 |
| Refrigerator |     0.00 |
+--------------+----------+
```

## Question 7

Display supplier names and replace NULL values with 'Unknown Supplier'.

```sql
SELECT IFNULL(supplier, 'Unknown Supplier') AS Supplier
FROM Products;
+-------------------+
| Supplier          |
+-------------------+
| Tech World        |
| Tech World        |
| ABC Suppliers     |
| XYZ Traders       |
| XYZ Traders       |
| Home Needs        |
| Home Needs        |
| Cooling Solutions |
| Cooling Solutions |
| XYZ Traders       |
+-------------------+
```

## Question 8

Calculate the discounted price by replacing NULL discounts with 0.

```sql
SELECT product_name,
       price,
       IFNULL(discount, 0) AS Discount,
       price - (price * IFNULL(discount, 0) / 100) AS Discounted_Price
FROM Products;
+--------------+----------+----------+------------------+
| product_name | price    | Discount | Discounted_Price |
+--------------+----------+----------+------------------+
| Laptop       | 55000.00 |     5.00 |   52250.00000000 |
| Mouse        |   800.00 |     0.00 |     800.00000000 |
| Keyboard     |  1200.00 |    10.00 |    1080.00000000 |
| Mobile       | 25000.00 |     0.00 |   25000.00000000 |
| Tablet       | 45000.00 |     7.50 |   41625.00000000 |
| Chair        |  3500.00 |     0.00 |    3500.00000000 |
| Table        |  7000.00 |     5.00 |    6650.00000000 |
| Fan          |  2500.00 |     0.00 |    2500.00000000 |
| AC           | 35000.00 |    12.00 |   30800.00000000 |
| Refrigerator | 28000.00 |     0.00 |   28000.00000000 |
+--------------+----------+----------+------------------+
```

## Question 9

Display all product details with NULL discount values replaced by 0.

```sql
SELECT product_id,
       product_name,
       category,
       brand,
       price,
       stock,
       IFNULL(discount, 0) AS discount,
       supplier
FROM Products;
+------------+--------------+-------------+----------+----------+-------+----------+-------------------+
| product_id | product_name | category    | brand    | price    | stock | discount | supplier          |
+------------+--------------+-------------+----------+----------+-------+----------+-------------------+
|        101 | Laptop       | Electronics | Dell     | 55000.00 |    10 |     5.00 | Tech World        |
|        102 | Mouse        | Electronics | Logitech |   800.00 |    50 |     0.00 | Tech World        |
|        103 | Keyboard     | Electronics | HP       |  1200.00 |    30 |    10.00 | ABC Suppliers     |
|        104 | Mobile       | Electronics | Samsung  | 25000.00 |    15 |     0.00 | XYZ Traders       |
|        105 | Tablet       | Electronics | Apple    | 45000.00 |     8 |     7.50 | XYZ Traders       |
|        106 | Chair        | Furniture   | IKEA     |  3500.00 |    20 |     0.00 | Home Needs        |
|        107 | Table        | Furniture   | IKEA     |  7000.00 |    12 |     5.00 | Home Needs        |
|        108 | Fan          | Appliances  | Bajaj    |  2500.00 |    25 |     0.00 | Cooling Solutions |
|        109 | AC           | Appliances  | LG       | 35000.00 |     5 |    12.00 | Cooling Solutions |
|        110 | Refrigerator | Appliances  | Samsung  | 28000.00 |     7 |     0.00 | XYZ Traders       |
+------------+--------------+-------------+----------+----------+-------+----------+-------------------+
```

## Question 10

Find products where IFNULL(discount,0) is greater than 5.

```sql
SELECT *
FROM Products
WHERE IFNULL(discount, 0) > 5;
+------------+--------------+-------------+-------+----------+-------+----------+-------------------+
| product_id | product_name | category    | brand | price    | stock | discount | supplier          |
+------------+--------------+-------------+-------+----------+-------+----------+-------------------+
|        103 | Keyboard     | Electronics | HP    |  1200.00 |    30 |    10.00 | ABC Suppliers     |
|        105 | Tablet       | Electronics | Apple | 45000.00 |     8 |     7.50 | XYZ Traders       |
|        109 | AC           | Appliances  | LG    | 35000.00 |     5 |    12.00 | Cooling Solutions |
+------------+--------------+-------------+-------+----------+-------+----------+-------------------+
```

## Question 11

Find products belonging to Electronics or Furniture categories.

```sql
SELECT *
FROM Products
WHERE category = 'Electronics'
   OR category = 'Furniture';
+------------+--------------+-------------+----------+----------+-------+----------+---------------+
| product_id | product_name | category    | brand    | price    | stock | discount | supplier      |
+------------+--------------+-------------+----------+----------+-------+----------+---------------+
|        101 | Laptop       | Electronics | Dell     | 55000.00 |    10 |     5.00 | Tech World    |
|        102 | Mouse        | Electronics | Logitech |   800.00 |    50 |     NULL | Tech World    |
|        103 | Keyboard     | Electronics | HP       |  1200.00 |    30 |    10.00 | ABC Suppliers |
|        104 | Mobile       | Electronics | Samsung  | 25000.00 |    15 |     NULL | XYZ Traders   |
|        105 | Tablet       | Electronics | Apple    | 45000.00 |     8 |     7.50 | XYZ Traders   |
|        106 | Chair        | Furniture   | IKEA     |  3500.00 |    20 |     NULL | Home Needs    |
|        107 | Table        | Furniture   | IKEA     |  7000.00 |    12 |     5.00 | Home Needs    |
+------------+--------------+-------------+----------+----------+-------+----------+---------------+
```

## Question 12

Find products manufactured by Samsung or LG.

```sql
SELECT *
FROM Products
WHERE brand = 'Samsung'
   OR brand = 'LG';
+------------+--------------+-------------+---------+----------+-------+----------+-------------------+
| product_id | product_name | category    | brand   | price    | stock | discount | supplier          |
+------------+--------------+-------------+---------+----------+-------+----------+-------------------+
|        104 | Mobile       | Electronics | Samsung | 25000.00 |    15 |     NULL | XYZ Traders       |
|        109 | AC           | Appliances  | LG      | 35000.00 |     5 |    12.00 | Cooling Solutions |
|        110 | Refrigerator | Appliances  | Samsung | 28000.00 |     7 |     NULL | XYZ Traders       |
+------------+--------------+-------------+---------+----------+-------+----------+-------------------+
```

## Question 13

Find products priced above 30,000 or having stock less than 10.

```sql
SELECT *
FROM Products
WHERE price > 30000
   OR stock < 10;
+------------+--------------+-------------+---------+----------+-------+----------+-------------------+
| product_id | product_name | category    | brand   | price    | stock | discount | supplier          |
+------------+--------------+-------------+---------+----------+-------+----------+-------------------+
|        101 | Laptop       | Electronics | Dell    | 55000.00 |    10 |     5.00 | Tech World        |
|        105 | Tablet       | Electronics | Apple   | 45000.00 |     8 |     7.50 | XYZ Traders       |
|        109 | AC           | Appliances  | LG      | 35000.00 |     5 |    12.00 | Cooling Solutions |
|        110 | Refrigerator | Appliances  | Samsung | 28000.00 |     7 |     NULL | XYZ Traders       |
+------------+--------------+-------------+---------+----------+-------+----------+-------------------+
```

## Question 14

Find products supplied by Tech World or XYZ Traders.

```sql
SELECT *
FROM Products
WHERE supplier = 'Tech World'
   OR supplier = 'XYZ Traders';
+------------+--------------+-------------+----------+----------+-------+----------+-------------+
| product_id | product_name | category    | brand    | price    | stock | discount | supplier    |
+------------+--------------+-------------+----------+----------+-------+----------+-------------+
|        101 | Laptop       | Electronics | Dell     | 55000.00 |    10 |     5.00 | Tech World  |
|        102 | Mouse        | Electronics | Logitech |   800.00 |    50 |     NULL | Tech World  |
|        104 | Mobile       | Electronics | Samsung  | 25000.00 |    15 |     NULL | XYZ Traders |
|        105 | Tablet       | Electronics | Apple    | 45000.00 |     8 |     7.50 | XYZ Traders |
|        110 | Refrigerator | Appliances  | Samsung  | 28000.00 |     7 |     NULL | XYZ Traders |
+------------+--------------+-------------+----------+----------+-------+----------+-------------+
```

## Question 15

Find products with discount greater than 10 or stock less than 10.

```sql
SELECT *
FROM Products
WHERE discount > 10
   OR stock < 10;
+------------+--------------+-------------+---------+----------+-------+----------+-------------------+
| product_id | product_name | category    | brand   | price    | stock | discount | supplier          |
+------------+--------------+-------------+---------+----------+-------+----------+-------------------+
|        105 | Tablet       | Electronics | Apple   | 45000.00 |     8 |     7.50 | XYZ Traders       |
|        109 | AC           | Appliances  | LG      | 35000.00 |     5 |    12.00 | Cooling Solutions |
|        110 | Refrigerator | Appliances  | Samsung | 28000.00 |     7 |     NULL | XYZ Traders       |
+------------+--------------+-------------+---------+----------+-------+----------+-------------------+
```

## Question 16

Find products that are not Electronics.

```sql
SELECT *
FROM Products
WHERE NOT category = 'Electronics';
+------------+--------------+------------+---------+----------+-------+----------+-------------------+
| product_id | product_name | category   | brand   | price    | stock | discount | supplier          |
+------------+--------------+------------+---------+----------+-------+----------+-------------------+
|        106 | Chair        | Furniture  | IKEA    |  3500.00 |    20 |     NULL | Home Needs        |
|        107 | Table        | Furniture  | IKEA    |  7000.00 |    12 |     5.00 | Home Needs        |
|        108 | Fan          | Appliances | Bajaj   |  2500.00 |    25 |     NULL | Cooling Solutions |
|        109 | AC           | Appliances | LG      | 35000.00 |     5 |    12.00 | Cooling Solutions |
|        110 | Refrigerator | Appliances | Samsung | 28000.00 |     7 |     NULL | XYZ Traders       |
+------------+--------------+------------+---------+----------+-------+----------+-------------------+
```

## Question 17

Find products not supplied by XYZ Traders.

```sql
SELECT *
FROM Products
WHERE NOT supplier = 'XYZ Traders';
+------------+--------------+-------------+----------+----------+-------+----------+-------------------+
| product_id | product_name | category    | brand    | price    | stock | discount | supplier          |
+------------+--------------+-------------+----------+----------+-------+----------+-------------------+
|        101 | Laptop       | Electronics | Dell     | 55000.00 |    10 |     5.00 | Tech World        |
|        102 | Mouse        | Electronics | Logitech |   800.00 |    50 |     NULL | Tech World        |
|        103 | Keyboard     | Electronics | HP       |  1200.00 |    30 |    10.00 | ABC Suppliers     |
|        106 | Chair        | Furniture   | IKEA     |  3500.00 |    20 |     NULL | Home Needs        |
|        107 | Table        | Furniture   | IKEA     |  7000.00 |    12 |     5.00 | Home Needs        |
|        108 | Fan          | Appliances  | Bajaj    |  2500.00 |    25 |     NULL | Cooling Solutions |
|        109 | AC           | Appliances  | LG       | 35000.00 |     5 |    12.00 | Cooling Solutions |
+------------+--------------+-------------+----------+----------+-------+----------+-------------------+
```

## Question 18

Find products not belonging to Samsung brand.

```sql
SELECT *
FROM Products
WHERE NOT brand = 'Samsung';
+------------+--------------+-------------+----------+----------+-------+----------+-------------------+
| product_id | product_name | category    | brand    | price    | stock | discount | supplier          |
+------------+--------------+-------------+----------+----------+-------+----------+-------------------+
|        101 | Laptop       | Electronics | Dell     | 55000.00 |    10 |     5.00 | Tech World        |
|        102 | Mouse        | Electronics | Logitech |   800.00 |    50 |     NULL | Tech World        |
|        103 | Keyboard     | Electronics | HP       |  1200.00 |    30 |    10.00 | ABC Suppliers     |
|        105 | Tablet       | Electronics | Apple    | 45000.00 |     8 |     7.50 | XYZ Traders       |
|        106 | Chair        | Furniture   | IKEA     |  3500.00 |    20 |     NULL | Home Needs        |
|        107 | Table        | Furniture   | IKEA     |  7000.00 |    12 |     5.00 | Home Needs        |
|        108 | Fan          | Appliances  | Bajaj    |  2500.00 |    25 |     NULL | Cooling Solutions |
|        109 | AC           | Appliances  | LG       | 35000.00 |     5 |    12.00 | Cooling Solutions |
+------------+--------------+-------------+----------+----------+-------+----------+-------------------+
```

## Question 19

Find products whose stock is not less than 10.

```sql
SELECT *
FROM Products
WHERE NOT stock < 10;
+------------+--------------+-------------+----------+----------+-------+----------+-------------------+
| product_id | product_name | category    | brand    | price    | stock | discount | supplier          |
+------------+--------------+-------------+----------+----------+-------+----------+-------------------+
|        101 | Laptop       | Electronics | Dell     | 55000.00 |    10 |     5.00 | Tech World        |
|        102 | Mouse        | Electronics | Logitech |   800.00 |    50 |     NULL | Tech World        |
|        103 | Keyboard     | Electronics | HP       |  1200.00 |    30 |    10.00 | ABC Suppliers     |
|        104 | Mobile       | Electronics | Samsung  | 25000.00 |    15 |     NULL | XYZ Traders       |
|        106 | Chair        | Furniture   | IKEA     |  3500.00 |    20 |     NULL | Home Needs        |
|        107 | Table        | Furniture   | IKEA     |  7000.00 |    12 |     5.00 | Home Needs        |
|        108 | Fan          | Appliances  | Bajaj    |  2500.00 |    25 |     NULL | Cooling Solutions |
+------------+--------------+-------------+----------+----------+-------+----------+-------------------+
```

## Question 20

Find products whose price is not greater than 30,000.

```sql
SELECT *
FROM Products
WHERE NOT price > 30000;
+------------+--------------+-------------+----------+----------+-------+----------+-------------------+
| product_id | product_name | category    | brand    | price    | stock | discount | supplier          |
+------------+--------------+-------------+----------+----------+-------+----------+-------------------+
|        102 | Mouse        | Electronics | Logitech |   800.00 |    50 |     NULL | Tech World        |
|        103 | Keyboard     | Electronics | HP       |  1200.00 |    30 |    10.00 | ABC Suppliers     |
|        104 | Mobile       | Electronics | Samsung  | 25000.00 |    15 |     NULL | XYZ Traders       |
|        106 | Chair        | Furniture   | IKEA     |  3500.00 |    20 |     NULL | Home Needs        |
|        107 | Table        | Furniture   | IKEA     |  7000.00 |    12 |     5.00 | Home Needs        |
|        108 | Fan          | Appliances  | Bajaj    |  2500.00 |    25 |     NULL | Cooling Solutions |
|        110 | Refrigerator | Appliances  | Samsung  | 28000.00 |     7 |     NULL | XYZ Traders       |
+------------+--------------+-------------+----------+----------+-------+----------+-------------------+
```
