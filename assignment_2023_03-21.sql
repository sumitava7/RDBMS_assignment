-- using POSTGRESQL

-- 1.Write the query to get the department and department wise total(sum) salary,
-- display it in ascending order according to salary.

select sum(salary),department_name from employee, departments
where departments.department_id = employee.department_id 
group by departments.department_name;


-- 2. Write the query to get the department, total no. employee of each department,
-- total(sum) salary with respect to department from "Employee" table.

select department_name,count(employee_id) as total_emplopyee,sum(salary) from employee, departments
where departments.department_id = employee.department_id 
group by departments.department_name;

-- 3. Get department wise maximum salary from "Employee" table order by salary
-- ascending

select department_name,max(salary) as max_salary from employee,departments
where departments.department_id = employee.department_id 
group by departments.department_id 
order by max_salary ; 


-- 4. Write a query to get the departments where average salary is more than 60k

select department_name from employee,departments
where departments.department_id = employee.department_id
group by departments.department_id
having round(avg(salary))>60000; 

-- 5. Write down the query to fetch department name assign to more than one
-- Employee

select department_name,count(employee_id) as total_emplopyee from employee, departments
where departments.department_id = employee.department_id 
group by departments.department_name
having count(employee_id)>1;


-- 6. Write a query to show department_name and assignedTo where assignedTo
-- will be “One candidate” if its assigned to only one employee otherwise
-- “Multiple candidates”

select department_name,count(employee_id) as total_emplopyee,case 
	when count(employee_id)<=1 then 'one candidate'
	else 'multiple candidate'
end as typeof_employee from employee, departments
where departments.department_id = employee.department_id 
group by departments.department_name;