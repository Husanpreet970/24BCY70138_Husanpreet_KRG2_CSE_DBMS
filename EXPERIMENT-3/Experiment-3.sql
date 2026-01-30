DECLARE
    emp_id     NUMBER := 101;
    emp_name   VARCHAR2(50) := 'John Smith';
    emp_salary NUMBER := 45000;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Employee ID     : ' || emp_id);
    DBMS_OUTPUT.PUT_LINE('Employee Name   : ' || emp_name);
    DBMS_OUTPUT.PUT_LINE('Employee Salary : ' || emp_salary);
END;
