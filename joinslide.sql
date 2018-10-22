
select department_id,manager_id
from departments
natural join employees
WHERE department_id in(20,50);

select department_id,e.manager_id
from departments d
 join employees e
using(department_id);


---using on clasue------

--on clause does not care foreign key and primay key if two data type converted to one type

select d.department_id,e.manager_id
from departments d
 join employees e
ON(e.MANAGER_ID=d.manager_id);

-----------------self join-------

select e.manager_id,m.last_name
from employees e
 join employees m
ON(e.employee_id=m.manager_id);

---inner join comes always mached pair values------------   

SELECT e.last_name, e.department_id, d.department_name
FROM   employees e full OUTER JOIN departments d
ON   (e.department_id = d.department_id) ;

