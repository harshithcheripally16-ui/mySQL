# Task 4

## Table Setup

```sql
CREATE TABLE Employee_Salary (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Salary DECIMAL(10,2),
    Bonus DECIMAL(10,2),
    Experience INT
);

INSERT INTO Employee_Salary VALUES
(101, 'Ravi', 12500.75, 1500.50, 2),
(102, 'Priya', 18750.50, 2500.75, 4),
(103, 'Kiran', 22000.99, 3200.25, 6),
(104, 'Sneha', 15600.25, 1800.80, 3),
(105, 'Rahul', 19899.80, 2700.60, 5);

SELECT * FROM Employee_Salary;
+--------+----------+----------+---------+------------+
| Emp_ID | Emp_Name | Salary   | Bonus   | Experience |
+--------+----------+----------+---------+------------+
|    101 | Ravi     | 12500.75 | 1500.50 |          2 |
|    102 | Priya    | 18750.50 | 2500.75 |          4 |
|    103 | Kiran    | 22000.99 | 3200.25 |          6 |
|    104 | Sneha    | 15600.25 | 1800.80 |          3 |
|    105 | Rahul    | 19899.80 | 2700.60 |          5 |
+--------+----------+----------+---------+------------+
```

## ROUND() Function

### Question 1

Display employee names and salaries rounded to the nearest whole number.

```sql
SELECT Emp_Name,
ROUND(Salary) AS Rounded_Salary
FROM Employee_Salary;
+----------+----------------+
| Emp_Name | Rounded_Salary |
+----------+----------------+
| Ravi     |          12501 |
| Priya    |          18751 |
| Kiran    |          22001 |
| Sneha    |          15600 |
| Rahul    |          19900 |
+----------+----------------+
```

### Question 2

Display employee names and bonuses rounded to 1 decimal place.

```sql
SELECT Emp_Name,
ROUND(Bonus, 1) AS Rounded_Bonus
FROM Employee_Salary;
+----------+---------------+
| Emp_Name | Rounded_Bonus |
+----------+---------------+
| Ravi     |        1500.5 |
| Priya    |        2500.8 |
| Kiran    |        3200.3 |
| Sneha    |        1800.8 |
| Rahul    |        2700.6 |
+----------+---------------+
```

### Question 3

Calculate total earnings (Salary + Bonus) and round the result to 2 decimal places.

```sql
SELECT Emp_Name,
ROUND(Salary + Bonus, 2) AS Total_Earnings
FROM Employee_Salary;
+----------+----------------+
| Emp_Name | Total_Earnings |
+----------+----------------+
| Ravi     |       14001.25 |
| Priya    |       21251.25 |
| Kiran    |       25201.24 |
| Sneha    |       17401.05 |
| Rahul    |        22600.4 |
+----------+----------------+
```

### Question 4

Display salaries rounded to the nearest thousand.

```sql
SELECT Emp_Name,
ROUND(Salary, -3) AS Rounded_Salary
FROM Employee_Salary;
+----------+----------------+
| Emp_Name | Rounded_Salary |
+----------+----------------+
| Ravi     |          13000 |
| Priya    |          19000 |
| Kiran    |          22000 |
| Sneha    |          16000 |
| Rahul    |          20000 |
+----------+----------------+
```

## CEIL() Function

### Question 5

Display employee salaries rounded up to the nearest integer.

```sql
SELECT Emp_Name,
CEIL(Salary) AS Ceil_Salary
FROM Employee_Salary;
+----------+-------------+
| Emp_Name | Ceil_Salary |
+----------+-------------+
| Ravi     |       12501 |
| Priya    |       18751 |
| Kiran    |       22001 |
| Sneha    |       15601 |
| Rahul    |       19900 |
+----------+-------------+
```

### Question 6

Find the ceiling value of each employee's bonus.

```sql
SELECT Emp_Name,
CEIL(Bonus) AS Ceil_Bonus
FROM Employee_Salary;
+----------+------------+
| Emp_Name | Ceil_Bonus |
+----------+------------+
| Ravi     |       1501 |
| Priya    |       2501 |
| Kiran    |       3201 |
| Sneha    |       1801 |
| Rahul    |       2701 |
+----------+------------+
```

### Question 7

Calculate total earnings (Salary + Bonus) and display the ceiling value.

```sql
SELECT Emp_Name,
CEIL(Salary + Bonus) AS Ceil_Earnings
FROM Employee_Salary;
+----------+---------------+
| Emp_Name | Ceil_Earnings |
+----------+---------------+
| Ravi     |         14002 |
| Priya    |         21252 |
| Kiran    |         25202 |
| Sneha    |         17402 |
| Rahul    |         22601 |
+----------+---------------+
```

