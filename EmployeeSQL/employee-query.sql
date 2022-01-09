{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- Query * FROM Each Table Confirming Data\
SELECT * FROM departments;\
SELECT * FROM titles;\
SELECT * FROM employees;\
SELECT * FROM dept_emp;\
SELECT * FROM dept_manager;\
SELECT * FROM salaries;\
\
\
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.\
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary\
FROM employees\
JOIN salaries\
ON employees.emp_no = salaries.emp_no;\
\
\
--2. List first name, last name, and hire date for employees who were hired in 1986.\
SELECT first_name, last_name, hire_date \
FROM employees\
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'\
ORDER BY hire_date;\
\
--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.\
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name\
FROM departments\
JOIN dept_manager\
ON departments.dept_no = dept_manager.dept_no\
JOIN employees\
ON dept_manager.emp_no = employees.emp_no;\
\
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.\
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name\
FROM dept_emp\
JOIN employees\
ON dept_emp.emp_no = employees.emp_no\
JOIN departments\
ON dept_emp.dept_no = departments.dept_no;\
\
--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."\
SELECT employees.first_name, employees.last_name, employees.sex\
FROM employees\
WHERE first_name = 'Hercules'\
AND last_name Like 'B%'\
\
--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.\
SELECT departments.dept_name, employees.last_name, employees.first_name\
FROM dept_emp\
JOIN employees\
ON dept_emp.emp_no = employees.emp_no\
JOIN departments\
ON dept_emp.dept_no = departments.dept_no\
WHERE departments.dept_name = 'Sales';\
\
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.\
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name\
FROM dept_emp\
JOIN employees\
ON dept_emp.emp_no = employees.emp_no\
JOIN departments\
ON dept_emp.dept_no = departments.dept_no\
WHERE departments.dept_name = 'Sales' \
OR departments.dept_name = 'Development';\
\
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.\
SELECT last_name,\
COUNT(last_name) AS "frequency"\
FROM employees\
GROUP BY last_name\
ORDER BY\
COUNT(last_name) DESC;}