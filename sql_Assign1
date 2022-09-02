create table Clients
(
client_id int primary key,
Cname varchar(40) not null,
Address varchar(30),
Email varchar(30),
Phone int,
Business varchar(20) not null
constraint uniqeemail unique(email)
)



create table Departments
(
Deptno int primary key,
Dname varchar(15) not null,
Loc varchar(20)
)


create table Employees
(
Empno int primary key,
Ename varchar(20) not null,
Job varchar(15),
Salary int,
Deptno int references Departments(Deptno),
constraint slrychk check(Salary > 0)
)



create table Projects
(
Project_ID int primary key,
Descr varchar(30) not null,
Start_Date date,
Planned_End_Date date,
Actual_End_Date date,
Budget int,
Client_ID int references Clients(client_id),
constraint dtCheck check(Actual_End_Date > Planned_End_Date),
constraint bdgtchk check(Budget>0)
)



create table EmpProjectTasks
(
Project_ID int references Projects(Project_ID),
Empno int references Employees(Empno),
Start_Date date,
End_Date date,
Task varchar(25) not null,
status varchar(15) not null,

primary key(Project_ID,Empno)
)

sp_help EmpProjectTasks

insert into Clients values(1001,'ACME Utilities', 'Noida','email@acmeutil.com',9567880031,'Manufacturing'),
(1002, 'Trackon consultants', 'Mumbai', 'email@trackon.com', 8734210090, 'Consultant'),
							(1003, 'Money Saver dist', 'Kolkata', 'email@moneysaver.com', 7799886655, 'Reseller'),
							 (1004, 'lawful corp ', 'chennai', 'email@lawful.com', 9210342219, 'Professional')

insert into Departments values(10, 'Design', 'Pune')

insert into Employees values(7001, 'Emp1', 'Analyst' , 25000, 10)

insert into Projects values(401, 'Inventory', '2011/04/01', '2011/10/01', '2011/10/31', 150000, 1001)

insert into Projects values(402, 'Accounting', '2011/08/01', '2012/01/01', null, 500000, 1002),
							(403, 'Payroll', '2011/10/01', '2011/12/31', null, 75000, 1003),
							 (404, 'Contact Mgmt', '2011/11/01', '2011/12/31', null, 50000, 1004)

insert into EmpProjectTasks values(401, 7001, '2011-04-01', '2011-04-20', 'System analyst', 'Completed')
