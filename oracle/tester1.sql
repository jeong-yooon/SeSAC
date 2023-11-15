select rowid, deptno, dname, loc
from dept;

-- 부서 테이블 제거하기
DROP TABLE EMP;
-- 사원 테이블 제거하기
DROP TABLE DEPT;
-- 급여 테이블 제거하기
DROP TABLE SALGRADE;
-- 부서 테이블 제거하기
DROP TABLE EMPLOYEE;
-- 사원 테이블 제거하기
DROP TABLE DEPARTMENT;
-- 급여 테이블 제거하기
DROP TABLE SALGRADE;

-- 부서 테이블 생성하기
CREATE TABLE DEPT(
	 DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	 DNAME VARCHAR2(14),
	 LOC   VARCHAR2(13) ) ;

-- 사원 테이블 생성하기
CREATE TABLE EMP( 
  	 EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	 ENAME VARCHAR2(10),
 	 JOB   VARCHAR2(9),
	 MGR  NUMBER(4),
	 HIREDATE DATE,
	 SAL NUMBER(7,2),
	 COMM NUMBER(7,2),
	 DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);

 -- 급여 테이블 생성하기
CREATE TABLE SALGRADE(
	 GRADE NUMBER,
	 LOSAL NUMBER,
	 HISAL NUMBER );

-- 사원 테이블에 샘플 데이터 추가하기
INSERT INTO DEPT VALUES(10, '경리부', '서울');
INSERT INTO DEPT VALUES(20, '인사부', '인천');
INSERT INTO DEPT VALUES(30, '영업부', '용인'); 
INSERT INTO DEPT VALUES(40, '전산부', '수원');

-- 부서 테이블에 샘플 데이터 추가하기
INSERT INTO EMP VALUES(1001, '김사랑', '사원', 1013, to_date('2007-03-01','yyyy-mm-dd'), 300, NULL, 20);
INSERT INTO EMP VALUES(1002, '한예슬', '대리', 1005, to_date('2007-04-02','yyyy-mm-dd'), 250,   80, 30);
INSERT INTO EMP VALUES(1003, '오지호', '과장', 1005, to_date('2005-02-10','yyyy-mm-dd'), 500,  100, 30);
INSERT INTO EMP VALUES(1004, '이병헌', '부장', 1008, to_date('2003-09-02','yyyy-mm-dd'), 600, NULL, 20);
INSERT INTO EMP VALUES(1005, '신동협', '과장', 1005, to_date('2005-04-07','yyyy-mm-dd'), 450,  200, 30);
INSERT INTO EMP VALUES(1006, '장동건', '부장', 1008, to_date('2003-10-09','yyyy-mm-dd'), 480, NULL, 30);
INSERT INTO EMP VALUES(1007, '이문세', '부장', 1008, to_date('2004-01-08','yyyy-mm-dd'), 520, NULL, 10);
INSERT INTO EMP VALUES(1008, '감우성', '차장', 1003, to_date('2004-03-08','yyyy-mm-dd'), 500,    0, 30);
INSERT INTO EMP VALUES(1009, '안성기', '사장', NULL, to_date('1996-10-04','yyyy-mm-dd'),1000, NULL, 20);
INSERT INTO EMP VALUES(1010, '이병헌', '과장', 1003, to_date('2005-04-07','yyyy-mm-dd'), 500, NULL, 10);
INSERT INTO EMP VALUES(1011, '조향기', '사원', 1007, to_date('2007-03-01','yyyy-mm-dd'), 280, NULL, 30);
INSERT INTO EMP VALUES(1012, '강혜정', '사원', 1006, to_date('2007-08-09','yyyy-mm-dd'), 300, NULL, 20);
INSERT INTO EMP VALUES(1013, '박중훈', '부장', 1003, to_date('2002-10-09','yyyy-mm-dd'), 560, NULL, 20);
INSERT INTO EMP VALUES(1014, '조인성', '사원', 1006, to_date('2007-11-09','yyyy-mm-dd'), 250, NULL, 10);

-- 급여 테이블에 샘플 데이터 추가하기
INSERT INTO SALGRADE VALUES (1, 700,1200);
INSERT INTO SALGRADE VALUES (2, 1201,1400);
INSERT INTO SALGRADE VALUES (3, 1401,2000);
INSERT INTO SALGRADE VALUES (4, 2001,3000);
INSERT INTO SALGRADE VALUES (5, 3001,9999);
COMMIT;

SELECT ename, sal*12+nvl(comm, 0) AS annsal FROM emp;
SELECT ename, sal*12+nvl(comm, 0) AS "annsal" FROM emp;
SELECT ename, sal*12+nvl(comm, 0) annsal FROM emp;
SELECT ename, sal*12+nvl(comm, 0) AS annsal FROM emp;

SELECT distinct dept;

SELECT *
FROM EMP
WHERE SAL >= 500;

SELECT *
FROM emp
WHERE deptno=10;

SELECT *
FROM emp
WHERE ename='이문세';

SELECT *
FROM emp
WHERE hiredate < TO_DATE('2005/01/01', 'YYYY/MM/DD');

SELECT to_char(sysdata, 'YYYY-MM-DD HH24:MI:SS') as thistime FROM dual
WHERE rownum = 1;

select tname from tab where tname='DUAL';
select * from dual;

SELECT *
FROM emp
WHERE deptno=10 AND job='과장';

SELECT *
FROM emp
WHERE deptno=10 OR job='과장';

select * 
from emp
where 400 <= sal and sal <= 500;

select * 
from emp
where sal between 400 and 500;

select *
from emp
where sal>=400 and sal<=500;

select *
from emp
where comm=80 or comm=100 or comm=200;

Select *
from emp
where hiredate between to_date('2003/01/01', 'YYYY/MM/DD')
                and to_date('2003/12/31', 'YYYY/MM/DD');
                
select *
from emp
where to_char(hiredate,'YYYY') = 2003;

SELECT *
FROM emp
WHERE comm=80 Or comm=100 OR comm=200;

SELECT *
FROM emp
WHERE comm NOT IN(80, 100, 200);

