--Aggregate Methods

--SUM
--MAX
--Min
--AVG
--COUNT

create table Aggregate_Table(
Sr# int not null identity,
stName varchar(50) not null,
CityName varchar(50) not null,
Class varchar(50) not Null,
Fee int,
);


insert into Aggregate_Table values('Álpha1','A','1st',1000);
insert into Aggregate_Table values('Álpha2','A','2nd',2000);
insert into Aggregate_Table values('Álpha3','A','3rd',3000);
insert into Aggregate_Table values('Álpha4','B','1st',1000);
insert into Aggregate_Table values('Álpha5','B','2nd',2000);
insert into Aggregate_Table values('Álpha6','C','3rd',3000);
insert into Aggregate_Table values('Álpha7','C','1st',1000);
insert into Aggregate_Table values('Álpha8','C','2nd',2000);
insert into Aggregate_Table values('Álpha9','C','3rd',3000);
insert into Aggregate_Table values('Álpha10','C','1st',1000);

Select * from Aggregate_Table;
Select sum(Fee) from Aggregate_Table;
Select max(Fee) from Aggregate_Table;
Select min(Fee) from Aggregate_Table;
Select avg(Fee) from Aggregate_Table;
Select count(Fee) from Aggregate_Table;


--Group By
Select CityName, sum(Fee) from Aggregate_Table Group by CityName;
Select Class, sum(Fee) from Aggregate_Table Group by Class;
Select CityName, count(stName) from Aggregate_Table Group by CityName;

--Having
Select CityName, sum(Fee) from Aggregate_Table Group by CityName having CityName in ('A','B');
Select Class, sum(Fee) from Aggregate_Table Group by Class having sum(Fee)>5000;
--Select CityName, count(stName) as TotalStudents from Aggregate_Table Group by CityName;

--Order by
Select * from Aggregate_Table order by stName asc;
Select * from Aggregate_Table order by stName desc;
Select * from Aggregate_Table order by CityName desc,Fee desc;
Select * from Aggregate_Table order by CityName desc;

--!!Droping table!!
Drop table Aggregate_Table;


