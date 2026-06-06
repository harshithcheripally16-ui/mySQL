# Task 3


## Table Setup

```sql
CREATE TABLE employee (
   emp_id INT,
   emp_name VARCHAR(50),
   department VARCHAR(20),
   salary INT,
   city VARCHAR(30),
   email VARCHAR(50)
);

INSERT INTO employee VALUES
(101,'Ravi','IT',50000,'Hyderabad','ravi@gmail.com'),
(102,'Kumar','HR',40000,'Chennai',NULL),
(103,'Sai','IT',70000,'Bangalore','sai@gmail.com'),
(104,'Priya','Finance',60000,'Hyderabad','priya@gmail.com'),
(105,'Anu','HR',35000,'Pune',NULL),
(106,'Ramesh','IT',80000,'Hyderabad','ramesh@gmail.com'),
(107,'Divya','Finance',55000,'Bangalore','divya@gmail.com'),
(108,'Kiran','HR',45000,'Hyderabad',NULL);

mysql> CREATE TABLE employee (
    ->    emp_id INT,
    ->    emp_name VARCHAR(50),
    ->    department VARCHAR(20),
    ->    salary INT,
    ->    city VARCHAR(30),
    ->    email VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql>
mysql> INSERT INTO employee VALUES
    -> (101,'Ravi','IT',50000,'Hyderabad','ravi@gmail.com'),
    -> (102,'Kumar','HR',40000,'Chennai',NULL),
    -> (103,'Sai','IT',70000,'Bangalore','sai@gmail.com'),
    -> (104,'Priya','Finance',60000,'Hyderabad','priya@gmail.com'),
    -> (105,'Anu','HR',35000,'Pune',NULL),
    -> (106,'Ramesh','IT',80000,'Hyderabad','ramesh@gmail.com'),
    -> (107,'Divya','Finance',55000,'Bangalore','divya@gmail.com'),
    -> (108,'Kiran','HR',45000,'Hyderabad',NULL);
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

```

## Question 1

Display employee name and salary increased by Rs. 5,000.

```sql
mysql> SELECT emp_name, salary + 5000 AS increased_salary
    -> FROM employee;
+----------+------------------+
| emp_name | increased_salary |
+----------+------------------+
| Ravi     |            55000 |
| Kumar    |            45000 |
| Sai      |            75000 |
| Priya    |            65000 |
| Anu      |            40000 |
| Ramesh   |            85000 |
| Divya    |            60000 |
| Kiran    |            50000 |
+----------+------------------+
8 rows in set (0.01 sec)

```

## Question 2

Calculate annual salary for all employees.

```sql
mysql> SELECT emp_name, salary * 12 AS annual_salary
    -> FROM employee;
+----------+---------------+
| emp_name | annual_salary |
+----------+---------------+
| Ravi     |        600000 |
| Kumar    |        480000 |
| Sai      |        840000 |
| Priya    |        720000 |
| Anu      |        420000 |
| Ramesh   |        960000 |
| Divya    |        660000 |
| Kiran    |        540000 |
+----------+---------------+
8 rows in set (0.00 sec)

```

## Question 3

Display salary after deducting Rs. 2,000.

```sql
mysql> SELECT emp_name, salary - 2000 AS deducted_salary
    -> FROM employee;
+----------+-----------------+
| emp_name | deducted_salary |
+----------+-----------------+
| Ravi     |           48000 |
| Kumar    |           38000 |
| Sai      |           68000 |
| Priya    |           58000 |
| Anu      |           33000 |
| Ramesh   |           78000 |
| Divya    |           53000 |
| Kiran    |           43000 |
+----------+-----------------+
8 rows in set (0.01 sec)

```

## Question 4

Find employees from the IT department and Hyderabad city.

```sql
mysql> SELECT * FROM employee
    -> WHERE department = 'IT' AND city = 'Hyderabad';
+--------+----------+------------+--------+-----------+------------------+
| emp_id | emp_name | department | salary | city      | email            |
+--------+----------+------------+--------+-----------+------------------+
|    101 | Ravi     | IT         |  50000 | Hyderabad | ravi@gmail.com   |
|    106 | Ramesh   | IT         |  80000 | Hyderabad | ramesh@gmail.com |
+--------+----------+------------+--------+-----------+------------------+
2 rows in set (0.01 sec)

```

## Question 5

Find employees from IT or Finance departments.

```sql
mysql> SELECT * FROM employee
    -> WHERE department = 'IT' OR department = 'Finance';
+--------+----------+------------+--------+-----------+------------------+
| emp_id | emp_name | department | salary | city      | email            |
+--------+----------+------------+--------+-----------+------------------+
|    101 | Ravi     | IT         |  50000 | Hyderabad | ravi@gmail.com   |
|    103 | Sai      | IT         |  70000 | Bangalore | sai@gmail.com    |
|    104 | Priya    | Finance    |  60000 | Hyderabad | priya@gmail.com  |
|    106 | Ramesh   | IT         |  80000 | Hyderabad | ramesh@gmail.com |
|    107 | Divya    | Finance    |  55000 | Bangalore | divya@gmail.com  |
+--------+----------+------------+--------+-----------+------------------+
5 rows in set (0.00 sec)

```

## Question 6

Find employees not belonging to the HR department.

