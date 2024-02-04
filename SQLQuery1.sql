create database SqlPractice1;

use SqlPractice1;

create table Student_Table(ID int,SName varchar(50),RollNo int,Class varchar(50));

select * from Student_Table;

insert into Student_Table values(1,'Christiana',2000,'5th');

insert into Student_Table(ID,SName,RollNo,Class) values (2,'Mavis',2001,'5th');
insert into Student_Table(ID,SName,RollNo,Class) values (3,'Yvette',2001,'5th');
insert into Student_Table(ID,SName,RollNo,Class) values (4,'John',2002,'5th');
insert into Student_Table(ID,SName,RollNo,Class) values (5,'Amanfo',2003,'5th');
insert into Student_Table(ID,SName,RollNo,Class) values (6,'Davis',2004,'5th');
insert into Student_Table(ID,SName,RollNo,Class) values (7,'Kawame',2005,'5th');


update Student_Table set RollNo=2002,SName='' where ID=3;
update Student_Table set SName='Yvette' where ID=3;

update Student_Table set RollNo=2003 where ID=4;
update Student_Table set RollNo=2004 where ID=5;
update Student_Table set RollNo=2005 where ID=6;
update Student_Table set RollNo=2006 where ID=7;


delete from Student_Table where id =7 OR id=6;

truncate table Student_Table;
Select * from Student_Table;


Alter table Student_Table Add A int not null;
Alter table Student_Table Drop column A;
Alter table Student_Table Add A int not null;
Alter table Student_Table Alter Column A varchar(50);
--Alter table Student_Table ALTER COLUMN A to B;
exec sp_rename 'Student_Table.A','B','Column';
exec sp_rename 'Student_Table','B_Table';
exec sp_rename 'B_Table','Student_Table';


Select * from Student_Table;
Drop table Student_Table;

--Constraints---------
create table Employee_Table(EmpId int not null unique,EmpName varchar(50) not null, EmpDpt varchar(50) not null, Salary varchar(50) not null);
Select*from Employee_Table;
Insert into Employee_Table values(1,'Ali','Accounts','35000');
Insert into Employee_Table values(2,'Amir','Admin','35000');
Select*from Employee_Table;
Drop table Employee_Table;

--check, default, primarykey, Drop table
create table Voter_Table(VoterId int primary key,VoterName varchar(50),Age int check(Age>=18) default(18));
--Not working when there are some contratints applied
--Alter table Voter_Table Drop Column Age;
--Alter table Voter_Table Add Age int check(Age>=18) default(18);
insert into Voter_Table (VoterId,VoterName) values(1,'Ali');
insert into Voter_Table values (2,'Amir',22);
insert into Voter_Table values (3,'Anus',19);
insert into Voter_Table values (4,'Usman',33);
insert into Voter_Table values (5,'Zain',26);
insert into Voter_Table values (6,'Taha',20);

truncate table Voter_Table;
Select*from Voter_Table;
Drop table Voter_Table;
--Select, where, or, selectByColumnNames, OrderBy
Select VoterName from Voter_Table where VoterId=5 or VoterID=1 ORDER BY VoterName desc;
Select * from Voter_Table where VoterId=5 or VoterID=1 ORDER BY VoterName desc;

--Creating PK,FK + Deleteing FK using alter + tRY DELETEING Data + adding FK
create table Customer_Table(CustomerId int primary key,CustomerName varchar(50),CAddress varchar(max),City varchar(50));
create table Order_Table(OrderId int Primary Key,OrderItem varchar(50),OrderQuantity int,PriceOf1 int,CustomerId int Foreign Key references Customer_Table(CustomerId));
Drop table Customer_Table;
Drop table Order_Table;
insert into Customer_Table values(1 ,'Ali','LatifaAbad Unit:12','HydraAbad');
insert into Customer_Table values(2 ,'Amir','LatifaAbad Unit:11','HydraAbad');
insert into Customer_Table values(3 ,'Anas','Gulshan e Iqbal','Karachi');
insert into Customer_Table values(4 ,'Usman','LatifaAbad Unit:8','HydraAbad');
insert into Customer_Table values(5 ,'Afnan','LatifaAbad Unit:6','HydraAbad');

insert into Order_Table values(100,'Hard Disk',2,500,4);
insert into Order_Table values(101,'RAM',1,350,2);
insert into Order_Table values(102,'Printer',2,4000,3);
insert into Order_Table values(103,'Monitor',3,1500,4);
insert into Order_Table values(104,'Mouse',3,300,5);

