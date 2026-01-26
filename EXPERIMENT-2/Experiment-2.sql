CREATE TABLE employee1(
	emp_id NUMERIC PRIMARY KEY,
	emp_name VARCHAR(50),
	department VARCHAR(50),
	salary NUMERIC(10,2),
	joining_date DATE
);

INSERT INTO employee1 VALUES (101, 'Amit', 'IT', 19000, '2020-02-12');
INSERT INTO employee1 VALUES (102, 'Priya', 'HR', 22000, '2019-03-10');
INSERT INTO employee1 VALUES (103, 'Rahul', 'Sales', 35000, '2021-07-18');
INSERT INTO employee1 VALUES (104, 'Neha', 'IT', 55000, '2018-09-22');
INSERT INTO employee1 VALUES (105, 'Rohan', 'Finance', 32000, '2022-01-05');
INSERT INTO employee1 VALUES (106, 'Sara', 'Sales', 13000, '2020-12-03');
INSERT INTO employee1 VALUES (107, 'Vikram', 'HR', 12000, '2017-04-11');

SELECT * FROM employee1;

SELECT department, AVG(salary) AS avg_salary
FROM employee1
GROUP BY department;

SELECT department, AVG(salary) AS avg_salary
FROM employee1
WHERE salary > 20000
GROUP BY department;

SELECT department, AVG(salary) AS avg_salary
FROM employee1
GROUP BY department
HAVING AVG(salary) > 30000;

SELECT department, AVG(salary) AS avg_salary
FROM employee1
WHERE salary > 20000
GROUP BY department
HAVING AVG(salary) > 30000
ORDER BY avg_salary DESC;
