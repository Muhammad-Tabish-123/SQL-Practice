/*
Views in sql server
They are just saved sql queries
A view can also be considered as virtual table
*/


create table Departments(
id int not null identity Primary key,
dpt_name varchar(50) not null
);

create table Employee(
Emp_Id int not null identity(100,1),
Emp_Name varchar(50) not null,
Gender varchar(6) not null,
Salary int not null,
City varchar(50) not null,
Dept_id int not null foreign key references Departments(id)
);

insert into Departments values('Accounts');
insert into Departments values('HR');
insert into Departments values('Administration');
insert into Departments values('Counsling');

insert into Employee values('Usman','Male',25000,'Hyderabaad',2);
insert into Employee values('Anas','Male',45000,'Karachi',1);
insert into Employee values('Anam','Female',35000,'Sukhur',3);
insert into Employee values('Ali','Male',45000,'Hyderabaad',4);
insert into Employee values('Aghar','Male',35000,'Karachi',2);
insert into Employee values('Usama','Male',25000,'Sukhur',1);

Select * from Departments;
Select * from Employee;

/*
Create view to display deparment name along with employee details
-Create view
-Give access to employee
*/
--Creating views
create view vW_forEmployees 
as
Select A.Emp_Id,A.Emp_Name,B.dpt_name,A.Gender,A.City from Employee as A
join Departments as B 
on B.id=A.Dept_id;


create view vW_forHrEmployees 
as
Select A.Emp_Id,A.Emp_Name,B.dpt_name,A.Gender,A.City from Employee as A
join Departments as B 
on B.id=A.Dept_id
where dpt_name='HR';

create view vW_forAccountsEmployees 
as
Select A.Emp_Id,A.Emp_Name,B.dpt_name,A.Gender,A.City from Employee as A
join Departments as B 
on B.id=A.Dept_id
where dpt_name='Accounts';

--Displaying views
Select * from vW_forEmployees;
Select * from vW_forHrEmployees;
Select * from vW_forAccountsEmployees;

--Getting view code
sp_helptext vW_forEmployees;

--Altering: Add alter instead of create
alter view vW_forAccountsEmployees 
as
Select A.Emp_Id,A.Emp_Name,B.dpt_name,A.Gender,A.City from Employee as A
join Departments as B 
on B.id=A.Dept_id
where dpt_name='Accounts' or dpt_name='Counsling';

-- Updating,deleting ,insersting in views cause change in orignal tables because views are virtual

--Droping views
Drop view vW_forAccountsEmployees;
Drop view vW_forEmployees;
Drop view vW_forHrEmployees;

/*
Like operator used for searching
Wild cards: %, _, []
*/

-- % represent 0,1 or multiple characters
Select * from Employee;
Select * from Employee where Emp_Name like 'a%'; --start with a
Select * from Employee where Emp_Name like '%a'; --end with a
Select * from Employee where Emp_Name like '%a%'; --contating a 
Select * from Employee where Emp_Name like '%a%i%'; 

-- _ represent sigle character
Select * from Employee;
Select * from Employee where Emp_Name like 'a__'; --Total 3 charters 1 known two unknown
Select * from Employee where Emp_Name like '__a__';
Select * from Employee where Emp_Name like 'a___';
Select * from Employee where Emp_Name like '____'; 

-- [] for multiple characters
Select * from Employee;
Select * from Employee where Emp_Name like '[a,b,c,u]%'; --Starting with a or b or c or u
Select * from Employee where Emp_Name like '%[n,s,m]';
Select * from Employee where Emp_Name like '%[a-m]';--Ending with a to m
Select * from Employee where Emp_Name like '_l%';--unknown first ,known second, remaining unknown


/*
SubQuery used after where
It is select statment
written inside ()
*/
Select * from Employee;
--Select with subQuery
Select * from Employee
where Salary in (Select Salary from Employee where Salary>30000);

Select * from Employee
where Emp_Id in (Select Emp_Id from Employee where City='Hyderabaad');

Select * from Employee
where Emp_Id in (Select Emp_Id from Employee where Gender='Male');

--Update with subQuery
Update Employee set Salary=200 
where Emp_Id in (Select Emp_Id from Employee where city='Hyderabaad');
Select * from Employee;
-- Delete with subQuery
-- multiple table subQuery
Select * from Departments;
Select * from Employee
where Dept_id in (Select id from Departments where dpt_name='Accounts');
/*
Types of subQueries
Scaler subQuery: That return one row to the outer subQuery (=,>,>=,<,<=,!=)
MultiValued subQuery: That return more than one row to the outer subQuery (in,any,all)

Self contained && Corelated subQueries 
Self-Contained: That is not dependent on outer query to show output
Corelated SubQueries:  That is dependent on outer query as it require aliais refrence

We can use aggregate functions min,max,count in subqueries wihch can not be use with where normally
*/

/*
Select into is used for making back up of a table by creating new table
Rows and columns can be specified
Other data bases can be used for backup
You can also copy columns with no data (where 1<>1) <> means not equal
*/
Select * into EmployeeBackup from Employee;
Select * from EmployeeBackup;
Drop table EmployeeBackup;
/*
Insert Into With Select 
Copy data rows from 1 table to other table(already exsit)
*/


--Droping tables
Drop table Departments;
Drop table Employee;



