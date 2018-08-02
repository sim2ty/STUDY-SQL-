--���̺� ������ ����ؾ� �ϴ� ��� SQL ���� ANSI ���ΰ� ����Ŭ ���� 2������ SQL ������ �ۼ��Ͽ� �����Ѵ�.

@ c:/SQL_DATA/work_db2.sql

-- 1. course1 �� course2 �� ��� �����ϴ� �л����� �̸�, ��ȭ ��ȣ �׸��� 
--    ���̸� ����Ͻÿ�.
SELECT name as "�̸�", phone as "��ȭ��ȣ", age as "����"
FROM course1
INTERSECT
SELECT name as "�̸�", phone as "��ȭ��ȣ", age as "����"
FROM course2;

-- 2. course1 �̵� course2 �� �����ϴ� �л����� �̸�, ��ȭ ��ȣ �׸��� 
--    ���̸� ����ϴµ� ���̰� ���� ������ ����Ͻÿ�.
SELECT name as "�̸�", phone as "��ȭ��ȣ", age as "����"
FROM course1
UNION
SELECT NAME AS "�̸�", phone AS "��ȭ��ȣ", age AS "����"
FROM course2
ORDER BY "����" DESC;

-- 3. course1�� ���������� course2 �� �������� �ʴ� �л����� �̸��� ����Ͻÿ�.
SELECT name as "�̸�"
FROM course1
MINUS
SELECT NAME AS "�̸�"
FROM course2;
-- 4. course2�� ���������� course1 �� �������� �ʴ� �л����� �̸��� ��ȭ��ȣ�� 
--    �̸� ������ ����Ͻÿ�.
SELECT name as "�̸�", phone as "��ȭ��ȣ"
FROM course2
MINUS
SELECT NAME AS "�̸�", phone AS "��ȭ��ȣ"
FROM course1
ORDER BY "�̸�";

-- 5. DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸��� ����Ͻÿ�.(5��)
--�̸�         ����        �μ��̸�          
---------- --------- --------------
--SMITH      CLERK     RESEARCH      
--JONES      MANAGER   RESEARCH      
--SCOTT      ANALYST   RESEARCH      
--ADAMS      CLERK     RESEARCH      
--FORD       ANALYST   RESEARCH      
SELECT ename AS "�̸�", JOB AS "����", e.deptno AS "�μ���ȣ", dname AS "�μ��̸�"
FROM emp e, dept d
WHERE e.deptno=d.deptno AND loc='DALLAS';

SELECT ename AS "�̸�", JOB AS "����", e.deptno AS "�μ���ȣ", dname AS "�μ��̸�"
FROM emp e JOIN dept d
ON e.deptno=d.deptno 
WHERE loc='DALLAS';

-- 6. �̸��� 'A'�� ���� ������� �̸��� �μ��̸��� ����Ͻÿ�.(7��)
--�̸�         �μ��̸�          
---------- --------------
--ALLEN      SALES         
--WARD       SALES         
--MARTIN     SALES        
SELECT ename AS "�̸�", dname AS "�μ��̸�"
FROM emp e, dept d
WHERE e.deptno=d.deptno AND ename like '%A%';

SELECT ename AS "�̸�", dname AS "�μ��̸�"
FROM emp e JOIN dept d
ON e.deptno=d.deptno 
WHERE ename like '%A%';

-- 7. ����̸��� �� ����� ���� �μ��� �μ���, �׸��� ������ 
--����ϴµ� ������ 3000�̻��� ����� ����Ͻÿ�. (3��)
--����̸�       �μ���                    ����
---------- -------------- ----------
--KING       ACCOUNTING           5000
--FORD       RESEARCH             3000
--SCOTT      RESEARCH             3000
SELECT ename AS "�̸�", dname AS "�μ��̸�", sal AS "����"
FROM emp e, dept d
WHERE e.deptno=d.deptno AND sal>=3000;

SELECT ename AS "�̸�", dname AS "�μ��̸�", sal AS "����"
FROM emp e JOIN dept d
ON e.deptno=d.deptno 
WHERE sal>=3000;

-- 8. ������ 'SALESMAN'�� ������� ������ �� ����̸�, �׸���
-- �� ����� ���� �μ� �̸��� ����Ͻÿ�. (4��)
--����        ����̸�       �μ��̸�          
--------- ---------- --------------
--SALESMAN  TURNER     SALES         
--SALESMAN  MARTIN     SALES         
--SALESMAN  WARD       SALES         
--SALESMAN  ALLEN      SALES       
SELECT JOB AS "����", ename AS "����̸�", dname AS "�μ� �̸�"
FROM emp e, dept d
WHERE e.deptno=d.deptno AND job='SALESMAN';

SELECT JOB AS "����", ename AS "����̸�", dname AS "�μ��̸�"
FROM emp e JOIN dept d
ON e.deptno=d.deptno 
WHERE job='SALESMAN';

