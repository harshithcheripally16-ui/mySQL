# Task 1


## Table Setup


```sql
mysql> CREATE TABLE Employee (
    ->     emp_id INT PRIMARY KEY,
    ->     emp_name VARCHAR(50),
    ->     department VARCHAR(30),
    ->     salary INT,
    ->     city VARCHAR(30)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql>
mysql> INSERT INTO Employee VALUES
    -> (101, 'Ravi', 'IT', 50000, 'Hyderabad'),
    -> (102, 'Suresh', 'HR', 40000, 'Chennai'),
    -> (103, 'Priya', 'IT', 60000, 'Bangalore'),
    -> (104, 'Anjali', 'Finance', 55000, 'Mumbai'),
    -> (105, 'Kiran', 'HR', 45000, 'Hyderabad'),
    -> (106, 'Rahul', 'IT', 70000, 'Pune'),
    -> (107, 'Sneha', 'Finance', 65000, 'Chennai'),
    -> (108, 'Arjun', 'IT', 48000, 'Hyderabad'),
    -> (109, 'Meena', 'HR', 52000, 'Bangalore'),
    -> (110, 'Vijay', 'Finance', 75000, 'Mumbai');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

```

## Question 1

Insert a new employee record into the Employee table.

```sql
mysql> INSERT INTO Employee VALUES(111, 'Harshith', 'IT', 200000, 'Hyderabad');
Query OK, 1 row affected (0.01 sec)

```

## Question 2

Insert an employee with emp_id = 112, emp_name = 'Teja', department = 'IT', salary = 55000, city = 'Hyderabad'.

```sql
mysql> INSERT INTO Employee VALUES(112, 'Teja', 'IT', 55000, 'Hyderabad');
Query OK, 1 row affected (0.01 sec)

```

## Question 3

Insert multiple employee records using a single query.

```sql
mysql> INSERT INTO Employee VALUES
    -> (113, 'Ajay', 'HR', '75000', 'Chennai'),
    -> (114, 'Jay', 'IT', '60000', 'Pune'),
    -> (115, 'Ayaz', 'IT', '150000', 'Bangalore'),
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 4
mysql> INSERT INTO Employee VALUES
    -> (113, 'Ajay', 'HR', '75000', 'Chennai'),
    -> (114, 'Jay', 'IT', '60000', 'Pune'),
    -> (115, 'Ayaz', 'IT', '150000', 'Bangalore');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Employee;
+--------+----------+------------+--------+-----------+
| emp_id | emp_name | department | salary | city      |
+--------+----------+------------+--------+-----------+
|    101 | Ravi     | IT         |  50000 | Hyderabad |
|    102 | Suresh   | HR         |  40000 | Chennai   |
|    103 | Priya    | IT         |  60000 | Bangalore |
|    104 | Anjali   | Finance    |  55000 | Mumbai    |
|    105 | Kiran    | HR         |  45000 | Hyderabad |
|    106 | Rahul    | IT         |  70000 | Pune      |
|    107 | Sneha    | Finance    |  65000 | Chennai   |
|    108 | Arjun    | IT         |  48000 | Hyderabad |
|    109 | Meena    | HR         |  52000 | Bangalore |
|    110 | Vijay    | Finance    |  75000 | Mumbai    |
|    111 | Harshith | IT         | 200000 | Hyderabad |
|    112 | Teja     | IT         |  55000 | Hyderabad |
|    113 | Ajay     | HR         |  75000 | Chennai   |
|    114 | Jay      | IT         |  60000 | Pune      |
|    115 | Ayaz     | IT         | 150000 | Bangalore |
+--------+----------+------------+--------+-----------+
15 rows in set (0.01 sec)

```

## Question 4

Insert a record by specifying column names explicitly.

```sql
mysql> INSERT INTO Employee(emp_id, emp_name, department, salary, city)  VALUES(116, 'Tarun', 'Finance', 45000, 'Mumbai');
Query OK, 1 row affected (0.01 sec)

```

## Question 5

Insert an employee record with only emp_id, emp_name, and department.

```sql
mysql> INSERT INTO Employee(emp_id, emp_name, department)  VALUES(117, 'Karan', 'IT');
Query OK, 1 row affected (0.01 sec)

```

## Question 6

Update the salary of employee with emp_id = 101.

```sql
mysql> UPDATE Employee
    -> SET salary=80000
    -> WHERE id = 101;
ERROR 1054 (42S22): Unknown column 'id' in 'where clause'
mysql> UPDATE Employee
    -> SET salary=80000
    -> WHERE emp_id = 101;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

```

