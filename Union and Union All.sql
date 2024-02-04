--Union and Union All
create table footBallPratcipants(
id int not null identity,
pname varchar(50) not null,
email varchar(50) not null
);
Insert into footBallPratcipants values('Ali','ali@gmail.com');
Insert into footBallPratcipants values('Aslam','aslam@gmail.com');
Insert into footBallPratcipants values('Arshid','arshid@gmail.com');

create table hockeyPratcipants(
hid int not null identity,
pname varchar(50) not null,
email varchar(50) not null
);

Insert into hockeyPratcipants values('Ali','ali@gmail.com');
Insert into hockeyPratcipants values('Yosaf','yousaf@gmail.com');
Insert into hockeyPratcipants values('Mushtaq','mushtaq@gmail.com');


Select* from footBallPratcipants;
Select* from hockeyPratcipants;

Select* from footBallPratcipants
union
Select* from hockeyPratcipants;
Select* from footBallPratcipants
union all
Select* from hockeyPratcipants;

--INTERSECT AND EXCEPT
--INTERSECT
Select* from footBallPratcipants
Intersect
Select* from hockeyPratcipants;
--EXCEPT
Select* from footBallPratcipants
EXCEPT
Select* from hockeyPratcipants;


truncate table hockeyPratcipants;
Drop table footBallPratcipants;
Drop table hockeyPratcipants;