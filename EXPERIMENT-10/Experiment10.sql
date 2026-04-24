DROP TABLE employee;

CREATE TABLE employee (
  emp_id INTEGER PRIMARY KEY,
  name VARCHAR(100),
  department VARCHAR(50)
);

CREATE SEQUENCE emp_seq START 1;

CREATE OR REPLACE FUNCTION emp_trigger_function()
RETURNS TRIGGER AS $$
BEGIN
  NEW.emp_id := nextval('emp_seq');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER emp_trigger
BEFORE INSERT ON employee
FOR EACH ROW
EXECUTE FUNCTION emp_trigger_function();

INSERT INTO employee (name, department) VALUES ('John', 'HR');
INSERT INTO employee (name, department) VALUES ('Alice', 'IT');

SELECT * FROM employee;
