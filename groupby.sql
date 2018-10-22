------------understang group by function procedure--------------------------------    
---max and min function can be used for numeric and date data types
select  min(hire_date),max(hire_date)----it display most senior and most junior employees
from employees;

select  min(last_name),max(last_name)----it display alphabetic display
from employees;
---count(*)=== null values
---count(expr)--null values
--count(distinct expr)
select count(*) "count of department 50"
from employees
where department_id=50;

select count(commission_pct) "count of department 50"
from employees
where department_id=50;

select count(*),count(commission_pct)-----null values counting
from employees
where department_id=80;

select department_id,count( department_id)----avoid non null values
from employees
group by department_id;
---using of group b


select department_id, count(distinct department_id)----avoid duplicate values and non null
from employees
group by department_id
having count(department_id)<7;
--------some important note about group by-------------------

---extra group by clasue-------
select department_id, count(distinct department_id)
from employees
group by department_id

----

