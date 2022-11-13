-- droping all foreign keys

alter table  DEPARTMENT drop foreign key DEPARTMENT_ibfk_1;                     
alter table  EMPLOYEE drop foreign key EMPLOYEE_ibfk_2;
alter table  EMPLOYEE drop foreign key EMPLOYEE_ibfk_1;
alter table  DEPT_LOCATIONS drop foreign key fk_deptlocations_department;
alter table  WORKS_ON drop foreign key fk_workson_employee;
alter table  PROJECT drop foreign key PROJECT_ibfk_1;
alter table  WORKS_ON drop foreign key fk_workson_project;
alter table  DEPENDENT drop foreign key DEPENDENT_ibfk_1; 
alter table  WORKS_ON drop foreign key WORKS_ON_ibfk_1;


-- adding foreign key with on delete cascade
Alter table DEPARTMENT
ADD foreign key (mgrssn) references EMPLOYEE(ssn) ON DELETE CASCADE;

Alter table EMPLOYEE
ADD foreign key (dno) references DEPARTMENT(dnumber) ON DELETE CASCADE;

Alter table EMPLOYEE
ADD foreign key (superssn) references EMPLOYEE(ssn) ON DELETE CASCADE;

Alter table DEPT_LOCATIONS
ADD foreign key (dnumber) references DEPARTMENT(dnumber) ON DELETE CASCADE;

Alter table WORKS_ON
ADD foreign key (essn) references EMPLOYEE(ssn) ON DELETE CASCADE;

Alter table WORKS_ON
ADD foreign key (PNO) references PROJECT(PNUMBER) ON DELETE CASCADE;

Alter table PROJECT
ADD foreign key (dnum) references DEPARTMENT(dnumber) ON DELETE CASCADE;

Alter table DEPENDENT
ADD foreign key (essn) references EMPLOYEE(ssn) ON DELETE CASCADE;






--21) delete the dpt no 3 from database

Delete from DEPARTMENT where dnumber=3;


-- 22 delete employees of research dpt
Delete from EMPLOYEE where dno in (SELECT dnumber from DEPARTMENT where dname='Research');


-- 24) change the location dnum of projectno 10 to kerala and 5 
UPDATE PROJECT set plocation='kolkata', dnum=5 where PNUMBER=2;
SELECT * from PROJECT

--25) give all employee in the sales dpt a 10% hike
UPDATE EMPLOYEE SET salary= salary + ((salary * 10) / 100) WHERE dno in(SELECT dnumber  from DEPARTMENT where dname='Sales');


