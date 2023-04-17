--Q[1] Create a trigger to fill up the full_name column in the dependents table while
--     inserting any new records.
-- Answer
create or replace function trg_full_name()
return trigger as
$trigconcat_full_name$
begin
    new.full_name := CONCAT(new.first_name, ' ',new.last_name);
    return new;
end;
$trigconcat_full_name$ language plpgsql;

create trigger trigconcat_full_name
before insert on dependents
for each row 
execute function trg_fill_full_name();

--Q[3] For the following tables create a view named employee_information with
--     employee first name, last name, salary, department name, city, postal code insert
--     only those records whose postal code length is less than 5.
--Answer
create view employee_information as
select emp.first_name, emp.last_name, emp.salary, d.department_name, l.city, l.pincode
from employee emp
join departments d on emp.department_id = d.department_id
join locations l on d.location_id = l.location_id
where length(l.pincode) < 5;


-- [Q4] Explain ACID properties with an example
--Answer
ACID propert is the full name of Atomicity,Consistency,Isolation and Durability which is used to keep the database
consistent
For example in a school databse if a student 

Atomicity:
It means that if any operation is performed in the database then it should be completely performed or executed or else
not executed at all. 
Example:- in bank transfer if from account A 10rs is transferred to account B but still the balance of
accoutn B is showing the old value then it is a problem and it has not atomicity

Consistency:
The data integrity and values must be preserved before start and end of the transaction.
Example:- In a bank transfer it must be ensured that total data must be preserved or be same in both accounts
at the start and end of transaction.

Isolation:
This ensures that when multiple transaction occurs all the transactions must be serializable.
Example:- If transfer of money occurs from person A to B then money must be deducted from A and credited to B 
simultaneously from both account.

Durability:
When the transactions are succesful this ensures that in system break the datas are preserved and are not reverted.
Example: Money transfer from account A to B is ensured that it will not be reverted back.


-- [Q5]There are five records in a data base. There is an index file associated with this and it contains the values 1,3,2,5 and 4. 
-- Which one of the fields is the index built from?
-- Answer
The index is built from the Occupation row since on sorting the table according to the occupation row the coloumns 
will be placed in the order 1,3,2,5,4.  
