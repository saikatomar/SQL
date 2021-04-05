# Specifying Gender: 
SELECT 	
	emp_no,
    first_name,
    last_name, 
    CASE 
		WHEN gender = 'M' THEN 'Male'
        ELSE 'Female'
	END AS Gender
FROM 
	employees;

# Alternatively
SELECT 
	emp_no,
    first_name,
    last_name,
	CASE Gender
		WHEN 'M' THEN 'Male'
        ELSE 'Female'
	END AS Gender
FROM 
	Employees;
    
# Looking for manager and employees
SELECT
	e.emp_no,
    e.first_name,
    e.last_name,
    CASE 
		WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
	END AS is_manager
FROM 
	employees e
		LEFT JOIN
	dept_manager dm ON dm.emp_no = e.emp_no
WHERE 
	e.emp_no > 109990;
    
# If conditions:
SELECT 
	emp_no,
    first_name,
    last_name,
	IF(gender = 'M', 'Male', 'Female') AS Gender
FROM
	employees e;
    
# Multiple CASE statements: Salary increase among managers
SELECT 
	dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS Salary_Difference,
    CASE
		WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raise by more than $30,000'
        WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 30000 THEN 'Salary was raise by more then $20,000 but less than $30,000'
        ELSE 'Salary was raise by less than $20,000'
	END AS Salary_Increase
From
	dept_manager dm
		JOIN
	employees e ON dm.emp_no = e.emp_no
		JOIN
	salaries s ON dm.emp_no = s.emp_no
GROUP BY s.emp_no;

# Exercise 01: obtain a result set containing the employee number, first name, and 
# last name of all employees with a number higher than 109990. Create a fourth column 
# in the query, indicating whether this employee is also a manager, according to the data provided 
# in the dept_manager table, or a regular employee. 

SELECT 
	e.emp_no,
    e.first_name,
    e.last_name,
    CASE 
		WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
	END AS Is_Manager
FROM 
	employees e
		LEFT JOIN
	dept_manager dm ON e.emp_no = dm.emp_no 
WHERE 
	e.emp_no > 10990;
    

