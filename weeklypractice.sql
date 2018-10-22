---------sql------------------------

select last_name,salary
from employees
where salary >&amount;

select last_name,add_months(to_char((hire_date,'fm "the" Day "of" Month ","yyyy')),6)as from employees;


select employee_id,hire_date,months_between(sysdate,hire_date) nrofmonths,next_day(hire_date,'Friday')
from employees;

select last_name, NEXT_DAY(ADD_MONTHS(to_char(hire_date, 'fm "the" Day "of" Month ","yyyy',6),'friday') as review
from employees;

SELECT last_name, hire_date, 
 TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6),'MONDAY'), 
 'fmDay, "the" Ddspth "of" Month, YYYY') REVIEW 
FROM employees; 

select last_name,hire_date, to_char(next_day(add_months(hire_date,6),'Monday'),'fmDay, "the" Ddspth "of" Month, YYYY')reveiw 
from employees;


/*
Vorige poging gevonden van 2018-10-21 17:11:19.1500000
*/
select last_name, hire_date, to_char(hire_date, 'Day') Day 
from "EMPLOYEES" 
ORDER BY TO_CHAR(hire_date -0,'d'); 

SELECT rpad(last_name, 8)||' '|| 
 rpad(' ', salary/1000+1, '*') 
 EMPLOYEES_AND_THEIR_SALARIES 
FROM employees 
ORDER BY salary DESC; 

-------
select job_id,
DECODE ( job_id, 'AD_PRES' ,'A',
                  'ST_MAN', 'B',
                 'IT_PROG', 'C',
                'SA_REP', 'D',
                'ST_CLERK', 'E',
				JOB_ID) GRADE
				FROM EMPLOYEES;
                
                SELECT  job_id, 
       DECODE(job_id, 'IT_PROG',  'a',
                      'ST_CLERK', 1.15*salary,
                      'SA_REP',   1.20*salary
              salary)
       REVISED_SALARY
FROM   employees;

select job_id,
DECODE ( job_id, 'AD_PRES' ,'A',
                  'ST_MAN', 'B',
                 'IT_PROG', 'C',
                'SA_REP', 'D',
                'ST_CLERK', 'E',
				JOB_ID) GRADE
				FROM EMPLOYEES;
      

				
select job_id, min(salary),max(salary),avg(salary)
from "EMPLOYEES";

select 
count(*) total,
count(DECODE (to_char(hire_date,'YYYY'), '1995', 1,0))"1995",
count(DECODE (to_char(hire_date,'YYYY'), '1996', 1,0))"1996",
count(DECODE (to_char(hire_date,'YYYY'), '1997',  1,0))"1997",  -----hhahahhahha what is the hell its coming
count(DECODE (to_char(hire_date,'YYYY'), '1998',  1,0))"1998"
from employees;
SELECT job_id "Job", SUM(DECODE(department_id , 20, salary)) "Dept 20", SUM(DECODE(department_id , 50, salary)) "Dept 50", 
SUM(DECODE(department_id , 80, salary)) "Dept 80", SUM(DECODE(department_id , 90, salary)) "Dept 90", SUM(salary) "Total" FROM employees GROUP BY job_id; 



----week3 practice------
select e.last_name ,department_id,d.department_name
from employees e join departments d using(department_id);  ---can not have qualifier
*/*
Vorige poging gevonden van 2018-10-21 19:26:58.2570000
*/
SELECT e.last_name Employee, e.employee_id EMP, m.last_name MANAGER, m.manager_id MGR 
from employees e JOIN employees m ON (e.employee_id= m.manager_id);


select last_name,employee_id,manager_id
from employees
where last_name='Fay';

SELECT e.last_name emp,e.employee_id, m.last_name mgr,e.manager_id
FROM   employees e JOIN employees m
ON    (e.manager_id = m.employee_id)
order by e.last_name;


    select last_name,hire_date
     from employees
      where department_id =
      (select department_id
        from employees
        where last_name = '&Zlotkey'
       )
       and last_name <> 'Zlotkey';
        
        
        select employee_id,last_name,salary
        from employees
        where salary >(select avg(salary)
                         from employees)
        order by salary asc;
        
        select employee_id,last_name
        from employees
        where department_id =any(select department_id
                                   from employees
                                   where last_name like '%u%');
      
      
      select last_name,employee_id,manager_id
      from employees
      where manager_id in
      ( select employee_id
      from employees
      where last_name='King');
      
      select department_id,last_name,job_id
      from employees
      where department_id in( select department_id
      from departments
       where department_name='Executive');
       
      select last_name,department_id
      from employees
      where salary>(select avg(salary)
                     from employees)
                     and department_id in
                (select department_id
                  from employees
                 where last_name like '%u%')
                 ;  
       
       select department_id
       from employees
       where last_name like '%u%';
       
       ----using subquery
       select e.last_name,e.salary,d.department_name
       from employees e join departments d
       on(e.department_id=d.department_id)
       where( nvl(e.commission_pct,0),e.salary) in (select nvl(e.commission_pct,0),e.salary
                                                        from employees e join departments d
                                                        on(e.department_id=d.department_id)
                                                        and d.location_id=1700
                                                        );
                                                        
                                                        
                                                        
        select last_name,hire_date,salary
       from employees
       where( nvl(commission_pct,0),salary) in (select nvl(commission_pct,0),salary
                                                        from employees 
                                                        where last_name ='Kochhar'
                                                        )
                                                        and last_name <>'Kochhar';
        
        select last_name,nvl(commission_pct,0),salary,hire_date
        from employees
        where last_name='Kochhar';
        
        select nvl(commission_pct,0),salary
        from employees 
        where last_name ='Kochhhar'
                                                
             
                                                        
            
            
         SELECT e.last_name, d.department_name, e.salary ------so returns null
FROM employees e, departments d 
WHERE e.department_id = d.department_id 
AND (salary,commission_pct)
 IN (
  SELECT salary,commission_pct
  FROM employees e, departments d 
  WHERE e.department_id = d.department_id 
  AND d.location_id = 1700
);
       
select *
from "EMPLOYEES"
where salary>ALL(select salary
                 from employees
                 where job_id='SA_MAN')
                     ORDER BY SALARY DESC;
                     
------join------
SELECT e.employee_id,e.last_name,e.department_id
from employees e join departments d
on(e.department_id=d.department_id)
join locations l
on(d.location_id=l.location_id)
where l.city like 'T%';

---------------subquery-----------
select employee_id,last_name,department_id
from employees
where department_id in(select department_id
                           from departments
                           where location_id in(select location_id
                                                 from locations
                                                 where city like 'T%'));
								 
 select e.employee_id,e.last_name,e.department_id
from employees e
where e.department_id in(select d.department_id
                           from departments d
                           where e.department_id=d.department_id
                           and d.location_id in(select l.location_id
                                                 from locations l
                                                 where d.location_id=location_id
                                                 and l.city like 'T%'));
-----inner query can not be executed without outer query
-----           
	  
       
       
select employee_id,last_name
from employees e
where  exists (select m.manager_id 
                           from employees m
                           where e.employee_id=m.manager_id);
                           
select last_name,department_id
from employees e
where 1 >=(select count(employee_id)
                              from employees 
                              where e.department_id=department_id);
                              
select count(employee_id),department_id
from employees                                        
group by department_id;

select last_name
from employees outer
where department_id in (select department_id
        from employees d
        where d.department_id=outer.department_id
        and d.hire_date>outer.hire_date
        and d.salary>outer.salary)
        

                              

