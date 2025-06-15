-- 1. Retrieve employee names and their department names using INNER JOIN
SELECT e.employee_id, e.first_name, d.department_name
FROM hr.employees e INNER JOIN hr.departments d 
ON e.department_id = d.department_id;

-- 2. Retrieve all employees and their respective department names (including those without a department) using LEFT JOIN
SELECT e.employee_id, e.first_name, d.department_name
FROM hr.employees e
LEFT JOIN hr.departments d 
ON e.department_id = d.department_id;


-- 3. Retrieve all departments and employees (including departments without employees) using RIGHT JOIN
SELECT e.employee_id, e.first_name, d.department_name
FROM hr.employees e RIGHT JOIN hr.departments d 
ON e.department_id = d.department_id;

-- 4. Retrieve all employees and their department names using FULL OUTER JOIN
select e.employee_id,e.first_name,d.department_name
from hr.employees e full outer join hr.departments d
on e.department_id=d.department_id;

-- 5. Retrieve employees who do not belong to any department using LEFT JOIN with NULL check
select e.employee_id,e.first_name
from hr.employees e left join hr.departments d
on e.department_id=d.department_id
and d.DEPARTMENT_ID is null;

-- 6. Retrieve departments that have no employees using RIGHT JOIN with NULL check
select d.department_name,d.department_id
from hr.employees e right join hr.DEPARTMENTS d
on e.department_id=d.department_id
where e.employee_id is null;

-- 7. Retrieve employees along with their manager names using SELF JOIN
--****DOUBT******
select e.employee_id,d.manager_id 
from hr.employees e self join hr.employees d 
on e.employee_id=d.employee_id;

-- 8. Retrieve employees along with their job title using INNER JOIN  
select e.employee_id,e.first_name,d.job_title
from hr.employees e inner join hr.jobs d
on e.job_id=d.job_id;

-- 9. Retrieve employees along with the location of their department using INNER JOIN

select e.employee_id,e.first_name,d.location_id,l.city
from hr.employees e inner join hr.departments d 
on e.department_id=d.department_id
inner join hr.locations l
on d.location_id=l.location_id;

-- 10. Retrieve employees and the projects they are assigned to using INNER JOIN
--****DOUBT****
select e.employee_id,e.first_name,p.project_name
from hr.employees e inner join projects p
on e.employee_id=p.employee_id;

-- 11. Retrieve employees who have not been assigned to any project using LEFT JOIN
--*doubt*project table not found
select e.employee_id.e.first_name
from hr.employees e left join projects p 
on  e.employee_id=p.employee_id
and p.project_id is null;

-- 12. Retrieve project names along with the department handling them using INNER JOIN

select p.project_name,d.department_name
from project p inner join hr.departments d
on p.department_id=d.department_id;   

-- 13. Retrieve employees along with the names of their training programs using INNER JOIN
*doubt*
SELECT e.employee_id, e.employee_name, t.training_name
FROM employees e INNER JOIN training_programs t
 ON e.training_id = t.training_id;


-- 14. Retrieve employees who have not attended any training programs using LEFT JOIN
SELECT e.employee_id, e.employee_name
FROM employees e LEFT JOIN training_programs t 
ON e.training_id = t.training_id
WHERE t.training_id IS NULL; 

-- 15. Retrieve employee names and their assigned shifts using INNER JOIN
SELECT e.employee_id, e.employee_name, s.shift_timing
FROM employees e INNER JOIN shifts s 
ON e.shift_id = s.shift_id;

-- 16. Retrieve employees who do not have an assigned shift using LEFT JOIN
SELECT e.employee_id, e.employee_name
FROM employees e  LEFT JOIN shifts s 
ON e.shift_id = s.shift_id
WHERE s.shift_id IS NULL;

-- 17. Retrieve employees, their department names, and their assigned project names using multiple INNER JOINs
SELECT e.employee_id, e.employee_name, d.department_name, p.project_name
FROM employees e INNER JOIN departments d 
ON e.department_id = d.department_id
INNER JOIN projects p 
ON e.employee_id = p.employee_id;  

-- 18. Retrieve employees who have worked on more than one project using INNER JOIN and GROUP BY
SELECT e.employee_id, e.employee_name, COUNT(p.project_id) AS project_count
FROM employees e INNER JOIN projects p 
ON e.employee_id = p.employee_id
GROUP BY e.employee_id, e.employee_name
HAVING COUNT(p.project_id) > 1;

-- 19. Retrieve employees along with their salaries and their department budget using INNER JOIN
SELECT e.employee_id, e.employee_name, e.salary, d.budget
FROM employees e INNER JOIN departments d 
ON e.department_id = d.department_id;

-- 20. Retrieve employees who earn more than their department’s average salary using INNER JOIN and a subquery
SELECT e.employee_id, e.employee_name, e.salary
FROM employees e INNER JOIN departments d 
ON e.department_id = d.department_id
WHERE e.salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id);

-- 22. Retrieve employees and their department names, but show "Not Assigned" if an employee has no department using LEFT JOIN and COALESCE
SELECT e.employee_id, e.employee_name, COALESCE(d.department_name, 'Not Assigned') AS department_name
FROM employees e LEFT JOIN departments d 
ON e.department_id = d.department_id;

-- 23. Retrieve employees and their assigned projects, including employees who are not assigned to any project using FULL OUTER JOIN
SELECT e.employee_id, e.employee_name, p.project_name
FROM employees e FULL OUTER JOIN projects p 
ON e.employee_id = p.employee_id;

-- 24. Retrieve employees who work in a city where their department is located using INNER JOIN
SELECT e.employee_id, e.employee_name, l.city
FROM employees e INNER JOIN departments d
 ON e.department_id = d.department_id
INNER JOIN locations l 
ON d.location_id = l.location_id;

-- 25. Retrieve employees and their total bonus amount using INNER JOIN with a bonus table
SELECT e.employee_id, e.employee_name, SUM(b.bonus_amount) AS total_bonus
FROM employees e INNER JOIN bonuses b 
ON e.employee_id = b.employee_id
GROUP BY e.employee_id, e.employee_name;

-- 26. Retrieve employees who do not have any recorded bonuses using LEFT JOIN
SELECT e.employee_id, e.employee_name
FROM employees e LEFT JOIN bonuses b 
ON e.employee_id = b.employee_id
WHERE b.bonus_amount IS NULL;

-- 27. Retrieve employees and their department names where employees belong to a specific region using INNER JOIN
SELECT e.employee_id, e.employee_name, d.department_name, r.region_name
FROM employees e
INNER JOIN departments d 
ON e.department_id = d.department_id
INNER JOIN locations l 
ON d.location_id = l.location_id
INNER JOIN regions r 
ON l.region_id = r.region_id;

-- 28. Retrieve employees and their project details, even if they are not assigned to a project using LEFT JOIN
SELECT e.employee_id, e.employee_name, p.project_name
FROM employees e
LEFT JOIN projects p 
ON e.employee_id = p.employee_id;

-- 29. Retrieve departments and the count of employees in each department using INNER JOIN and GROUP BY
SELECT d.department_id, d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e 
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

-- 30. Retrieve employees who work on projects located in a different city than their department using INNER JOIN
SELECT e.employee_id, e.employee_name, d.department_name, p.project_name, l.city AS project_city
FROM employees e
INNER JOIN projects p ON e.employee_id = p.employee_id
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN locations l ON p.location_id = l.location_id
WHERE d.location_id <> p.location_id;

