CREATE TABLE Employee2 (
    emp_id NUMERIC,
    emp_name VARCHAR(50),
    salary NUMERIC
);

INSERT INTO Employee2 VALUES (1,'Rahul',20000);
INSERT INTO Employee2 VALUES (2,'Amit',0);
INSERT INTO Employee2 VALUES (3,'Neha',25000);
INSERT INTO Employee2 VALUES (4,'Jay',56011);
INSERT INTO Employee2 VALUES (5,'Sushmita',24013);

SELECT * FROM Employee2;

SELECT emp_id, salary,
       CASE 
           WHEN MOD(salary, 2) = 0 THEN 'Even'
           ELSE 'Odd'
       END AS salary_type
FROM Employee2;
