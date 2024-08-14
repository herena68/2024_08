
/*

select
from
where
group by
having
order by
limit
 
*/

use scott;
select ename,job from emp;
select concat( ename,"---",job) from emp;
select concat( ename) from emp;
select group_concat( ename) from emp;
select group_concat( distinct job) from emp;

-- DML
select @@autocommit;
set autocommit = false;  -- 0
set autocommit = true;  -- 1

desc dept;
desc emp;

select * from dept;
select * from emp;

insert into dept(deptno,dname,loc) values(50,'교육팀','서울'); 
commit;
insert into dept(deptno,dname,loc) values(51,'기술팀','서울'); 
commit; -- 확정
insert into dept(deptno,dname,loc) values(52,'기술팀','서울'); 
rollback; -- 취소 
insert into dept(deptno,dname,loc) values(52,'기술팀','서울'); 
commit; -- 확정
update dept set dname='영업팀';
rollback; -- 취소 
update dept set dname='영업팀' where deptno = 52;
commit; -- 확정
delete from dept;
rollback; -- 취소 
delete from dept where loc = '서울';
commit;


insert into emp values(9000,'김씨','사원',null,sysdate(),0,null,40);
insert into emp values(9001,'이씨','사원',null,now(),0,null,50); -- error
insert into dept(deptno,dname,loc) values(50,'교육팀','서울'); 
insert into emp values(9001,'이씨','사원',null,now(),0,null,50); -- ok

commit;
rollback;

insert into emp(empno,ename,job) values(9002,'박씨','사원'); 
rollback;

delete from dept where deptno = 50;
-- FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO) ON DELETE CASCADE -- 자식도 지워져요 

commit;
delete from emp where empno = 9000;
commit;

select * from dept;
select * from emp;


insert into emp values(9000,'김씨','사원',null,sysdate(),0,null,40);
-- ddl

create table dept2 as select * from dept; -- DDL  autocomit 
select * from dept2;
desc dept;
desc dept2;
create table dept3 as select * from dept where 1!=1; -- DDL  autocomit 

-- ch13
CREATE SCHEMA `서울지하철` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin ; -- DDL  autocomit 
drop SCHEMA `서울지하철`;
drop Database `서울지하철`;

use 서울지하철;
show tables;

desc 지하철공기질;
desc 지하철승하차;
select * from 지하철공기질;
select * from 지하철승하차;
select * from 지하철승하차 limit 30;


alter table 지하철공기질 modify column 호선명 varchar(30); -- DDL  autocomit 
alter table 지하철공기질 modify column 시도명 varchar(30); -- DDL  autocomit 
alter table 지하철공기질 modify column 시군구명 varchar(30); -- DDL  autocomit 
alter table 지하철공기질 modify column 역명 varchar(30); -- DDL  autocomit 
alter table 지하철공기질 add primary key(호선명,역명);

alter table 지하철승하차 modify column 사용일자 DATE; -- DDL  autocomit 
alter table 지하철승하차 modify column 호선명 varchar(30); -- DDL  autocomit 
alter table 지하철승하차 modify column 역명 varchar(30); -- DDL  autocomit 
alter table 지하철승하차 add primary key(사용일자,호선명,역명);



-- mysql -u user01 -p -e "select * from scott.emp" > qqqq.csv


select * from scott.emp;

/*
			WHEN 0 THEN '월요일'
            WHEN 1 THEN '화요일'
            WHEN 2 THEN '수요일'
            WHEN 3 THEN '목요일'
            WHEN 4 THEN '금요일'
            WHEN 5 THEN '토요일'
            ELSE '일요일'
*/

create table 요일(
   weekno int primary key,
   name varchar(20),
   e_name varchar(20)
);

insert into 요일 values(0,'월요일','monday');
insert into 요일 values(1,'화요일','');
insert into 요일 values(2,'수요일','');
insert into 요일 values(3,'목요일','');
insert into 요일 values(4,'금요일','');
insert into 요일 values(5,'토요일','');
insert into 요일 values(6,'일요일','sunday');
commit;


SELECT MONTH(사용일자) AS 월
      ,WEEKDAY(사용일자) AS 정수요일
      , name  AS "요 일"
      ,SUM(승차승객수 + 하차승객수) AS 승하차승객수합
FROM 지하철승하차 , 요일
WHERE WEEKDAY(사용일자)=weekno and 호선명 = '2호선'
GROUP BY MONTH(사용일자)
        ,WEEKDAY(사용일자)
        ,name
ORDER BY 1,2 ;


