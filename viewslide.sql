------using of views------------------

----view is  a virtual table which is based on own table,who does not hold.which provides access to subset of column one or more table.
----user sequrity to access the data----
/*

View can be described as virtual table which derived its data from one or more than one table columns. 
It is stored in the database. View can be created using tables of same database or different database. 
It is used to implement the security mechanism in the SQL Server.Aug 19, 2013

A simple view is one that:
Derives data from only one table
Contains no functions or groups of data
Can perform DML operations through the view

A complex view is one that:
Derives data from many tables
Contains functions or groups of data
Does not always allow DML operations through the view


---you can not remove or modify  the row if the view contains the following ----group function,group by clause,the distinct keyword,columns defined
by expression-------------

*/

select *
from employees
where employee_id=145;

Create or replace view  empvw80    ---simple view
AS select employee_id,last_name,salary,first_name
from employees
where department_id=80;

Create OR REPLACE view  empvw20   ---simple view
AS select *
from employees
where department_id=20
WITH CHECK OPTION;

----display the view-----
select *
from empvw80;

select *
from empvw20;

-----deleting view-----
DROP VIEW empvw20;


----DML operation-----
Update empvw80 set last_name=' Akter', first_name='Dholon' where employee_id=145;
Update empvw20 set employee_id=203 where employee_id=202;
UPDATE empvw20
SET    department_id = 10
WHERE  employee_id = 201;






CREATE  or REPLACE  VIEW 	salvu50
 AS SELECT  employee_id ,First_name, last_name,
            salary*12 ANN_SALARY
    FROM    employees
    WHERE   department_id = 50;
    
    select *
    from salvu50;
    
    ----DML OPERATION------
    
Update salvu50 set last_name=' Hasan', first_name='Jabid' where employee_id=191;

DESCRIBE employees;
