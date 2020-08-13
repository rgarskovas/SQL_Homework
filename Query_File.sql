
-- Question 1
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
from employees
inner join salaries on
employees.emp_no = salaries.emp_no;

-- Question 2
SELECT last_name,
first_name,
hire_date
FROM employees
WHERE hire_date IN
(
  SELECT hire_date
  FROM employees
  WHERE hire_date >= '01/01/1986' and hire_date < '01/01/1987'
);

-- Question 3
SELECT departments.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.first_name,
	employees.last_name
from departments
inner join dept_manager on
departments.dept_no = dept_manager.dept_no
inner join employees on
dept_manager.emp_no = employees.emp_no;

-- Question 4
SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	departments.dept_name
from employees
inner join dept_emp on
employees.emp_no = dept_emp.emp_no
inner join departments on
departments.dept_no = dept_emp.dept_no;

-- Question 5
SELECT employees.first_name,
	employees.last_name,
	employees.sex
from employees
WHERE first_name = 'Hercules' and left(last_name, 1) = 'B';

-- Question 6
SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	departments.dept_name
from employees
inner join dept_emp on
employees.emp_no = dept_emp.emp_no
inner join departments on
departments.dept_no = dept_emp.dept_no
WHERE dept_name in
(
	SELECT dept_name
	FROM departments
	WHERE dept_name = 'Sales');

-- Question 7
SELECT employees.emp_no,
	employees.first_name,
	employees.last_name,
	departments.dept_name
from employees
inner join dept_emp on
employees.emp_no = dept_emp.emp_no
inner join departments on
departments.dept_no = dept_emp.dept_no
WHERE dept_name in
(
	SELECT dept_name
	FROM departments
	WHERE dept_name IN ('Sales', 'Development'));
	
-- Question 8
SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;

-- Bonus question 2
SELECT employees.emp_no,
	salaries.salary,
	titles.title
from employees
inner join salaries on
employees.emp_no = salaries.emp_no
inner join titles on
titles.title_id = employees.emp_title;