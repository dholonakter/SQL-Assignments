---question1
create or  replace view deparmentOverview
(deparmentid,departmentname,managername,city)
AS select d.department_id,d.department_name,e.last_name,l.city
from departments d  join employees e
on (d.manager_id=e.employee_id)
--and d.manager_id=e.employee_id
join locations l
on (l.location_id=d.location_id);


----question 2

        select first_name,last_name,salary
        from employees
        where salary>(select avg(salary)
        from employees);
        --the question is retrieve the averge salary of employees in their department
        select first_name,last_name,salary, ol.city
        from employees e, departments od, locations ol
        where e.department_id=od.department_id
        and od.location_id = ol.location_id
        and salary>
        (select avg(salary) 
        from employees e1, departments d, locations l
        where e1.department_id=d.department_id
        and d.location_id = l.location_id
        and l.city = ol.city
        group by l.city
        );
        
        
---question 3
---subquery
select country_name
from countries 
where country_id not in(select country_id
from locations l
where location_id in(select location_id
                            from departments
                             ));
--co related

select country_name
from countries c
where  not exists(select country_id
from locations l join departments d
on l.location_id=d.location_id
where l.country_id=c.country_id);

----join
select distinct C.*
from countries c left outer join locations l
on l.country_id=c.country_id
join departments d
on l.location_id=d.location_id;----need to think to implementation

SELECT *
FROM COUNTRIES C right JOIN  LOCATIONS L
ON  L.COUNTRY_ID = C.COUNTRY_ID
 JOIN DEPARTMENTS D
ON L.LOCATION_ID=D.LOCATION_ID;

SELECT DISTINCT COUNTRY_ID,D.LOCATION_ID
FROM LOCATIONS L LEFT OUTER JOIN DEPARTMENTS D
ON L.LOCATION_ID=D.LOCATION_ID;

SELECT DISTINCT C.COUNTRY_ID,C.COUNTRY_NAME,L.COUNTRY_ID
FROM COUNTRIES C left JOIN  LOCATIONS L
ON  L.COUNTRY_ID = C.COUNTRY_ID ;


SELECT DISTINCT L.COUNTRY_ID,D.LOCATION_ID
FROM LOCATIONS L LEFT join DEPARTMENTS D
ON(L.LOCATION_ID=D.LOCATION_ID);

SELECT DISTINCT C.COUNTRY_ID,D.LOCATION_ID
FROM DEPARTMENTS D RIGHT join LOCATIONS L
ON(L.LOCATION_ID=D.LOCATION_ID)
 JOIN COUNTRIES C
 ON  L.COUNTRY_ID = C.COUNTRY_ID
 AND C.COUNTRY_ID IS NULL;











---question 4
select avg(salary) averagesalary,hire_date
from employees
group by hire_date
order by averagesalary desc;



---question 5

select department_name
from departments
where department_id in (select department_id
                        from employees
                        group by department_id
                        having count(employee_id)>=5
                        );
                        

---question 6

select d.department_name
from departments d join employees e
on(d.department_id=e.department_id)
group by d.department_name
having count(e.employee_id) in(select max(count(employee_id))
                                from employees
                                group by department_id)



      

