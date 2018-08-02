--QUESTION
--1. EMP ���̺�� DEPT ���̺��� �����Ͽ� ���� �÷���� �����Ǵ� ��(EMPDEPT)�� �����Ѵ�.
-- 	empno, ename, sal, hiredate, dname
CREATE VIEW empdept
AS
SELECT empno, ename, sal, hiredate, dname
FROM emp e, dept d
WHERE e.deptno=d.deptno;

--2. 'SMITH'���� ������ ���� �޴� ������� �̸��� ���� �׸��� �μ����� ����Ѵ�.(13��)
--�����               �޿�             �μ���         
---------- ---------- ------------
-- MILLER	1300	ACCOUNTING
-- KING		5000	ACCOUNTING
-- CLARK	2450	ACCOUNTING
-- FORD		3000	RESEARCH

-- �ذ��� 1 - empdept ��� �並 ����ؼ�
SELECT ename �����, sal �޿�, dname �μ���
FROM empdept
WHERE sal > (SELECT sal FROM empdept WHERE ename='SMITH');

-- �ذ��� 1 - �並 ������� �ʰ�
SELECT ename, sal
FROM emp
WHERE sal > (SELECT sal FROM emp WHERE ename='SMITH');

--3. 10�� �μ��� ������ ���� ������ �޴� ������� �̸�, ����, (3��)
--   �μ���ȣ�� ����Ѵ�.
--ENAME             SAL     DEPTNO
---------- ---------- ----------
--CLARK            2450         10
--KING             5000         10
--MILLER           1300         10
SELECT ename, sal, deptno
FROM emp
WHERE sal IN (SELECT sal FROM emp WHERE deptno=10);

--4. 'BLAKE'�� ���� �μ��� �ִ� ������� �̸��� ������� �̴µ� 'BLAKE'�� ���� ����Ѵ�. (5��)
--ENAME      HIREDATE
---------- --------
--JAMES      81/10/03
--TURNER     81/09/08
SELECT ename, hiredate
FROM emp
WHERE deptno IN (SELECT deptno FROM emp WHERE ename='BLAKE')
AND ename <> 'BLAKE';

--5. ��ձ޿����� ���� �޿��� �޴� ������� �����ȣ, �̸�, ������
-- ����ϵ�, ������ ���� ��� ������ ����Ѵ�.(6��)
--  EMPNO ENAME             SAL
---------- ---------- ----------
--   7839 KING             5000
--   7902 FORD             3000
SELECT empno, ename, sal
FROM emp
WHERE sal>(SELECT avg(sal) FROM emp);

--6. �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ����� �ٹ��ϰ�
--   �ִ� ����� �����ȣ�� �̸��� ����Ѵ�.(11��)
--     EMPNO ENAME     
---------- ----------
--      7902 FORD      
--      7876 ADAMS     
--      7788 SCOTT   
SELECT empno, ename
FROM emp
WHERE deptno IN (SELECT deptno FROM emp WHERE ename LIKE '%T%');

--7 �ڽ��� �޿��� ��ձ޿����� ����,�̸��� S�ڰ� ���� ����� ������
--  �μ����� �ٹ��ϴ� ��� ����� �����ȣ,�̸� �� �޿��� ����Ͻÿ�(4��)
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

--8. 30�� �μ��� �ִ� ����� �߿��� ���� ���� ������ �޴� �������
--   ���� ������ �޴� ������� �̸�, �μ���ȣ, ������ ����Ѵ�. (4��)
--   (��, ALL �Ǵ� ANY �����ڸ� ����� ��)
--  �̸�    �μ���ȣ   ����
--------------------------------
--  JONES     20     2975
--  SCOTT     20     3000
--  KING       10     5000
--  FORD      20     3000
SELECT ename �̸�, deptno �μ���ȣ, sal ����
FROM emp
WHERE SAL > ALL(SELECT SAL FROM EMP WHERE DEPTNO = 30);

--9. 'DALLAS'���� �ٹ��ϰ� �ִ� ����� ���� �μ����� ���ϴ� �����
--   �̸�, �μ���ȣ, ������ ����Ѵ�.(5��)
--ENAME          DEPTNO JOB      
---------- ---------- ---------
--FORD               20 ANALYST  
--ADAMS              20 CLERK    
--SCOTT              20 ANALYST  
--JONES              20 MANAGER  
--SMITH              20 CLERK 
SELECT ename �̸�, deptno �μ���ȣ, JOB ����
FROM emp e
WHERE deptno IN (SELECT deptno FROM dept WHERE loc='DALLAS');

--10. SALES �μ����� ���ϴ� ������� �μ���ȣ, �̸�, ������ ����Ѵ�.(6��)
--    DEPTNO ENAME      JOB      
---------- ---------- ---------
--    30 JAMES      CLERK    
--    30 TURNER     SALESMAN 
--    30 BLAKE      MANAGER    
SELECT deptno, ename, JOB
FROM emp
WHERE deptno=(SELECT deptno FROM dept WHERE dname='SALES');

--11. 'KING'���� �����ϴ� ��� ����� �̸��� �޿��� ����Ѵ�. (3��)
--     (KING���� �����ϴ� ����̶� mgr�� KING�� ����� �ǹ���) 
--ENAME             SAL
---------- ----------
--CLARK            2450
--BLAKE            2850
--JONES            2975
SELECT ename, sal
FROM emp
WHERE mgr = (SELECT empno FROM emp WHERE ename='KING');

--12. Ŀ�̼��� �޴� ����� / �μ���ȣ, ������ ���� �����
--    �̸�, ����, �μ���ȣ�� ����϶�. (6��)
--	ALLEN	1600	30
--	MARTIN	1250	30
--	WARD	1250	30
--	JONES	2975	20
--	KING	5000	10
--	TURNER	1500	30
SELECT ename �̸�, sal ����, deptno �μ���ȣ
FROM emp
WHERE deptno IN (SELECT deptno FROM emp WHERE nvl(comm,0)>0)
AND sal IN (SELECT sal FROM emp WHERE nvl(comm,0)>0);

--13. 30�� �μ� ������ ���ް� Ŀ�̼��� ���� ����
--    ������� �̸�, ����, Ŀ�̼��� ����϶�.(30�� �μ� ����) (2��)
--  ENAME      SAL    COMM
---------- ---------- ----------
--	JONES	2975	30
--	KING	5000	3500
SELECT ename, sal, comm
FROM emp
WHERE sal NOT IN (SELECT sal FROM emp WHERE deptno=30)
AND nvl(comm,0) NOT IN (SELECT nvl(comm,0) FROM emp WHERE deptno=30)
AND deptno <> 30;
