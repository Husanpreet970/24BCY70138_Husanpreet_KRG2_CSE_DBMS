# Experiment 06 – Understanding and Implementing Cursors for Row-by-Row Data Processing

---

## AIM

To understand the concept and working of cursors in PL/SQL for row-by-row data processing, and to analyze how implicit cursors, explicit cursors, and cursor attributes are used to implement business logic on multiple rows in a database table.

---

## Software Requirements

- Database Management System: Oracle Database Express Edition (Oracle XE)  
- Database Administration Tool: Oracle SQL Developer  

---

## Objective

To implement and analyze the use of:

- Implicit cursors  
- Explicit cursors  
- Cursor attributes  

for processing multiple rows from a database table and applying business logic effectively.

---

## Problem Statement

In real-world enterprise applications, database queries often return multiple rows that need to be processed individually to apply specific business rules.

---

## Practical / Experiment Steps

- Use implicit cursors for single-row DML operations  
- Use explicit cursors to fetch and process multiple records  
- Apply cursor attributes to control execution flow  

---

## Table Structure

```sql
CREATE TABLE employee (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    salary NUMBER
);
```

---

## Sample Data

```sql
INSERT INTO employee VALUES (101, 'John', 3000);
INSERT INTO employee VALUES (102, 'Alice', 4000);
INSERT INTO employee VALUES (103, 'Bob', 3500);
INSERT INTO employee VALUES (104, 'Emma', 4500);

COMMIT;
```

---

## Enable Output

```sql
SET SERVEROUTPUT ON;
```

---

## Problem 1: Implicit Cursor

### Description

Update employee salary and display number of rows affected using implicit cursor attributes.

### Program

```sql
BEGIN
    UPDATE employee
    SET salary = salary + 1000
    WHERE emp_id = 101;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Rows Updated: ' || SQL%ROWCOUNT);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No rows updated');
    END IF;
END;
```

---

## Problem 2: Explicit Cursor

### Description

Fetch and display employee records using an explicit cursor.

### Program

```sql
DECLARE
    CURSOR emp_cursor IS
        SELECT emp_id, emp_name, salary FROM employee;

    v_id employee.emp_id%TYPE;
    v_name employee.emp_name%TYPE;
    v_salary employee.salary%TYPE;
BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO v_id, v_name, v_salary;
        EXIT WHEN emp_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_id || ' ' || v_name || ' ' || v_salary);
    END LOOP;

    CLOSE emp_cursor;
END;
```

---

## Problem 3: Cursor Attributes

### Description

Demonstrate the use of cursor attributes such as %FOUND, %NOTFOUND, and %ROWCOUNT.

### Program

```sql
DECLARE
    CURSOR emp_cursor IS
        SELECT emp_id FROM employee;

    v_id employee.emp_id%TYPE;
BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO v_id;

        IF emp_cursor%FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_id);
        END IF;

        EXIT WHEN emp_cursor%NOTFOUND;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total Rows Fetched: ' || emp_cursor%ROWCOUNT);

    CLOSE emp_cursor;
END;
```

---

## Learning Outcomes

1. Understood the role of cursors in PL/SQL for handling multi-row query results  
2. Learned the difference between implicit and explicit cursors  
3. Used cursor attributes such as %FOUND, %NOTFOUND, %ROWCOUNT, and %ISOPEN  
4. Developed PL/SQL programs to process records row by row  
5. Applied cursor-based logic in practical database scenarios  

---

## Conclusion

This experiment demonstrated the use of implicit and explicit cursors in Oracle PL/SQL. It provided practical knowledge on processing multiple rows individually and applying business logic using cursor attributes, which is essential in real-world database applications.
