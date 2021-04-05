-- find average salaries for men & women in the company.
SELECT 
    e.gender, AVG(s.salary) AS Average_Salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY gender;