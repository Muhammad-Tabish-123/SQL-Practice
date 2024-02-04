/*
After Triggers
*/

--trigers on insert and on delete
--trigers location
-- showing message
--Inserted
--Deleted
--Adding message with data in new table (showing id , date and casting to strings) 24:00
--altering
-- multi trigers on one table one to save other to show 
-- In update one row is deleted and other is inserted

--ATri1.
create trigger tr_ShowMessageOnInsert
on Employee
after insert
as
begin
print ('Something happened at employee table')
end

Select*from Employee;
Insert into Employee values('Ashraf','Male',200,'Hyderabaad',4);

drop trigger tr_ShowMessageOnInsert;

--ATri2
create trigger tr_ShowValuesOnInsert
on Employee
after insert
as
begin
	select * from inserted
end

Insert into Employee values('Amjad','Male',200,'Hyderabaad',2);
drop trigger tr_ShowValuesOnInsert;

--ATri3
create trigger tr_ShowValuesOnDelete
on Employee
after delete
as
begin
Select * from deleted;
end

delete from Employee where Emp_Id=108;

Select * from Employee;

drop trigger tr_ShowValuesOnDelete;

--Ctreating action record table
create table MyRecords(
	id int identity,
	the_desc varchar(max) not null
);

drop table MyRecords
Select * from MyRecords;
Select * from Employee;

--ATri 1.1
alter trigger tr_ForInsert
on Employee
after insert
as
begin
declare @name varchar(50)
declare @id int
Select @id=  Emp_Id from inserted
Select @name=  Emp_Name from inserted
	Insert into MyRecords values('Employee with id '+ Cast(@id as varchar(50)) +' and name ' + Cast(@name as varchar(50)) + ' is inserted at: '+cast(GetDate() as varchar(50)))
	Select * from inserted
end
--ATri 1.2
create trigger tr_ForDelete
on Employee
after delete
as
begin
declare @id int
declare @name varchar(50)
select @id = Emp_Id from deleted
select @name= Emp_Name from deleted
insert into MyRecords values('Employee with id: '+ Cast(@id as varchar(50)) + '; and name: ' + cast(@name as varchar(50))+'; is deleted')
end
--ATri 1.3
create trigger tr_ForUpdate
on Employee
after update
as
begin 
declare @idBefore int
declare @nameBefore varchar(50)
select @idBefore= Emp_Id from deleted
select @nameBefore= Emp_Name from deleted
declare @idAfter as int
declare @nameAfter as varchar(50)
Select @idAfter= Emp_Id from inserted
Select @nameAfter= Emp_Name from inserted
insert into MyRecords values('Employee with id: '+cast(@idBefore as varchar(50)) + '; and name: '+cast(@nameBefore as varchar(50))+' is deleted')
insert into MyRecords values('Employee with id: '+cast(@idAfter as varchar(50)) + '; and name: '+cast(@nameAfter as varchar(50))+' is inserted')
end
--Testing1 Start
insert into Employee values('Alpha1','Male',200,'Sukhur',2);
update Employee set Gender='Female' where Emp_Name='Alpha1';
delete from Employee where Emp_Name='Alpha1';
select * from MyRecords;
--Testing1 End
--Droping triggers
Drop trigger [tr_ForDelete];
Drop trigger [tr_ForInsert];
Drop trigger [tr_ForUpdate];


/*
Instead of Triggers
Will cause operation not to be performed
You can still get data from inserted or deleted table
Can't have two instead of triggers on sigle command
Can be used with views(made from 2 or more tables) to delete data
*/
--Craeting trigger BTri1
create trigger tr_instead_of_insert
on Employee
instead of insert
as
begin
	print 'You can not create table'
end

insert into Employee values('Alpha1','Male',200,'Sukhur',2);
Select * from Employee;
-- Droping trigger
Drop trigger tr_instead_of_insert;

/*
DDL Triggers
Create , Alter or Drop
use rollback command to prevent from desired action
stored in programmabili
use on database while dropping
*/
--Craeting trigger CTri1
create trigger tr_DDL_onCreateTable
on database
for CREATE_TABLE
as
begin
	ROLLBACK
	print 'You are not allowed to create table'
end

disable trigger tr_DDL_onCreateTable on database;
enable trigger tr_DDL_onCreateTable on database;

--Testing
create table newTable(id  int identity);
--Drop table newTable;
--Droping trigger
Drop trigger [tr_DDL_onCreateTable] on database;


/*
Droping tables
*/
