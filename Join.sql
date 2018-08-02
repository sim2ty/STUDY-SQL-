--테이블 조인을 사용해야 하는 모든 SQL 문은 ANSI 조인과 오라클 조인 2가지로 SQL 문장을 작성하여 제출한다.

@ c:/SQL_DATA/work_db2.sql

-- 1. course1 과 course2 를 모두 수강하는 학생들의 이름, 전화 번호 그리고 
--    나이를 출력하시오.
SELECT name as "이름", phone as "전화번호", age as "나이"
FROM course1
INTERSECT
SELECT name as "이름", phone as "전화번호", age as "나이"
FROM course2;

-- 2. course1 이든 course2 든 수강하는 학생들의 이름, 전화 번호 그리고 
--    나이를 출력하는데 나이가 많은 순으로 출력하시오.
SELECT name as "이름", phone as "전화번호", age as "나이"
FROM course1
UNION
SELECT NAME AS "이름", phone AS "전화번호", age AS "나이"
FROM course2
ORDER BY "나이" DESC;

-- 3. course1은 수강하지만 course2 는 수강하지 않는 학생들의 이름을 출력하시오.
SELECT name as "이름"
FROM course1
MINUS
SELECT NAME AS "이름"
FROM course2;
-- 4. course2는 수강하지만 course1 은 수강하지 않는 학생들의 이름과 전화번호를 
--    이름 순으로 출력하시오.
SELECT name as "이름", phone as "전화번호"
FROM course2
MINUS
SELECT NAME AS "이름", phone AS "전화번호"
FROM course1
ORDER BY "이름";

-- 5. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을 출력하시오.(5개)
--이름         직위        부서이름          
---------- --------- --------------
--SMITH      CLERK     RESEARCH      
--JONES      MANAGER   RESEARCH      
--SCOTT      ANALYST   RESEARCH      
--ADAMS      CLERK     RESEARCH      
--FORD       ANALYST   RESEARCH      
SELECT ename AS "이름", JOB AS "직위", e.deptno AS "부서번호", dname AS "부서이름"
FROM emp e, dept d
WHERE e.deptno=d.deptno AND loc='DALLAS';

SELECT ename AS "이름", JOB AS "직위", e.deptno AS "부서번호", dname AS "부서이름"
FROM emp e JOIN dept d
ON e.deptno=d.deptno 
WHERE loc='DALLAS';

-- 6. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하시오.(7개)
--이름         부서이름          
---------- --------------
--ALLEN      SALES         
--WARD       SALES         
--MARTIN     SALES        
SELECT ename AS "이름", dname AS "부서이름"
FROM emp e, dept d
WHERE e.deptno=d.deptno AND ename like '%A%';

SELECT ename AS "이름", dname AS "부서이름"
FROM emp e JOIN dept d
ON e.deptno=d.deptno 
WHERE ename like '%A%';

-- 7. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을 
--출력하는데 월급이 3000이상인 사원을 출력하시오. (3개)
--사원이름       부서명                    월급
---------- -------------- ----------
--KING       ACCOUNTING           5000
--FORD       RESEARCH             3000
--SCOTT      RESEARCH             3000
SELECT ename AS "이름", dname AS "부서이름", sal AS "월급"
FROM emp e, dept d
WHERE e.deptno=d.deptno AND sal>=3000;

SELECT ename AS "이름", dname AS "부서이름", sal AS "월급"
FROM emp e JOIN dept d
ON e.deptno=d.deptno 
WHERE sal>=3000;

-- 8. 직위가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고
-- 그 사원이 속한 부서 이름을 출력하시오. (4개)
--직위        사원이름       부서이름          
--------- ---------- --------------
--SALESMAN  TURNER     SALES         
--SALESMAN  MARTIN     SALES         
--SALESMAN  WARD       SALES         
--SALESMAN  ALLEN      SALES       
SELECT JOB AS "직위", ename AS "사원이름", dname AS "부서 이름"
FROM emp e, dept d
WHERE e.deptno=d.deptno AND job='SALESMAN';

SELECT JOB AS "직위", ename AS "사원이름", dname AS "부서이름"
FROM emp e JOIN dept d
ON e.deptno=d.deptno 
WHERE job='SALESMAN';

