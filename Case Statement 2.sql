# Exercise 2: Extract a dataset containing the following information about the managers: 
# employee number, first name, and last name. Add two columns at the end – one showing the 
# difference between the maximum and minimum salary of that employee, and another one saying 
# whether this salary raise was higher than $30,000 or NOT.

USE employees;
SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS Salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary has raised higher than $30,000'
        ELSE 'Salary has NOT raised higher than $30,000'
    END AS salary_raise
FROM
    dept_manager dm
        JOIN
    employees e ON e.emp_no = dm.emp_no
        JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY e.emp_no
ORDER BY e.emp_no;

# Another solution using IF:
SELECT 
	dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    IF (MAX(s.salary) - MIN(s.salary) > 30000,'Salary as raised higher than $30,000', 
		'Salary has NOT raised higher than $30,000') AS Salary_difference
FROM 
	dept_manager dm
		JOIN
	employees e ON e.emp_no = dm.emp_no
		JOIN
	salaries s ON s.emp_no = dm.emp_no
Group by e.emp_no;
    