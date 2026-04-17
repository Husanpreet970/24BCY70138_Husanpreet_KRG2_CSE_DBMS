DROP TABLE employees;

CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    salary NUMERIC,
    dept_id INT
);

INSERT INTO employees (emp_name, salary, dept_id) VALUES
('Aman', 50000, 10),
('Riya', 60000, 20),
('Raj', 55000, 10),
('Neha', 70000, 30);

CREATE SCHEMA IF NOT EXISTS emp_package;

CREATE OR REPLACE FUNCTION emp_package.get_all_employees()
RETURNS refcursor AS $$
DECLARE
    emp_cursor refcursor := 'emp_cur';  -- Named cursor
BEGIN
    OPEN emp_cursor FOR
        SELECT * FROM employees;

    RETURN emp_cursor;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION emp_package.get_employee_by_dept(p_dept_id INT)
RETURNS refcursor AS $$
DECLARE
    emp_cursor refcursor := 'dept_cur';  -- Named cursor
BEGIN
    OPEN emp_cursor FOR
        SELECT * FROM employees
        WHERE dept_id = p_dept_id;

    RETURN emp_cursor;
END;
$$ LANGUAGE plpgsql;

BEGIN;

SELECT emp_package.get_all_employees();

FETCH ALL IN "emp_cur";

COMMIT;

BEGIN;

SELECT emp_package.get_employee_by_dept(10);

FETCH ALL IN "dept_cur";

COMMIT;
