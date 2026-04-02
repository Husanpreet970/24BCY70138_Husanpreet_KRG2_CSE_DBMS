---PROCEDURE IMPLEMENTATION
create table employee_data(
emp_id serial primary key,
emp_name varchar(50),
gender varchar(10),
salary numeric(10,2)
);

insert into employee_data(emp_name,gender,salary) values
('Amit','Male',30000),
('Riya','Female',35000),
('John','Male',28000),
('Sneha','Female',40000)

--count number of employees based on gender

select * from employee_data

CREATE OR REPLACE PROCEDURE count_emp(
    IN p_gen VARCHAR(20),
    OUT count_emp INT,
    INOUT status VARCHAR
)
AS
$$
BEGIN
    SELECT COUNT(*) INTO count_emp 
    FROM employee_data 
    WHERE gender = p_gen;

    status := 'SUCCESS';
END;
$$ LANGUAGE plpgsql;


-- calling
    DO
$$
DECLARE
    GEN VARCHAR(20) := 'Male';
    COUNT_BY_GEN INT;
    STATUS VARCHAR(20) := 'Fail';
BEGIN

    CALL COUNT_EMP(GEN, COUNT_BY_GEN, STATUS);

    RAISE NOTICE 'YOUR GENDER IS % YOUR COUNT IS % AND STATUS IS %',
        GEN, COUNT_BY_GEN, STATUS;

END;
$$;

---FUNCTION IMPLEMENTATION
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id INT  PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    salary NUMERIC(10,2) NOT NULL,
    department VARCHAR(50)
);

-- 2. Insert sample data
INSERT INTO employees (emp_id,emp_name, salary, department) VALUES
(1,'Alice', 50000, 'HR'),
(2,'Bob', 60000, 'IT'),
(3,'Charlie', 55000, 'Finance');

CREATE OR REPLACE FUNCTION get_bonus(p_emp_id INT)
RETURNS NUMERIC
AS
$$
BEGIN
    RETURN (
        SELECT salary * 0.10 
        FROM employees 
        WHERE emp_id = p_emp_id
    );
END;
$$ LANGUAGE plpgsql;

DO
$$
DECLARE
    emp_id INT := 1;
    bonus NUMERIC(10,2);
BEGIN
    bonus := get_bonus(emp_id);

    RAISE NOTICE 'your emp_id is % and your bonus is %', emp_id, bonus;
END;
$$;

---
select * from get_bonus(1)

CREATE OR REPLACE FUNCTION get_employees()
RETURNS TABLE(
    id INT,
    name VARCHAR(100)
)
AS
$$
BEGIN
    RETURN QUERY
    SELECT emp_id, emp_name FROM employees;
END;
$$ LANGUAGE plpgsql;


--calling part
DO
$$ 
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT * FROM get_employees()
    LOOP
        RAISE NOTICE 'id: %, name: %', rec.id, rec.name;
    END LOOP;
END;
$$;

