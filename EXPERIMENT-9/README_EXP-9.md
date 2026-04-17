# Experiment 09 – Implementation of Package (Schema) with Procedures and Shared Cursor
---

## AIM

To design and implement a package-like structure using schema in PostgreSQL that contains procedures/functions and shared cursors to retrieve employee details, demonstrating modular and reusable database programming.

---

## Software Requirements

- Database Management System:
-- Oracle Database Express Edition (Oracle XE)
-- PostgreSQL Database

- Database Administration Tool / Client Tool:
-- Oracle SQL Developer (for Oracle XE)
-- pgAdmin (for PostgreSQL)
  
---

## Objective

To implement modular database programming using schema (as package equivalent), functions, and shared cursors in PostgreSQL.

---

## Problem Statement

In enterprise systems, related database operations must be grouped together for better maintainability, reusability, and performance. While Oracle provides packages, PostgreSQL achieves similar functionality using schemas and functions.

---

## Experiment Steps

Design a package-like structure that:
Contains procedures/functions to fetch employee details
Uses a shared cursor to retrieve employee records
Demonstrates execution of functions

## Table Structure

```sql
CREATE TABLE employee_data(
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    gender VARCHAR(10),
    salary NUMERIC(10,2)
);
```

---

## Sample Data

```sql
INSERT INTO employees (emp_name, salary, dept_id) VALUES
('Aman', 50000, 10),
('Riya', 60000, 20),
('Raj', 55000, 10),
('Neha', 70000, 30);
```

---

## Implementation

### Description

Package Creation (Schema in PostgreSQL)

### Program

```sql
CREATE SCHEMA IF NOT EXISTS emp_package;
```

```sql
Function 1: Get All Employees (Shared Cursor)
CREATE OR REPLACE FUNCTION emp_package.get_all_employees()
RETURNS refcursor AS $$
DECLARE
    emp_cursor refcursor := 'emp_cur';
BEGIN
    OPEN emp_cursor FOR
        SELECT * FROM employees;

    RETURN emp_cursor;
END;
$$ LANGUAGE plpgsql;
```

```sql 
Function 2: Get Employees by Department
CREATE OR REPLACE FUNCTION emp_package.get_employee_by_dept(p_dept INT)
RETURNS refcursor AS $$
DECLARE
    emp_cursor refcursor := 'dept_cur';
BEGIN
    OPEN emp_cursor FOR
        SELECT * FROM employees
        WHERE dept_id = p_dept;

    RETURN emp_cursor;
END;
$$ LANGUAGE plpgsql;
```
### Execution

```sql
Get All Employees
BEGIN;

SELECT emp_package.get_all_employees();

FETCH ALL IN "emp_cur";

COMMIT;
```
```sql
Get Employees by Department
BEGIN;

SELECT emp_package.get_employee_by_dept(10);

FETCH ALL IN "dept_cur";

COMMIT;
```

## Learning Outcomes
1. Understand the concept of packages and their equivalent in PostgreSQL
2. Differentiate between schema and package
3. Implement functions with shared cursors
4. Execute cursor-based data retrieval using FETCH
5. Develop modular and reusable database logic used in organizations like Oracle Corporation and SAP.

## Conclusion

The experiment successfully demonstrated the implementation of a package-like structure in PostgreSQL using schema and functions. By using shared cursors and modular logic, efficient and reusable database operations were achieved. This approach aligns with real-world enterprise practices, improving maintainability and scalability of database systems.