### Question 8

Find employees whose ceiling salary is greater than 18,000.

```sql
SELECT Emp_Name,
CEIL(Salary) AS Ceil_Salary
FROM Employee_Salary
WHERE CEIL(Salary) > 18000;
+----------+-------------+
| Emp_Name | Ceil_Salary |
+----------+-------------+
| Priya    |       18751 |
| Kiran    |       22001 |
| Rahul    |       19900 |
+----------+-------------+
```

## FLOOR() Function

### Question 9

Display employee salaries rounded down to the nearest integer.

```sql
SELECT Emp_Name,
FLOOR(Salary) AS Floor_Salary
FROM Employee_Salary;
+----------+--------------+
| Emp_Name | Floor_Salary |
+----------+--------------+
| Ravi     |        12500 |
| Priya    |        18750 |
| Kiran    |        22000 |
| Sneha    |        15600 |
| Rahul    |        19899 |
+----------+--------------+
```

### Question 10

Find the floor value of total earnings (Salary + Bonus).

```sql
SELECT Emp_Name,
FLOOR(Salary + Bonus) AS Floor_Earnings
FROM Employee_Salary;
+----------+----------------+
| Emp_Name | Floor_Earnings |
+----------+----------------+
| Ravi     |          14001 |
| Priya    |          21251 |
| Kiran    |          25201 |
| Sneha    |          17401 |
| Rahul    |          22600 |
+----------+----------------+
```

### Question 11

Show the floor value of average salary.

```sql
SELECT FLOOR(AVG(Salary)) AS Floor_Average_Salary
FROM Employee_Salary;
+----------------------+
| Floor_Average_Salary |
+----------------------+
|                17750 |
+----------------------+
```

### Question 12

Find employees whose floor salary is greater than 15,000.

```sql
SELECT Emp_Name,
FLOOR(Salary) AS Floor_Salary
FROM Employee_Salary
WHERE FLOOR(Salary) > 15000;
+----------+--------------+
| Emp_Name | Floor_Salary |
+----------+--------------+
| Priya    |        18750 |
| Kiran    |        22000 |
| Sneha    |        15600 |
| Rahul    |        19899 |
+----------+--------------+
```

## ABS() Function

### Question 13

Find the absolute value of -5000.

```sql
SELECT ABS(-5000) AS Absolute_Value;
+----------------+
| Absolute_Value |
+----------------+
|           5000 |
+----------------+
```

### Question 14

Display the absolute difference between Salary and Bonus for each employee.

```sql
SELECT Emp_Name,
ABS(Salary - Bonus) AS Absolute_Difference
FROM Employee_Salary;
+----------+---------------------+
| Emp_Name | Absolute_Difference |
+----------+---------------------+
| Ravi     |            11000.25 |
| Priya    |            16249.75 |
| Kiran    |            18800.74 |
| Sneha    |            13799.45 |
| Rahul    |             17199.2 |
+----------+---------------------+
```

### Question 15

Calculate the absolute difference between the highest and lowest salary.

```sql
SELECT ABS(MAX(Salary) - MIN(Salary)) AS Max_Min_Difference
FROM Employee_Salary;
+--------------------+
| Max_Min_Difference |
+--------------------+
|  9500.240000000002 |
+--------------------+
```

### Question 16

Find the absolute difference between Salary and 20,000.

```sql
SELECT Emp_Name,
ABS(Salary - 20000) AS Diff_From_20000
FROM Employee_Salary;
+----------+--------------------+
| Emp_Name | Diff_From_20000    |
+----------+--------------------+
| Ravi     |            7499.25 |
| Priya    |             1249.5 |
| Kiran    | 2000.9900000000016 |
| Sneha    |            4399.75 |
| Rahul    | 100.20000000000073 |
+----------+--------------------+
```

## MOD() Function

### Question 17

Find whether Emp_ID is even or odd using MOD().

```sql
SELECT Emp_ID,
Emp_Name,
CASE WHEN MOD(Emp_ID, 2) = 0
THEN 'Even'
ELSE 'Odd'
END AS ID_Type
FROM Employee_Salary;
+--------+----------+---------+
| Emp_ID | Emp_Name | ID_Type |
+--------+----------+---------+
|    101 | Ravi     | Odd     |
|    102 | Priya    | Even    |
|    103 | Kiran    | Odd     |
|    104 | Sneha    | Even    |
|    105 | Rahul    | Odd     |
+--------+----------+---------+
```

### Question 18

Display employees whose Experience leaves a remainder of 1 when divided by 2.

