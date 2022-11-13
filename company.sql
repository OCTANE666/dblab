DROP DATABASE IF EXISTS Company;
CREATE DATABASE Company;


USE Company;


DROP TABLE IF EXISTS DEPARTMENT;
CREATE TABLE DEPARTMENT (
  dname        varchar(25) not null,
  dnumber      int not null,
  mgrssn      int not null, 
  mgrstartdate date,
  CONSTRAINT pk_Department primary key (dnumber)
);

DROP TABLE IF EXISTS EMPLOYEE;
CREATE TABLE EMPLOYEE (
  name    varchar(15) not null, 
  ssn     int, 
  bdate    date,
  address  varchar(50),
  sex      char,
  salary   decimal(10,2),
  superssn int,
  dno      int,
  CONSTRAINT pk_employee primary key (ssn)
  #'--CONSTRAINT fk_employee_employee foreign key (superssn) references EMPLOYEE(ssn), -- Constraint Will be added later to prevent cyclic referential itegrity violation'
 
);

DROP TABLE IF EXISTS DEPENDENT;
CREATE TABLE DEPENDENT (
   essn           int,
  dependent_name varchar(15),
 
  sex            char,
  bdate          date,
  relationship   varchar(8)
 
);

DROP TABLE IF EXISTS DEPT_LOCATIONS;
CREATE TABLE DEPT_LOCATIONS (
  dnumber   int,
  dlocation varchar(15), 
  CONSTRAINT pk_dept_locations primary key (dnumber,dlocation),
  CONSTRAINT fk_deptlocations_department foreign key (dnumber) references DEPARTMENT(dnumber)
);

DROP TABLE IF EXISTS PROJECT;
CREATE TABLE PROJECT (
  pname      varchar(25) not null,
  pnumber    int,
  plocation  varchar(15),
  dnum       int not null,
  CONSTRAINT ok_project primary key (pnumber),
  CONSTRAINT uc_pnumber unique (pname)
 
);

DROP TABLE IF EXISTS WORKS_ON;
CREATE TABLE WORKS_ON (
  essn   int,
  pno    int,
  hours  decimal(4,1),
  CONSTRAINT pk_worksOn primary key (essn,pno),
  CONSTRAINT fk_workson_employee foreign key (essn) references EMPLOYEE(ssn),
  CONSTRAINT fk_workson_project foreign key (pno) references PROJECT(pnumber)
);



-- Insert all records 
INSERT INTO DEPARTMENT VALUES ('Research',1,107,'2001-07-15');
INSERT INTO DEPARTMENT VALUES ('Accounts',2,104,'2000-08-11');
INSERT INTO DEPARTMENT VALUES ('Administrator',4,101,'2002-11-02');
INSERT INTO DEPARTMENT VALUES ('Headquaters',3,102,'2001-01-07');
INSERT INTO DEPARTMENT VALUES ('Development',5,100,'2000-01-07');


INSERT INTO EMPLOYEE VALUES ('Vishnu',100,'1985-05-13','Mumbai','M',1000,107,5 );
INSERT INTO EMPLOYEE VALUES ('Raj',101,'1989-07-21','Delhi','M',2000,100,3 );
INSERT INTO EMPLOYEE VALUES ('Sonu',102,'1987-06-01','Hyderbad','M',3000,101,5 );
INSERT INTO EMPLOYEE VALUES ('Jeniffer',104,'1986-10-15','Delhi','F',4000,104,4 );
INSERT INTO EMPLOYEE VALUES ('Priya',107,'1989-01-17','Banglore','F',5000,null,1 );





INSERT INTO DEPENDENT VALUES ('101','Rajesh','M','1987-05-17','Father');
INSERT INTO DEPENDENT VALUES ('104','Jeniffer','F','1986-10-15','Spouse');
INSERT INTO DEPENDENT VALUES ('102','William','M','1986-10-03','Son');
INSERT INTO DEPENDENT VALUES ('100','Rahul','M','1987-03-17','Son');
INSERT INTO DEPENDENT VALUES ('107','Jasmine','F','1987-04-16','Spouse');

INSERT INTO DEPT_LOCATIONS VALUES (5,'Delhi');
INSERT INTO DEPT_LOCATIONS VALUES (4,'Lucknow');
INSERT INTO DEPT_LOCATIONS VALUES (2,'Hyderbad');
INSERT INTO DEPT_LOCATIONS VALUES (3,'Kochi');


INSERT INTO PROJECT VALUES ('Develop',2,'Delhi',4);
INSERT INTO PROJECT VALUES ('AI',3,'Pune',2);
INSERT INTO PROJECT VALUES ('web_development',1,'Kochi',5);
INSERT INTO PROJECT VALUES ('android_app',4,'Delhi',1);
INSERT INTO PROJECT VALUES ('Big-data',5,'Mumbai',4);


INSERT INTO WORKS_ON VALUES (102,5,48); 
INSERT INTO WORKS_ON VALUES (104,2,72); 
INSERT INTO WORKS_ON VALUES (104,3,24);
INSERT INTO WORKS_ON VALUES (100,2,72);
INSERT INTO WORKS_ON VALUES (101,1,30);
INSERT INTO WORKS_ON VALUES (107,2,35);
INSERT INTO WORKS_ON VALUES (107,3,48);




-- Adding FK constraint after loading data into system
Alter table EMPLOYEE
ADD foreign key (superssn) references EMPLOYEE(ssn);

Alter table EMPLOYEE
ADD foreign key (dno) references DEPARTMENT(dnumber);

Alter table DEPARTMENT
ADD foreign key (mgrssn) references EMPLOYEE(ssn);

Alter table PROJECT
ADD foreign key (dnum) references DEPARTMENT(dnumber);

Alter table WORKS_ON
ADD foreign key (essn) references EMPLOYEE(ssn);

Alter table DEPENDENT
ADD foreign key (essn) references EMPLOYEE(ssn);








