# Experiment 03 – Basic PL/SQL Block

---

## Student Information

* **Name:** Husanpreet Kaur
* **UID:** 24BCY70138
* **Branch:** AIT–CSE (Cyber Security)
* **Section:** 24AIT-KRG2
* **Semester:** 4
* **Subject:** Database Management System
* **Date of Performance:** 28/01/2026

---

## Experiment Title

**Design and Implementation of a Basic PL/SQL Program Using Declaration and Execution Blocks**

---

## Aim

To design and implement a simple PL/SQL program that demonstrates the basic structure of a PL/SQL block, including the declaration section for defining variables and the execution section for performing operations and displaying output.

---

## Software Requirements

* Oracle Database Express Edition
* SQL*Plus / Oracle SQL Developer

---

## Objectives

* To understand the structure of a PL/SQL block
* To declare and initialize variables in PL/SQL
* To perform operations in the execution section
* To display output using DBMS_OUTPUT.PUT_LINE

---

## Theory

A PL/SQL block is a fundamental unit of PL/SQL programming. It consists of three main sections:

1. **DECLARE Section** – Used to declare variables, constants, and cursors.
2. **BEGIN Section** – Contains executable statements.
3. **END Section** – Marks the end of the PL/SQL block.

The DBMS_OUTPUT.PUT_LINE procedure is used to display output from a PL/SQL program.

---

## Program Description

The following PL/SQL program declares variables to store employee details such as Employee ID, Employee Name, and Employee Salary. The values of these variables are displayed using output statements.

---

## PL/SQL Program

```sql
DECLARE
    -- Declaration Section
    emp_id     NUMBER := 101;
    emp_name   VARCHAR2(50) := 'John Smith';
    emp_salary NUMBER := 45000;
BEGIN
    -- Execution Section
    DBMS_OUTPUT.PUT_LINE('Employee ID     : ' || emp_id);
    DBMS_OUTPUT.PUT_LINE('Employee Name   : ' || emp_name);
    DBMS_OUTPUT.PUT_LINE('Employee Salary : ' || emp_salary);
END;
```

---

## Output

```
Employee ID     : 101
Employee Name   : John Smith
Employee Salary : 45000
```

---

## Learning Outcomes

* Understood the basic structure of a PL/SQL block
* Learned how to declare and initialize variables in PL/SQL
* Gained practical experience using DBMS_OUTPUT.PUT_LINE for displaying output
* Improved understanding of procedural programming in databases

---

## Conclusion

This experiment successfully demonstrated the structure and working of a basic PL/SQL block. By using the DECLARE and BEGIN–END sections, variables were defined and processed efficiently, and the output was displayed using DBMS_OUTPUT.PUT_LINE. This experiment forms the foundation for understanding advanced PL/SQL concepts such as control structures, procedures, and functions.
