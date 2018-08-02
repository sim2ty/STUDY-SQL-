-- < work ���� >
-- 1. �Ʒ��� ���� EMP01 �̶�� ���̺��� �����  �����͸� �Է��Ѵ�.

--COLUMN_NAME	    DATA_TYPE                      ��������
--------------------------------------------------------------------------------------
--EMPNO	                       NUMBER(3)	                  �⺻Ű
--ENAME	                       VARCHAR(12)                 �ΰ������� 
--SAL	                       NUMBER(5)                        
--HIREDATE	         DATE          		     �⺻��(sysdate)     
--DEPTNO                         NUMBER(2)                           
--
-- 
--111	�Ѹ�		3000	���� ��¥ 		10(�Լ��� �̿��Ͽ� ���ó�¥ ���� �ۼ�)
--112	��ġ		2500	2001-08-03	20
--113	�����		3500	1999-09-23	30
--114	����		2500	2001-08-02	30
--115         ��ũ                       4000      ���� ��¥                40(��������� �⺻�� �������� ���)
--116         �ν�                      3000      ���� ��¥                40(�Ͻ������� �⺻�� �������� ���)

DROP TABLE emp01;
CREATE TABLE emp01(
empno NUMBER(3),
ename VARCHAR(12) NOT NULL,
sal NUMBER(5),
hiredate DATE DEFAULT SYSDATE,
deptno NUMBER(2),
PRIMARY KEY (empno)
);

INSERT INTO emp01 VALUES(111, '�Ѹ�',3000,SYSDATE,10);
INSERT INTO emp01 VALUES(112, '��ġ',2500,to_date('	2001-08-03', 'yyyy-mm-dd'),20);
INSERT INTO emp01 VALUES(113, '�����',3500,to_date('1999-09-23', 'yyyy-mm-dd'),30);
INSERT INTO emp01 VALUES(114, '����',2500,to_date('2001-08-02', 'yyyy-mm-dd'),30);
INSERT INTO emp01 VALUES(115, '��ũ',4000,DEFAULT,40);
INSERT INTO emp01 (empno, ename, sal, deptno) VALUES (116, '�ν�',3000,40);

-- 2. EMP01 ���̺� MGR �÷�(NUMBER(3))�� �߰��Ѵ�.
ALTER TABLE emp01 ADD mgr NUMBER(3);

-- 3. EMP01 ���̺��� SAL �÷��� ���������� NUMBER(8)�� �����Ѵ�.
ALTER TABLE emp01 MODIFY sal NUMBER(8);

-- 4. EMP01 ���̺��� MGR �÷��� �����Ѵ�.
ALTER TABLE emp01 DROP COLUMN mgr;

-- 5. ���̺� ���� EMP02 �� �����Ѵ�.
ALTER TABLE emp01 RENAME TO emp02;

-- 6. EMP02 ���̺��� �����Ѵ�.
DROP TABLE emp02;


-- < jdbctest ���� >
--
--1. ���̺�� : visitor
--    �÷� ��� : name - �ѱ� �������� �ִ� 6�ڸ� ������ �� �ְ�
--                   writedate - ��¥�� �ð��� ������ �� �ְ� 
--                   memo - �ѱ� �������� �ִ� 60�ڸ� ������ �� �ְ�
--                   [visitor ���̺� �����͸� 3�� ���� �Է�]
--	      ��¥ ������ : 1�� : ����ð�,  
--                                      1�� : 2017�� 12�� 25��, 
--                                      1�� : 1999�� 8�� 11��
DROP table visitor;
CREATE TABLE visitor(
NAME VARCHAR2(18),
writedata DATE,
memo VARCHAR2(180)
);

INSERT INTO visitor VALUES('ȫ�浿', SYSDATE, 'ABCDE');
INSERT INTO visitor VALUES('��浿', '2017-12-25', 'FGHIJ');
INSERT INTO visitor VALUES('�ڱ浿', '1999-08-11', 'KLMNO');

-- 2. ���̺�� : member
--    �÷� ��� : m_id -  ���� �������� �ִ� 12�ڸ� ������ �� �ְ� - primary key
--	     m_pwd - ���� �������� �ִ� 12�ڸ� ������ �� �ְ� - not null
--                   name - �ѱ� �������� �ִ� 6�ڸ� ������ �� �ְ�  - not null
--                   joindate - ��¥�� �ð��� ������ �� �ְ�  - �⺻�� sysdate
--

CREATE TABLE MEMBER(
m_id VARCHAR2(24),
m_pwd VARCHAR2(24) NOT NULL,
NAME VARCHAR2(18) NOT NULL,
joindate DATE DEFAULT SYSDATE,
PRIMARY KEY (m_id)
);

-- 3. ���̺�� : news
--     �÷���� : id - ���̰� 8�� ���� Ÿ�� - primary key
--                    writer - �ѱ� �������� �ִ� 6�ڸ� ������ �� �ְ�
--	      title - �ѱ� �������� �ִ� 40�ڸ� ������ �� �ְ�
--	      content - �ѱ� �������� �ִ� 300�ڸ� ������ �� �ְ�
--                     writedate - ��¥�� �ð��� ������ �� �ְ�
--                     cnt - ���̰� 8�� ���� Ÿ��
--
--     ������ ���� : news_seq - 1���� ����, 1�� ����

CREATE TABLE news(
ID NUMBER(8),
writer VARCHAR2(18),
title VARCHAR2(120),
CONTENT VARCHAR2(900),
writedate DATE,
cnt NUMBER(8),
PRIMARY KEY (ID)
);
create sequence news_seq start with 1 increment by 1;

-- 4. ���̺�� : meeting
--     �÷���� : id - ���̰� 8�� ���� Ÿ�� - primary key
--                   name - �ѱ� �������� �ִ� 6�ڸ� ������ �� �ְ�
-- 	      title - �ѱ� �������� �ִ� 40�ڸ� ������ �� �ְ� 
--	      meetingdate - ��¥�� �ð��� ������ �� �ְ�
--
--      ������ ���� : meeting_seq - 1���� ����, 1�� ����

CREATE TABLE meeting(
ID NUMBER(8),
name VARCHAR2(18),
title VARCHAR2(120),
meetingdate DATE,
PRIMARY KEY (ID)
);
CREATE SEQUENCE meeting_seq START WITH 1 INCREMENT BY 1;

--5. ���̺�� : imgtest
--     �÷���� : name - �ѱ� �������� �ִ� 6�ڸ� ������ �� �ְ� - primary key
--                   imgcontent - �̹����� �����ͷ� ������ �� �ְ� (BLOB)

CREATE TABLE imgtest(
NAME VARCHAR2(18),
imgcontent BLOB
);