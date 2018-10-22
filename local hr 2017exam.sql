select employee_id,last_name,(salary*12+(commission_pct)) as anunualsalary,to_char(nvl(commission_pct,'do not have commission'))
from employees;

--Give the id and last name of employees who’s total annual salary, including the commission, is more than € 100.000,=.
--Note: the given salaries are monthly, and take care that not every employee earns commission (for those employees the commission percentage is not filled in).

select employee_id,salary,nvl(commission_pct,0),(salary*12+nvl(commission_pct,0)) as annualsal
from employees
where (salary*12+nvl(commission_pct,0))>100000;

--Give the name of the departments that have at least 20 employees.
       select d.department_name
            from departments d
            join employees e
            on(d.department_id=e.department_id)
            group by d.department_name
            having count(e.employee_id)>=20;
            
            --trying phase
            select department_name
         from departments
              where 20>=any(select count(employee_id)
            from employees
            group by department_id)
           group by department_name;
      
      select count(job_id),sum(salary)
      from employees
      where job_id='AD_PRES' or JOB_ID='AD_VP'
      group by job_id;
            
            select count(job_id),job_id
            from employees
            group by job_id;----need to fix some issues
            
---Give the id, last name and the salary of the employees who earn the highest salary within their job.


            select employee_id,last_name,salary,job_id
            from employees outer
            where salary=ANY(select max(salary)
                            from employees
                            where job_id=outer.job_id
                            )
                            order by job_id asc;
                            
                            
                            
                            select max(salary)
                            from employees;
    ---Give the id and last name of the managers who are managing at least 10 employees......current problem when and where to use group by
    select m.manager_id managerid,m.last_name managername----trying to use self join relationship but nothing result
    from employees e join employees m
    on(e.employee_id=m.manager_id)
     group by m.manager_id,m.last_name
    having count(e.employee_id)>=10;------------this is not working
    
    
    select employee_id managerid,last_name as managername
    from employees 
    where employee_id in (select manager_id
                           from employees 
                           group by manager_id
                           having count(employee_id)>=10); 

----Create a view that shows for all employees their id, the last name, the current job id, together with all their previous job id’s, and the start dates and the end dates of those jobs. 
---Note: also employees who have no previous jobs, must be shown!

--current problem make elationship when and with what


--Give the id and last name of the employees who currently earn at least €5000,=, and also earned at least €5000,= in all their previous jobs.

            