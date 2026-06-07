# Task 4

## Table Setup

Create the `Departments` table.

```sql
mysql> CREATE TABLE Departments (
    -> dept_id INT PRIMARY KEY,
    -> dept_name VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.08 sec)
```

## Incorrect Attempts and Corrections

Attempt to create the `Students` table by writing the foreign key directly with the column definition.

```sql
mysql> CREATE TABLE Students (
    -> student_id INT PRIMARY KEY,
    -> student_name VARCHAR(20),
    -> dept_id INT FOREIGN KEY (dept_id) REFERENCES Departments (dept_id),
    -> birth_date DATE,
    -> pincode INT,
    -> house_no VARCHAR(10),
    -> street VARCHAR(100)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FOREIGN KEY (dept_id) REFERENCES Departments (dept_id),
birth_date DATE,
pincode' at line 4
```

Attempt to add a foreign key without first creating the `dept_id` column.

```sql
mysql> CREATE TABLE Students (
    -> student_id INT PRIMARY KEY,
    -> student_name VARCHAR(20),
    -> FOREIGN KEY (dept_id) REFERENCES Departments (dept_id),
    -> birth_date DATE,
    -> pincode INT,
    -> house_no VARCHAR(10),
    -> street VARCHAR(100)
    -> );
ERROR 1072 (42000): Key column 'dept_id' doesn't exist in table
```

Correct way to create the `Students` table with a foreign key.

```sql
mysql> CREATE TABLE Students (
    ->     student_id INT PRIMARY KEY,
    ->     student_name VARCHAR(20),
    ->     dept_id INT,
    ->     birth_date DATE,
    ->     pincode INT,
    ->     house_no VARCHAR(10),
    ->     street VARCHAR(100),
    ->     FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
    -> );
Query OK, 0 rows affected (0.05 sec)
```

## Remaining Table Setup

Create the `Student_mobileno` table.

```sql
mysql> CREATE TABLE Student_mobileno (
    -> student_id INT, FOREIGN KEY (student_id) REFERENCES Students (student_id),
    -> mobile_no VARCHAR(15)
    -> );
Query OK, 0 rows affected (0.05 sec)
```

Create the `Course` table.

```sql
mysql> CREATE TABLE Course (
    -> course_id INT PRIMARY KEY,
    -> duration VARCHAR(10),
    -> course_name VARCHAR(15)
    -> );
Query OK, 0 rows affected (0.02 sec)
```

Incorrect attempt to create the `Enrollment` table by referencing the wrong column in the `Course` table.

```sql
mysql> CREATE TABLE Enrollment (
    -> student_id INT,
    -> course_id INT,
    -> enrollment_date DATE,
    -> PRIMARY KEY (student_id, course_id),
    -> FOREIGN KEY (student_id) REFERENCES Students (student_id),
    -> FOREIGN KEY (course_id) REFERENCES Course (student_id)
    -> );
ERROR 3734 (HY000): Failed to add the foreign key constraint. Missing column 'student_id' for constraint 'enrollment_ibfk_2' in the referenced table 'course'
```

Correct way to create the `Enrollment` table.

```sql
mysql> CREATE TABLE Enrollment (
    -> student_id INT,
    -> course_id INT,
    -> enrollment_date DATE,
    -> PRIMARY KEY (student_id, course_id),
    -> FOREIGN KEY (student_id) REFERENCES Students (student_id),
    -> FOREIGN KEY (course_id) REFERENCES Course (course_id)
    -> );
Query OK, 0 rows affected (0.04 sec)
```

## Table Descriptions

Display the structure of the `Departments` table.

```sql
mysql> desc departments;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_id   | int         | NO   | PRI | NULL    |       |
| dept_name | varchar(50) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.02 sec)
```

Display the structure of the `Students` table.

```sql
mysql> desc students;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| student_id   | int          | NO   | PRI | NULL    |       |
| student_name | varchar(20)  | YES  |     | NULL    |       |
| dept_id      | int          | YES  | MUL | NULL    |       |
| birth_date   | date         | YES  |     | NULL    |       |
| pincode      | int          | YES  |     | NULL    |       |
| house_no     | varchar(10)  | YES  |     | NULL    |       |
| street       | varchar(100) | YES  |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)
```

Display the structure of the `Student_mobileno` table.

```sql
mysql> desc student_mobileno;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| student_id | int         | YES  | MUL | NULL    |       |
| mobile_no  | varchar(15) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)
```

Display the structure of the `Course` table.

```sql
mysql> desc course;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| course_id   | int         | NO   | PRI | NULL    |       |
| duration    | varchar(10) | YES  |     | NULL    |       |
| course_name | varchar(15) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)
```

Display the structure of the `Enrollment` table.

```sql
mysql> desc enrollment;
+-----------------+------+------+-----+---------+-------+
| Field           | Type | Null | Key | Default | Extra |
+-----------------+------+------+-----+---------+-------+
| student_id      | int  | NO   | PRI | NULL    |       |
| course_id       | int  | NO   | PRI | NULL    |       |
| enrollment_date | date | YES  |     | NULL    |       |
+-----------------+------+------+-----+---------+-------+
3 rows in set (0.00 sec)
```

## Sample Data Insertion

Insert records into the `Departments` table.

```sql
mysql> INSERT INTO Departments VALUES
    -> (101, 'Computer Science'),
    -> (102, 'Information Technology'),
    -> (103, 'Mechanical')
    -> ;
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0
```

Insert records into the `Students` table.

