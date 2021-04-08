USE employees;
DROP FUNCTION IF EXISTS f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL (10,2)
DETERMINISTIC 
BEGIN 

DECLARE v_avg_salary DECIMAL(10,2);

SELECT 
	AVG(s.salary) 
INTO v_avg_salary FROM
		employees e
			JOIN 
		salaries s ON e.emp_no = s.emp_no
WHERE 
		e.emp_no = p_emp_no;

RETURN v_avg_salary;
END$$

DELIMITER ; 

SELECT f_emp_avg_salary(11300);

# Exercise: Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, 
# and returns the salary from the newest contract of that employee.

USE employees;

DELIMITER $$
CREATE FUNCTION emp_info(p_first_name varchar(255), p_last_name varchar(255)) RETURNS DECIMAL (10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN 
DECLARE v_max_from_date DATE;
DECLARE v_salary DECIMAL(10,2);
DECLARE v_emp_no INTEGER;
	SELECT emp_no INTO v_emp_no FROM
			employees e 
		WHERE e.first_name = p_first_name 
			AND e.last_name = p_last_name;
	SELECT MAX(s.from_date) INTO v_max_from_date FROM
			employees e
				JOIN
			salaires s ON e.emp_no = s.emp_no
		WHERE e.emp_no = v_emp_no;
	SELECT salary INTO v_salary FROM
			salaries 
		WHERE emp_no = v_emp_no AND from_date = v_max_from_date;
        
RETURN v_salary;
END$$
DELIMITER ;
  
SELECT emp_info('Aruna','Journel');
