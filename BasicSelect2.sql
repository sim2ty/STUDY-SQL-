--1. hr ����� ������ �����Ǿ� �ִ� ��� ���̺��� ����Ʈ�� ����Ѵ�.
SELECT * FROM TAB;

--2. employees, departments, locations, countries ���̺���� ������ �����Ѵ�.
DESC employees;
DESC departments;
DESC locations;
DESC countries;

--3. employees ���̺��� ��� �����͵��� ����ϴµ� ���� �Ի��� ������ ����Ѵ�.
SELECT *
FROM employees
ORDER BY hire_date;

--4. �������� �޴� ������ �Ѿ׼��� ����ϴµ� õ �������� , �� �Բ� ����ϰ� �������� '��' ����Ѵ�.   ���� �÷����� "�ѱ޿� �ݾ�" �� �ǵ��� �Ѵ�.
SELECT to_char(sum(salary),'999,999,999')||'��' "�ѱ޿� �ݾ�"
FROM employees;

--5. �������� �̸�(first_name) �׸��� ������ �ٹ��ϴ� �μ����� ����Ѵ�.
--   �μ� ������ ������ ������ �����Ѵ�.(106��)
SELECT first_name "�̸�", department_name "�μ���"
FROM employees e, departments d
WHERE e.department_id=d.department_id
AND e.department_id IS NOT NULL;

--6. ����(JOB_ID)�� ������ ����� ����Ѵ�. ��� �÷����� "����", "������ ���" �̴�.(19��)
SELECT job_id "����", avg(salary) "������ ���"
FROM employees
GROUP BY job_id;

--7. Ŀ�̼��� �޴� �������� �̸��� ���� �������� ���еǴ� �ϳ��� �÷����� ����Ѵ�.
--    �÷����� "������ ����" �̴�.(35��)
SELECT last_name||' '||first_name "������ ����"
FROM employees
WHERE commission_pct IS NOT NULL;

--8. ������ ����� Ŀ�̼��� ���� ���θ� ����ϰ��� �Ѵ�. Ŀ�̼��� ������ ������ "����", ������ "����" �� ����ϸ� �÷����� "���", "Ŀ�̼� ���� ����"�� �Ѵ�.
SELECT employee_id "���", nvl2(to_char(commission_pct), '����', '����') "Ŀ�̼� ���� ����"
FROM employees;

--9. �μ� ��ġ�� ���� ���� ������ id(employee_id), �̸�(first_name), �ش� ������ ����ϴ� �Ŵ��� ID, �Ŵ����� �̸��� ��ȸ�Ͽ� ����Ѵ�. �÷����� "����ID", "�����̸�", "�Ŵ���ID", "�Ŵ����̸�" �����Ѵ�.(1��)
SELECT x.employee_id "����ID", x.first_name "�����̸�", x.manager_id "�Ŵ��� ID", y.first_name "�Ŵ����̸�"
FROM employees x, employees y
WHERE x.manager_id=y.employee_id
AND x.department_id is null;

--10. ���޺���  ������ �ְ�޿��� ��ȸ�Ͽ� ����Ѵ�. ��, ��½� �ְ�޿� ������������ ���ĵǾ� ����ϸ� �ְ� �޿��� 10000 �̻��� ��쿡�� ����Ѵ�. �÷����� "����", "�ְ� �޿�" ��� �����Ѵ�.(9��)
SELECT job_id "����", MAX(salary) "�ְ�޿�"
FROM employees
GROUP BY job_id
HAVING MAX(salary)>=10000
ORDER BY �ְ�޿� DESC;

--11. �Ի���� 7���� ������ �̸�(first_name),  �μ��̸�(department_name)  �� ����-�Ի���ޡ��� ����Ѵ�.(7��)
SELECT first_name "������ �̸�", department_name "�μ��̸�", '��-�Ի����'
FROM employees e, departments d
WHERE e.department_id=d.department_id
AND substr(hire_date,4,2)='07';

--12. �Ի�⵵�� �������� ���Ͽ� ����Ͻÿ�. ��, �޿��� 5000���� 10000 ���̸� ������ �׸���  �������� 7�� �̻��� ��츸 �Ի�⵵ ������ �����Ѵ�.  �⵵���� '��'�� �ٿ��� ǥ���ϸ� �÷����� "�Ի�⵵", "������" �� �����Ѵ�.(3��)
SELECT substr(hire_date,0,2) "�Ի�⵵", count(employee_id) "������"
FROM employees
WHERE salary BETWEEN 5000 AND 10000
GROUP BY substr(hire_date,0,2)
HAVING count(employee_id)>=7;

--13. ���� �̸��� ��ģ ���̰� 15�� �̻��� �����鿡 ���Ͽ� �̸��� ���� �������� ������ �÷��� �ٹ� �������
--     ������ ū ������ ����Ѵ�.  �÷����� "���� �̸�", "�ٹ� ����" �� �����Ѵ�.(11��)
SELECT  last_name||' '||first_name "���� �̸�", country_name "�ٹ� ����"
FROM employees e, departments d, locations l, countries c 
WHERE e.department_id=d.department_id
AND d.location_id=l.location_id
AND l.country_id=c.country_id
AND LENGTH(last_name)+LENGTH(first_name)>=15
ORDER BY salary DESC;