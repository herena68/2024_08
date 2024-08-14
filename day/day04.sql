/*

select
from
where
group by
having
order by


구문처리순서
from ->  where -> group by -> having -> select -> order by

where 절에는 집계함수사용 X , 
select앞에선 별칭 사용 X,
order by 절에서는 다 사용 가능 

*/


use scott;

select empno,ename,emp.deptno,dname,loc 
from emp , dept 
where emp.deptno = dept.deptno; 

select empno,ename,emp.deptno,dname,loc 
from emp inner join dept 
on emp.deptno = dept.deptno; 

select empno,ename,emp.deptno,dname,loc 
from emp left outer join dept -- 마스터테이블이 emp
on emp.deptno = dept.deptno; 

select empno,ename,emp.deptno,dept.deptno,dname,loc 
from emp right outer join dept   -- 마스터테이블이 dept
on emp.deptno = dept.deptno; 

select empno,ename,emp.deptno,dname,loc 
from emp right outer join dept   -- 마스터테이블이 dept
on emp.deptno = dept.deptno 
where emp.deptno is null;


select empno,ename,emp.deptno , sal ,grade 
from emp,salgrade
where sal between losal and hisal; 


select empno,ename,emp.deptno , sal ,grade 
from emp join salgrade
on sal between losal and hisal; 

-- self join 
select e.empno 사원번호,e.ename as 사원명, m.empno 상사사번,m.ename 상사이름 
from emp e,emp m
where e.mgr = m.empno;  
-- where e.mgr(+) = m.empno;  -- 오라클방식

select e.empno 사원번호,e.ename as 사원명, m.empno 상사사번,m.ename 상사이름 
from emp e join emp m
on e.mgr = m.empno;  

select e.empno 사원번호,e.ename as 사원명, m.empno 상사사번,m.ename 상사이름 
from emp e left outer join emp m
on e.mgr = m.empno;  

select e.empno 사원번호,e.ename as 사원명, m.empno 상사사번,m.ename 상사이름 
from emp e left outer join emp m
on e.mgr = m.empno
where m.empno is null ;  

select e.empno 사원번호,e.ename as 사원명, m.empno 상사사번,m.ename 상사이름 
from emp e left outer join emp m
on e.mgr = m.empno
where e.sal > m.sal ;   -- sal+ ifnull(comm,0)

-- 3개 테이블 join
select ename , dname , loc ,  sal , grade 
from emp,dept,salgrade
where emp.deptno = dept.deptno 
      and sal between losal and hisal;

select ename , dname , loc ,  sal , grade 
from emp 
   join dept
   on emp.deptno = dept.deptno 
   join salgrade
   on sal between losal and hisal
where sal > 2000;   
      
-- 문제 3
select 제품명,sum(주문수량) as 주문수량합
from 제품 , 주문세부
where 제품.제품번호 = 주문세부.제품번호
group by 제품명;
      
select 제품명,sum(주문수량) as 주문수량합
from 제품 left outer join 주문세부
on 제품.제품번호 = 주문세부.제품번호
group by 제품명;      

-- 실습문제
-- 03
select 고객.*
from 고객,주문
where 고객.고객번호 = 주문.고객번호 and 주문일='2020-04-09';

select 고객.*
from 고객 join 주문
on 고객.고객번호 = 주문.고객번호 
where 주문일='2020-04-09';


-- 04 
select 도시, sum(주문수량 * 단가) 주문금액합
from 고객,주문,주문세부
where 고객.고객번호 = 주문.고객번호 and 주문.주문번호 = 주문세부.주문번호
group by 도시
order by 주문금액합 DESC
limit 5;

select 도시, sum(주문수량 * 단가) 주문금액합
from 고객 join 주문
on 고객.고객번호 = 주문.고객번호 
join 주문세부
on 주문.주문번호 = 주문세부.주문번호
group by 도시
order by 주문금액합 DESC
limit 5;



















