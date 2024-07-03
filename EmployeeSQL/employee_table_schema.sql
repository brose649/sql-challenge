-- Drop table if exists (1)
DROP TABLE departments;

-- Create table and view column datatypes
CREATE TABLE departments(
	dept_no CHAR(4) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);

SELECT * FROM departments;

-- Drop table if exists (2)
DROP TABLE titles;

-- Create table and view column datatypes
CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);

SELECT * FROM titles;

-- Drop table if exists (3)
DROP TABLE dept_emp;

-- Create table and view column datatypes
CREATE TABLE dept_emp(
	emp_no INT NOT NULL, 
	dept_no CHAR(4) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp;

-- Drop table if exists (4)
DROP TABLE employees;

-- Create table and view column datatypes
CREATE TABLE employees(
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex CHAR(1),
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

SELECT * FROM employees;

-- Drop table if exists (5)
DROP TABLE dept_manager;

-- Create table and view column datatypes
CREATE TABLE dept_manager(
	dept_no CHAR(4) NOT NULL, 
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM dept_manager;

-- Drop table if exists (6)
DROP TABLE salaries;

-- Create table and view column datatypes
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary FLOAT NOT NULL,		
	PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;

-- Show all tables
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';
