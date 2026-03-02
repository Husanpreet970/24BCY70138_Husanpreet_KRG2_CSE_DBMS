CREATE TABLE Employee_data(
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    salary NUMBER
);
----------------------------------------------------------

INSERT INTO Employee_data VALUES (101, 'John', 3000);
INSERT INTO Employee_data VALUES (102, 'Alice', 4000);
INSERT INTO Employee_data VALUES (103, 'Bob', 3500);
INSERT INTO Employee_data VALUES (104, 'Emma', 4500);
COMMIT;
----------------------------------------------------------

BEGIN
    UPDATE Employee_data
    SET salary = salary + 1000
    WHERE emp_id = 101;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Rows Updated: ' || SQL%ROWCOUNT);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No rows updated');
    END IF;
END;
------------------------------------------------------------------

DECLARE
    CURSOR emp_cursor IS
        SELECT emp_id, emp_name, salary FROM Employee_data;
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
------------------------------------------------------------------------------

DECLARE
    CURSOR emp_cursor IS
        SELECT emp_id FROM Employee_data;

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