```sql
SELECT Emp_Name,
Experience FROM Employee_Salary
WHERE MOD(Experience, 2) = 1;
+----------+------------+
| Emp_Name | Experience |
+----------+------------+
| Sneha    |          3 |
| Rahul    |          5 |
+----------+------------+
```

### Question 19

Find the remainder when Salary is divided by 100.

```sql
SELECT Emp_Name,
Salary,
MOD(Salary, 100) AS Remainder
FROM Employee_Salary;
+----------+----------+-----------+
| Emp_Name | Salary   | Remainder |
+----------+----------+-----------+
| Ravi     | 12500.75 |      0.75 |
| Priya    |  18750.5 |      50.5 |
| Kiran    | 22000.99 |      0.99 |
| Sneha    | 15600.25 |      0.25 |
| Rahul    |  19899.8 |      99.8 |
+----------+----------+-----------+
```

### Question 20

Find employees whose Emp_ID is divisible by 5.

```sql
SELECT Emp_ID,
Emp_Name FROM Employee_Salary
WHERE MOD(Emp_ID, 5) = 0;
+--------+----------+
| Emp_ID | Emp_Name |
+--------+----------+
|    105 | Rahul    |
+--------+----------+
```

## POWER() Function

### Question 21

Calculate Experience raised to the power of 2 for each employee.

```sql
SELECT Emp_Name,
Experience,
POWER(Experience, 2) AS Exp_Power_2
FROM Employee_Salary;
+----------+------------+-------------+
| Emp_Name | Experience | Exp_Power_2 |
+----------+------------+-------------+
| Ravi     |          2 |           4 |
| Priya    |          4 |          16 |
| Kiran    |          6 |          36 |
| Sneha    |          3 |           9 |
| Rahul    |          5 |          25 |
+----------+------------+-------------+
```

### Question 22

Calculate Experience raised to the power of 3 for each employee.

```sql
SELECT Emp_Name,
Experience,
POWER(Experience, 3) AS Exp_Power_3
FROM Employee_Salary;
+----------+------------+-------------+
| Emp_Name | Experience | Exp_Power_3 |
+----------+------------+-------------+
| Ravi     |          2 |           8 |
| Priya    |          4 |          64 |
| Kiran    |          6 |         216 |
| Sneha    |          3 |          27 |
| Rahul    |          5 |         125 |
+----------+------------+-------------+
```

## SQRT() Function

### Question 23

Find the square root of each employee's Experience.

```sql
SELECT Emp_Name,
Experience,
SQRT(Experience) AS Exp_Sqrt
FROM Employee_Salary;
+----------+------------+--------------------+
| Emp_Name | Experience | Exp_Sqrt           |
+----------+------------+--------------------+
| Ravi     |          2 | 1.4142135623730951 |
| Priya    |          4 |                  2 |
| Kiran    |          6 |  2.449489742783178 |
| Sneha    |          3 | 1.7320508075688772 |
| Rahul    |          5 |   2.23606797749979 |
+----------+------------+--------------------+
```

## TRUNCATE() Function

### Question 24

Display Salary truncated to 1 decimal place.

```sql
SELECT Emp_Name,
TRUNCATE(Salary, 1) AS Truncated_Salary
FROM Employee_Salary;
+----------+------------------+
| Emp_Name | Truncated_Salary |
+----------+------------------+
| Ravi     |          12500.7 |
| Priya    |          18750.5 |
| Kiran    |          22000.9 |
| Sneha    |          15600.2 |
| Rahul    |          19899.8 |
+----------+------------------+
```

## Mixed Numerical Function

### Question 25

Display Salary, CEIL(Salary), FLOOR(Salary), and ROUND(Salary) in the same result set.

```sql
SELECT Emp_Name,
Salary,
CEIL(Salary) AS Ceil_Salary,
FLOOR(Salary) AS Floor_Salary,
ROUND(Salary) AS Rounded_Salary
FROM Employee_Salary;
+----------+----------+-------------+--------------+----------------+
| Emp_Name | Salary   | Ceil_Salary | Floor_Salary | Rounded_Salary |
+----------+----------+-------------+--------------+----------------+
| Ravi     | 12500.75 |       12501 |        12500 |          12501 |
| Priya    |  18750.5 |       18751 |        18750 |          18751 |
| Kiran    | 22000.99 |       22001 |        22000 |          22001 |
| Sneha    | 15600.25 |       15601 |        15600 |          15600 |
| Rahul    |  19899.8 |       19900 |        19899 |          19900 |
+----------+----------+-------------+--------------+----------------+
```
