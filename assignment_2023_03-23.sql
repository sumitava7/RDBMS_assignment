--using Postgres
--Q[1]

select department_name from departments 
where department_id in(
	select department_id 
	from employee 
	where salary<2000
);


--Q[2]

select country_name from countries 
where country_id not in(
	select country_id 
	from locations 
	where location_id not in (
		select location_id
		from departments 
		where department_id not in(
			select department_id 
			from employee 
		)
	)
);


--Q[3]

select job_title from jobs
where job_id in (
    select e.job_id from employee e
    where e.department_id in (
        select e1.department_id from employee e1
        where (select count(e2.employee_id) from employee e2
        	where e1.department_id=e2.department_id)>=2
    )
);

--Q[4]

select country_name from countries  
where country_id in( select country_id from locations l where l.city like 'a%'  
);

--Q[5]

select department_name from departments dep 
where dep.location_id in (
	select location_id from locations l where l.city=null
);
