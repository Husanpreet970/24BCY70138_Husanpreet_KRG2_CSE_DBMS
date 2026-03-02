# Experiment 07 – Design and Performance Analysis of Materialized Views

---

## AIM

To design and implement a materialized view and to compare and analyze execution time and performance differences between simple views, complex views, and materialized views.

---

## Software Requirements

- Database Management System: Oracle Database Express Edition (Oracle XE)  
- Database Administration Tool: Oracle SQL Developer  

---

## Objective

- Create simple views  
- Create complex views  
- Create materialized views  
- Compare execution time and performance of each  

---

## Problem Statement

In large-scale enterprise systems, frequent execution of complex queries can significantly affect performance. Optimized mechanisms are required to improve query response time without compromising data consistency.

---

## Table Structure

```sql
CREATE TABLE employee (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    dept_id NUMBER,
    salary NUMBER
);

CREATE TABLE department (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50)
);
```

---

## Sample Data

```sql
INSERT INTO department VALUES (1, 'HR');
INSERT INTO department VALUES (2, 'IT');

INSERT INTO employee VALUES (101, 'John', 1, 3000);
INSERT INTO employee VALUES (102, 'Alice', 2, 5000);
INSERT INTO employee VALUES (103, 'Bob', 2, 4000);
INSERT INTO employee VALUES (104, 'Emma', 1, 3500);

COMMIT;
```

---

## Problem 1: Simple View

### Description

Create a simple view based on a single table.

### Program

```sql
CREATE VIEW emp_view AS
SELECT emp_id, emp_name, salary
FROM employee;
```

---

## Problem 2: Complex View

### Description

Create a complex view using join and aggregation.

### Program

```sql
CREATE VIEW emp_dept_view AS
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;
```

---

## Problem 3: Materialized View

### Description

Create a materialized view to store precomputed results.

### Program

```sql
CREATE MATERIALIZED VIEW emp_mv
BUILD IMMEDIATE
REFRESH COMPLETE
AS
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;
```

---

## Refresh Materialized View

```sql
EXEC DBMS_MVIEW.REFRESH('EMP_MV');
```

---

## Performance Analysis

### Query on Simple View

```sql
SELECT * FROM emp_view;
```

### Query on Complex View

```sql
SELECT * FROM emp_dept_view;
```

### Query on Materialized View

```sql
SELECT * FROM emp_mv;
```

---

## Learning Outcomes

1. Understood the concept of simple, complex, and materialized views  
2. Learned how to create and use materialized views in Oracle  
3. Compared performance between different types of views  
4. Learned how materialized views improve query performance  
5. Applied concepts useful in real-world applications  

---

## Conclusion

This experiment demonstrated the differences between simple views, complex views, and materialized views. Materialized views improve performance by storing precomputed results, making them highly useful for data-intensive applications.
