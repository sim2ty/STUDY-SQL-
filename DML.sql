-- 1. EMP ���̺��� �����ȣ�� 7499���� ����� ������ 5000�޷��� �����Ѵ�.
UPDATE emp SET sal=5000
WHERE empno=7499;
ROLLBACK;
--SELECT sal
--FROM emp
--where empno=7499;

-- 2. EMP���̺��� �μ���ȣ�� 20���� ������� ������ ���� ���޿��� 10% �λ��� �ݾ����� �����Ѵ�.
UPDATE emp SET sal=sal*1.1
WHERE deptno=20;
ROLLBACK;

-- 3. DEPT ���̺� �Ʒ��� �������� �����͸� �Է��Ѵ�.
-- �μ���ȣ: 50, �μ���ġ: BOSTON,  �μ���: RESERCH
INSERT INTO dept VALUES (50, 'RESEARCH', 'BOSTON');
ROLLBACK;

-- 4. EMP ���̺� �Ʒ��� ���� �����͸� �����Ѵ�.
-- �����ȣ: 9900, ����̸�: JACKSON, ����: SALESMAN, �μ���ȣ: 10, ���� : 800
INSERT INTO emp (empno, ename, JOB, deptno, sal) VALUES (9900, 'JACKSON', 'SALESMAN', 10, 800);
ROLLBACK;
-- 5. DEPT ���̺� �Ʒ��� �������� �����͸� �Է��Ѵ�.
-- �μ���ȣ: 60, �μ���ġ: NULL,  �μ���: MARKETING
INSERT INTO dept VALUES (60, 'MARKETING', NULL);
ROLLBACK;

-- 6. �����ȣ�� 7698���� ����� �μ���ȣ�� 7369�� ����� 
-- �μ���ȣ�� �����Ѵ�.(SQL �� 2��)
UPDATE emp SET deptno = (select deptno from emp where empno=7369)
WHERE empno=7698;
ROLLBACK;

-- 7. 20�� �μ��� �������� ��� �����Ѵ�.
DELETE FROM emp
WHERE deptno=20;
ROLLBACK;

-- 8. ������ 1000 ������ �������� �����Ѵ�.
DELETE FROM emp
WHERE sal<=1000;
ROLLBACK;

-- 9. �����ȣ�� 7788 �� ������ ������ ���� ���޿��� 5% ������Ű�� �μ���ȣ�� 40���� �����Ѵ�.
UPDATE emp SET sal=sal*1.05, deptno=40
WHERE empno=7788;
ROLLBACK;
-- 10. ���縦 �������� �Ի����� 37�� �̻��� �����鿡 ���Ͽ� ������ 2��� �����ϰ� Ŀ�̼ǵ� 3000���� �����Ѵ�.
--       (�Ի����� �⵵�� �������� �ݿø��Ͽ� ����Ѵ�.)
UPDATE emp SET sal=sal*2, comm=3000
WHERE EXTRACT (YEAR FROM SYSDATE) - EXTRACT (YEAR FROM round(hiredate, 'year'))>=37;
ROLLBACK;
