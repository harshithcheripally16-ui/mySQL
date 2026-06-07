# Task 1

## Table Setup

```sql
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    city VARCHAR(30)
);

INSERT INTO Employee VALUES
(101, 'Ravi', 'IT', 50000, 'Hyderabad'),
(102, 'Suresh', 'HR', 40000, 'Chennai'),
(103, 'Priya', 'IT', 60000, 'Bangalore'),
(104, 'Anjali', 'Finance', 55000, 'Mumbai'),
(105, 'Kiran', 'HR', 45000, 'Hyderabad'),
(106, 'Rahul', 'IT', 70000, 'Pune'),
(107, 'Sneha', 'Finance', 65000, 'Chennai'),
(108, 'Arjun', 'IT', 48000, 'Hyderabad'),
(109, 'Meena', 'HR', 52000, 'Bangalore'),
(110, 'Vijay', 'Finance', 75000, 'Mumbai');
```

## Question 1

Insert a new employee record into the Employee table.

```sql
INSERT INTO Employee VALUES(111, 'Harshith', 'IT', 200000, 'Hyderabad');
```

## Question 2

Insert an employee with emp_id = 112, emp_name = 'Teja', department = 'IT', salary = 55000, city = 'Hyderabad'.

```sql
INSERT INTO Employee VALUES(112, 'Teja', 'IT', 55000, 'Hyderabad');
```

## Question 3

Insert multiple employee records using a single query.

```sql
INSERT INTO Employee VALUES
(113, 'Ajay', 'HR', '75000', 'Chennai'),
(114, 'Jay', 'IT', '60000', 'Pune'),
(115, 'Ayaz', 'IT', '150000', 'Bangalore');

SELECT * FROM Employee;
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
```

## Question 4

Insert a record by specifying column names explicitly.

```sql
INSERT INTO Employee(emp_id, emp_name, department, salary, city) VALUES(116, 'Tarun', 'Finance', 45000, 'Mumbai');
```

## Question 5

Insert an employee record with only emp_id, emp_name, and department.

```sql
INSERT INTO Employee(emp_id, emp_name, department) VALUES(117, 'Karan', 'IT');
```

## Question 6

Update the salary of employee with emp_id = 101.

```sql
UPDATE Employee
SET salary=80000
WHERE emp_id = 101;
```

## Question 7

Update the city of employee 'Ravi' to Bangalore.

```sql
UPDATE Employee
SET city = 'Bangalore'
WHERE emp_id = 101;
```

## Question 8

Update the department of employee with emp_id = 105 to Finance.

```sql
UPDATE Employee
SET department = 'Finance'
WHERE emp_id = 105;
```

## Question 9

Update the salary of all employees in the IT department.

```sql
UPDATE Employee
SET salary = salary + 500
WHERE department = 'IT';
```

## Question 10

Update the city to Hyderabad for all HR employees.

```sql
UPDATE Employee
SET city = 'Hyderabad'
WHERE department = 'HR';
```

## Question 11

Delete the employee whose emp_id = 103.

```sql
DELETE FROM Employee
WHERE emp_id = 103;
```

## Question 12

Delete all employees belonging to the HR department.

```sql
DELETE FROM Employee
WHERE department = 'HR';
```

## Question 13

Delete employees whose salary is less than 40000.

```sql
DELETE FROM Employee
WHERE salary < 40000;
```

## Question 14

Delete employees from Hyderabad.

```sql
DELETE FROM Employee
WHERE city = 'Hyderabad';
```

## Question 15

Delete employees working in the Finance department.

```sql
DELETE FROM Employee
WHERE department = 'Finance';

SELECT * FROM Employee;
+--------+----------+------------+--------+-----------+
| emp_id | emp_name | department | salary | city      |
+--------+----------+------------+--------+-----------+
|    101 | Ravi     | IT         |  80500 | Bangalore |
|    106 | Rahul    | IT         |  70500 | Pune      |
|    114 | Jay      | IT         |  60500 | Pune      |
|    115 | Ayaz     | IT         | 150500 | Bangalore |
|    117 | Karan    | IT         |   NULL | NULL      |
+--------+----------+------------+--------+-----------+
```

## Question 16

Display all employees whose salary is greater than 50000.

```sql
SELECT * FROM Employee
WHERE salary > 50000;
+--------+----------+------------+--------+-----------+
| emp_id | emp_name | department | salary | city      |
+--------+----------+------------+--------+-----------+
|    101 | Ravi     | IT         |  80500 | Bangalore |
|    106 | Rahul    | IT         |  70500 | Pune      |
|    114 | Jay      | IT         |  60500 | Pune      |
|    115 | Ayaz     | IT         | 150500 | Bangalore |
+--------+----------+------------+--------+-----------+
```

## Question 17

Display employees working in the IT department.

