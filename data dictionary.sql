-------theory study----------------------------

    ---data dictionary views------
    
    ---what is data dictionary
    ---A data dictionary is a collection of description of the data objects  or items in a data model for the benefits of programmers and others who need 
    ---to refer to them
    
    ---A data dictionary contains metadata i.e data about the database. 
    --The data dictionary is very important as it contains information such as what is in the database, 
    --who is allowed to access it, where is the database physically stored etc. 
    --The users of the database normally don't interact with the data dictionary, it is only handled by the database administrators.

    describe dictionary;
    select *
    from dictionary
    where table_name='USER_OBJECTS';
    
    
    SELECT object_name, object_type, created, status
FROM   user_objects
ORDER BY object_type;

SELECT table_name
from user_tables;


SELECT column_name, data_type, data_length,
       data_precision, data_scale, nullable
FROM   user_tab_columns
WHERE  table_name = 'EMPLOYEES'; 

DESCRIBE user_constraints;

describe user_cons_columns;

SELECT constraint_name, constraint_type,
       search_condition, r_constraint_name, 
       delete_rule, status
FROM   user_constraints
WHERE  table_name = 'EMPLOYEES'; 

DESCRIBE user_views;

SELECT view_name FROM user_views;

SELECT text FROM user_views 
WHERE view_name = 'EMP_DETAILS_VIEW';

DESCRIBE ALL_USERS;

SELECT USERNAME
FROM all_users;

DESCRIBE user_procedures;
DESCRIBE user_source;


