# Experiment 08 – Design and Implementation of Procedures and Functions

---

## AIM

To design and implement PL/pgSQL procedures and functions and to analyze their usage for performing database operations efficiently.
---

## Software Requirements

- Database Management System: PostgreSQL
- Database Administration Tool: pgAdmin / psql

---

## Objective

- Create tables and insert data
- Implement stored procedures
- Use IN, OUT, and INOUT parameters
- Create scalar functions
- Create table-returning functions
- Execute and analyze outputs

---

## Problem Statement

In database systems, reusable and efficient logic is required to handle data operations. Procedures and functions help in modular programming, reduce redundancy, and improve performance and maintainability.

---

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

## Problem 2: Scalar Function

### Description

Create a function to calculate bonus (10% of salary).

### Program

```sql
CREATE OR REPLACE FUNCTION get_bonus(p_emp_id INT)
RETURNS NUMERIC AS $$
BEGIN
    RETURN (
        SELECT salary * 0.10
        FROM employees
        WHERE emp_id = p_emp_id
    );
END;
$$ LANGUAGE plpgsql;
```

```sql
SELECT get_bonus(1);
---
```

## Problem 3: Table Returning Function

### Description

Create a function to return employee details.

### Program

```sql
CREATE OR REPLACE FUNCTION get_employees()
RETURNS TABLE(
    id INT,
    name VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY
    SELECT emp_id, emp_name FROM employees;
END;
$$ LANGUAGE plpgsql;
```

```sql
DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT * FROM get_employees()
    LOOP
        RAISE NOTICE 'id: %, name: %', rec.id, rec.name;
    END LOOP;
END;
$$;
---
```

## Performance Analysis

### Procedure

```sql
CALL COUNT_EMP(...);
```

### Function

```sql
SELECT get_bonus(1);
SELECT * FROM get_employees();
```
---

## Learning Outcomes

1. Understood procedures and parameter modes (IN, OUT, INOUT)
2. Learned how to create and execute functions
3. Implemented scalar and table-returning functions
4. Gained knowledge of PL/pgSQL procedural programming
5. Applied concepts useful in real-world database applications
---

## Conclusion

This experiment demonstrated the implementation of procedures and functions in PostgreSQL. Procedures are useful for performing operations with multiple outputs, while functions are efficient for returning computed values and datasets, improving modularity and performance in database systems.
