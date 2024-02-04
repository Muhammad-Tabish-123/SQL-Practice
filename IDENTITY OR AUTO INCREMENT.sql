create table teacher_Table(
T_id int identity (100,5),
T_name varchar(50) not null,
T_Qualification varchar(50) not null,
T_Salary varchar(50) not null,
); 
Select * from teacher_Table;
Insert teacher_Table values('Amir','BSC','20000');
Insert teacher_Table values('Anas','Masters','24000');
Insert teacher_Table values('Hamza','BSC','27000');
Insert teacher_Table values('Zain','BBA','60000');

Select * from teacher_Table;

TRUNCATE TABLE teacher_Table;
Drop table teacher_Table;