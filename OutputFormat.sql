--QUESTION
--1. ��� ���̺��� ����̸��� ù���ڴ� �빮�ڷ�, �������� �ҹ��ڷ� ����Ͻÿ�.
-- [���]       ����̸�
--           ---------------------
--                  Smith
		
SELECT initcap(ename) AS "����̸�"
FROM emp;

--2. ������̺��� ����̸��� �̰� �� �̸��� �ι�° ���ں��� �׹�° ���ڱ���
-- ����Ͻÿ�.
-- [���]         ����̸�    2-4����
--                  ---------------------
--                  SMITH        MIT
SELECT ename as "����̸�", substr(ename,2,3) AS "2-4����"
FROM emp;

--3. ������̺��� ��� �̸��� ���� ������ ����Ͻÿ�.
SELECT ename as "����̸�", LENGTH(ename) AS "����"
FROM emp;

--4. ������̺��� ��� �̸��� �� ���� �ϳ��� ������ ���� �ϳ��� ����ϵ� 
-- ��� �ҹ��ڷ� ���� ����Ͻÿ�.
SELECT ename AS "����̸�", lower(substr(ename,1,1)||substr(ename,-1,1)) AS "ù����+����������"
FROM emp;

--5. 3456.78�� �ݿø��Ͽ� �Ҽ��� �Ʒ� ù��° �ڸ� ������ ��Ÿ���ÿ�.
SELECT round(3456.78,1)
FROM dual;

--6. ���޿� 55�� ���ϰ� �ʴ����� �����Ͽ� ����ϴµ� ���޵ڿ� '��'�� ���̰� 
--    õ�������� ','�� �ٿ��� ����Ѵ�.
--[���]	��� ���
-----------------
--          40,000��
--	80,000��
-- 	62,500��
--	148,700��
SELECT to_char(trunc(sal*50,-2), '999,999')||'��'as "�ݾ�"
FROM emp;

--7. ���� �̸��� Ŀ�̼� ���� ���θ� ����ϴµ� �����Ǿ����� '����'
--    �������� �ʾ����� '����'�� ����Ͻÿ�.
--    	SMITH	����	
--	ALLEN	����	300
--	WARD	����	200
--	JONES	����	30
SELECT ename AS "���� �̸�", nvl2(comm,'����','����') as "Ŀ�̼� ���� ����"
FROM emp;

--8. ���� �̸��� �μ���ȣ �׸��� �μ���ȣ�� ���� �μ����� ����Ͻÿ�.
--    �μ��� ���� ������ '����' �� ����Ͻÿ�.
--    (�μ��� : 10 �̸� 'A �μ�', 20 �̸� 'B �μ�', 30 �̸� 'C �μ�')
SELECT ename AS "���� �̸�", decode(deptno, 10, 'A �μ�', 20, 'B �μ�', 30, 'C �μ�', '����' ) as "�μ���"
FROM emp;
SELECT *
FROM emp;

--9. ������ 'SALESMAN'�̰� ������ 1000�̻��� �����
-- �̸��� ������ ����Ͻÿ�.
SELECT ename AS "���� �̸�", sal AS "����"
FROM emp
WHERE JOB='SALESMAN' AND sal >= 1000;

--10. ���ó�¥�� ���ó�¥���� 10���� ���� ��¥�� ����Ͻÿ�.
SELECT SYSDATE, (SYSDATE+10)
FROM dual;

--11. ���� �ð��� "....�� ..�� ..�� ..�� ..��" ���� ����Ͻÿ�.
SELECT to_char(SYSDATE, 'yyyy"��" mm"��" hh"��" mi"��"') as "���� �ð�"
FROM dual;
--12. ������ �̸�, ���޿�, ������ ��ȸ�ϴ� ���Ǹ� �ۼ��Ͻÿ�.
--(��, ������ ������ $200�� �� ���ʽ��� �����Ͽ� ����մϴ�.)

--�̸�              ���޿�               ����
---------------------------------------------------
--SMITH             800                 12000
--ALLEN            1600                 21600
--WARD             1250                 17400
SELECT ename AS "�̸�", sal AS "���޿�", sal*12+200 AS "����"
FROM emp;
--13.  7��26��_�߰�.docx �� ��ü
-- �ڵ� ���� ��� ������ 1000 �̸��̸� A, 1000 �̻��̰� 2000 �̸��̸� B, 2000 �̻��̰� 3000 �̸��̸� C, 
-- 3000 �̻��̰� 4000 �̸��̸� D,  �� �ܿ��� E �� ����Ѵ�.
SELECT ename AS "�̸�", sal AS "����", CASE WHEN sal<1000 THEN 'A' 
                                                                          WHEN sal>=1000 AND sal<2000 THEN 'B'
                                                                          WHEN sal>=2000 AND sal<3000 THEN 'C'
                                                                          WHEN sal>=3000 AND sal<4000 THEN 'D'
                                                                          ELSE 'E'
                                                                    END AS "�ڵ�"                                                                    
FROM emp;

