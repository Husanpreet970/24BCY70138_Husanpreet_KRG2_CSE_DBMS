CREATE TABLE emp_table (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    dept_id NUMBER,
    salary NUMBER
);

CREATE TABLE department (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50)
);

INSERT INTO department VALUES (1, 'HR');
INSERT INTO department VALUES (2, 'IT');

INSERT INTO emp_table VALUES (101, 'John', 1, 3000);
INSERT INTO emp_table VALUES (102, 'Alice', 2, 5000);
INSERT INTO emp_table VALUES (103, 'Bob', 2, 4000);
INSERT INTO emp_table VALUES (104, 'Emma', 1, 3500);

COMMIT;

CREATE VIEW emp_view AS
SELECT emp_id, emp_name, salary
FROM emp_table;

CREATE VIEW emp_dept_view AS
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM emp_table e
JOIN department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

CREATE MATERIALIZED VIEW emp_mv
BUILD IMMEDIATE
REFRESH COMPLETE
AS
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM emp_table e
JOIN department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

EXEC DBMS_MVIEW.REFRESH('EMP_MV');

SELECT * FROM emp_view;

SELECT * FROM emp_dept_view;

SELECT * FROM emp_mv;
