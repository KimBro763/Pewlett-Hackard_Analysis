Employee_Database_challenge.sql
--DELIVERABLE 1:
--Retrieve columns from Employees table
SELECT e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
FROM employees as e
RIGHT OUTER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no

SELECT * FROM retirement_titles;

--Remove duplicates
SELECT DISTINCT ON (emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;

-- Number of employees retiring
SELECT COUNT(ut.title) as mycount,
ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY mycount DESC

SELECT * FROM retiring_titles


--DELIVERABLE 2: 



