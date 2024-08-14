
-- http://192.168.1.252/

-- 구문수행 순서
-- FROM  -> WHERE -> SELECT -> ORDER BY 절 처리 

use scott;
select * from emp;

select ename,hiredate ,year(hiredate) as 입사년도,month(hiredate) as 입사월
from emp
order by 입사월 ,입사년도 ;

select ename,hiredate ,sal,comm,sal+comm ,sal+ ifnull(comm,0) 급여합
from emp
order by  급여합;


select * from 고객;

select 고객회사명,마일리지,
       case 
          when 마일리지 > 10000 then '골드' 
          when 마일리지 > 5000 then '실버' 
          else '일반'
       end as 등급
from 고객
order by 등급;

SELECT SUM(마일리지),avg(마일리지)
FROM 고객
WHERE 도시 = '서울특별시';

SELECT 도시,SUM(마일리지),round(avg(마일리지))
FROM 고객
group by 도시;

select 담당자직위 ,도시, sum(마일리지) sum,max(마일리지) max,min(마일리지) min,avg(마일리지) avg
from 고객
where 도시 like '%광역시'
group by 담당자직위 , 도시
order by 담당자직위,avg;


select 담당자직위 ,도시, sum(마일리지) sum,max(마일리지) max,min(마일리지) min,avg(마일리지) avg
from 고객
where 도시 like '%광역시'
group by 담당자직위 , 도시
having avg(마일리지) > 5000
order by 담당자직위,avg;

/*
select
from
where
group by 
having
order by;
*/

select 지역, count(*) as 고객수
from 고객 
where 담당자직위 in('대표 이사')
group by 지역;
-- having
-- order by;

select 지역, count(*) as 고객수
from 고객 
where 담당자직위 in('대표 이사')
group by 지역
with rollup;

select if(grouping(지역) != 1 ,지역,'총계') as 지역, count(*) as 고객수
from 고객 
where 담당자직위 in('대표 이사')
group by 지역
with rollup;

select  ifnull(if(grouping(지역) != 1 ,지역,'총계'),'--') as 지역, 
        count(*) as 고객수
from 고객 
where 담당자직위 in('대표 이사')
group by 지역
with rollup;



select year(주문일) 주문년도,quarter(주문일) 분기 ,count(*) 주문건수 
from 주문 
group by  year(주문일),quarter(주문일)
with rollup;

-- 실습 문제 
-- 03 [주문] 2021년 주문내역에 대하여 고객번호별로 주문건수를 보이되, 주문건수가
-- 많은 상위 3건의 고객의 정보만 보이시오.

select 고객번호,count(*) as 주문건수
from 주문
where year(주문일) = 2021
group by 고객번호
order by 주문건수 DESC
limit 3;

-- join 연습 
use scott;
desc emp;
desc dept;
select * from emp;
select * from dept;

select ename , emp.deptno ,dname  
from emp,dept;


select ename , emp.deptno ,dname  ,loc 
from emp,dept 
where emp.deptno = dept.deptno; -- 조인조건 : FK = PK

-- 안시조인  from 절의  , -> join , 조인조건 -> on
select ename , emp.deptno ,dname  ,loc 
from emp join dept 
on emp.deptno = dept.deptno;

select ename ,sal , emp.deptno ,dname  ,loc 
from emp inner join dept 
on emp.deptno = dept.deptno;


select ename , e.deptno ,dname  ,loc 
from emp e ,dept d 
where e.deptno = d.deptno;


select ename , emp.deptno ,dname  ,loc 
from emp inner join dept 
on emp.deptno = dept.deptno;

select  ename , e.deptno ,dname  ,loc ,sal
from emp e ,dept d 
where e.deptno = d.deptno and sal > 3000;

select ename , emp.deptno ,dname  ,loc 
from emp inner join dept 
on emp.deptno = dept.deptno
where sal > 3000;