```sql
mysql> INSERT INTO Students VALUES
    -> (1, 'Rahul', 101, '2003-05-10', 500001, '12A', 'MG Road'),
    -> (2, 'Priya', 102, '2004-08-15', 500002, '45B', 'Nehru Street'),
    -> (3, 'Arjun', 101, '2003-12-20', 500003, '78C', 'Gandhi Nagar'),
    -> (4, 'Sneha', 103, '2004-03-25', 500004, '21D', 'Station Road');
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0
```

Insert records into the `Student_mobileno` table.

```sql
mysql> INSERT INTO Student_mobileno VALUES
    -> (1, '9876543210'),
    -> (1, '9123456780'),
    -> (2, '9988776655'),
    -> (3, '9871234567'),
    -> (4, '9012345678');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0
```

Insert records into the `Course` table.

```sql
mysql> INSERT INTO Course VALUES
    -> (201, '6 Months', 'SQL'),
    -> (202, '4 Months', 'Java'),
    -> (203, '5 Months', 'Python'),
    -> (204, '3 Months', 'DBMS');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0
```

Insert records into the `Enrollment` table.

```sql
mysql> INSERT INTO Enrollment VALUES
    -> (1, 201, '2025-01-10'),
    -> (1, 203, '2025-01-15'),
    -> (2, 202, '2025-01-12'),
    -> (3, 201, '2025-01-18'),
    -> (3, 204, '2025-01-20'),
    -> (4, 203, '2025-01-25');
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0
```

## Question 1

Display all department records.

```sql
mysql> SELECT * FROM Departments;
+---------+------------------------+
| dept_id | dept_name              |
+---------+------------------------+
|     101 | Computer Science       |
|     102 | Information Technology |
|     103 | Mechanical             |
+---------+------------------------+
3 rows in set (0.01 sec)
```

## Question 2

Display all student records.

```sql
mysql> SELECT * FROM Students;
+------------+--------------+---------+------------+---------+----------+--------------+
| student_id | student_name | dept_id | birth_date | pincode | house_no | street       |
+------------+--------------+---------+------------+---------+----------+--------------+
|          1 | Rahul        |     101 | 2003-05-10 |  500001 | 12A      | MG Road      |
|          2 | Priya        |     102 | 2004-08-15 |  500002 | 45B      | Nehru Street |
|          3 | Arjun        |     101 | 2003-12-20 |  500003 | 78C      | Gandhi Nagar |
|          4 | Sneha        |     103 | 2004-03-25 |  500004 | 21D      | Station Road |
+------------+--------------+---------+------------+---------+----------+--------------+
4 rows in set (0.00 sec)
```

## Question 3

Display all student mobile numbers.

```sql
mysql> SELECT * FROM Student_mobileno;
+------------+------------+
| student_id | mobile_no  |
+------------+------------+
|          1 | 9876543210 |
|          1 | 9123456780 |
|          2 | 9988776655 |
|          3 | 9871234567 |
|          4 | 9012345678 |
+------------+------------+
5 rows in set (0.00 sec)
```

## Question 4

Display all course records.

```sql
mysql> SELECT * FROM Course;
+-----------+----------+-------------+
| course_id | duration | course_name |
+-----------+----------+-------------+
|       201 | 6 Months | SQL         |
|       202 | 4 Months | Java        |
|       203 | 5 Months | Python      |
|       204 | 3 Months | DBMS        |
+-----------+----------+-------------+
4 rows in set (0.00 sec)
```

## Question 5

Display all enrollment records.

```sql
mysql> SELECT * FROM Enrollment;
+------------+-----------+-----------------+
| student_id | course_id | enrollment_date |
+------------+-----------+-----------------+
|          1 |       201 | 2025-01-10      |
|          1 |       203 | 2025-01-15      |
|          2 |       202 | 2025-01-12      |
|          3 |       201 | 2025-01-18      |
|          3 |       204 | 2025-01-20      |
|          4 |       203 | 2025-01-25      |
+------------+-----------+-----------------+
6 rows in set (0.00 sec)
```

## Question 6

Display student names, course names, and enrollment dates using joins.

```sql
mysql> SELECT
    ->     s.student_id,
    ->     s.student_name,
    ->     c.course_name,
    ->     e.enrollment_date
    -> FROM Students s
    -> JOIN Enrollment e
    ->     ON s.student_id = e.student_id
    -> JOIN Course c
    ->     ON e.course_id = c.course_id;
+------------+--------------+-------------+-----------------+
| student_id | student_name | course_name | enrollment_date |
+------------+--------------+-------------+-----------------+
|          1 | Rahul        | SQL         | 2025-01-10      |
|          1 | Rahul        | Python      | 2025-01-15      |
|          2 | Priya        | Java        | 2025-01-12      |
|          3 | Arjun        | SQL         | 2025-01-18      |
|          3 | Arjun        | DBMS        | 2025-01-20      |
|          4 | Sneha        | Python      | 2025-01-25      |
+------------+--------------+-------------+-----------------+
6 rows in set (0.00 sec)
```

## Question 7

Delete one mobile number for student ID 1.

```sql
mysql> DELETE FROM Student_mobileno
    -> WHERE student_id = 1
    ->   AND mobile_no = '9123456780';
Query OK, 1 row affected (0.01 sec)
```

## Final Table View

Display the `Student_mobileno` table after deleting one record.

```sql
mysql> SELECT * FROM Student_mobileno;
+------------+------------+
| student_id | mobile_no  |
+------------+------------+
|          1 | 9876543210 |
|          2 | 9988776655 |
|          3 | 9871234567 |
|          4 | 9012345678 |
+------------+------------+
4 rows in set (0.00 sec)
```