-- 9. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션,
-- 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',
-- '연봉','실급여', '급여등급'으로 하여 출력하시오. (6개)
--  사원번호 사원이름               연봉        실급여       급여등급
---------- ---------- ---------- ---------- ----------
--  7521 WARD            15000      15200          2
--  7654 MARTIN          15000      15300          2
--  7844 TURNER          18000      18000          3
SELECT empno AS "사원번호", ename AS "사원이름", sal*12 AS "연봉", sal*12+comm AS "실급여", grade AS "급여등급"
FROM emp e, salgrade s
WHERE comm is not null and sal BETWEEN losal AND hisal;

SELECT empno AS "사원번호", ename AS "사원이름", sal*12 AS "연봉", sal*12+comm AS "실급여", grade AS "급여등급"
FROM emp e JOIN salgrade s
ON sal BETWEEN losal AND hisal
WHERE comm IS NOT NULL;

-- 10. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름,
-- 월급, 급여등급을 출력하시오. (3개)
--   부서번호 부서이름           사원이름               월급       급여등급
---------- -------------- ---------- ---------- ----------
--      10 ACCOUNTING     CLARK            2450          4
--      10 ACCOUNTING     KING             5000          5
--      10 ACCOUNTING     MILLER           1300          2 
SELECT e.deptno AS "부서번호", dname as "부서이름", ename AS "사원이름", sal AS "월급", grade AS "급여등급"
FROM emp e, dept d, salgrade s
WHERE e.deptno=d.deptno and e.deptno=10 and sal BETWEEN losal AND hisal;

SELECT e.deptno AS "부서번호", dname AS "부서이름", ename AS "사원이름", sal AS "월급", grade AS "급여등급"
FROM salgrade s, emp e 
JOIN dept d ON e.deptno=d.deptno
where e.deptno=10 and sal BETWEEN losal AND hisal;

-- 11. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름, 
-- 사원이름, 월급, 급여등급을 출력하시오. 그리고 그 출력된 
-- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로 정렬하시오. (8개)
--   부서번호 부서이름           사원이름               월급       급여등급
---------- -------------- ---------- ---------- ----------
--    10 ACCOUNTING     KING             5000          5
--    10 ACCOUNTING     CLARK            2450          4
SELECT e.deptno AS "부서번호", dname as "부서이름", ename AS "사원이름", sal AS "월급", grade AS "급여등급"
FROM emp e, dept d, salgrade s
WHERE e.deptno=d.deptno AND e.deptno in (10,20) AND sal BETWEEN losal AND hisal
ORDER BY "부서번호";


SELECT e.deptno AS "부서번호", dname AS "부서이름", ename AS "사원이름", sal AS "월급", grade AS "급여등급"
FROM salgrade s, emp e 
JOIN dept d ON e.deptno=d.deptno
WHERE e.deptno in (10,20) AND sal BETWEEN losal AND hisal
ORDER BY "부서번호";

-- 12. 사원들의 이름, 부서번호, 부서이름을 출력하시오. (15개) 
-- 단, 직원이 없는 부서도 출력하며 이경우 이름을 '미정'이라고
-- 출력한다.        
--이름               부서번호 부서이름          
---------- ---------- --------------
--SMITH              20 RESEARCH      
--ALLEN              30 SALES         
--WARD               30 SALES         
--JONES              20 RESEARCH      
SELECT nvl(ename,'미정') AS "이름", d.deptno AS "부서번호", dname AS "부서이름"
FROM emp e, dept d
WHERE e.deptno(+)=d.deptno;

SELECT nvl(ename,'미정') AS "이름", d.deptno AS "부서번호", dname AS "부서이름"
FROM emp e right JOIN dept d
ON e.deptno=d.deptno;

-- 13. 사원들의 이름, 부서번호, 부서이름을 출력하시오. (15개) 
-- 단, 아직 부서 배치를 못받은 직원도  출력하며 이경우 부서번호는  0 으로
-- 출력한다.        
--이름               부서번호 부서이름          
---------- ---------- --------------
--SMITH              20 RESEARCH      
--ALLEN              30 SALES         
--WARD               30 SALES         
--JONES              20 RESEARCH      
SELECT ename AS "이름", nvl(e.deptno,'0') AS "부서번호", dname AS "부서이름"
FROM emp e, dept d
WHERE e.deptno=d.deptno(+);

