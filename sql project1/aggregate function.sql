--1.count the number of employee  in each department.
--this query groups employees by depatment_id and counts how many emp exist in each.
select department_id, count(*) as number_of_employees
from hr.EMPLOYEES
group by department_id;
--2.
--3.find the maximum and minimum salary in each department.
--after groupnig based on dept_id then easily find out max and min value 

select department_id,max(salary) as max_sal,min(salary) as min_sal
from hr.EMPLOYEES
group by department_id
order by department_id;

--4.find the total salary paid in each department.
--based on dept_id grouping then find 
select department_id,sum(salary) as total_salary
from hr.employees
group by department_id;

--5.count the number of employees in each job role.
--ater groupnig query count no of emp in each job_id
select job_id,count(*) as no_of_employee
from hr.employees
group by job_id;

--6.find the average salary for each job role.

select job_id,avg(salary)
from hr.employees
group by job_id;

--7.find the maximum salary for each job role.

select job_id,max(salary)
from hr.employees
group by job_id;

--8.find the minimum salary for each job role.

select job_id,min(salary)
from hr.employees
group by job_id;


--9.find the total salary paid for each job role. 

select job_id,sum(salary)
from hr.employees
group by job_id;

--10.count the number of employees hired in each year.

select extract(YEAR from HIRE_DATE) as year, count(*)
from hr.employees
group by year;

--11.find the total salary paid in each location.

select d.location_id,sum(e.salary) as total_salary
from hr.employees e 
join hr.departments d
on e.department_id=d.department_id
group by d.location_id; 




--12.find the number of employees in each manager's team.

select manager_id,count(*) as team_size
from hr.employees
where manager_id is not null
group by manager_id;


--13.find the highest salary for each manager.
select manager_id,max(salary)
from hr.EMPLOYEES
where manager_id is not NULL
group by manager_id; 


--14.find the average salary for each managers .
select manager_id,avg(salary)
from hr.employees
group by manager_id
having manager_id is not null;
--15.count the number of employees hired in each month of the year.

select extract(MONTH from the hire_date) as hire_month,count(*) as total_hired
from hr.employees
group by hire_month;
--16.find the department with the highest total salary
select department_id from hr.employees where salary=
  (select max(salary) from hr.employees);

--17.find the job role with the highest average salary.
select job_id from hr.employees where salary in
  (select avg(salary) from hr.employees);
--18.find the number of employees in each city.
select l.city,count(*) as total_employees
  from hr.employees e
  join hr.departments d on e.department_id=d.department_id
  join locations l on d.location_id=l.location_d
  group by l.city;
--19.a
--20.find the sum of salaries for employees who have a commission, grouped by department.
select department_id,sum(salary)
from hr.employees
where commission_pct is not null 
group by department_id;


-- # Oracle SQL Aggregation Questions for Sales History Table

--1.count the number of sales transactions for each product.
select prod_id,count(*) as transaction_count
from sh.SALES
group by prod_id;

--2.find the average sale amount for each product.
select prod_id,avg(amount_sold) as avg_sale_amount
from sh.SALES
group by prod_id; 

--3.find the maximum and minimum sale amount for each product.
select prod_id,max(amount_sold) as max_sale,min(amount_sold) as min_sale
from sh.SALES
group by prod_id;

--4.find the total revenue generated by each product.
select prod_id,sum(amount_sold) total_sale
from sh.SALES
group by prod_id;

---5.count the number of sales transactions for each customer.
select cust_id,count(*) no_of_sales
from sh.SALES
group by cust_id;

--6.find the average sale amount per customer.
select cust_id,avg(amount_sold)
from sh.sales 
group by cust_id;

--7.find the highest purchase amount for each customer.
select cust_id,max(amount_sold)
from sh.SALES
group by cust_id;

--8.find the lowest purchase amount for each customer.
select cust_id,min(amount_sold)
from sh.SALES
group by cust_id;

--9.find the total revenue generated by each store location.
--**doubt**
select store_location,sum(amount_sold) total_revenue
from sales
group by store_location; 

--10.count the number of sales transactions for each region.
select region,count(*)
from Sales
group by region;

--11.find the total revenue per region.
select region,sum(amount_sold)
from Sales
group by region;

--12.find the average sale amount per region.

select region,avg(amount_sold)
from Sales
group by region;

--13.count the number of sales per month
select to_char(sale_date,yyyy_mm) sale_month,
      count(*) as sales_count
   from
      sales
   group by 
         to_char(sale_date,'yyyy_mm')
  order by 
         sale_month;

--14.find the total revenue per month.
SELECT 
    TO_CHAR(sale_date, 'YYYY-MM') AS sale_month,
    SUM(sales_amount) AS total_revenue
FROM 
    sales
GROUP BY 
    TO_CHAR(sale_date, 'YYYY-MM')
ORDER BY 
    sale_month;

--15.find the product that generated the highest revenue.
SELECT 
    product_id,
    SUM(quantity_sold * unit_price) AS total_revenue
FROM 
    sales
GROUP BY 
    product_id
ORDER BY 
    total_revenue DESC
FETCH FIRST 1 ROWS ONLY;


16.find the most frequently purchased product.
SELECT 
    product_id,
    COUNT(*) AS purchase_count
FROM 
    sales
GROUP BY 
    product_id
ORDER BY 
    purchase_count DESC
FETCH FIRST 1 ROWS ONLY;

--17.find the most valuable customer based on total spending.
SELECT 
    customer_id,
    SUM(quantity_sold * unit_price) AS total_spent
FROM 
    sales
GROUP BY 
    customer_id
ORDER BY 
    total_spent DESC
FETCH FIRST 1 ROWS ONLY;

--18.find the total revenue per sales channel(e.g online vs offline).
SELECT 
    sales_channel,
    SUM(quantity_sold * unit_price) AS total_revenue
FROM 
    sales
GROUP BY 
    sales_channel
ORDER BY 
    total_revenue DESC;

--19.count the number of sales for each payment method  .
SELECT 
    payment_method,
    COUNT(*) AS sales_count
FROM 
    sales
GROUP BY 
    payment_method
ORDER BY 
    sales_count DESC;

--20.find the total revenue generated per payment method.
SELECT 
    payment_method,
    SUM(quantity_sold * unit_price) AS total_revenue
FROM 
    sales
GROUP BY 
    payment_method
ORDER BY 
    total_revenue DESC;



