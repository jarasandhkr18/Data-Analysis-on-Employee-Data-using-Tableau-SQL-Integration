-- Query 1: Breakdown of Male and Female Employees Working Each Year
SELECT 
    YEAR(hire_date) AS year, 
    gender, 
    COUNT(emp_no) AS total_employees 
FROM 
    t_employees
GROUP BY 
    year, gender
ORDER BY 
    year ASC;

-- Query 2: Number of Male and Female Managers by Department Each Year
SELECT 
    YEAR(d.from_date) AS year, 
    dn.dept_name AS department_name, 
    e.gender, 
    COUNT(e.emp_no) AS manager_count 
FROM 
    t_dept_manager d
JOIN 
    t_employees e ON d.emp_no = e.emp_no
JOIN 
    t_departments dn ON d.dept_no = dn.dept_no
GROUP BY 
    year, department_name, e.gender
ORDER BY 
    year ASC, department_name;

-- Query 3: Average Annual Employee Salary by Gender
SELECT 
    YEAR(e.hire_date) AS year, 
    e.gender, 
    AVG(s.salary) AS average_salary 
FROM 
    t_employees e
JOIN 
    t_salaries s ON e.emp_no = s.emp_no
GROUP BY 
    year, e.gender
ORDER BY 
    year ASC;

-- Query 4: Average Salary by Department and Gender (Filtered by Salary Range)
SELECT 
    d.dept_name AS department_name, 
    e.gender, 
    AVG(s.salary) AS average_salary 
FROM 
    t_dept_emp de
JOIN 
    t_employees e ON de.emp_no = e.emp_no
JOIN 
    t_salaries s ON de.emp_no = s.emp_no
JOIN 
    t_departments d ON de.dept_no = d.dept_no
WHERE 
    s.salary BETWEEN 30000 AND 80000 -- Replace with desired salary range
GROUP BY 
    department_name, e.gender
ORDER BY 
    department_name, e.gender;

-- Query 5: Average Male and Female Salaries Across All Departments
SELECT 
    dn.dept_name AS department_name, 
    e.gender, 
    AVG(s.salary) AS avg_salary
FROM 
    t_employees e
JOIN 
    t_dept_emp de ON e.emp_no = de.emp_no
JOIN 
    t_departments dn ON de.dept_no = dn.dept_no
JOIN 
    t_salaries s ON e.emp_no = s.emp_no
GROUP BY 
    department_name, e.gender
ORDER BY 
    department_name;
