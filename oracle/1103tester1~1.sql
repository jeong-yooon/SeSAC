SELECT deptno, job, NULL, avg(sal) FROM emp
GROUP BY deptno, job
UNION ALL
SELECT NULL, job, mgr, avg(sal) FROM emp
GROUP BY job, mgr;

SELECT deptno, job, mgr, avg(sal)
FROM emp
GROUP BY GROUPING SETS ((deptno, job),(job,mgr));


-- with 절 사용 전
select 'sum', sum(sum_sal)
from (select deptno, sum(sal) as sum_sal, count(*) as cnt
from emp
      group by deptno)
union all
select 'avg', sum_sal/cnt
from (select deptno, sum(sal) as sum_sal, count(*) as cnt
from emp
group by deptno);

-- with 절 사용 후
with a as (select deptno, sum(sal) as sum_sal, count(*) as cnt from emp
           group by deptno)
select 'sum', sum(sum_sal)
from a
union all
select 'avg', sum_sal/cnt from a;


WITH
DEPT_COSTS AS (SELECT d.deptno,
                 SUM(E.SAL) AS DEPT_TOTAL
                 FROM EMP E, DEPT D
                 WHERE E.DEPTNO = D.DEPTNO
                 GROUP BY D.DEPTNO),
 AVG_COST AS (SELECT SUM(DEPT_TOTAL) / COUNT(*)
 AS DEPT_AVG
 FROM DEPT_COSTS)
 SELECT * FROM DEPT_COSTS
 WHERE DEPT_TOTAL > (SELECT DEPT_AVG FROM AVG_COST)
 ORDER BY DEPTNO;
 
----------------------------------------

CREATE TABLE fruits ( 
name varchar2(20),
grade varchar2(1));

INSERT INTO fruits VALUES ('딸기', 'A');
INSERT INTO fruits VALUES ('딸기', 'B');
INSERT INTO fruits VALUES ('바나나', 'A');
INSERT INTO fruits VALUES ('바나나', 'B');
INSERT INTO fruits VALUES ('바나나', 'C');
commit;


CREATE TABLE purchases ( 
name varchar2(20),
grade varchar2(1));

INSERT INTO purchases VALUES ('딸기', 'A');
INSERT INTO purchases VALUES ('딸기', 'B');
INSERT INTO purchases VALUES ('바나나', 'A');
INSERT INTO purchases VALUES ('바나나', 'B');
INSERT INTO purchases VALUES ('바나나', 'C');
commit;


SELECT *
FROM fruits
WHERE name in (SELECT name FROM purchases) 
AND grade in (SELECT grade FROM purchases);

SELECT *
FROM fruits
WHERE name in ('딸기','바나나') AND grade in ('A','B');

SELECT *
FROM fruits
WHERE (name = '딸기' or name = '바나나') 
AND (grade= 'A' or grade= 'B');

SELECT *
FROM fruits
WHERE (name,grade) in (SELECT name,grade FROM purchases);

SELECT *
FROM fruits
WHERE (name,grade) not in (SELECT name,grade FROM purchases);

SELECT deptno, min(sal) 
FROM emp
GROUP BY deptno;

SELECT ename, sal, deptno FROM emp
WHERE (deptno, sal) in (SELECT deptno, min(sal)
FROM emp
GROUP BY deptno);

-- fruit에서 한번도 팔리지 않았던 제품을 찾아보자.

------------------------------------------------------------

CREATE TABLE test1 (
EMPNO NUMBER(4) not null unique
ENAME VARCHAR(30)
HP VARCHAR(11) unique
SAL NUMBER
DEPTNO NUMBER(2));

CREATE TABLE test2 (
DEPTNO NUMBER(2)
DNAME VARCHAR2(30)
LOC VARCHAR2(10)
));

-- 사원번호는 not null + unique
-- 사원명은 not null
-- 휴대폰은 unique
-- 급여는 100만원 이상
-- 사원 테이블의 부서번호는 부서테이블에 존재해야 함...

-- 컬럼레벨 constraints
create table t_dept (
deptno number(2)    constraint t_dept_deptno_pk primary key,
dname varchar2(30)  constraint t_dept_dname_nn not null,
loc varchar2(10)
);

create table t_emp (
empno number(4)     constraint t_emp_empno_pk primary key,
ename varchar2(30)  constraint t_emp_ename not null,
hp varchar2(11)     constraint t_emp_hp_uk unique,
sal number          constraint t_emp_sal_ck check(sal >= 100),
deptno number(2)    constraint t_emp_deptno_fk references t_dept(deptno)
);

-- 컬럼레벨 Constraints에 제약조건 이름 추가 
drop table t_emp purge;
drop table t_dept purge;


-- 테이블 레벨 constraints
create table t_dept (
deptno number(2),
dname varchar2(30),
loc varchar2(10),
constraint t_dept_deptno_pk primary key(deptno),
constraint t_dept_dname_nn check(dname is not null)
);

create table t_emp (
empno number(4),
ename varchar2(30),
hp varchar2(11),
sal number,
deptno number(2),
constraint t_emp_empno_pk primary key(empno),
constraint t_emp_ename_nn check(ename is not null),
constraint t_emp_hp_uk unique(hp),
constraint t_emp_sal_ck check(sal >= 100),
constraint t_emp_deptno_fk foreign key(deptno) references t_dept(deptno)
);