SELECT nvl(ename,'0') AS "이름", nvl(e.deptno,'0') AS "부서번호", dname AS "부서이름"
FROM emp e left JOIN dept d
ON e.deptno=d.deptno;

-- 14. 사원들의 이름, 부서번호, 부서이름을 출력하시오. (16개) 
-- 단, 직원이 없는 부서도 출력하며 이경우 이름과 부서번호를 '미정'이라고
-- 출력한다. 아직 부서 배치를 못받은 직원도  출력하며 부서 번호와 부서 이름을
-- '미정' 이라고 출력한다.     
--이름               부서번호 부서이름          
---------- ---------- --------------
--SMITH              20 RESEARCH      
--ALLEN              30 SALES         
--WARD               30 SALES         
--JONES              20 RESEARCH    
SELECT nvl(ename,'미정') AS "이름", to_char(d.deptno) AS "부서번호", dname AS "부서이름"
FROM emp e, dept d
WHERE e.deptno(+)=d.deptno
UNION
SELECT ename AS "이름", nvl(to_char(e.deptno),'미정') AS "부서번호", nvl(dname,'미정') AS "부서이름"
FROM emp e, dept d
WHERE e.deptno=d.deptno(+);

SELECT nvl(ename,'미정') AS "이름", nvl(to_char(d.deptno),'미정') AS "부서번호", nvl(dname,'미정') AS "부서이름"
FROM emp e full JOIN dept d ON e.deptno=d.deptno;


--15. 커미션이 정해진 모든 직원의 이름, 커미션, 부서이름, 위치를 조회하는 sql을 작성하시오.

--ENAME           COMM        DNAME         	LOC
----------------------------------------------------
--KING		3500	ACCOUNTING	NEW YORK
--JONES		30	RESEARCH	DALLAS
--TURNER	0	SALES		CHICAGO
--MARTIN	300	SALES		CHICAGO
--WARD		200	SALES		CHICAGO
--ALLEN		300	SALES		CHICAGO         
SELECT ename AS "이름", comm AS "커미션", dname AS "부서이름", loc AS "위치"
FROM emp e, dept d
WHERE e.deptno=d.deptno AND comm IS NOT NULL;

SELECT ename AS "이름", comm AS "커미션", dname AS "부서이름", loc AS "위치"
FROM emp e JOIN dept d ON e.deptno=d.deptno
WHERE comm IS NOT NULL;

-- 16. DALLAS에서 근무하는 사원의 이름,  월급, 등급을 출력하시오.(5개)
--이름         월급             등급          
---------- --------- --------------
--SMITH      800         1      
--JONES      2975       4   
--SCOTT      3000      4      
--ADAMS    1100         1
--FORD       3000        4      
SELECT ename AS "이름", sal AS "월급", grade AS "등급"
FROM emp e, dept d, salgrade s
WHERE e.deptno=d.deptno AND loc='DALLAS' AND sal BETWEEN losal AND hisal;

SELECT ename AS "이름", sal AS "월급", grade AS "등급"
FROM salgrade s, emp e JOIN dept d ON e.deptno=d.deptno
WHERE loc='DALLAS' AND sal BETWEEN losal AND hisal;

--17. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의 
-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하시오. (15개)
--   관리자가 없으면 '없음'을 대신 출력한다.
--    사원번호 사원이름            관리자번호 관리자이름     
---------- ---------- ---------- ----------
--  7902 FORD             7566 JONES     
--  7788 SCOTT            7566 JONES     
--   7900 JAMES            7698 BLAKE   
SELECT x.empno AS "사원번호", x.ename AS "사원이름", nvl(to_char(x.mgr),'없음') as "관리자번호", nvl(y.ename,'없음') AS "관리자이름"
FROM emp x, emp y
WHERE x.mgr=y.empno(+);

SELECT x.empno AS "사원번호", x.ename AS "사원이름", nvl(to_char(x.mgr),'없음') AS "관리자번호", nvl(y.ename,'없음') AS "관리자이름"
FROM emp x left JOIN emp y ON x.mgr=y.empno;
