-- < work 계정 >
-- 1. 아래와 같이 EMP01 이라는 테이블을 만들고  데이터를 입력한다.

--COLUMN_NAME	    DATA_TYPE                      제약조건
--------------------------------------------------------------------------------------
--EMPNO	                       NUMBER(3)	                  기본키
--ENAME	                       VARCHAR(12)                 널값허용안함 
--SAL	                       NUMBER(5)                        
--HIREDATE	         DATE          		     기본값(sysdate)     
--DEPTNO                         NUMBER(2)                           
--
-- 
--111	둘리		3000	오늘 날짜 		10(함수를 이용하여 오늘날짜 직접 작성)
--112	또치		2500	2001-08-03	20
--113	도우너		3500	1999-09-23	30
--114	희동이		2500	2001-08-02	30
--115         듀크                       4000      오늘 날짜                40(명시적으로 기본값 제약조건 사용)
--116         턱시                      3000      오늘 날짜                40(암시적으로 기본값 제약조건 사용)

DROP TABLE emp01;
CREATE TABLE emp01(
empno NUMBER(3),
ename VARCHAR(12) NOT NULL,
sal NUMBER(5),
hiredate DATE DEFAULT SYSDATE,
deptno NUMBER(2),
PRIMARY KEY (empno)
);

INSERT INTO emp01 VALUES(111, '둘리',3000,SYSDATE,10);
INSERT INTO emp01 VALUES(112, '또치',2500,to_date('	2001-08-03', 'yyyy-mm-dd'),20);
INSERT INTO emp01 VALUES(113, '도우너',3500,to_date('1999-09-23', 'yyyy-mm-dd'),30);
INSERT INTO emp01 VALUES(114, '희동이',2500,to_date('2001-08-02', 'yyyy-mm-dd'),30);
INSERT INTO emp01 VALUES(115, '듀크',4000,DEFAULT,40);
INSERT INTO emp01 (empno, ename, sal, deptno) VALUES (116, '턱시',3000,40);

-- 2. EMP01 테이블에 MGR 컬럼(NUMBER(3))을 추가한다.
ALTER TABLE emp01 ADD mgr NUMBER(3);

-- 3. EMP01 테이블에서 SAL 컬럼의 데이터형을 NUMBER(8)로 변경한다.
ALTER TABLE emp01 MODIFY sal NUMBER(8);

-- 4. EMP01 테이블에서 MGR 컬럼을 삭제한다.
ALTER TABLE emp01 DROP COLUMN mgr;

-- 5. 테이블 명을 EMP02 로 변경한다.
ALTER TABLE emp01 RENAME TO emp02;

-- 6. EMP02 테이블을 삭제한다.
DROP TABLE emp02;


-- < jdbctest 계정 >
--
--1. 테이블명 : visitor
--    컬럼 사양 : name - 한글 기준으로 최대 6자를 저장할 수 있게
--                   writedate - 날짜와 시간을 저장할 수 있게 
--                   memo - 한글 기준으로 최대 60자를 저장할 수 있게
--                   [visitor 테이블에 데이터를 3개 행을 입력]
--	      날짜 데이터 : 1개 : 현재시간,  
--                                      1개 : 2017년 12월 25일, 
--                                      1개 : 1999년 8월 11일
DROP table visitor;
CREATE TABLE visitor(
NAME VARCHAR2(18),
writedata DATE,
memo VARCHAR2(180)
);

INSERT INTO visitor VALUES('홍길동', SYSDATE, 'ABCDE');
INSERT INTO visitor VALUES('김길동', '2017-12-25', 'FGHIJ');
INSERT INTO visitor VALUES('박길동', '1999-08-11', 'KLMNO');

-- 2. 테이블명 : member
--    컬럼 사양 : m_id -  영문 기준으로 최대 12자를 저장할 수 있게 - primary key
--	     m_pwd - 영문 기준으로 최대 12자를 저장할 수 있게 - not null
--                   name - 한글 기준으로 최대 6자를 저장할 수 있게  - not null
--                   joindate - 날짜와 시간을 저장할 수 있게  - 기본값 sysdate
--

CREATE TABLE MEMBER(
m_id VARCHAR2(24),
m_pwd VARCHAR2(24) NOT NULL,
NAME VARCHAR2(18) NOT NULL,
joindate DATE DEFAULT SYSDATE,
PRIMARY KEY (m_id)
);

-- 3. 테이블명 : news
--     컬럼사양 : id - 길이가 8인 숫자 타입 - primary key
--                    writer - 한글 기준으로 최대 6자를 저장할 수 있게
--	      title - 한글 기준으로 최대 40자를 저장할 수 있게
--	      content - 한글 기준으로 최대 300자를 저장할 수 있게
--                     writedate - 날짜와 시간을 저장할 수 있게
--                     cnt - 길이가 8인 숫자 타입
--
--     시퀀스 생성 : news_seq - 1부터 시작, 1씩 증가

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

-- 4. 테이블명 : meeting
--     컬럼사양 : id - 길이가 8인 숫자 타입 - primary key
--                   name - 한글 기준으로 최대 6자를 저장할 수 있게
-- 	      title - 한글 기준으로 최대 40자를 저장할 수 있게 
--	      meetingdate - 날짜와 시간을 저장할 수 있게
--
--      시퀀스 생성 : meeting_seq - 1부터 시작, 1씩 증가

CREATE TABLE meeting(
ID NUMBER(8),
name VARCHAR2(18),
title VARCHAR2(120),
meetingdate DATE,
PRIMARY KEY (ID)
);
CREATE SEQUENCE meeting_seq START WITH 1 INCREMENT BY 1;

--5. 테이블명 : imgtest
--     컬럼사양 : name - 한글 기준으로 최대 6자를 저장할 수 있게 - primary key
--                   imgcontent - 이미지를 데이터로 저장할 수 있게 (BLOB)

CREATE TABLE imgtest(
NAME VARCHAR2(18),
imgcontent BLOB
);