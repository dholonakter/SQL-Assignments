select department_id,location_id
from departments;

select location_id,country_id
from locations
where location_id in(1400,1500,1700,1800,2400,2500,2700);

select country_id,location_id
from locations;

select distinct(country_name)
from countries;

select country_name
from countries
where country_id  in(select country_id
                     from locations
                     where location_id  in(select location_id
                                               from departments));
                                               
                                               
                                                                                           
SELECT DISTINCT country_id
FROM LOCATIONS
WHERE location_id IN(select location_id
                        from departments);
    select country_id
    from countries;
                        
select country_id
from countries
where country_id='US'
   or country_id='CA'
   or country_id='DE'
   or country_id='UK';
   
   select country_id
   from countries
   where country_id  not in (SELECT DISTINCT country_id
FROM LOCATIONS
WHERE location_id  IN(elect location_id
                        from departmentss));
   
select country_id
from countries
where
country_id='AR'
or country_id='AU'
or country_id='BE'
or country_id='CH'
or country_id='CN'
or country_id='DK'
or country_id='EG'
or country_id='FR'
or country_id='IL'
or country_id='IN'
or country_id='IT'
or country_id='JP'
or country_id='KW'
or country_id='ML'
or country_id='MX'
or country_id='NG'
or country_id='NL'
or country_id='SG'
or country_id='ZM'
or country_id='ZW';


//JOIN

select DISTINCT( c.country_name)
from countries c join locations l
on(c.country_id =l.country_id)
join departments d
on (d.location_id=l.location_id);

--where c.country_id ='US' OR
--     C.country_id ='UK'
--    OR  c.country_id ='DE' OR
--     c.country_id ='CA';
--
--from departments d join locations l
--






   
