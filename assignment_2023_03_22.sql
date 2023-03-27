--USING PSQL

-- [Q1]

select concat(emp.first_name,' ',emp.last_name) as full_name , emp.email ,emp .salary , dep.department_name , loc.pincode , loc.city  
from employee as emp join departments as dep on emp.employee_id = dep.department_id  join locations as loc on dep.location_id = loc.location_id; 

-- [Q2]

select dep.department_name , loc.state_province , loc.street_address 
from departments as dep join locations as loc on dep.location_id = loc.location_id
where loc.state_province = 'jharkhand' or loc.state_province = 'jammu kashmir';

-- [Q3]

select count(employee.employee_id) as employee_count ,jobs.job_title as job_name , round(avg(employee.salary)) as average_salary
from employee join jobs on employee.job_id = jobs.job_id 
group by employee.job_id , jobs.job_id 
having avg(employee.salary) > 10000;

-- [Q4]

select emp.first_name ,emp.last_name , depend.first_name ,depend.last_name
from employee as emp full outer join dependents as depend on emp.employee_id = depend.employee_id
order by emp.last_name desc ,depend.last_name desc ; 

-- adding managr_id as foreign key(self referncing) in employee table

ALTER TABLE employee
ADD FOREIGN KEY (manager_id) REFERENCES employee(employee_id);

-- [Q5]
select distinct concat(emp1.first_name,' ',emp1.last_name) as name 
from employee emp1 join employee as emp2 on emp1.employee_id = emp2.manager_id ;

-- [Q6]
select dep.department_name , loc.state_province , count(emp.employee_id) as employee_count
from departments dep join employee emp on emp.department_id = dep.department_id join locations loc on dep.location_id = loc.location_id 
where emp.salary >50000 and (loc.state_province = 'new york' or loc.state_province = 'california')
group by dep,department_name ,loc.state_province
having count(emp.employee_id)<=5;

-- [Q7]

select d.department_name , j.job_title 
from employee e join jobs j on e.job_id = j.job_id join departments d on e.department_id = d.department_id join dependents depend on e.employee_id = depend.employee_id  
where j.job_title like '%manager%'
group by d.department_name , j.job_title ;

-- [Q8]

alter table dependents 
add column city varchar(255);

update dependents 
set city = 'kolkata' where dependent_id = 1;

update dependents 
set city = 'doha' where dependent_id = 3;

update dependents 
set city = 'salt lake' where dependent_id = 4;

update dependents 
set city = 'sealdah' where dependent_id = 6;

update dependents 
set city = 'mumbai' where dependent_id = 10;


SELECT CONCAT(e.first_name, ' ', e.last_name) as employee_fullname, e.salary, d.department_name, l.city
from employee e join jobs j on e.job_id = j.job_id join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
join employee e2 on e2.manager_id = e2.employee_id join jobs j2 on e2.job_id = j2.job_id join dependents dep on e.employee_id = dep.employee_id
where e.hire_date >= now() - interval '3 years' and dep.city <> l.city
and e.salary > (
    select avg(salary)
    from employee
    where job_id = e.job_id
	)
and j2.job_title like '%director%' order by d.department_name;

