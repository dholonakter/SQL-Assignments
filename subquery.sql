-----------using of subquery example----------

select employee_id,last_name,salary
from employees
where salary in(select min(salary)
               from employees
               group by department_id
               );
               
    select min(salary),department_id
    from employees
    group by department_id;
               
               select min(salary)
               from employees;
               
               
               ----using of null values----
               select employee_id,last_name
               from employees
               where employee_id in(select manager_id
                                    from employees);
                                    
                                    
                                    
            select employee_id,last_name      --need to revise
               from employees
               where employee_id not in(select nvl(manager_id,0)
                                    from employees);
                                    
                                    
    ---The slide example displays employees who are not IT programmers and whose salary is less than that of any IT programmer. 
    --The maximum salary that a programmer earns is $9,000. 
    
    select salary
    from employees
    where job_id='IT_PROG';
    
    SELECT employee_id,last_name,job_id,salary
    from employees
    where salary >ALL(select salary
    from employees
    where job_id='IT_PROG'
    )
    and job_id <> 'IT_PROG';
    
    select *
from employees
where salary > 
   (select salary
	from employees
	where employee_id = 
       (select manager_id
			from employees
			where employee_id = (Select max(employee_id)
					from employees
					where department_id = (select department_ID
							from departments
							WHERE department_name='IT'))));
                            
                            SELECT MAX(employee_id)
                            from employees
                            where department_id=60;

    
    
    
    
    select *
    from employees
    where salary >
      (select salary
       from employees
        where (employee_id) =(select max(employee_id)
                                 from employees
                                 where department_id = (select department_id
                                                          from departments
                                                           where department_name='IT')));
    
    select employee_id,manager_id,department_id,last_name
    from employees
    where (manager_id,department_id)in(select manager_id,department_id
                           from employees
                           
                                 );
                           
                           
                           select manager_id,department_id
                           from employees;
                           
                           
---co related subquery
---Find all employees who earn more than the average salary in their department.

SELECT last_name, salary, department_id
FROM   employees 
WHERE  salary >any          
(SELECT AVG(salary)
          FROM   employees
          group by department_id);
          

          
          
          
SELECT last_name, salary, department_id
FROM   employees outer
WHERE  salary >(SELECT AVG(salary)
          FROM   employees
          WHERE  department_id =  
          outer.department_id);
          
          
          
          
          ----exist operator existence------

            select employee_id,last_name      --need to revise
               from employees e
               where   exists (select manager_id
                                    from employees
                                    where e.employee_id=manager_id);
                                    
                                    
            
          
          
          
          

                                    
                                    
                                    