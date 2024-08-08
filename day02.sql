
SELECT * 
FROM 고객;

SELECT 고객회사명,도시,지역 AS "지 역" 
FROM 고객;

SELECT 고객번호 
      ,담당자명 
	  ,도시 
	  ,마일리지 AS 포인트 
FROM 고객 
WHERE 도시 = '서울특별시' AND 마일리지 >= 70000 
-- WHERE 도시 = '서울특별시' AND 포인트 >= 70000   x ERROR 
-- ORDER BY 마일리지 DESC;  
ORDER BY 포인트 ;  

-- 구문수행 순서
-- FROM  -> WHERE -> SELECT -> ORDER BY 절 처리 

SELECT 도시 FROM 고객;

SELECT DISTINCT 도시 FROM 고객;


SELECT @@autocommit;
SET autocommit=TRUE;
SET autocommit=FALSE;

/*예제2-12*/
SELECT 고객번호
      ,담당자명
	  ,마일리지
      ,도시
FROM 고객
WHERE 도시 = '부산광역시'
UNION
SELECT 고객번호
      ,담당자명
      ,마일리지
      ,도시
FROM 고객
WHERE 마일리지 < 1000
ORDER BY 1;


/*예제2-12*/
SELECT 고객번호
      ,담당자명
	  ,마일리지
      ,도시
FROM 고객
WHERE 도시 = '부산광역시';

SELECT 고객번호
      ,담당자명
      ,마일리지
      ,도시
FROM 고객
WHERE 마일리지 < 1000
ORDER BY 1;

USE SCOTT;
SELECT * FROM emp;

SELECT ename,sal,job,comm
FROM emp
WHERE UPPER(ename) LIKE UPPER('a%')
ORDER BY sal DESC;

-- 점검 문제

SELECT * 
FROM 고객 
WHERE 지역 IS NOT NULL 
AND 담당자직위 <> '대표 이사';

SELECT * 
FROM 고객 
WHERE 지역 IS NOT NULL 
AND 담당자직위 NOT IN('대표 이사');

SELECT * 
FROM 고객 
WHERE 지역 IS NOT NULL 
AND 담당자직위 IN('대표 이사');

SELECT rand(10);

SELECT round(rand() * 45)+1;

SELECT date('20-2-02');
SELECT str_to_date('20-2-02','%d-%m-%y');





