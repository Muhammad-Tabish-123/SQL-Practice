/*
Sql Joins :

Inner
Left
Right
Full Outer
*/

create table employee_Table(
empid int unique not Null,
ename varchar(50) not null,
email varchar(50) not null,
designation varchar(50) not null
);
drop table employee_Table;
Select * from employee_Table;

insert into employee_Table values(11,'Amir','amir@gmail.com','Manager');
insert into employee_Table values(12,'Usman','usman@gmail.com','Assistant Manager');
insert into employee_Table values(13,'Anus','anus@gmail.com','IT Incharge');
insert into employee_Table values(14,'Umar','umar@gmail.com','Computer Operator');
insert into employee_Table values(15,'Uman','uman@gmail.com','Assistant Manager');


create table Department_Table(
Did int not null unique,
Dname varchar(50) not null,
Dsalary varchar(50) not null,
eid int not null
);
Drop table Department_Table;
Select*from Department_Table;
Insert into Department_Table values (111,'Administration','50000',13);
Insert into Department_Table values (222,'Accounts','60000',12);
Insert into Department_Table values (333,'IT','40000',11);
Insert into Department_Table values (444,'Acadmic','45000',14);
Insert into Department_Table values (555,'New','New',00);

Select * from employee_Table as T1 inner join Department_Table as T2 
on T1.empid = T2.eid;
Select ename, designation, Dname, Dsalary from employee_Table as T1 inner join Department_Table as T2 
on T1.empid = T2.eid;

Select * from employee_Table as T1 left join Department_Table as T2 
on T1.empid = T2.eid;
Select ename, designation, Dname, Dsalary from employee_Table as T1 left join Department_Table as T2 
on T1.empid = T2.eid;

Select * from employee_Table as T1 right join Department_Table as T2 
on T1.empid = T2.eid;
Select ename, designation, Dname, Dsalary from employee_Table as T1 right join Department_Table as T2 
on T1.empid = T2.eid;

Select * from employee_Table as T1 full outer join Department_Table as T2 
on T1.empid = T2.eid;
Select ename, designation, Dname, Dsalary from employee_Table as T1 full outer join Department_Table as T2 
on T1.empid = T2.eid;


--Self join--
create table employee_Manager(
eid int not null,
ename varchar(50),
mid int not null,
);

insert into employee_Manager values(1,'Ali',4);
insert into employee_Manager values(2,'Amir',4);
insert into employee_Manager values(3,'Anas',5);
insert into employee_Manager values(4,'Hamza',6);
insert into employee_Manager values(5,'Asghar',1);
insert into employee_Manager values(6,'Nasir',1);

Select * from employee_Manager;
Select* from employee_Manager as T1 
inner join employee_Manager as T2
on T1.mid=T2.eid;
Select T1.ename as Employee,T2.ename as Manager from employee_Manager as T1 
inner join employee_Manager as T2
on T1.mid=T2.eid;

Drop table employee_Manager;