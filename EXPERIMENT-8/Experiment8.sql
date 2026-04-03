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


