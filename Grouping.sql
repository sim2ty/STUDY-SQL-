--QUESTION

--1.  사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의 
-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하시오. (15개)
--   관리자가 없으면 '없음'을 대신 출력한다.
--    사원번호 사원이름            관리자번호 관리자이름     
---------- ---------- ---------- ----------
--    7902    FORD               7566        JONES     
--    7788    SCOTT              7566       JONES     
--    7900   JAMES              7698       BLAKE 
SELECT x.empno AS "사원번호", x.ename AS "사원이름", nvl(to_char(x.mgr),'없음') as "관리자번호", nvl(y.ename,'없음') AS "관리자이름"
FROM emp x, emp y
WHERE x.mgr=y.empno(+);

SELECT x.empno AS "사원번호", x.ename AS "사원이름", nvl(to_char(x.mgr),'없음') AS "관리자번호", nvl(y.ename,'없음') AS "관리자이름"
FROM emp x left JOIN emp y ON x.mgr=y.empno;

--2. 모든 직원들 월급의 평균을 구하시오. 
--   (소수점 이하 둘째자리까지만 나타내고 셋째자리 부터는 절삭하시오)
--	월급 평균
               -----------
--	   x
SELECT trunc(avg(sal),2) AS "월급 평균"
FROM emp;

--3. 모든 직원들이 받는 커미션의 합을 구하시오.
--	커미션 합
               -----------
--	  x
SELECT sum(comm) AS "커미션 합"
FROM emp;

--4. 'DALLAS'에서 근무중인 직원의 명수와 월급의 합을 다음과 같은 형식으로 추출하시오.

--	처리결과
	----------------------------
--                직원들은 X명이고 월급의 합은 X입니다.
SELECT '직원들은 '||count(empno)||'명이고 월급의 합은 '||sum(sal)||'입니다.' 처리결과
FROM emp e, dept d
WHERE e.deptno=d.deptno and loc='DALLAS';

SELECT '직원들은 '||count(empno)||'명이고 월급의 합은 '||sum(sal)||'입니다.' 처리결과
FROM emp e JOIN dept d
ON e.deptno=d.deptno
WHERE loc='DALLAS';

--5. 부서별 최대 월급을 "부서명", "최대월급" 으로 출력하시오.(최대월급이 큰 순)
	
--	부서명	최대월급
	----------------------------
--	xxxx          xxx
--	 :	   :
SELECT dname AS "부서명", MAX(sal) AS "최대월급"
FROM emp e, dept d
WHERE e.deptno=d.deptno
GROUP BY dname
ORDER BY "최대월급" DESC;

SELECT dname AS "부서명", MAX(sal) AS "최대월급"
FROM emp e JOIN dept d
ON e.deptno=d.deptno
GROUP BY dname
ORDER BY "최대월급" DESC;

--6. 직급별 최소 월급이 3000 이상이 되는 직급의 직급명과 최소 월급을  출력하시오. 

--	직급명	최소월급
	----------------------------
--	xxxx          xxx
--	 :	   :
SELECT JOB AS "직급명", MIN(sal) AS "최소월급"
FROM emp
GROUP BY JOB
HAVING MIN(sal)>=3000;

--7. 부서별 평균월급을 출력하되, 평균월급가 2000보다
-- 큰 부서의 부서 이름과 평균월급을 출력하시오.

--	부서명     평균월급
           	------------------------
--	xxxx          xxx
--	 :	   :
SELECT dname AS "부서명", round(avg(sal)) AS "평균월급"
FROM emp e, dept d
WHERE e.deptno=d.deptno
GROUP BY dname
HAVING round(avg(sal))>2000;

SELECT dname AS "부서명", round(avg(sal)) AS "평균월급"
FROM emp e join dept d
ON e.deptno=d.deptno
GROUP BY dname
HAVING round(avg(sal))>2000;

--8. 각 직급별로 총월급을 출력하되 총월급이 낮은 순으로 출력하시오.

--	직급명	총월급
	----------------------------
--	xxxx          xxx
--	 :	   :
SELECT JOB AS "직급명", sum(sal) AS "총월급"
FROM emp
GROUP BY JOB
ORDER BY sum(sal);

--9. 직급별 총월급을 출력하되, 직급이 'MANAGER'인 직원들은 제외하시오. 
--   그리고 그 총월급이 5000보다 큰 직급와 총월급만 출력하시오.

--	직급명	총월급
	----------------------------
--	xxxx          xxx
--	 :	   :
SELECT JOB AS "직급명", sum(sal) AS "총월급"
FROM emp
WHERE JOB <> 'MANAGER'
GROUP BY JOB
HAVING sum(sal)>5000;

--10. 커미션이 정해진 직원들 중에서 부서별 최대월급을 출력하시오. 
--최대 월급이 높은 순으로 정렬하여 출력하시오.

--	부서명     최대월급
           	------------------------
--	xxxx          xxx
--	 :	   :
SELECT dname AS "부서명", MAX(sal) AS "최대월급"
FROM emp e, dept d
WHERE e.deptno=d.deptno AND comm IS NOT NULL
GROUP BY dname
ORDER BY "최대월급" DESC;

SELECT dname AS "부서명", MAX(sal) AS "최대월급"
FROM emp e JOIN dept d
ON e.deptno=d.deptno
WHERE comm IS NOT NULL
GROUP BY dname
ORDER BY "최대월급" DESC;

--11. 30번 부서의 업무별 년봉의 평균을 검색한다.
-- 연봉계산은 월급+커미션(null이면 0으로 계산)이며 
-- 출력 양식은 소수점 이하 두 자리(반올림)까지 통일된 양식으로 출력한다.
--              업무명       평균월급
              ---------------------------
--             xxxx         xxx.xx
--  :	    :
SELECT JOB AS "업무명", to_char(round(avg(sal*12+nvl(comm,0)),2),'99999.99') AS "평균월급"
FROM emp 
WHERE deptno=30
GROUP BY JOB;

--12. 부서별 근무 직원의 5명 이상인 부서의 부서명과 직원수를 출력한다.

--	부서명       근무인원 수
              ---------------------------
--              xxxx            x
--	 :	    :
SELECT dname AS "부서명", count(empno) AS "직원수"
FROM emp e, dept d
WHERE e.deptno=d.deptno
GROUP BY dname
HAVING count(empno)>=5;

SELECT dname AS "부서명", count(empno) AS "직원수"
FROM emp e JOIN dept d
ON e.deptno=d.deptno  
GROUP BY dname
HAVING count(empno)>=5;