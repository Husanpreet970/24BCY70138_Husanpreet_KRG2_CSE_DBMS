# Experiment 04 – Conditional Control Statements in PL/SQL

---

## AIM

To design and implement PL/SQL programs utilizing conditional control statements such as **IF–ELSE, IF–ELSIF–ELSE, ELSIF ladder, and CASE constructs** in order to control the flow of execution based on logical conditions and to analyze decision-making capabilities in PL/SQL blocks.

---

## Software Requirements

* **Database Management System:** PostgreSQL
* **Database Administration Tool:** pgAdmin

---

## Objective

To implement control structures in PL/SQL such as:

* IF–ELSE
* IF–ELSIF–ELSE
* ELSIF Ladder
* CASE Statement

and understand how conditional logic controls the execution flow in PL/SQL programs.

---

## Problem Statement

Develop and execute PL/SQL programs that demonstrate the use of conditional control statements. The programs should evaluate given conditions using IF–ELSE, ELSIF, ELSIF ladder, and CASE statements and display appropriate results, thereby illustrating decision-making capabilities in PL/SQL blocks.

---

## Problem 1: IF–ELSE Statement

### Description

Write a PL/SQL program to check whether a given number is positive or non-positive using the IF–ELSE conditional control statement.

### Program

```sql
DECLARE
    num NUMBER := -5;
BEGIN
    IF num > 0 THEN
        DBMS_OUTPUT.PUT_LINE('The number is Positive');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The number is Non-Positive');
    END IF;
END;
```

---

## Problem 2: IF–ELSIF–ELSE Statement

### Description

Write a PL/SQL program to evaluate the grade of a student based on obtained marks using the IF–ELSIF–ELSE statement.

### Program

```sql
DECLARE
    marks NUMBER := 78;
BEGIN
    IF marks >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: A');
    ELSIF marks >= 75 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: B');
    ELSIF marks >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: C');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Grade: Fail');
    END IF;
END;
```

---

## Problem 3: ELSIF Ladder

### Description

Write a PL/SQL program to determine the performance status of a student based on marks using an ELSIF ladder.

### Program

```sql
DECLARE
    marks NUMBER := 82;
BEGIN
    IF marks >= 85 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Excellent');
    ELSIF marks >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Very Good');
    ELSIF marks >= 55 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Good');
    ELSIF marks >= 40 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Average');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Performance: Poor');
    END IF;
END;
```

---

## Problem 4: CASE Statement

### Description

Write a PL/SQL program to display the name of the day based on a given day number using the CASE statement.

### Program

```sql
DECLARE
    day_num NUMBER := 3;
    day_name VARCHAR2(20);
BEGIN
    CASE day_num
        WHEN 1 THEN day_name := 'Sunday';
        WHEN 2 THEN day_name := 'Monday';
        WHEN 3 THEN day_name := 'Tuesday';
        WHEN 4 THEN day_name := 'Wednesday';
        WHEN 5 THEN day_name := 'Thursday';
        WHEN 6 THEN day_name := 'Friday';
        WHEN 7 THEN day_name := 'Saturday';
        ELSE day_name := 'Invalid Day Number';
    END CASE;

    DBMS_OUTPUT.PUT_LINE('Day is: ' || day_name);
END;
```

---

## Learning Outcomes

1. Understood the use of conditional control statements in PL/SQL.
2. Learned how IF–ELSE and IF–ELSIF–ELSE statements control program flow.
3. Gained knowledge of using ELSIF ladders for multi-condition evaluation.
4. Learned to use CASE statements for simplified decision-making logic.
5. Improved understanding of procedural programming concepts in databases.

---

## Conclusion

This experiment successfully demonstrated the use of conditional control statements in PL/SQL. By implementing IF–ELSE, IF–ELSIF–ELSE, ELSIF ladder, and CASE statements, the programs illustrated how logical conditions can be used to control execution flow and support decision-making in database-driven applications.