## Question 7

Update the city of employee 'Ravi' to Bangalore.

```sql
mysql> UPDATE Employee
    -> SET city = 'Bangalore'
    -> WHERE emp_id = 101;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

```

## Question 8

Update the department of employee with emp_id = 105 to Finance.

```sql
mysql> UPDATE Employee
    -> SET department = 'Finance'
    -> WHERE emp_id = 105;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

```

## Question 9

Update the salary of all employees in the IT department.

```sql
mysql> UPDATE Employee
    -> SET salary = salary + 500
    -> WHERE department = 'IT';
Query OK, 8 rows affected (0.02 sec)
Rows matched: 9  Changed: 8  Warnings: 0

```

## Question 10

Update the city to Hyderabad for all HR employees.

```sql
mysql> UPDATE Employee
    -> SET city = 'Hyderabad'
    -> WHERE department = 'HR';
Query OK, 3 rows affected (0.01 sec)
Rows matched: 3  Changed: 3  Warnings: 0

```

## Question 11

Delete the employee whose emp_id = 103.

```sql
mysql> DELETE FROM Employee
    -> WHERE emp_id = 103;
Query OK, 1 row affected (0.01 sec)

```

## Question 12

Delete all employees belonging to the HR department.

```sql
mysql> DELETE FROM Employee
    -> WHERE department = 'HR';
Query OK, 3 rows affected (0.01 sec)

```

## Question 13

Delete employees whose salary is less than 40000.

```sql
mysql> DELETE FROM Employee
    -> WHERE salary < 40000;
Query OK, 0 rows affected (0.00 sec)

```

## Question 14

Delete employees from Hyderabad.

```sql
mysql> DELETE FROM Employee
    -> WHERE city = 'Hyderabad';
Query OK, 4 rows affected (0.01 sec)

```

## Question 15

Delete employees working in the Finance department.

```sql
mysql> DELETE FROM Employee
    -> WHERE department = 'Finance';
Query OK, 4 rows affected (0.01 sec)

mysql> SELECT * FROM Employee;
+--------+----------+------------+--------+-----------+
| emp_id | emp_name | department | salary | city      |
+--------+----------+------------+--------+-----------+
|    101 | Ravi     | IT         |  80500 | Bangalore |
|    106 | Rahul    | IT         |  70500 | Pune      |
|    114 | Jay      | IT         |  60500 | Pune      |
|    115 | Ayaz     | IT         | 150500 | Bangalore |
|    117 | Karan    | IT         |   NULL | NULL      |
+--------+----------+------------+--------+-----------+
5 rows in set (0.01 sec)

```

## Question 16

Display all employees whose salary is greater than 50000.

```sql
mysql> SELECT * FROM Employee
    -> WHERE salary > 50000;
+--------+----------+------------+--------+-----------+
| emp_id | emp_name | department | salary | city      |
+--------+----------+------------+--------+-----------+
|    101 | Ravi     | IT         |  80500 | Bangalore |
|    106 | Rahul    | IT         |  70500 | Pune      |
|    114 | Jay      | IT         |  60500 | Pune      |
|    115 | Ayaz     | IT         | 150500 | Bangalore |
+--------+----------+------------+--------+-----------+
4 rows in set (0.00 sec)

```

## Question 17

Display employees working in the IT department.

```sql
mysql> SELECT * FROM Employee
    -> WHERE department = 'IT';
+--------+----------+------------+--------+-----------+
| emp_id | emp_name | department | salary | city      |
+--------+----------+------------+--------+-----------+
|    101 | Ravi     | IT         |  80500 | Bangalore |
|    106 | Rahul    | IT         |  70500 | Pune      |
|    114 | Jay      | IT         |  60500 | Pune      |
|    115 | Ayaz     | IT         | 150500 | Bangalore |
|    117 | Karan    | IT         |   NULL | NULL      |
+--------+----------+------------+--------+-----------+
5 rows in set (0.00 sec)

```

## Question 18

Display employees from Hyderabad.

```sql
mysql> SELECT * FROM Employee
    -> WHERE city = 'Hyderabad';
Empty set (0.00 sec)

```

## Question 19

Display employees whose salary is less than 60000.

```sql
mysql> SELECT * FROM Employee
    -> WHERE salary < 60000;
Empty set (0.00 sec)

```

## Question 20

Display details of employee with emp_id = 105.

```sql
mysql> SELECT * FROM Employee
    -> WHERE emp_id = 105;
Empty set (0.01 sec)

```

