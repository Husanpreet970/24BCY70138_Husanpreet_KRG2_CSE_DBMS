# Experiment 05 – SQL Conditional Logic (Odd & Even Values)

---

## AIM

To understand and apply conditional logic in SQL using the MOD (%) operator to classify employee salaries as odd or even.

---

## Software Requirements

- Database Management System: PostgreSQL  
- Database Administration Tool: pgAdmin  

---

## Objective

To write and execute SQL queries that:

- Use the MOD (%) operator  
- Identify whether salary values are odd or even  
- Display employee details based on salary classification  

---

## Problem Statement

Develop and execute SQL queries that utilize conditional logic to analyze employee salary data. The queries should determine whether salaries are odd or even using the MOD operator and display appropriate results.

---

## Table Structure

```sql
EMPLOYEE(
    emp_id NUMBER,
    emp_name VARCHAR2(50),
    salary NUMBER
);
```
---

## Problem 1: Display Salary Type (Odd/Even)

### Description

Write an SQL query to display employee details along with salary classification as odd or even.

### Program

```sql
SELECT emp_id, emp_name, salary,
       CASE 
           WHEN MOD(salary, 2) = 0 THEN 'Even Salary'
           ELSE 'Odd Salary'
       END AS salary_type
FROM employee;
```
---

## Problem 2: Display Employees with Even Salaries

### Description

Write an SQL query to display employees whose salaries are even.

### Program

```sql
SELECT * 
FROM employee
WHERE MOD(salary, 2) = 0;
```
---

## Problem 3: Display Employees with Odd Salaries

### Description

Write an SQL query to display employees whose salaries are odd.

### Program

```sql
SELECT * 
FROM employee
WHERE MOD(salary, 2) <> 0;
```
---
## Problem 4: Count Odd and Even Salaries

### Description

Write an SQL query to count employees based on salary type.

### Program

```sql
SELECT 
    CASE 
        WHEN MOD(salary, 2) = 0 THEN 'Even'
        ELSE 'Odd'
    END AS salary_type,
    COUNT(*) AS total_employees
FROM employee
GROUP BY 
    CASE 
        WHEN MOD(salary, 2) = 0 THEN 'Even'
        ELSE 'Odd'
    END;
```
---


## Learning Outcomes

1.Learned how to use the MOD (%) operator in SQL

2.Understood classification of data into odd and even values

3.Gained knowledge of CASE statements in SQL

4.Improved data filtering and grouping techniques

5.Enhanced SQL query writing skills

---

## Conclusion

This experiment demonstrated how conditional logic can be implemented in SQL using the MOD operator. It helped in classifying and analyzing employee salary data effectively, improving decision-making and data handling skills.
