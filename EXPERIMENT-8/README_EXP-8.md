# Experiment 08 – Design of a Parameterized PL/SQL Stored Procedure for Employee Count by Gender (CData, Toddle)

---

## AIM

To design and implement a stored procedure that accepts gender as an input parameter and returns the total number of employees based on the given gender, thereby demonstrating procedural programming and parameterized logic in PL/SQL.

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

To write and execute a PL/SQL stored procedure that dynamically accepts gender as an argument and computes the employee count corresponding to the given gender.

---

## Problem Statement

In database systems, reusable and efficient logic is required to handle data operations. Procedures and functions help in modular programming, reduce redundancy, and improve performance and maintainability.

---

## Experiment Steps

Design a stored procedure that:
- Accepts gender as an input parameter
- Counts the total number of employees matching the given gender
- Returns the count as an output parameter

## Table Structure

```sql
CREATE TABLE employee_data(
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    gender VARCHAR(10),
    salary NUMERIC(10,2)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    salary NUMERIC(10,2) NOT NULL,
    department VARCHAR(50)
);
```

---

## Sample Data

```sql
INSERT INTO employee_data(emp_name, gender, salary) VALUES
('Amit','Male',30000),
('Riya','Female',35000),
('John','Male',28000),
('Sneha','Female',40000);

INSERT INTO employees (emp_id, emp_name, salary, department) VALUES
(1,'Alice', 50000, 'HR'),
(2,'Bob', 60000, 'IT'),
(3,'Charlie', 55000, 'Finance');
```

---

## Problem 1: Procedure Implementation

### Description

Create a procedure to count the number of employees based on gender.

### Program

```sql
CREATE OR REPLACE PROCEDURE count_emp(
    IN p_gen VARCHAR(20),
    OUT count_emp INT,
    INOUT status VARCHAR
) AS $$
BEGIN
    SELECT COUNT(*) INTO count_emp
    FROM employee_data
    WHERE gender = p_gen;

    status := 'SUCCESS';
END;
$$ LANGUAGE plpgsql;
```

```sql
DO $$
DECLARE
    GEN VARCHAR(20) := 'Male';
    COUNT_BY_GEN INT;
    STATUS VARCHAR(20) := 'Fail';
BEGIN
    CALL COUNT_EMP(GEN, COUNT_BY_GEN, STATUS);

    RAISE NOTICE 'YOUR GENDER IS % YOUR COUNT IS % AND STATUS IS %',
        GEN, COUNT_BY_GEN, STATUS;
END;
$$;
---
```
---

## Learning Outcomes

1. Understand the structure and components of a stored procedure
2. Implement IN and OUT parameters in PL/SQL procedures
3. Pass dynamic input values to stored procedures
4. Apply aggregate functions (like COUNT) within procedures
5. Develop reusable database logic for real-world business scenarios used in companies like CData and Toddle

## Conclusion

The experiment successfully demonstrated the design and implementation of a parameterized PL/SQL stored procedure to calculate employee count based on gender. By using IN and OUT parameters along with aggregate functions, dynamic and reusable database logic was achieved. This method improves efficiency in data retrieval and supports real-world organizational requirements such as workforce analysis and reporting.
