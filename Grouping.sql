--QUESTION

--1.  �����ȣ�� ����̸�, �׸��� �� ����� �����ϴ� �������� 
-- �����ȣ�� ����̸��� ����ϵ� ������ �÷����� '�����ȣ',
-- '����̸�', '�����ڹ�ȣ', '�������̸�'���� �Ͽ� ����Ͻÿ�. (15��)
--   �����ڰ� ������ '����'�� ��� ����Ѵ�.
--    �����ȣ ����̸�            �����ڹ�ȣ �������̸�     
---------- ---------- ---------- ----------
--    7902    FORD               7566        JONES     
--    7788    SCOTT              7566       JONES     
--    7900   JAMES              7698       BLAKE 
SELECT x.empno AS "�����ȣ", x.ename AS "����̸�", nvl(to_char(x.mgr),'����') as "�����ڹ�ȣ", nvl(y.ename,'����') AS "�������̸�"
FROM emp x, emp y
WHERE x.mgr=y.empno(+);

SELECT x.empno AS "�����ȣ", x.ename AS "����̸�", nvl(to_char(x.mgr),'����') AS "�����ڹ�ȣ", nvl(y.ename,'����') AS "�������̸�"
FROM emp x left JOIN emp y ON x.mgr=y.empno;

--2. ��� ������ ������ ����� ���Ͻÿ�. 
--   (�Ҽ��� ���� ��°�ڸ������� ��Ÿ���� ��°�ڸ� ���ʹ� �����Ͻÿ�)
--	���� ���
               -----------
--	   x
SELECT trunc(avg(sal),2) AS "���� ���"
FROM emp;

--3. ��� �������� �޴� Ŀ�̼��� ���� ���Ͻÿ�.
--	Ŀ�̼� ��
               -----------
--	  x
SELECT sum(comm) AS "Ŀ�̼� ��"
FROM emp;

--4. 'DALLAS'���� �ٹ����� ������ ����� ������ ���� ������ ���� �������� �����Ͻÿ�.

--	ó�����
	----------------------------
--                �������� X���̰� ������ ���� X�Դϴ�.
SELECT '�������� '||count(empno)||'���̰� ������ ���� '||sum(sal)||'�Դϴ�.' ó�����
FROM emp e, dept d
WHERE e.deptno=d.deptno and loc='DALLAS';

SELECT '�������� '||count(empno)||'���̰� ������ ���� '||sum(sal)||'�Դϴ�.' ó�����
FROM emp e JOIN dept d
ON e.deptno=d.deptno
WHERE loc='DALLAS';

--5. �μ��� �ִ� ������ "�μ���", "�ִ����" ���� ����Ͻÿ�.(�ִ������ ū ��)
	
--	�μ���	�ִ����
	----------------------------
--	xxxx          xxx
--	 :	   :
SELECT dname AS "�μ���", MAX(sal) AS "�ִ����"
FROM emp e, dept d
WHERE e.deptno=d.deptno
GROUP BY dname
ORDER BY "�ִ����" DESC;

SELECT dname AS "�μ���", MAX(sal) AS "�ִ����"
FROM emp e JOIN dept d
ON e.deptno=d.deptno
GROUP BY dname
ORDER BY "�ִ����" DESC;

--6. ���޺� �ּ� ������ 3000 �̻��� �Ǵ� ������ ���޸�� �ּ� ������  ����Ͻÿ�. 

--	���޸�	�ּҿ���
	----------------------------
--	xxxx          xxx
--	 :	   :
SELECT JOB AS "���޸�", MIN(sal) AS "�ּҿ���"
FROM emp
GROUP BY JOB
HAVING MIN(sal)>=3000;

--7. �μ��� ��տ����� ����ϵ�, ��տ��ް� 2000����
-- ū �μ��� �μ� �̸��� ��տ����� ����Ͻÿ�.

--	�μ���     ��տ���
           	------------------------
--	xxxx          xxx
--	 :	   :
SELECT dname AS "�μ���", round(avg(sal)) AS "��տ���"
FROM emp e, dept d
WHERE e.deptno=d.deptno
GROUP BY dname
HAVING round(avg(sal))>2000;

SELECT dname AS "�μ���", round(avg(sal)) AS "��տ���"
FROM emp e join dept d
ON e.deptno=d.deptno
GROUP BY dname
HAVING round(avg(sal))>2000;

--8. �� ���޺��� �ѿ����� ����ϵ� �ѿ����� ���� ������ ����Ͻÿ�.

--	���޸�	�ѿ���
	----------------------------
--	xxxx          xxx
--	 :	   :
SELECT JOB AS "���޸�", sum(sal) AS "�ѿ���"
FROM emp
GROUP BY JOB
ORDER BY sum(sal);

--9. ���޺� �ѿ����� ����ϵ�, ������ 'MANAGER'�� �������� �����Ͻÿ�. 
--   �׸��� �� �ѿ����� 5000���� ū ���޿� �ѿ��޸� ����Ͻÿ�.

--	���޸�	�ѿ���
	----------------------------
--	xxxx          xxx
--	 :	   :
SELECT JOB AS "���޸�", sum(sal) AS "�ѿ���"
FROM emp
WHERE JOB <> 'MANAGER'
GROUP BY JOB
HAVING sum(sal)>5000;

--10. Ŀ�̼��� ������ ������ �߿��� �μ��� �ִ������ ����Ͻÿ�. 
--�ִ� ������ ���� ������ �����Ͽ� ����Ͻÿ�.

--	�μ���     �ִ����
           	------------------------
--	xxxx          xxx
--	 :	   :
SELECT dname AS "�μ���", MAX(sal) AS "�ִ����"
FROM emp e, dept d
WHERE e.deptno=d.deptno AND comm IS NOT NULL
GROUP BY dname
ORDER BY "�ִ����" DESC;

SELECT dname AS "�μ���", MAX(sal) AS "�ִ����"
FROM emp e JOIN dept d
ON e.deptno=d.deptno
WHERE comm IS NOT NULL
GROUP BY dname
ORDER BY "�ִ����" DESC;

--11. 30�� �μ��� ������ ����� ����� �˻��Ѵ�.
-- ��������� ����+Ŀ�̼�(null�̸� 0���� ���)�̸� 
-- ��� ����� �Ҽ��� ���� �� �ڸ�(�ݿø�)���� ���ϵ� ������� ����Ѵ�.
--              ������       ��տ���
              ---------------------------
--             xxxx         xxx.xx
--  :	    :
SELECT JOB AS "������", to_char(round(avg(sal*12+nvl(comm,0)),2),'99999.99') AS "��տ���"
FROM emp 
WHERE deptno=30
GROUP BY JOB;

--12. �μ��� �ٹ� ������ 5�� �̻��� �μ��� �μ���� �������� ����Ѵ�.

--	�μ���       �ٹ��ο� ��
              ---------------------------
--              xxxx            x
--	 :	    :
SELECT dname AS "�μ���", count(empno) AS "������"
FROM emp e, dept d
WHERE e.deptno=d.deptno
GROUP BY dname
HAVING count(empno)>=5;

SELECT dname AS "�μ���", count(empno) AS "������"
FROM emp e JOIN dept d
ON e.deptno=d.deptno  
GROUP BY dname
HAVING count(empno)>=5;