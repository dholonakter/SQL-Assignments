---practice week1 sql-----
select last_name,salary,salary+300---using expression
from employees;

---using column aliases---
select last_name as Name ,salary*12 "Annual salary" ---double quatation and square brackets allows space AND THERE IS DIFFERNCE WIthout quatation
from employees  ;

--using concatenation----

select last_name||' is a '||job_id  as "Employee detailas"
from employees;

----The default display of queries is all row including duplicate rows---
select department_id
from employees;
--using distinct
select distinct(department_id)
from employees;

describe employees;
--using the where clause to restrict the rows,it will return based on the condition

--date function--'DD-MM-YY'--
select hire_date,last_name
from employees
where hire_date ='13-01-01';

---alias can not be used in where clause ,the symble != and ^= can also be present not equal to condition

---understanding  and and or operator process
---then repalce with in ,any ,all etc later 
-----some important of and operator,it can no compare with equal operater same colum with different rows
select salary
from employees
where salary = all(17000,14000 );

      select salary
      from employees
      where salary=17000;

select salary
from employees
where salary=17000
and salary=14000;

--using of between expession    
select salary 
from employees
where salary between 10000 and 17000
order by salary asc ;
     
----
---using of like wildcard expression-----

---% represents the zero and one more multiple charcters
--- _ underscore reprents the sigle charcters
---Finds any first naem that start with "A"
select first_name
from employees
where first_name like 'A%';
---Finds any first naem that end with "A"
select first_name
from employees
where first_name like '%a';
---Finds any first naem that have a in any position
select first_name
from employees
where first_name like '%a%';
--Finds any values that have "a" in the second position
select first_name
from employees
where first_name like '_a%';
---Finds any values that start with "a" and are at least 3 characters in length
select first_name
from employees
where first_name like 'A_%_%';
---Finds any values that start with "a" and ends with "D"
select first_name
from employees
where first_name like 'A%r';

---The LIKE condition can be used as a shortcut for some BETWEEN comparisons.
--The following example displays the last names and hire dates of all employees who joined between January 1995 and December 1995: 

select last_name,hire_date
from employees
where hire_date not like '%05';

--order by clause----

select salary
from employees
order by salary 
;

--using of alias---
select salary as salaryofemployeees
from employees
order by salaryofemployeees 
;
---sort by multiple column and column numbers----
SELECT last_name, department_id, salary
FROM   employees
ORDER BY 2, salary DESC;

---substitution variable----
--With the single ampersand, the user is prompted every time the command is executed, if the variable does not exist.


select last_name,department_id,salary,employee_id
from employees
where employee_id=&employee_num;

--charcter value--
select last_name,department_id,salary,employee_id
from employees
where last_name ='&name';
                      -----using of sql function in edb3------------------------
                      
            
--single row funtion 
--1.case manipulation function
--lower,upper,initcap are case manipulation function

SELECT 'The job id for '||UPPER(last_name)||' is '
	||LOWER(job_id) AS "EMPLOYEE DETAILS"
FROM   employees;

Select 'The job id for '||UPPER(LAST_NAME)||' is '||LOWER(job_id) AS "Employee Details"
from employees;


---trying to turn out some example by showing two match values----
select department_id
from departments
where 20=(select department_id
             from departments
             where department_id=20);----------one of the understanding concept,why it is showing this result
             
             
select department_id
from departments
where 20=20;   -------what is that and why it is woorkig

select initcap(last_name)
from employees
where lower(last_name)='higgins';
---using concatenation
select concat('My name is ',last_name)
from employees
where lower(last_name)='higgins';
----EXTRACT THE VALUES
select SUBSTR(last_name,1,3)
from employees
where lower(last_name)='higgins';

select INSTR(last_name,'i')
from employees
where lower(last_name)='higgins';


---LENGTH THE VALUES
select length(last_name)
from employees
where lower(last_name)='higgins';

select lpad(last_name,11,'*')
from employees
where lower(last_name)='higgins';

select rpad(last_name,11,'*')
from employees
where lower(last_name)='higgins';

select replace(last_name,'H','D')
from employees
where lower(last_name)='higgins';

select trim('H' from last_name)
from employees
where lower(last_name)='higgins';

---SEARCH VALUE WITH  ampersand values

select last_name
from employees
where lower(last_name)='&last_name';
----
select trunc(salary*15/13,2) salary
from employees
where lower(last_name)='higgins';

----working with dates------
    --The Oracle database stores dates in an internal numeric format, representing the century, year, month, day, hours, minutes, and seconds.
select hire_date
from employees
where hire_date='29-JAN-2005';


select sysdate
from dual;
---The example in the slide displays the last name and the number of weeks employed for all 
--employees in department 90. It subtracts the date on which the employee was hired from the current date (SYSDATE) and divides the result by 7 to calculate the number of weeks that a worker has been employed.
select last_name,round((sysdate -hire_date),2)/7
FROM employees
WHERE department_id=90;

---using date functions-------

--For example, display the employee number, hire date, number of months employed,
--six-month review date, first Friday after hire date, and last day of the hire month 
--for all employees who have been employed for fewer than 80 mont 
select last_name, months_between(sysdate,hire_date)
from employees;


select last_name, add_months(hire_date,3)
from employees
where hire_date='29-JAN-2005';

select last_name, next_day(hire_date,'Friday')
from employees
where hire_date='29-JAN-2005';

select last_name, last_day(hire_date)
from employees
where hire_date='29-JAN-2005';

SELECT employee_id, hire_date,
	MONTHS_BETWEEN (SYSDATE, hire_date) TENURE,
	ADD_MONTHS (hire_date, 6) REVIEW,
	NEXT_DAY (hire_date, 'FRIDAY'), LAST_DAY(hire_date)
FROM   employees
WHERE  MONTHS_BETWEEN (SYSDATE, hire_date) < 80;-----does not show any result my god





