-- 9. Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�,
-- �޿������ ����ϵ�, ������ �÷����� '�����ȣ', '����̸�',
-- '����','�Ǳ޿�', '�޿����'���� �Ͽ� ����Ͻÿ�. (6��)
--  �����ȣ ����̸�               ����        �Ǳ޿�       �޿����
---------- ---------- ---------- ---------- ----------
--  7521 WARD            15000      15200          2
--  7654 MARTIN          15000      15300          2
--  7844 TURNER          18000      18000          3
SELECT empno AS "�����ȣ", ename AS "����̸�", sal*12 AS "����", sal*12+comm AS "�Ǳ޿�", grade AS "�޿����"
FROM emp e, salgrade s
WHERE comm is not null and sal BETWEEN losal AND hisal;

SELECT empno AS "�����ȣ", ename AS "����̸�", sal*12 AS "����", sal*12+comm AS "�Ǳ޿�", grade AS "�޿����"
FROM emp e JOIN salgrade s
ON sal BETWEEN losal AND hisal
WHERE comm IS NOT NULL;

-- 10. �μ���ȣ�� 10���� ������� �μ���ȣ, �μ��̸�, ����̸�,
-- ����, �޿������ ����Ͻÿ�. (3��)
--   �μ���ȣ �μ��̸�           ����̸�               ����       �޿����
---------- -------------- ---------- ---------- ----------
--      10 ACCOUNTING     CLARK            2450          4
--      10 ACCOUNTING     KING             5000          5
--      10 ACCOUNTING     MILLER           1300          2 
SELECT e.deptno AS "�μ���ȣ", dname as "�μ��̸�", ename AS "����̸�", sal AS "����", grade AS "�޿����"
FROM emp e, dept d, salgrade s
WHERE e.deptno=d.deptno and e.deptno=10 and sal BETWEEN losal AND hisal;

SELECT e.deptno AS "�μ���ȣ", dname AS "�μ��̸�", ename AS "����̸�", sal AS "����", grade AS "�޿����"
FROM salgrade s, emp e 
JOIN dept d ON e.deptno=d.deptno
where e.deptno=10 and sal BETWEEN losal AND hisal;

-- 11. �μ���ȣ�� 10��, 20���� ������� �μ���ȣ, �μ��̸�, 
-- ����̸�, ����, �޿������ ����Ͻÿ�. �׸��� �� ��µ� 
-- ������� �μ���ȣ�� ���� ������, ������ ���� ������ �����Ͻÿ�. (8��)
--   �μ���ȣ �μ��̸�           ����̸�               ����       �޿����
---------- -------------- ---------- ---------- ----------
--    10 ACCOUNTING     KING             5000          5
--    10 ACCOUNTING     CLARK            2450          4
SELECT e.deptno AS "�μ���ȣ", dname as "�μ��̸�", ename AS "����̸�", sal AS "����", grade AS "�޿����"
FROM emp e, dept d, salgrade s
WHERE e.deptno=d.deptno AND e.deptno in (10,20) AND sal BETWEEN losal AND hisal
ORDER BY "�μ���ȣ";


SELECT e.deptno AS "�μ���ȣ", dname AS "�μ��̸�", ename AS "����̸�", sal AS "����", grade AS "�޿����"
FROM salgrade s, emp e 
JOIN dept d ON e.deptno=d.deptno
WHERE e.deptno in (10,20) AND sal BETWEEN losal AND hisal
ORDER BY "�μ���ȣ";

-- 12. ������� �̸�, �μ���ȣ, �μ��̸��� ����Ͻÿ�. (15��) 
-- ��, ������ ���� �μ��� ����ϸ� �̰�� �̸��� '����'�̶��
-- ����Ѵ�.        
--�̸�               �μ���ȣ �μ��̸�          
---------- ---------- --------------
--SMITH              20 RESEARCH      
--ALLEN              30 SALES         
--WARD               30 SALES         
--JONES              20 RESEARCH      
SELECT nvl(ename,'����') AS "�̸�", d.deptno AS "�μ���ȣ", dname AS "�μ��̸�"
FROM emp e, dept d
WHERE e.deptno(+)=d.deptno;

SELECT nvl(ename,'����') AS "�̸�", d.deptno AS "�μ���ȣ", dname AS "�μ��̸�"
FROM emp e right JOIN dept d
ON e.deptno=d.deptno;

-- 13. ������� �̸�, �μ���ȣ, �μ��̸��� ����Ͻÿ�. (15��) 
-- ��, ���� �μ� ��ġ�� ������ ������  ����ϸ� �̰�� �μ���ȣ��  0 ����
-- ����Ѵ�.        
--�̸�               �μ���ȣ �μ��̸�          
---------- ---------- --------------
--SMITH              20 RESEARCH      
--ALLEN              30 SALES         
--WARD               30 SALES         
--JONES              20 RESEARCH      
SELECT ename AS "�̸�", nvl(e.deptno,'0') AS "�μ���ȣ", dname AS "�μ��̸�"
FROM emp e, dept d
WHERE e.deptno=d.deptno(+);

