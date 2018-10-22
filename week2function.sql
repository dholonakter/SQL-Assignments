-----week2 slide practice-----------------
--data type conversation
---convert to one data type to  another data type

---must be used in single quation marks
--format model can be include any valid date format
--
select employee_id,to_char(hire_date,'dd/mm/yy')"month hired"
from employees
where last_name='Higgins';

select employee_id,to_char(hire_date,'dy mon yyyy')"month hired"
from employees
where last_name='Higgins';

select employee_id,to_char(hire_date,'fmDdspth "of" Month YYYY fmHH24:MI:SS AM')"month hired"
from employees
where last_name='Higgins';

select employee_id,to_char(salary,'$99,999.00')
from employees
where last_name='Higgins';

SELECT last_name, hire_date
FROM   employees
WHERE  hire_date = TO_DATE('May   24, 1999', 'fxMonth DD, YYYY');

---using the nvl function in oracle-------
select last_name,to_char(commission_pct,'NO COMMISIO YET')
from employees;

select last_name,NVL(TO_CHAR(commission_pct), 'No Commission') COMM 
from employees;

select last_name, nvl(to_char(commission_pct),'no ccomm')---in nvl data type must be match,
from employees;

---need to undrstand how it is working-------

----using te decode function--------

select salary,job_id,last_name,
decode(job_id,'IT_PROG', 1.10*salary,
                'ST_CLERK', 1.15*salary,
                'SA_REP', 1.10*salary,
        
        SALARY)
        revised_SALARY
        FROM employees;
        
        
-- Using the DECODE function, write a query that displays the grade of all employees based on the value of the column JOB_ID, using the following data:
  --trying to solve this question of using decode
  
select job_id,
decode(job_id,'IT_PROG', 'A',
               'ST_MAN ', 'B',
                'ST_CLERK','C',
                'SA_REP', 'D',
                  'AD_PRES' ,' A',
        
        0)
        grade
        FROM employees;
       --algorithm---
   --    IF job_id = 'IT_PROG'     THEN  salary = salary*1.10
  -- IF job_id = 'ST_CLERK'    THEN  salary = salary*1.15
 --  IF job_id = 'SA_REP'      THEN  salary = salary*1.20
 --  ELSE salary = salary;
 
 -----------extra exercise of function----------------------------
 

    select street_address,nvl(to_char(state_province),'unknown state province')----how char and nvl function proceed together,need to reseach
    from locations;

select salary,JOB_ID,(salary*12+nvl(commission_pct,0)) "annual sal",-------HOW TIS MATHMATICAL TERM IS USED,NEED TO RESEARH
decode (job_id ,'SA_MAN' , 1.50*salary,
                 'SA_REP', 1.40*salary,
                 salary) revised_salary
from employees
where job_id ='SA_MAN'
OR  JOB_ID= 'SA_REP';

    


