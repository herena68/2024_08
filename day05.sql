-- 도시이름별 평균 급여를 구하세요.

use scott;

select loc , round(avg(sal)) 평균급여 
from emp,dept
where emp.deptno = dept.deptno
group by loc;

select loc , round(avg(sal)) 평균급여 
from emp join dept
on emp.deptno = dept.deptno
group by loc;


-- 고객정보 : 최대마일리지 
select max(마일리지) from 고객;

select * from 고객 where 마일리지 = 128790;

select * 
from 고객 
where 마일리지 = (select max(마일리지) from 고객);

-- 스칼라=단일값   ,  벡터=다중값
select min(sal) from emp;
select min(sal) from emp group by deptno;

-- 부서별 최고 급여 리스트
select * from emp;
select * from emp order by deptno,sal;

select *  
from emp 
where (deptno,sal) in ((10,5000),(20,3000),(30,2850));

select *  
from emp 
where (deptno,sal) in (select deptno, max(sal) from emp group by deptno);

select deptno, max(sal) from emp group by deptno;

-- 윈도우함수

select * from emp;

select   avg(sal) from emp;
select ename ,  avg(sal) from emp; -- error
select ename ,  avg(sal) over() from emp;
select ename , deptno,  avg(sal) over(partition by deptno) from emp;

select ename , deptno,sal,  
  avg(sal) over(partition by deptno) 부서별평균급여,
  max(sal) over(partition by deptno) 최대,
  count(*) over(partition by deptno) 사원수,
  rank() over(partition by deptno order by sal DESC) 순위 
from emp;

select * from emp;
select * from emp order by sal;

select 
ename,job,
first_value(ename) over(order by sal ) ,
first_value(job) over(order by sal) 
from emp;


select 
ename,job,deptno,
first_value(ename) over(partition by deptno order by sal )  최소급여이름,
first_value(job) over(partition by deptno order by sal) 최소급여job
from emp;


select 
ename,job,deptno,
last_value(ename) over(partition by deptno order by sal 
 rows between unbounded preceding and current row)  최대급여이름,
last_value(job) over(partition by deptno order by sal) 최대급여job
from emp;

select 
ename,job,deptno,
last_value(ename) over(partition by deptno order by sal 
 rows between unbounded preceding and unbounded following)  최대급여이름,
last_value(job) over(partition by deptno order by sal
rows between unbounded preceding and unbounded following) 최대급여job
from emp;