--14. 7��26��_��.docx �� ��ü
-- �ڵ� ���� ��� �μ���ȣ�� 10�̸� A, 20�̸� B, 30�̸� C, 40�̸� E,  
-- �� �ܿ��� f �� ����Ѵ�. decode( ) �Լ��� �ذ��Ѵ�. (��� ������ �޶��� �� �ִ�)
SELECT ename AS "�̸�", deptno AS "�μ���ȣ", decode(deptno, 10, 'A', 20, 'B', 30, 'C', 40, 'E', 'F') AS "�ڵ�"     
FROM emp;
--15.  ���̸��� Employee and Job Title�̰�, �޸��� �������� ���е� �����̸��� 
--������ ����ǵ��� �ϴ� ���Ǹ� �ۼ��Ͻÿ�.

--Employee and Job Title
---------------------------
--SMITH, CLERK
--ALLEN, SALESMAN
SELECT ename||', '||JOB AS "Employee and Job Title"
FROM emp;

--16. �̸��� �ι�° ���ڰ� ��A���� ��� ������ �̸��� ��ȸ�ϴ� ���Ǹ� �ۼ��Ͻÿ� 

--ENAME
----------
--WARD 
--MARTIN
--JAMES
SELECT ename AS "���� �̸�"
FROM emp
WHERE instr(ename, 'A')=2;

--17. �̸�, �Ի���, �Ի��� ������ ��ȸ�ϴ� ���Ǹ� �ۼ��Ͻÿ�
--�Ի��� ������ �������� �������� �����մϴ�.(�̶� ���ؿ����� �����Ϸ� �մϴ�)
--(�̶�, �̸�, �Ի��� �Ի���� ��Ī�� ����մϴ�.)

--�̸�                �Ի���              �Ի����
---------------------------------------------------
--MARTIN         1981��9��28��        ������
SELECT ename AS "�̸�", hiredate AS "�Ի���", to_char(hiredate, 'day') AS "�Ի����"
FROM emp, dual
ORDER BY to_char(hiredate - 1, 'D');

--18.   ��� ������ �̸��� ��������� �Ի�Ⱓ�� ������(���� ����� ���� �ݿø��� ��)�� 
--   ��ȸ�ϴ� ���Ǹ� �ۼ��Ͻÿ�
--   (�̶�, �Ի�Ⱓ�� �ش��ϴ� ����Ī�� ��MONTHS WORKED���� �ϰ�, 
--    �Ի�Ⱓ�� ���� ���� ���������� �����մϴ�.)

--��¿�)
--ENAME         MONTHS WORKED
--------------------------------
--ADAMS            284
--SCOTT            286
--MILLER           348
SELECT ename, round(months_between(SYSDATE,hiredate)) AS "MONTHS WORKED"
FROM emp, dual
ORDER BY "MONTHS WORKED";

--19. ������̺��� ����̸��� ������� ���� ��¥������ �ٹ��ϼ��� ���Ͻÿ�.
--����̸�   �ٹ��ϼ�
-- -----------------------
--SMITH    12474��
--ALLEN    12409��
--WARD    12407��
--JONES    12368��
--MARTIN    12189��
--BLAKE    12369��
SELECT ename AS "����̸�", round(SYSDATE-hiredate)||'��' AS "�ٹ��ϼ�"
FROM emp, dual;

--20. 1981�⵵�� �Ի��� �������� �̸�, ���� �׸��� �Ի�����
--         �Ի��� ������ ����Ͻÿ�.
SELECT ename AS "�̸�", JOB AS "����", hiredate AS "�Ի���"
FROM emp
WHERE to_char(hiredate,'yyyy')='1981'
ORDER BY hiredate;

--21. �������� �������� ������ ����ϴ� SQL  ����� �ۼ��Ͻÿ�.
SELECT TO_CHAR( (TO_DATE(19870723) ), 'day') as "����"
FROM dual;

--22. ���縦 �������� ���� �¾�� �� ���� �Ǿ����� �� �� �ִ� 
--      SQL ����� �ۼ��Ͻÿ�.
SELECT trunc(months_between(SYSDATE,(TO_DATE(19870723)))) AS "��� �� ���� ��"
FROM dual;

--23. �������� �̸��� ���� �׸��� Ŀ�̼� ������ ����ϴµ�
--     Ŀ�̼��� �������� ���� ������ "����"�̶�� ����Ͻÿ�.
SELECT ename AS "�̸�", sal AS "����", nvl2(comm,to_char(comm),'����') AS "Ŀ�̼�"
FROM emp;

--24. ������̺��� �̸��� ù���ڰ� A�̰� ������ ���ڰ� N�� �ƴ� �����
-- �̸��� ����Ͻÿ�.
SELECT ename AS "�̸�"
FROM emp
WHERE substr(ename,1,1)='A' AND substr(ename,-1,1)<>'N';

--25. ������ �̸�, �Ի� ��¥ �׸��� �⵵�� �������� �Ͽ� �ݿø��� ��¥��
--     ����Ͻÿ�.        
SELECT ename AS "�̸�", hiredate AS "�Ի糯¥", round(hiredate,'year') AS "�ݿø��� ��¥"
FROM emp, dual;