Update Order_Table set CustomerId=3 where CustomerId=5;
Update Order_Table set CustomerId=5 where CustomerId=3;


Update Customer_Table set CustomerId=6 where CustomerId=1;
Update Customer_Table set CustomerId=1 where CustomerId=6;

Delete from Customer_Table where CustomerId=1;
Delete from Customer_Table where CustomerId=5;
Delete from Order_Table where CustomerId=5;

alter table Order_Table drop constraint FK__Order_Tab__Custo__5441852A;
alter table Order_Table add foreign key(CustomerId) references Customer_Table(CustomerId) ;


Select*from Customer_Table;
Select*from Order_Table;

truncate table Order_Table;



--Referential Integrity Constraints
--NoAction (Default)
--Cascade
--Set Default
--Set Null
create table Customer_Table(CustomerId int primary key,CustomerName varchar(50),CAddress varchar(max),City varchar(50));
create table Order_Table(OrderId int Primary Key,OrderItem varchar(50),OrderQuantity int,PriceOf1 int,
CustomerId int Foreign Key references Customer_Table(CustomerId) 
on update set default
on delete set default
);
alter table Order_Table add default 0 for CustomerId;

Drop table Customer_Table;
Drop table Order_Table;
insert into Customer_Table values(0 ,'NoName','NoAddress','NoCity');
insert into Customer_Table values(1 ,'Ali','LatifaAbad Unit:12','HydraAbad');
insert into Customer_Table values(2 ,'Amir','LatifaAbad Unit:11','HydraAbad');
insert into Customer_Table values(3 ,'Anas','Gulshan e Iqbal','Karachi');
insert into Customer_Table values(4 ,'Usman','LatifaAbad Unit:8','HydraAbad');
insert into Customer_Table values(5 ,'Afnan','LatifaAbad Unit:6','HydraAbad');

insert into Order_Table values(100,'Hard Disk',2,500,4);
insert into Order_Table values(101,'RAM',1,350,2);
insert into Order_Table values(102,'Printer',2,4000,3);
insert into Order_Table values(103,'Monitor',3,1500,4);
insert into Order_Table values(104,'Mouse',3,300,5);

Update Order_Table set CustomerId=3 where CustomerId=5;
Update Order_Table set CustomerId=5 where CustomerId=3;


Update Customer_Table set CustomerId=6 where CustomerId=2;
Update Customer_Table set CustomerId=2 where CustomerId=6;

Delete from Customer_Table where CustomerId=5;

--alter table Order_Table drop constraint FK__Order_Tab__Custo__656C112C;
--alter table Order_Table add foreign key(CustomerId) references Customer_Table(CustomerId) ;
alter table Order_Table add foreign key(CustomerId) references Customer_Table(CustomerId)
on delete set default
on update set Null;

Select*from Customer_Table;
Select*from Order_Table;

truncate table Order_Table;


--Alter command >> 
--Changing db name,Chnaging table name, Adding column, Deleting column
--Changing data type
alter database SQLPractice1 modify name= SQLPractice;
execute sp_renamedb 'SQLPractice1','SQLPractice';
execute sp_renamedb 'SQLPractice','SQLPractice1';

execute sp_rename 'Customer_Table','New_Customer_Table'
alter table New_Customer_Table add city2 int;
alter table New_Customer_Table drop column city2 ;
alter table New_Customer_Table alter column city2 varchar(50);

Select*from New_Customer_Table;
Select*from Order_Table;

Drop table New_Customer_Table;

 --Adding droping sql contraints using alter
 -- Not Null
 --Unique
 --Primary key
 --Foreign key
 --Check
 --Default

 create table Voter_Table(
 VoterId int ,
 VoterName varchar(50),
 Age int 
 );
 Drop table Voter_Table;
 Select*from Voter_Table;

 alter table Voter_Table alter column VoterName varchar(50) not Null;
 alter table Voter_Table alter column VoterName varchar(50) Null;

 alter table Voter_Table add unique (VoterId);
 alter table Voter_Table drop constraint UQ__Voter_Ta__12D25BF96EC2A9CE;

 alter table Voter_Table alter column VoterId int not Null;
 alter table Voter_Table add Primary Key(VoterId);
 alter table Voter_Table drop constraint [PK__Voter_Ta__12D25BF8DB981A09];

 alter table Voter_Table add check(Age>=18);
 alter table Voter_Table drop constraint [CK__Voter_Table__Age__778AC167];

 alter table Voter_Table add default 18 for Age;
 alter table Voter_Table drop constraint [DF__Voter_Table__Age__787EE5A0];