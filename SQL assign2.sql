--****************************************************************************************************************************************
create table tblDPT(
	deptno numeric(4) primary key,
	dname varchar(40),
	loc varchar(40)
)
create table tblEMP(
	empno int primary key, 
	ename varchar(40) not null, 
	job varchar(40),
	mgr_id int,
	hiredate date not null,
	salary numeric(7),
	comm numeric(6),
	deptno numeric(4) foreign key references tblDPT(deptno)
)

--___________________________________________________________________________________________________________________________________________



INSERT INTO tblDPT(Deptno,Dname,Loc) VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO tblDPT(Deptno,Dname,Loc) VALUES (20,'RESEARCH','DALLAS');
INSERT INTO tblDPT(Deptno,Dname,Loc) VALUES (30,'SALES','CHICAGO');
INSERT INTO tblDPT(Deptno,Dname,Loc) VALUES (40,'OPERATIONS','BOSTON');

--___________________________________________________________________________________________________________________________________________

INSERT INTO tblEMP(EMPNO,ENAME,JOB,MGR_Id,HIREDATE,SALARY,COMM,DEPTNO) VALUES (7369,'SMITH','CLERK','7902','17-DEC-80',800,NULL,20);
INSERT INTO tblEMP(EMPNO,ENAME,JOB,MGR_Id,HIREDATE,SALARY,COMM,DEPTNO) VALUES (7499,'ALLEN','SALESMAN','7698','20-FEB-81',1600,300,30);
INSERT INTO tblEMP(EMPNO,ENAME,JOB,MGR_Id,HIREDATE,SALARY,COMM,DEPTNO) VALUES (7521,'WARD','SALESMAN','7698','22-FEB-81',1250,500,30);
INSERT INTO tblEMP(EMPNO,ENAME,JOB,MGR_Id,HIREDATE,SALARY,COMM,DEPTNO) VALUES (7566,'JONES','MANAGER','7839','02-APR-81',2975,NULL,20);
INSERT INTO tblEMP(EMPNO,ENAME,JOB,MGR_Id,HIREDATE,SALARY,COMM,DEPTNO) VALUES (7654,'MARTIN','SALESMAN','7698','28-SEP-81',1250,1400,30);
INSERT INTO tblEMP(EMPNO,ENAME,JOB,MGR_Id,HIREDATE,SALARY,COMM,DEPTNO) VALUES (7698,'BLAKE','MANAGER','7839','01-MAY-81',2850,NULL,30);
INSERT INTO tblEMP(EMPNO,ENAME,JOB,MGR_Id,HIREDATE,SALARY,COMM,DEPTNO) VALUES (7782,'CLARK','MANAGER','7839','09-JUN-81',2450,NULL,20);
INSERT INTO tblEMP(EMPNO,ENAME,JOB,MGR_Id,HIREDATE,SALARY,COMM,DEPTNO) VALUES (7788,'SCOTT','ANALYST','7566','19-APR-87',3000,NULL,20);
INSERT INTO tblEMP(EMPNO,ENAME,JOB,MGR_Id,HIREDATE,SALARY,COMM,DEPTNO) VALUES (7839,'KING','PRESIDENT',NULL,'17-NOV-81',5000,NULL,10);
INSERT INTO tblEMP(EMPNO,ENAME,JOB,MGR_Id,HIREDATE,SALARY,COMM,DEPTNO) VALUES (7844,'TURNER','SALESMAN','7698','08-SEP-81',1500,0,30);
INSERT INTO tblEMP(EMPNO,ENAME,JOB,MGR_Id,HIREDATE,SALARY,COMM,DEPTNO) VALUES (7876,'ADAMS','CLERK','7788','23-MAY-87',1100,NULL,20);
INSERT INTO tblEMP(EMPNO,ENAME,JOB,MGR_Id,HIREDATE,SALARY,COMM,DEPTNO) VALUES (7900,'JAMES','CLERK','7698','03-DEC-81',950,NULL,30);
INSERT INTO tblEMP(EMPNO,ENAME,JOB,MGR_Id,HIREDATE,SALARY,COMM,DEPTNO) VALUES (7902,'FORD','ANALYST','7566','03-DEC-81',3000,NULL,20);
INSERT INTO tblEMP(EMPNO,ENAME,JOB,MGR_Id,HIREDATE,SALARY,COMM,DEPTNO) VALUES (7934,'MILLER','CLERK','7782','23-JAN-82',1300,NULL,10);
INSERT INTO tblEMP(EMPNO,ENAME,JOB,MGR_Id,HIREDATE,SALARY,COMM,DEPTNO) VALUES (7935,'MILLER-2','CLERK','7782','23-JAN-82',1300,NULL,null);


select * from tblDPT;
select * from tblEMP;
--___________________________________________________________________________________________________________________________________________
select ename from tblEMP where ename like 'A%';
--___________________________________________________________________________________________________________________________________________
select * from tblEMP where mgr_id is NULL;
--___________________________________________________________________________________________________________________________________________
select ename, empno, salary from tblEMP where salary between 1200 and 1400;
--___________________________________________________________________________________________________________________________________________
select ename, salary from tblEMP e join tblDPT d on  e.deptno = d.deptno where dname = 'RESEARCH';
--___________________________________________________________________________________________________________________________________________
update tblEMP set salary = ( salary + salary * 0.1) where deptno = (select deptno from tblDPT where dname = 'RESEARCH');
--___________________________________________________________________________________________________________________________________________
select count(*) 'NUM OF CLERKS' from tblEMP where job = 'CLERK';
--___________________________________________________________________________________________________________________________________________
select avg(salary) 'AVG SALARY', count(empno) 'NUMBER OF EMP' from tblEMP group by job;
--___________________________________________________________________________________________________________________________________________
select ename from tblEMP where salary = (select  min(salary) from tblEMP);
--___________________________________________________________________________________________________________________________________________
select ename from tblEMP where salary = (select  max(salary) from tblEMP);
--___________________________________________________________________________________________________________________________________________
select * from tblDPT d where not exists (select * from tblEMP e where e.deptno = d.deptno );
--___________________________________________________________________________________________________________________________________________
select ename, salary from tblEMP  where job = 'ANALYST' and salary > 1200 and deptno = 20 order by ename desc; 
--___________________________________________________________________________________________________________________________________________
select d.dname, d.deptno, sum(salary) 'TOTAL SALARY OF EMP' from tblEMP e join tblDPT d on e.deptno = d.deptno group by d.dname, d.deptno;
--___________________________________________________________________________________________________________________________________________
select salary from tblEMP where ename IN( 'MILLER', 'SMITH');
--___________________________________________________________________________________________________________________________________________
select ename from tblEMP where ename like '[AM]%';
--___________________________________________________________________________________________________________________________________________
select ( salary * 12 ) as 'ANNUAL SALARY OF SMITH ' from tblEMP where ename = 'SMITH';
--___________________________________________________________________________________________________________________________________________
select ename, salary  from tblEMP where salary not between  1500 and 2850;