## Question 21

Display employees whose department is Finance.

```sql
mysql> SELECT * FROM Employee
    -> WHERE department = 'Finance';
Empty set (0.00 sec)

```

## Question 22

Display employees whose city is Bangalore.

```sql
mysql> SELECT * FROM Employee
    -> WHERE city = 'Bangalore';
+--------+----------+------------+--------+-----------+
| emp_id | emp_name | department | salary | city      |
+--------+----------+------------+--------+-----------+
|    101 | Ravi     | IT         |  80500 | Bangalore |
|    115 | Ayaz     | IT         | 150500 | Bangalore |
+--------+----------+------------+--------+-----------+
2 rows in set (0.00 sec)

```

## Question 23

Display employees whose salary is greater than 50000 and city is Hyderabad.

```sql
mysql> SELECT * FROM Employee
    -> WHERE salary > 50000
    -> AND city = 'Hyderabad';
Empty set (0.00 sec)

```

## Question 24

Display employees whose department is IT and salary is greater than 60000.

```sql
mysql> SELECT * FROM Employee
    -> WHERE department = 'IT'
    -> AND salary > 60000;
+--------+----------+------------+--------+-----------+
| emp_id | emp_name | department | salary | city      |
+--------+----------+------------+--------+-----------+
|    101 | Ravi     | IT         |  80500 | Bangalore |
|    106 | Rahul    | IT         |  70500 | Pune      |
|    114 | Jay      | IT         |  60500 | Pune      |
|    115 | Ayaz     | IT         | 150500 | Bangalore |
+--------+----------+------------+--------+-----------+
4 rows in set (0.00 sec)

```

## Question 25

Display employees whose city is Mumbai and department is Finance.

```sql
mysql> SELECT * FROM Employee
    -> WHERE city = 'Mumbai'
    -> AND department = 'Finance';
Empty set (0.00 sec)

```

## Question 26

Display emp_name as Employee_Name.

```sql
mysql> SELECT emp_name AS Employee_Name
    -> FROM Employee;
+---------------+
| Employee_Name |
+---------------+
| Ravi          |
| Rahul         |
| Jay           |
| Ayaz          |
| Karan         |
+---------------+
5 rows in set (0.00 sec)

```

## Question 27

Display salary as Employee_Salary.

```sql
mysql> SELECT salary AS Employee_Salary
    -> FROM Employee;
+-----------------+
| Employee_Salary |
+-----------------+
|           80500 |
|           70500 |
|           60500 |
|          150500 |
|            NULL |
+-----------------+
5 rows in set (0.00 sec)

```

## Question 28

Display department as Dept_Name and city as Employee_City.

```sql
mysql> SELECT department AS Dept_Name,
    -> city AS Employee_City
    -> FROM Employee;
+-----------+---------------+
| Dept_Name | Employee_City |
+-----------+---------------+
| IT        | Bangalore     |
| IT        | Pune          |
| IT        | Pune          |
| IT        | Bangalore     |
| IT        | NULL          |
+-----------+---------------+
5 rows in set (0.00 sec)

```

## Question 29

Display all employees ordered by salary in descending order.

```sql
mysql> SELECT * FROM Employee
    -> ORDER BY salary DESC;
+--------+----------+------------+--------+-----------+
| emp_id | emp_name | department | salary | city      |
+--------+----------+------------+--------+-----------+
|    115 | Ayaz     | IT         | 150500 | Bangalore |
|    101 | Ravi     | IT         |  80500 | Bangalore |
|    106 | Rahul    | IT         |  70500 | Pune      |
|    114 | Jay      | IT         |  60500 | Pune      |
|    117 | Karan    | IT         |   NULL | NULL      |
+--------+----------+------------+--------+-----------+
5 rows in set (0.01 sec)

```

## Question 30

Display all employees ordered by city ascending and salary descending.

```sql
mysql> SELECT * FROM Employee
    -> ORDER BY city ASC, salary DESC;
+--------+----------+------------+--------+-----------+
| emp_id | emp_name | department | salary | city      |
+--------+----------+------------+--------+-----------+
|    117 | Karan    | IT         |   NULL | NULL      |
|    115 | Ayaz     | IT         | 150500 | Bangalore |
|    101 | Ravi     | IT         |  80500 | Bangalore |
|    106 | Rahul    | IT         |  70500 | Pune      |
|    114 | Jay      | IT         |  60500 | Pune      |
+--------+----------+------------+--------+-----------+
5 rows in set (0.01 sec)
```