SELECT nvl(ename,'0') AS "�̸�", nvl(e.deptno,'0') AS "�μ���ȣ", dname AS "�μ��̸�"
FROM emp e left JOIN dept d
ON e.deptno=d.deptno;

-- 14. ������� �̸�, �μ���ȣ, �μ��̸��� ����Ͻÿ�. (16��) 
-- ��, ������ ���� �μ��� ����ϸ� �̰�� �̸��� �μ���ȣ�� '����'�̶��
-- ����Ѵ�. ���� �μ� ��ġ�� ������ ������  ����ϸ� �μ� ��ȣ�� �μ� �̸���
-- '����' �̶�� ����Ѵ�.     
--�̸�               �μ���ȣ �μ��̸�          
---------- ---------- --------------
--SMITH              20 RESEARCH      
--ALLEN              30 SALES         
--WARD               30 SALES         
--JONES              20 RESEARCH    
SELECT nvl(ename,'����') AS "�̸�", to_char(d.deptno) AS "�μ���ȣ", dname AS "�μ��̸�"
FROM emp e, dept d
WHERE e.deptno(+)=d.deptno
UNION
SELECT ename AS "�̸�", nvl(to_char(e.deptno),'����') AS "�μ���ȣ", nvl(dname,'����') AS "�μ��̸�"
FROM emp e, dept d
WHERE e.deptno=d.deptno(+);

SELECT nvl(ename,'����') AS "�̸�", nvl(to_char(d.deptno),'����') AS "�μ���ȣ", nvl(dname,'����') AS "�μ��̸�"
FROM emp e full JOIN dept d ON e.deptno=d.deptno;


--15. Ŀ�̼��� ������ ��� ������ �̸�, Ŀ�̼�, �μ��̸�, ��ġ�� ��ȸ�ϴ� sql�� �ۼ��Ͻÿ�.

--ENAME           COMM        DNAME         	LOC
----------------------------------------------------
--KING		3500	ACCOUNTING	NEW YORK
--JONES		30	RESEARCH	DALLAS
--TURNER	0	SALES		CHICAGO
--MARTIN	300	SALES		CHICAGO
--WARD		200	SALES		CHICAGO
--ALLEN		300	SALES		CHICAGO         
SELECT ename AS "�̸�", comm AS "Ŀ�̼�", dname AS "�μ��̸�", loc AS "��ġ"
FROM emp e, dept d
WHERE e.deptno=d.deptno AND comm IS NOT NULL;

SELECT ename AS "�̸�", comm AS "Ŀ�̼�", dname AS "�μ��̸�", loc AS "��ġ"
FROM emp e JOIN dept d ON e.deptno=d.deptno
WHERE comm IS NOT NULL;

-- 16. DALLAS���� �ٹ��ϴ� ����� �̸�,  ����, ����� ����Ͻÿ�.(5��)
--�̸�         ����             ���          
---------- --------- --------------
--SMITH      800         1      
--JONES      2975       4   
--SCOTT      3000      4      
--ADAMS    1100         1
--FORD       3000        4      
SELECT ename AS "�̸�", sal AS "����", grade AS "���"
FROM emp e, dept d, salgrade s
WHERE e.deptno=d.deptno AND loc='DALLAS' AND sal BETWEEN losal AND hisal;

SELECT ename AS "�̸�", sal AS "����", grade AS "���"
FROM salgrade s, emp e JOIN dept d ON e.deptno=d.deptno
WHERE loc='DALLAS' AND sal BETWEEN losal AND hisal;

--17. �����ȣ�� ����̸�, �׸��� �� ����� �����ϴ� �������� 
-- �����ȣ�� ����̸��� ����ϵ� ������ �÷����� '�����ȣ',
-- '����̸�', '�����ڹ�ȣ', '�������̸�'���� �Ͽ� ����Ͻÿ�. (15��)
--   �����ڰ� ������ '����'�� ��� ����Ѵ�.
--    �����ȣ ����̸�            �����ڹ�ȣ �������̸�     
---------- ---------- ---------- ----------
--  7902 FORD             7566 JONES     
--  7788 SCOTT            7566 JONES     
--   7900 JAMES            7698 BLAKE   
SELECT x.empno AS "�����ȣ", x.ename AS "����̸�", nvl(to_char(x.mgr),'����') as "�����ڹ�ȣ", nvl(y.ename,'����') AS "�������̸�"
FROM emp x, emp y
WHERE x.mgr=y.empno(+);

SELECT x.empno AS "�����ȣ", x.ename AS "����̸�", nvl(to_char(x.mgr),'����') AS "�����ڹ�ȣ", nvl(y.ename,'����') AS "�������̸�"
FROM emp x left JOIN emp y ON x.mgr=y.empno;