```sql
mysql> SELECT * FROM employee
    -> WHERE department != 'HR';
+--------+----------+------------+--------+-----------+------------------+
| emp_id | emp_name | department | salary | city      | email            |
+--------+----------+------------+--------+-----------+------------------+
|    101 | Ravi     | IT         |  50000 | Hyderabad | ravi@gmail.com   |
|    103 | Sai      | IT         |  70000 | Bangalore | sai@gmail.com    |
|    104 | Priya    | Finance    |  60000 | Hyderabad | priya@gmail.com  |
|    106 | Ramesh   | IT         |  80000 | Hyderabad | ramesh@gmail.com |
|    107 | Divya    | Finance    |  55000 | Bangalore | divya@gmail.com  |
+--------+----------+------------+--------+-----------+------------------+
5 rows in set (0.00 sec)

```

## Question 7

Find employees whose salary is between Rs. 40,000 and Rs. 60,000.

```sql
mysql> SELECT * FROM employee
    -> WHERE salary BETWEEN 40000 AND 60000;
+--------+----------+------------+--------+-----------+-----------------+
| emp_id | emp_name | department | salary | city      | email           |
+--------+----------+------------+--------+-----------+-----------------+
|    101 | Ravi     | IT         |  50000 | Hyderabad | ravi@gmail.com  |
|    102 | Kumar    | HR         |  40000 | Chennai   | NULL            |
|    104 | Priya    | Finance    |  60000 | Hyderabad | priya@gmail.com |
|    107 | Divya    | Finance    |  55000 | Bangalore | divya@gmail.com |
|    108 | Kiran    | HR         |  45000 | Hyderabad | NULL            |
+--------+----------+------------+--------+-----------+-----------------+
5 rows in set (0.00 sec)

```

## Question 8

Find employees whose email is NULL.

```sql
mysql> SELECT * FROM employee
    -> WHERE email IS NULL;
+--------+----------+------------+--------+-----------+-------+
| emp_id | emp_name | department | salary | city      | email |
+--------+----------+------------+--------+-----------+-------+
|    102 | Kumar    | HR         |  40000 | Chennai   | NULL  |
|    105 | Anu      | HR         |  35000 | Pune      | NULL  |
|    108 | Kiran    | HR         |  45000 | Hyderabad | NULL  |
+--------+----------+------------+--------+-----------+-------+
3 rows in set (0.00 sec)

```

## Question 9

Find employees whose email is NOT NULL.

```sql
mysql> SELECT * FROM employee
    -> WHERE email IS NOT NULL;
+--------+----------+------------+--------+-----------+------------------+
| emp_id | emp_name | department | salary | city      | email            |
+--------+----------+------------+--------+-----------+------------------+
|    101 | Ravi     | IT         |  50000 | Hyderabad | ravi@gmail.com   |
|    103 | Sai      | IT         |  70000 | Bangalore | sai@gmail.com    |
|    104 | Priya    | Finance    |  60000 | Hyderabad | priya@gmail.com  |
|    106 | Ramesh   | IT         |  80000 | Hyderabad | ramesh@gmail.com |
|    107 | Divya    | Finance    |  55000 | Bangalore | divya@gmail.com  |
+--------+----------+------------+--------+-----------+------------------+
5 rows in set (0.00 sec)

```

## Question 10

Find employees whose names do NOT start with the letter 'R'.

```sql
mysql> SELECT * FROM employee
    -> WHERE emp_name NOT LIKE 'R%';
+--------+----------+------------+--------+-----------+-----------------+
| emp_id | emp_name | department | salary | city      | email           |
+--------+----------+------------+--------+-----------+-----------------+
|    102 | Kumar    | HR         |  40000 | Chennai   | NULL            |
|    103 | Sai      | IT         |  70000 | Bangalore | sai@gmail.com   |
|    104 | Priya    | Finance    |  60000 | Hyderabad | priya@gmail.com |
|    105 | Anu      | HR         |  35000 | Pune      | NULL            |
|    107 | Divya    | Finance    |  55000 | Bangalore | divya@gmail.com |
|    108 | Kiran    | HR         |  45000 | Hyderabad | NULL            |
+--------+----------+------------+--------+-----------+-----------------+
6 rows in set (0.01 sec)

```

## Final Table View

```sql
mysql> SELECT * FROM employee;
+--------+----------+------------+--------+-----------+------------------+
| emp_id | emp_name | department | salary | city      | email            |
+--------+----------+------------+--------+-----------+------------------+
|    101 | Ravi     | IT         |  50000 | Hyderabad | ravi@gmail.com   |
|    102 | Kumar    | HR         |  40000 | Chennai   | NULL             |
|    103 | Sai      | IT         |  70000 | Bangalore | sai@gmail.com    |
|    104 | Priya    | Finance    |  60000 | Hyderabad | priya@gmail.com  |
|    105 | Anu      | HR         |  35000 | Pune      | NULL             |
|    106 | Ramesh   | IT         |  80000 | Hyderabad | ramesh@gmail.com |
|    107 | Divya    | Finance    |  55000 | Bangalore | divya@gmail.com  |
|    108 | Kiran    | HR         |  45000 | Hyderabad | NULL             |
+--------+----------+------------+--------+-----------+------------------+
8 rows in set (0.00 sec)
```
