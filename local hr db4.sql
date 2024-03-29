--The example in the slide displays employees whose job ID is the same as that of employee 141 and whose salary is greater than that of employee 143.


--------------more clear work about or and and performance-----------------------------------------------------------------------------------------------
SELECT employee_id,last_name,job_id
FROM employees;



select  employee_id ,job_id,salary
from employees
where job_id=(SELECT  job_id
FROM employees
where employee_id=141)
and salary >( SELECT salary
FROM employees
where employee_id=143
and employee_id=141)  ;--result is 2600 

select salary,employee_id         --if the question is like that find a salary where  employee id=143 and 14
From employees
where employee_id =143             --the difference ---how it works behind the scenery or and and operator,i want to get more expalination
or employee_id=141;



--------------------------------------------------------------------or and and performance-------------------------------------------------------------------------------------------------------------------------
--rajas

--127-144 has st_clerk

----result is in and or operator

SELECT employee_id,last_name,job_id,salary
FROM employees
where employee_id=141; --result is 3500
                                      
 SELECT employee_id,last_name,job_id,salary
FROM employees
where employee_id=143;  --result is 2600 

----------------------------------------------------------------------exercise question about in and understand question------------------------------------------------------------------------------------------------------------------------------------------------
----exercise question
select department_id
from employees;

select distinct department_id 
from employees
where department_id>90;

select distinct(department_id)
from employees
where department_id in (90,60);

select distinct(department_id)
from employees
where department_id in (select department_id 
from employees
where department_id>90);

select employee_id,first_name,last_name,department_id,job_id
from employees;

select employee_id,job_id,department_id
from job_history;


select employee_id,first_name,last_name,department_id,job_id
from employees
where employee_id in(100,101,201,114,122,200,176)
and department_id=90;


select employee_id,first_name,last_name,department_id
 from employees
 where (department_id,employee_id)in ( select department_id,employee_id)
                           from job_history
                           where start_date < '1-JAN-1997' );





select employee_id,job_id,department_id,start_date
from job_history
where start_date < '1-JAN-1997' ;


select employee_id,job_id,department_id
from job_history;

select employee_id,job_id,department_id,start_date
from job_history;

select employee_id,job_id,department_id,start_date
from job_history
where start_date < '1-JAN-1997' ;

select department_id,employee_id
from job_history
where start_date < '1-JAN-1997' ;

---trying to get final result by subquery
select employee_id,first_name,last_name,department_id,job_id
from employees
where department_id=90;

select employee_id,LAST_NAME,DEPARTMENT_ID
from employees
where department_id=90;

select employee_id,department_id
from employees
where employee_id=200
and department_id=90;

select job_id,employee_id,DEPARTMENT_ID,LAST_NAME
from employees
where job_id='AD_ASST';



-- Write a query that displays the employee ID, first name, last name and department ID of all employees 
--that currently work in a department
--for which any job history data from before 1997 is known.
--It is mandatory to use a subquery.

--find any employee which job history data is matches that is known before 1997 that  work in current department
--find any employees from job history is working in a currrent department is known.
--find 

select employee_id,first_name,last_name,department_id
 from employees
 where (department_id,employee_id)in ( select department_id,employee_id)
                           from job_history
                           where start_date < '1-JAN-1997' );




select employee_id,first_name,last_name,department_id
 from employees
 where department_id in ( select department_id
                           from job_history
                           where start_date < '1-JAN-1997' );
                           
 ----------------------------------------------------------------using group by returns multiple row in subquery-------------------------------------------------------------------------------------------------------------------------------------------------------   
    --multiple queries using group by
    select department_id, min(salary)
    from employees
    group by department_id
    order by department_id asc;
    
    
    select min(salary)
    from employees;
----------------------------------------------------NULL SUBQUERY---------------------------------------------------------------------------------------------------------------------------
--using null operator
---not in :equal to any memeber in the liat
--compare to each value returned by the subquery
--compared all value returned by the subquery
--test for existence row in a subquery 
----------------------------------------------------------------understand between ANY and ALL------------------------------------------------------------------------------------------------------------------------------------------

