# Connecting Dept Manager and Departmants table
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm,
    departments d
ORDER BY dm.emp_no , d.dept_no;

-- even without WHERE or ON, sql will know it is a CROSS JOIN
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

-- to show the depts where manager is not being involved 
SELECT 
    dm.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;

-- To show more information about the managers -> like name, joining date, etc.
SELECT 
    e.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
        JOIN
    employees e ON dm.emp_no = e.emp_no
WHERE
    d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;

# Use a CROSS JOIN to return a list with all possible combinations between managers 
# from the dept_manager table and department number 9.
SELECT 
    dm.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    d.dept_no = 'd009'
ORDER BY d.dept_name;

# Return a list with the first 10 employees with all the departments they can be assigned to.
SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no , d.dept_name;