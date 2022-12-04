-- Q1 Increase the salary of employee with ssn=100....

create table Employee(name varchar(20),ssn int primary key,salary int,exp int);
insert into Employee values('anil',400,12000,7);

insert into Employee values('rani',100,10000,5);

insert into Employee values('raja',200,11000,5);

insert into Employee values ('anu',300,12000,6);

select * from employee;

DECLARE 
    CURSOR employee_cur IS 
      SELECT name, 
             salary, 
             exp 
      FROM   Employee 
      where ssn=100 
      FOR UPDATE; 
    incr_sal NUMBER; 
BEGIN 
    FOR employee_rec IN employee_cur LOOP 
        IF employee_rec.exp >5  THEN 
          incr_sal := 2000; 
        ELSE 
          incr_sal := 1000; 
        END IF; 
 
        UPDATE Employee 
        SET    salary = salary +  incr_sal 
        WHERE  CURRENT OF employee_cur; 
    END LOOP; 
END; 
