
# Experiment 01.1 – DDL, DML and DCL Operations in SQL

---

## Student Information

- **Name:** Husanpreet Kaur  
- **UID:** 24BCY70138 
- **Branch:** AIT-CSE(Cyber Security) 
- **Section:** 24AIT-KRG2
- **Semester:** 4 
- **Subject:** DataBase Management System 
- **Date of Performance:** 13/01/2026  

---

## Experiment Title

**Design and Implementation of a Sample Database System using DDL, DML, and DCL Commands**

---

## Aim

To design and implement a sample database system using Data Definition Language (DDL), Data Manipulation Language (DML), and Data Control Language (DCL) commands, including database creation, data manipulation, schema modification, and role-based access control to ensure data integrity and secure, read-only access for authorized users.

---

## Software Requirements

- Oracle Database Express Edition  
- PostgreSQL  
- pgAdmin  

---

## Objectives

- To gain practical experience with DDL, DML, and DCL commands  
- To design relational tables with constraints  
- To implement secure role-based access control  
- To understand schema modification techniques  
- To maintain referential integrity in databases  

---

# Database Design

The database is designed to manage **Books, Library_Visitor, and Book_Issue** within an organization.

### Tables:
- Books
- Library_Visitor
- Book_Issue 

### Constraints Used:
- PRIMARY KEY  
- FOREIGN KEY  
- NOT NULL  
- UNIQUE  
- CHECK  

---

# Step 1: Table Creation (DDL)

### Books Table

```sql
CREATE TABLE books (
    id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    author_name VARCHAR(30) NOT NULL
);

```

---

### Library_Visitor Table

```sql
CREATE TABLE library_visitor(
USER_ID INT PRIMARY KEY,
USER_NAME VARCHAR(20),
AGE INT CHECK(AGE>=17) NOT NULL,
EMAIL_ID VARCHAR(20) UNIQUE NOT NULL
);

```

---

### Book_Issue Table

```sql
CREATE TABLE book_issue(
BOOK_ISSUE_ID INT PRIMARY KEY,
BOOK_ID INT REFERENCES books(ID),
USER_ID INT REFERENCES library_visitor(USER_ID) NOT NULL,
BOOK_ISSUE DATE NOT NULL
);

```

---


# Step 2: Data Manipulation (DML)

### Insert Records

#### Books

```sql
INSERT INTO books (id, name, author_name)
VALUES (140, ‘The Tiger King’, ‘J.K. Rowling’);
VALUES(130,’mowgli’,’clearstone’);
VALUES(120,’panchtantra’,’J.K.Rowling’);
VALUES(110,’STEVE ROLLS’,’ROLL CLANS’);
SELECT * FROM books;

```


#### Library_Visitor

```sql
INSERT INTO library_visitor(USER_ID,USER_NAME,AGE,EMAIL_ID) VALUES(101,'aly',19,'abcd@gmail.com');
INSERT INTO library_visitor(USER_ID,USER_NAME,AGE,EMAIL_ID) VALUES(102,'aman',21,'efgh@gmail.com');

```

---

#### Book_Issue

```sql
INSERT INTO book_issue VALUES(555,140,101,'05-01-2026'); 
```



# Step 3: UPDATE Operations


```sql
UPDATE books
SET COUNT=3 WHERE ID=120;

---

```sql
UPDATE library_visitor
SET USER_NAME='vikas'
WHERE USER_ID=102;

```sql
UPDATE library_visitor
SET EMAIL_ID='AK@GMAIL.COM'
WHERE USER_ID=101;

---sql
UPDATE library_visitor
SET EMAIL_ID='BF@GMAIL.COM'
WHERE USER_ID=102;

---
```

#Step 4: Access Control & Security (DCL)

### Create Role

```sql
CREATE ROLE librarian
WITH LOGIN PASSWORD 'Husan_123';

```

---

### Grant SELECT Privileges

```sql
GRANT SELECT, INSERT, DELETE, UPDATE ON books TO librarian;
GRANT SELECT, INSERT, DELETE, UPDATE ON book_issue TO librarian;
GRANT SELECT, INSERT, DELETE, UPDATE ON library_visitor 
```

---

### Revoke CREATE Privilege

```sql

REVOKE SELECT, INSERT, DELETE, UPDATE ON library_visitor FROM librarian;
```

---


# Step 5: Schema Modification

```sql
ALTER TABLE books
ADD COUNT INT CHECK(COUNT>=1);

```

```sql
ALTER TABLE library_visitor
ALTER COLUMN EMAIL_ID TYPE VARCHAR(50);
```

```sql
ALTER TABLE library_visitor
DROP COLUMN EMAIL_ID;
```

```sql
ALTER TABLE library_visitor
ADD COLUMN EMAIL_ID VARCHAR(30) UNIQUE;
```
---

# Learning Outcomes

- Understood the basics of relational database design using tables, keys, and relationships.  
- Learned to apply primary and foreign key constraints to maintain data integrity.  
- Gained hands-on experience with INSERT, UPDATE, and DELETE operations.  
- Understood role-based access control using GRANT and REVOKE.  
- Learned how to create read-only users for secure data access.  
- Practiced ALTER TABLE and DROP TABLE commands for schema management.  

---

## Conclusion

This experiment provided practical exposure to core SQL concepts including DDL, DML, and DCL commands. It strengthened understanding of database security, referential integrity, and schema management, which are essential for real-world enterprise database systems.
