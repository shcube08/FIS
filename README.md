# FIS
--union and union all
create table table2(Tid int identity,
Tname varchar(30),Grade char(1),Percent_age int)
 
insert into table2 values('Hamza','B',60),('Vinamr','A',80),('Vinuthna','B',70),
('Meghana','C',45)
 
select * from table1
select * from table2
 
select Tname,grade,percent_age from table1
union 
select Tname,grade,percent_age from table2
 
--intersect
create table sample1(Id int identity, Ename varchar(20),Age int, city varchar(20))
 
create table sample2(Bonusid int, Id int, bonusamount float)
 
insert into sample1 values('John',25,'Seatle'),('Ben',26,'NY'),('Robert',25,'Chicago')
 
insert into sample2 values(200,1,25000),(202,3,20000)
 
select * from sample1
select * from sample2
 
select sample1.Id,ename,sample2.bonusamount from sample1 left join sample2 on sample1.Id=sample2.Id
intersect
select sample1.Id,ename,sample2.bonusamount from sample1 right join sample2 on sample1.Id=sample2.Id
 
select sample1.Id,ename,sample2.bonusamount from sample1 left join sample2 on sample1.Id=sample2.Id
except
select sample1.Id,ename,sample2.bonusamount from sample1 right join sample2 on sample1.Id=sample2.Id
