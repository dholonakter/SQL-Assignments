CREATE TABLE Customer 
	  (Customer_id                      NUMBER(2) NOT NULL,                                                                                                                             
	   Customer_name                      VARCHAR2(20) NOT NULL,
	    Addresss                         VARCHAR2(10),                                                                                                                                                       
	   ContactName                    VARCHAR2(15),
	   CONSTRAINT PRIM_KEY_id     PRIMARY KEY (Customer_id)
	  );

CREATE TABLE Orders
	  (Order_id                      NUMBER(2) NOT NULL,                                                                                                                             
	   Customer_id                    NUMBER(2) NOT NULL,
       Employee_id                       NUMBER(2) NOT NULL,                                                                                                                                                    
	   CONSTRAINT PRIM_KEY_orderid     PRIMARY KEY (Order_id)
	  );
      
      ALTER TABLE Orders
    ADD CONSTRAINT FOR_KEY_od
	FOREIGN KEY (customer_id) REFERENCES Customer(Customer_id);

      
      
      select *
      from customer;
      
      select c.customer_id,c.customer_name,o.order_id
      from customer c join Orders o
      on (c.customer_id=o.customer_id);   ----so
      
       select customer_id,customer_name,order_id
      from customer natural join Orders ;
     
      
      ALTER TABLE Customer
MODIFY  Customer_name VARCHAR2(255);

alter table
   Orders
add
   customer_id NUMBER(2) ;  
   
   ALTER TABLE Orders
DROP COLUMN Customer_id ;
 

   
   
   CREATE TABLE Project
	  (ProjectManager                 VARCHAR2(20) NOT NULL,                                                                                                                             
	   ManagerID                      NUMBER(3) NOT NULL,
       Phone_Extension                VARCHAR2(20),   
       ProjectName                    VARCHAR2(20) NOT NULL,   
       ProjectID                      VARCHAR2(20) NOT NULL,  
       StartDate                      DATE,
       Budget                         VARCHAR2(20) NOT NULL
       );

       INSERT INTO Project  VALUES ( 'Dan','3','X7270','OS upgrade',101,'1 june 2017','12000');
       INSERT INTO Project  VALUES ( 'Dan','3','X7270','SQL Training',102,'3 April 2014','9000');
       INSERT INTO Project  VALUES ( 'Dan','3','X7270','New Tablet pcs',103,'11 May 2014','4200');
      INSERT INTO Project  VALUES ( 'Cho','2','X2114','Website Design',105,'7 June 2014','9000');
      INSERT INTO Project  VALUES ( 'Dan','3','X2114','Cloud hosting',106,'7 June 2014','9000');
      INSERT INTO Project  VALUES ( 'Dan','3','X2114','AI reserach',107,'7 June 2014','9000');
      INSERT INTO Project  VALUES ( 'Rajesh','1','X5754','New Web server',108,'7 June 2014','3000');
      INSERT INTO Project  VALUES ( 'Dan','3','X2114','wifi',109,'7 June 2014','9000');
      INSERT INTO Project  VALUES ( 'Dan','3','X2114','Client training',110,'7 June 2014','9000');
      INSERT INTO Project  VALUES ( 'Dan','3','X2114','DB upgrade',111,'7 June 2014','9000');



select projectManager,managerid,projectname
from project;

select projectmanager,managerid,count(ProjectName)
from project
group by projectmanager,managerid
having count(ProjectName)>=3;


INSERT INTO Project  VALUES ( 'Dan','3','X2114','DB upgrade',111,'7 June 2014','9000');

UPDATE PROJECT
SET ProjectName = 'Robotic problem'
where projectid=101;


UPDATE PROJECT
SET ProjectName = 'Science Research',managerid=2  --updating anamolies
where projectid=103;

DELETE FROM Project
WHERE ProjectName='Robotic problem';     --deleting anamolies
INSERT INTO Project  VALUES ( 'xkcda','3','','cdsncds',111,'7 June 2014','9000');
 
 ---To estabish a relationship we need to implement a foreign key

-----little bit effort to understand interact with tables---------



       

      
   
   select c.customer_name,c.customer_id,o.order_id
   from Customer c
    join Orders  o
   on(c.customer_id=o.customer_id);
   
   



      
      
       INSERT INTO Customer VALUES ( 0,'Dholon Akter','Elgarstraat','Dola Netherlands');
      -- INSERT INTO Orders VALUES ( 1,'Binod Nepali','Frederikalan','binod Netherlands');
       
              INSERT INTO Orders VALUES ( 1,1,10);

       
ALTER TABLE Orders
    ADD CONSTRAINT FOR_KEY_order 
	FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id);


select c.customer_id,c.customer_name,o.employee_id
from customer c join orders o
on(c.customer_id=o.customer_id);
    
    
    
    
