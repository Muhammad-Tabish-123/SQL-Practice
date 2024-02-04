
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
Stored procedures is a set of structured query language
with an assigned name
stored in data base
Similar to functions of some programming languages that help in code reuse
-- There are two types (-)System defined or (-)User defined
--Store procedures might also have arguments
*/

--Creating procedures 1
create procedure spGetEmployees
as
begin
select Emp_Name,Gender FROM Employee;
end

execute spGetEmployees;

Drop procedure spGetEmployees;

--Creating procedures 2
create procedure spGetEmployeesById
@id int
as
begin
select Emp_Name,Gender FROM Employee where Emp_Id=@id;
end

execute spGetEmployeesById 100; 
execute spGetEmployeesById 101; 
execute spGetEmployeesById 102; 
execute spGetEmployeesById 103; 


Drop proc spGetEmployeesById;

--Creating procedures 3
create procedure spGetEmployeesByIdandName
@id int,
@name varchar(50)
as
begin
select Emp_Name,Gender FROM Employee where Emp_Id=@id and Emp_Name=@name;
end

execute spGetEmployeesByIdandName 100,'Usman'; 
execute spGetEmployeesByIdandName 101,'Anas'; 
execute spGetEmployeesByIdandName 102,'Anam'; 
execute spGetEmployeesByIdandName 103,'Ali'; 

--Alter
alter procedure spGetEmployeesByIdandName
@id int,
@name varchar(50)
--with encryption
as
begin
select * FROM Employee where Emp_Id=@id and Emp_Name=@name;
end

sp_helpText spGetEmployeesByIdandName;

Drop procedure spGetEmployeesByIdandName;

--Creating store procedure with output parameters
create proc spGetEmployeeByGender
@Gender varchar(50), --use as input
@EmployeeCount int output -- use to provide output
as
begin
select @EmployeeCount=count(Emp_Id) 
from Employee
where Gender=@Gender
end

--Execute following 3 lines at once
Declare @TotalEmployee int; --Declaring variable
exec spGetEmployeeByGender 'Male',@TotalEmployee output; --Passing output variable
select @TotalEmployee as Male; --Display stored value
exec spGetEmployeeByGender 'Female',@TotalEmployee output; 
select @TotalEmployee as Female; 

Drop proc spGetEmployeeByGender;

/*
Creating users/Roles
*/
create role dbstoreProcedureonlyAccess;
grant execute to dbstoreProcedureonlyAccess;
Drop role dbstoreProcedureonlyAccess;

--Drop tables
Drop table Departments;
Drop table Employee;