--any operator always combination with  > ,<>,=,<=,=
--------practicing any and all operator---------------------
-- The slide example displays employees who are not IT programmers and whose salary is less than that of any IT programmer. The maximum salary that a programmer earns is $9,000.
--answer
select employee_id,salary
from employees
where  SALARY >any (select salary
            from EMPLOYEES
         where job_id='IT_PROG')
and  job_id <>'IT_PROG';

select employee_id,salary
from employees
--where  SALARY <any(9000,6000,500);  --difference betwwen any and all
where salary=9000
or salary=6000
or salary=500;


select employee_id,salary
from employees
where  SALARY <all(9000,6000,500);  --difference betwwen any and all
where salary<9000
and salary=6000;

--pair comparison
SELECT	employee_id, manager_id, department_id
FROM	employees
WHERE  (manager_id, department_id)IN ((108,100) ,(100,80));

SELECT manager_id, department_id
FROM employees
WHERE first_name = 'John'
--AND first_name <> 'John';



select sllary
from employees;

select salary
from EMPLOYEES
where job_id='IT_PROG';


--any operator use like or operator so it just if one,it returns true is any of them is true
--all operator use like all both of them shoud be true and operator



--The slide example displays employees whose salary is less than the salary of all employees with a job ID of IT_PROG and whose job is not IT_PROG. 
-- >ALL means more than the maximum, and <ALL means less than the minimum.
--The NOT operator can be used with IN, ANY, and ALL operators.

--answer
--FIRST STEP
SELECT employee_id,salary
from employees;

select employee_id,salary
from employees
where job_id='IT_PROG';

AND JOB_ID <>'IT_PROG';
]]=

--Who earns more than the manager of the employee with highest employeeID of the IT-department

--answer
select * 
from employees
where salary=6200
and salary=11500;

--question
--Display the details of the employees who are managed by the same manager and work in the same department as employees with the first name of “John.”



--answer


--note
--Pairwise Comparison Subquery
---The example in the slide compares the combination of values in the MANAGER_ID column and the DEPARTMENT_ID column of each row in the EMPLOYEES table with the values in the MANAGER_ID column and 
--the DEPARTMENT_ID column for the employees with the FIRST_NAME of “John.” First, the subquery to retrieve the MANAGER_ID and DEPARTMENT_ID values for the employees with the FIRST_NAME of “John” is executed. 
--This subquery returns the following:
--These values are compared with the MANAGER_ID column and the DEPARTMENT_ID column of each row in the EMPLOYEES table. 
--If the combination matches, the row is displayed. In the output, the records of the employees with the FIRST_NAME of  “John” will not be displayed. The following is the output of the query in the slide:



--corelated subquery
--Correlated Subquery Execution
--Get a candidate row (fetched by the outer query).
--Execute the inner query using the value of the candidate row.
--Use the values resulting from the inner query to qualify or disqualify the candidate.
--Repeat until no candidate row remains.

--
--

--Write a query to display the last names of the employees who have one or more co-workers in their departments with later hire dates but higher salaries.
--first try
select last_name
from employees e
where (select department_id,last_name
                                   from emloyees
                                   where employee_id=e.employee_id);
                         
And hire_date>

select last_name
from employees outer
       in (select department_id
        from employees
        where department_id=outer.department_id
        and hire_date>outer.hire_date
        and salary>outer.slary)
           
--trying to do with corerelated

select count(employee_id) as employee,department_id
from employees outer
where (hire_date,salary)>any(select (hire_date,salary)
                  from employees
                  where employee_id=outer.employee_id)
having count(employee_id)>0
group by department_id;

select hire_date,employee_id,last_name
from employees
where hire_date>any(select hire_date
                  from employees)
and salary>any (select salary
             from employees);
             
        

--list the countries where no department is located
--using corelaated subquery

select distinct country_id
from locations 
where location_id in(select location_id
                            from departments
                             );
                            
--using corelated subquery
select country_name
from countries c
where country_id not in(select  country_id
                     from locations 
                 where location_id in
                 (select location_id
                            from departments
                             )
);

select first_name,last_name,salary
from employees

select avg(salary)
from employees

select city 
from locations


----give an overview of employees  first,lastnames and salaries of all employees  who earn more than average salary of employees in teir city
    
;
select avg(salary), l.city
        from employees e1, departments d, locations l
        where e1.department_id=d.department_id
        and d.location_id = l.location_id
        group by l.city
;
select last_name, salary
from employees;






