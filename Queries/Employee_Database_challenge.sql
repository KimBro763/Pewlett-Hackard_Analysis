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
--current employees born in '65
SELECT DISTINCT ON(e.emp_no)
e.emp_no, 
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO  mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON(e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility;
-- Number of employees eligible
SELECT COUNT(me.emp_no) as mycount,
me.title
INTO eligibility_by_title
FROM mentorship_eligibility as me
GROUP BY me.title
ORDER BY mycount DESC

SELECT * FROM eligibility_by_title;

--extend eligibility requirements
SELECT DISTINCT ON(e.emp_no)
e.emp_no, 
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO extended_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON(e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (birth_date BETWEEN '1962-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

-- Number of employees eligible
SELECT COUNT(ee.emp_no) as mycount,
ee.title
INTO extended_eligibility_by_title
FROM extended_eligibility as ee
GROUP BY ee.title
ORDER BY mycount DESC

SELECT * FROM extended_eligibility_by_title;





