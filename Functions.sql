/*
Functions
*/
--AF1
Create function ShowMessage()
returns varchar(100)
as
begin
return 'Welcome to function'
end

select dbo.ShowMessage();

Drop function ShowMessage;
--AF2
create function TakeANumber(@num  int)
returns int
as
begin
return (@num * @num)
end

Select dbo.TakeANumber(2);
Select dbo.TakeANumber(3);
Select dbo.TakeANumber(4);

Drop function TakeANumber;

--AF3
create function Addition(@num1 int,@num2 int)
returns int
as
begin
return (@num1+@num2)
end

Select dbo.Addition(1,2);
Select dbo.Addition(10,20);
Select dbo.Addition(11,22);
Select dbo.Addition(55,-22);

Drop function Addition;

--AF4
--With if and aelse
create function CheckVoterAge(@age int)
returns varchar(100)
as
begin
declare @str varchar(100)
if @age>=18
begin
set @str= 'You are eligible to vote'
end
else
begin
set @str= 'You are not eligible to vote'
end
return @str
end

select dbo.CheckVoterAge(18);
select dbo.CheckVoterAge(10);

Drop function CheckVoterAge;

--BF1
create function fnSelectData()
returns table
as
return(Select* from Employee)

select * from fnSelectData();
drop function fnSelectData;

--CF1
Select * from Employee;
create function fn_GetEmployeeByGender(@Gender as varchar(10))
returns @MyTable table(id int,E_Name varchar(50),gender varchar(50))
as
begin
Insert into @MyTable select Emp_Id,Emp_Name,Gender from Employee where Gender=@Gender
RETURN
end

Select * from fn_GetEmployeeByGender('mALE');
Select * from fn_GetEmployeeByGender('Female');


