# Experiment 10 – Implementation of Trigger for Automatic Primary Key Generation
---

## AIM

To design and implement a trigger in PostgreSQL that automatically generates primary key values, ensuring unique identification of records and demonstrating automated database programming.

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

- To implement automatic primary key generation using triggers
- To eliminate manual key assignment errors
- To ensure data integrity in database systems
- To understand trigger execution in PostgreSQL
---

## Problem Statement

- In enterprise applications, manually assigning primary keys can result in:
Duplicate values
Data inconsistency
Human errors

To solve this, a trigger-based system is required that:
- Automatically generates unique primary keys
- Uses sequence-based logic
- Ensures reliable and consistent data insertion

This approach is widely used in organizations like Amazon, Flipkart, and Oracle Corporation.

---

## Experiment Steps

1. Create a table with a primary key column
2. Create a sequence to generate unique values
3. Write a trigger function using nextval()
4. Create a BEFORE INSERT trigger
5. Insert records without specifying the primary key
6. Verify automatic key generation
   
## Table Structure

```sql
CREATE TABLE employee (
    emp_id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);
```

---

## Implementation

### Create Sequence
### Program

```sql
CREATE SEQUENCE emp_seq START 1;
```

```sql
CREATE OR REPLACE FUNCTION emp_trigger_function()
RETURNS TRIGGER AS $$
BEGIN
    NEW.emp_id := nextval('emp_seq');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
```

```sql
CREATE TRIGGER emp_trigger
BEFORE INSERT ON employee
FOR EACH ROW
EXECUTE FUNCTION emp_trigger_function();
```

```sql
INSERT INTO employee (name, department) VALUES ('Aman', 'HR');
INSERT INTO employee (name, department) VALUES ('Riya', 'IT');
INSERT INTO employee (name, department) VALUES ('Raj', 'Finance');
```
### Execution
```sql 
SELECT * FROM employee;
```

## Learning Outcomes
1.Understand the concept of database triggers
2. Implement automatic primary key generation
3. Ensure data integrity without manual intervention
4. Learn sequence and trigger integration
5. Apply automation techniques used in companies like Oracle Corporation

## Conclusion

The experiment successfully demonstrated the use of triggers in PostgreSQL to automate primary key generation. By integrating sequences with triggers, unique identifiers were assigned automatically to each record. This method eliminates manual errors, ensures data integrity, and reflects real-world enterprise database practices.
