-- 1. EMP 테이블에서 사원번호가 7499번인 사원의 월급을 5000달러로 변경한다.
UPDATE emp SET sal=5000
WHERE empno=7499;
ROLLBACK;
--SELECT sal
--FROM emp
--where empno=7499;

-- 2. EMP테이블에서 부서번호가 20번인 사원들의 월급을 현재 월급에서 10% 인상한 금액으로 변경한다.
UPDATE emp SET sal=sal*1.1
WHERE deptno=20;
ROLLBACK;

-- 3. DEPT 테이블에 아래의 조건으로 데이터를 입력한다.
-- 부서번호: 50, 부서위치: BOSTON,  부서명: RESERCH
INSERT INTO dept VALUES (50, 'RESEARCH', 'BOSTON');
ROLLBACK;

-- 4. EMP 테이블에 아래와 같은 데이터를 삽입한다.
-- 사원번호: 9900, 사원이름: JACKSON, 직업: SALESMAN, 부서번호: 10, 월급 : 800
INSERT INTO emp (empno, ename, JOB, deptno, sal) VALUES (9900, 'JACKSON', 'SALESMAN', 10, 800);
ROLLBACK;
-- 5. DEPT 테이블에 아래의 조건으로 데이터를 입력한다.
-- 부서번호: 60, 부서위치: NULL,  부서명: MARKETING
INSERT INTO dept VALUES (60, 'MARKETING', NULL);
ROLLBACK;

-- 6. 사원번호가 7698번인 사원의 부서번호를 7369번 사원의 
-- 부서번호로 변경한다.(SQL 문 2개)
UPDATE emp SET deptno = (select deptno from emp where empno=7369)
WHERE empno=7698;
ROLLBACK;

-- 7. 20번 부서의 직원들을 모두 삭제한다.
DELETE FROM emp
WHERE deptno=20;
ROLLBACK;

-- 8. 월급이 1000 이하인 직원들을 삭제한다.
DELETE FROM emp
WHERE sal<=1000;
ROLLBACK;

-- 9. 사원번호가 7788 인 직원의 월급을 현재 월급에서 5% 증가시키고 부서번호를 40으로 변경한다.
UPDATE emp SET sal=sal*1.05, deptno=40
WHERE empno=7788;
ROLLBACK;
-- 10. 현재를 기준으로 입사한지 37년 이상인 직원들에 대하여 월급을 2배로 변경하고 커미션도 3000으로 변경한다.
--       (입사일은 년도를 기준으로 반올림하여 계산한다.)
UPDATE emp SET sal=sal*2, comm=3000
WHERE EXTRACT (YEAR FROM SYSDATE) - EXTRACT (YEAR FROM round(hiredate, 'year'))>=37;
ROLLBACK;