```sql
SELECT * FROM Employee
WHERE department = 'IT';
+--------+----------+------------+--------+-----------+
| emp_id | emp_name | department | salary | city      |
+--------+----------+------------+--------+-----------+
|    101 | Ravi     | IT         |  80500 | Bangalore |
|    106 | Rahul    | IT         |  70500 | Pune      |
|    114 | Jay      | IT         |  60500 | Pune      |
|    115 | Ayaz     | IT         | 150500 | Bangalore |
|    117 | Karan    | IT         |   NULL | NULL      |
+--------+----------+------------+--------+-----------+
```

## Question 18

Display employees from Hyderabad.

```sql
SELECT * FROM Employee
WHERE city = 'Hyderabad';
Empty set
```

## Question 19

Display employees whose salary is less than 60000.

```sql
SELECT * FROM Employee
WHERE salary < 60000;
Empty set
```

## Question 20

Display details of employee with emp_id = 105.

```sql
SELECT * FROM Employee
WHERE emp_id = 105;
Empty set
```

## Question 21

Display employees whose department is Finance.

```sql
SELECT * FROM Employee
WHERE department = 'Finance';
Empty set
```

## Question 22

Display employees whose city is Bangalore.

```sql
SELECT * FROM Employee
WHERE city = 'Bangalore';
+--------+----------+------------+--------+-----------+
| emp_id | emp_name | department | salary | city      |
+--------+----------+------------+--------+-----------+
|    101 | Ravi     | IT         |  80500 | Bangalore |
|    115 | Ayaz     | IT         | 150500 | Bangalore |
+--------+----------+------------+--------+-----------+
```

## Question 23

Display employees whose salary is greater than 50000 and city is Hyderabad.

```sql
SELECT * FROM Employee
WHERE salary > 50000
AND city = 'Hyderabad';
Empty set
```

## Question 24

Display employees whose department is IT and salary is greater than 60000.

```sql
SELECT * FROM Employee
WHERE department = 'IT'
AND salary > 60000;
+--------+----------+------------+--------+-----------+
| emp_id | emp_name | department | salary | city      |
+--------+----------+------------+--------+-----------+
|    101 | Ravi     | IT         |  80500 | Bangalore |
|    106 | Rahul    | IT         |  70500 | Pune      |
|    114 | Jay      | IT         |  60500 | Pune      |
|    115 | Ayaz     | IT         | 150500 | Bangalore |
+--------+----------+------------+--------+-----------+
```

## Question 25

Display employees whose city is Mumbai and department is Finance.

```sql
SELECT * FROM Employee
WHERE city = 'Mumbai'
AND department = 'Finance';
Empty set
```

## Question 26

Display emp_name as Employee_Name.

```sql
SELECT emp_name AS Employee_Name
FROM Employee;
+---------------+
| Employee_Name |
+---------------+
| Ravi          |
| Rahul         |
| Jay           |
| Ayaz          |
| Karan         |
+---------------+
```

## Question 27

Display salary as Employee_Salary.

```sql
SELECT salary AS Employee_Salary
FROM Employee;
+-----------------+
| Employee_Salary |
+-----------------+
|           80500 |
|           70500 |
|           60500 |
|          150500 |
|            NULL |
+-----------------+
```

## Question 28

Display department as Dept_Name and city as Employee_City.

```sql
SELECT department AS Dept_Name,
       city AS Employee_City
FROM Employee;
+-----------+---------------+
| Dept_Name | Employee_City |
+-----------+---------------+
| IT        | Bangalore     |
| IT        | Pune          |
| IT        | Pune          |
| IT        | Bangalore     |
| IT        | NULL          |
+-----------+---------------+
```

## Question 29

Display all employees ordered by salary in descending order.

```sql
SELECT * FROM Employee
ORDER BY salary DESC;
+--------+----------+------------+--------+-----------+
| emp_id | emp_name | department | salary | city      |
+--------+----------+------------+--------+-----------+
|    115 | Ayaz     | IT         | 150500 | Bangalore |
|    101 | Ravi     | IT         |  80500 | Bangalore |
|    106 | Rahul    | IT         |  70500 | Pune      |
|    114 | Jay      | IT         |  60500 | Pune      |
|    117 | Karan    | IT         |   NULL | NULL      |
+--------+----------+------------+--------+-----------+
```

## Question 30

Display all employees ordered by city ascending and salary descending.

```sql
SELECT * FROM Employee
ORDER BY city ASC, salary DESC;
+--------+----------+------------+--------+-----------+
| emp_id | emp_name | department | salary | city      |
+--------+----------+------------+--------+-----------+
|    117 | Karan    | IT         |   NULL | NULL      |
|    115 | Ayaz     | IT         | 150500 | Bangalore |
|    101 | Ravi     | IT         |  80500 | Bangalore |
|    106 | Rahul    | IT         |  70500 | Pune      |
|    114 | Jay      | IT         |  60500 | Pune      |
+--------+----------+------------+--------+-----------+
```
