--QUESTION
--1. EMP 테이블과 DEPT 테이블을 조인하여 다음 컬럼들로 구성되는 뷰(EMPDEPT)를 생성한다.
-- 	empno, ename, sal, hiredate, dname
CREATE VIEW empdept
AS
SELECT empno, ename, sal, hiredate, dname
FROM emp e, dept d
WHERE e.deptno=d.deptno;

--2. 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급 그리고 부서명을 출력한다.(13개)
--사원명               급여             부서명         
---------- ---------- ------------
-- MILLER	1300	ACCOUNTING
-- KING		5000	ACCOUNTING
-- CLARK	2450	ACCOUNTING
-- FORD		3000	RESEARCH

-- 해결방법 1 - empdept 라는 뷰를 사용해서
SELECT ename 사원명, sal 급여, dname 부서명
FROM empdept
WHERE sal > (SELECT sal FROM empdept WHERE ename='SMITH');

-- 해결방법 1 - 뷰를 사용하지 않고
SELECT ename, sal
FROM emp
WHERE sal > (SELECT sal FROM emp WHERE ename='SMITH');

--3. 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급, (3개)
--   부서번호를 출력한다.
--ENAME             SAL     DEPTNO
---------- ---------- ----------
--CLARK            2450         10
--KING             5000         10
--MILLER           1300         10
SELECT ename, sal, deptno
FROM emp
WHERE sal IN (SELECT sal FROM emp WHERE deptno=10);

--4. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데 'BLAKE'는 빼고 출력한다. (5개)
--ENAME      HIREDATE
---------- --------
--JAMES      81/10/03
--TURNER     81/09/08
SELECT ename, hiredate
FROM emp
WHERE deptno IN (SELECT deptno FROM emp WHERE ename='BLAKE')
AND ename <> 'BLAKE';

--5. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을
-- 출력하되, 월급이 높은 사람 순으로 출력한다.(6개)
--  EMPNO ENAME             SAL
---------- ---------- ----------
--   7839 KING             5000
--   7902 FORD             3000
SELECT empno, ename, sal
FROM emp
WHERE sal>(SELECT avg(sal) FROM emp);

--6. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고
--   있는 사원의 사원번호와 이름을 출력한다.(11개)
--     EMPNO ENAME     
---------- ----------
--      7902 FORD      
--      7876 ADAMS     
--      7788 SCOTT   
SELECT empno, ename
FROM emp
WHERE deptno IN (SELECT deptno FROM emp WHERE ename LIKE '%T%');

--7 자신의 급여가 평균급여보다 많고,이름에 S자가 들어가는 사원과 동일한
--  부서에서 근무하는 모든 사원의 사원번호,이름 및 급여를 출력하시오(4개)
--     EMPNO    ENAME      SAL
--    --------  --------  -------
--      7902     FORD       3000
--      7788     SCOTT      3000
--      7566     JONES      2975
--      7698     BLAKE     2850
SELECT empno, ename, sal
FROM emp
WHERE sal>(SELECT avg(sal) FROM emp)
AND deptno IN (SELECT deptno FROM emp WHERE ename LIKE '%S%');

--8. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다
--   많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력한다. (4개)
--   (단, ALL 또는 ANY 연산자를 사용할 것)
--  이름    부서번호   월급
--------------------------------
--  JONES     20     2975
--  SCOTT     20     3000
--  KING       10     5000
--  FORD      20     3000
SELECT ename 이름, deptno 부서번호, sal 월급
FROM emp
WHERE SAL > ALL(SELECT SAL FROM EMP WHERE DEPTNO = 30);

--9. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의
--   이름, 부서번호, 직업을 출력한다.(5개)
--ENAME          DEPTNO JOB      
---------- ---------- ---------
--FORD               20 ANALYST  
--ADAMS              20 CLERK    
--SCOTT              20 ANALYST  
--JONES              20 MANAGER  
--SMITH              20 CLERK 
SELECT ename 이름, deptno 부서번호, JOB 직업
FROM emp e
WHERE deptno IN (SELECT deptno FROM dept WHERE loc='DALLAS');

--10. SALES 부서에서 일하는 사원들의 부서번호, 이름, 직업을 출력한다.(6개)
--    DEPTNO ENAME      JOB      
---------- ---------- ---------
--    30 JAMES      CLERK    
--    30 TURNER     SALESMAN 
--    30 BLAKE      MANAGER    
SELECT deptno, ename, JOB
FROM emp
WHERE deptno=(SELECT deptno FROM dept WHERE dname='SALES');

--11. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력한다. (3개)
--     (KING에게 보고하는 사원이란 mgr이 KING인 사원을 의미함) 
--ENAME             SAL
---------- ----------
--CLARK            2450
--BLAKE            2850
--JONES            2975
SELECT ename, sal
FROM emp
WHERE mgr = (SELECT empno FROM emp WHERE ename='KING');

--12. 커미션을 받는 사원과 / 부서번호, 월급이 같은 사원의
--    이름, 월급, 부서번호를 출력하라. (6개)
--	ALLEN	1600	30
--	MARTIN	1250	30
--	WARD	1250	30
--	JONES	2975	20
--	KING	5000	10
--	TURNER	1500	30
SELECT ename 이름, sal 월급, deptno 부서번호
FROM emp
WHERE deptno IN (SELECT deptno FROM emp WHERE nvl(comm,0)>0)
AND sal IN (SELECT sal FROM emp WHERE nvl(comm,0)>0);

--13. 30번 부서 사원들과 월급과 커미션이 같지 않은
--    사원들의 이름, 월급, 커미션을 출력하라.(30번 부서 제외) (2개)
--  ENAME      SAL    COMM
---------- ---------- ----------
--	JONES	2975	30
--	KING	5000	3500
SELECT ename, sal, comm
FROM emp
WHERE sal NOT IN (SELECT sal FROM emp WHERE deptno=30)
AND nvl(comm,0) NOT IN (SELECT nvl(comm,0) FROM emp WHERE deptno=30)
AND deptno <> 30;
