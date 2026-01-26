# Experiment 02 – SQL Filtering, Grouping and Sorting

## Student Information
- Name: Husanpreet Kaur
- UID: 24BCY70138
- Branch: AIT-CSE(Cyber Security) 
- Section: 24AIT-KRG2  
- Semester: 4
- Subject: Database Management System
- Date of Performance: 16/01/2026  

---

## Aim
To design and implement a sample database system using SQL commands to perform filtering, sorting, grouping, and aggregation operations and to understand the difference between row-level and group-level filtering.

---

## Software Requirements
- PostgreSQL  
- pgAdmin  
- Oracle Database Express Edition (optional)

---

## Objectives
- Retrieve specific data using filtering conditions  
- Sort query results using single and multiple attributes  
- Perform aggregation using grouping techniques  
- Apply conditions on aggregated data  
- Understand real-world analytical SQL queries  

---

## Step 1: Table Creation

```sql
CREATE TABLE employee1(
	emp_id NUMERIC PRIMARY KEY,
	emp_name VARCHAR(50),
	department VARCHAR(50),
	salary NUMERIC(10,2),
	joining_date DATE
);

```

---

## Step 1.1: Insert Sample Data

```sql
INSERT INTO employee1 VALUES (101, 'Amit', 'IT', 19000, '2020-02-12');
INSERT INTO employee1 VALUES (102, 'Priya', 'HR', 22000, '2019-03-10');
INSERT INTO employee1 VALUES (103, 'Rahul', 'Sales', 35000, '2021-07-18');
INSERT INTO employee1 VALUES (104, 'Neha', 'IT', 55000, '2018-09-22');
INSERT INTO employee1 VALUES (105, 'Rohan', 'Finance', 32000, '2022-01-05');
INSERT INTO employee1 VALUES (106, 'Sara', 'Sales', 13000, '2020-12-03');
INSERT INTO employee1 VALUES (107, 'Vikram', 'HR', 12000, '2017-04-11');
SELECT * FROM employee1;

```
## Step 2: Filtering Data

```sql
SELECT department, AVG(salary) AS avg_salary
FROM employee1
GROUP BY department;

```

```sql
SELECT department, AVG(salary) AS avg_salary
FROM employee1
WHERE salary > 20000
GROUP BY department;

```
```sql
SELECT department, AVG(salary) AS avg_salary
FROM employee1
GROUP BY department
HAVING AVG(salary) > 30000;


```
---

## Step 3: Sorting Data

```sql
SELECT department, AVG(salary) AS avg_salary
FROM employee1
WHERE salary > 20000
GROUP BY department
HAVING AVG(salary) > 30000
ORDER BY avg_salary DESC;
```

---

## Learning Outcomes
- Ability to create relational database tables
- Understanding of row-level filtering using WHERE
- Understanding of group-level filtering using HAVING
- Application of aggregate functions
- Clear understanding of SQL execution order

---

## Conclusion
This experiment enhanced understanding of SQL analytical queries including filtering, sorting, grouping, and aggregation, which are essential for real-world database applications and interviews.
