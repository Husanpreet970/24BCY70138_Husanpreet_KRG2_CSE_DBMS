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
CREATE TABLE Students1 (
    id NUMERIC PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(30),
    marks NUMERIC(10,0)
);

```

---

## Step 1.1: Insert Sample Data

```sql
INSERT INTO Students1 VALUES (1, 'Aman', 'Mohali', 85);
INSERT INTO Students1 VALUES (2, 'Rohit', 'Mohali', 78);
INSERT INTO Students1 VALUES (3, 'Neha', 'Mohali', 92);
INSERT INTO Students1 VALUES (4, 'Simran', 'Amritsar', 88);
INSERT INTO Students1 VALUES (6, 'Karan', 'Amritsar', 75);
SELECT * FROM Students1;

```
## Step 2: Filtering Data

```sql
SELECT city,count(*) as count_of_students
from Students1
group by city;

```

```sql
SELECT city,count(id) as count_of_students
from Students1
group by city;

```
```sql
SELECT city,COUNT(ID) as count_of_students
FROM Students1
GROUP BY city
HAVING COUNT(ID)>=3;


```
---

## Step 3: Sorting Data

```sql
SELECT city, COUNT(*) as count_of_students 
FROM Students1
GROUP BY city
ORDER BY COUNT(*) ASC;
```

---

## Step 4: Grouping and Aggregation

```sql
SELECT city,AVG(MARKS)::NUMERIC(10,2) as average_marks
FROM Students1
Group BY city;

```

```sql
SELECT city, SUM(marks) FROM Students1 GROUP BY city;
```
```sql
SELECT city, MAX(marks) FROM Students1 GROUP BY city;
```
```sql
SELECT city, MIN(marks) FROM Students1 GROUP BY city;
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
