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

select *
from emp
where ename = '이';


-- ace/ace에서
-- 1.
-- salary가 10000달러 이상이며 job_id에 문자열 'MAN'이 포함된 사원의 last_name, salary, job_id 출력

-- 2.
-- salary가 10000달러 이상이거나 job_id에 문자열 'MAN'이 포함된 사원의 lst_name, salary, job_id 출력

-- 3.
-- job_id가 IT_PROG, ST_CLERK, SA_REP에 속하지 않은 사원의 last_name, job_id 출력

-- 4.
-- commission_pct가 null이 아닌 사원들의 lastname, commission_pct 출력

-- 5.
-- job_id가 ST_CLERK 또는 SA_REP이면서 급여가 2500, 3500, 7000이 아닌 모든 사원의 last_name, job_id, salary 출력



drop group_star;
drop single_start;

CREATE TABLE GROUP_STAR(
   NAME      VARCHAR2(50)
);
--
CREATE TABLE SINGLE_STAR(
   NAME      VARCHAR2(50)
);
INSERT INTO GROUP_STAR VALUES('태연');
INSERT INTO GROUP_STAR VALUES('유리');
INSERT INTO GROUP_STAR VALUES('윤아');
INSERT INTO GROUP_STAR VALUES('효연');
INSERT INTO GROUP_STAR VALUES('티파니');
INSERT INTO GROUP_STAR VALUES('제시카');
INSERT INTO GROUP_STAR VALUES('수영');
INSERT INTO GROUP_STAR VALUES('써니');
INSERT INTO GROUP_STAR VALUES('서현');
INSERT INTO GROUP_STAR VALUES('탑');
INSERT INTO GROUP_STAR VALUES('지드래곤');
INSERT INTO GROUP_STAR VALUES('대성');
INSERT INTO GROUP_STAR VALUES('승리');
INSERT INTO GROUP_STAR VALUES('태양');

INSERT INTO SINGLE_STAR VALUES('태연');
INSERT INTO SINGLE_STAR VALUES('지드래곤');
INSERT INTO SINGLE_STAR VALUES('대성');
INSERT INTO SINGLE_STAR VALUES('태양');
INSERT INTO SINGLE_STAR VALUES('아이유');
INSERT INTO SINGLE_STAR VALUES('백지영');
INSERT INTO SINGLE_STAR VALUES('윤종신');
COMMIT;

select name from group_star;

select name from single_star;

select *
from group_star
union
select *
from single_star;


select * 
from salgrade;

select ename, hiredate
from emp
where hiredate=to_date('2007/04/02', 'YYYY/MM/DD');


select ename, decode(sal//100, 0, 'LOW',
                    sal//100, 1, 'LOW',
                    sal//100, 2, 'LOW',
                    sal//100, 3, 'MID',
                    sal//100, 4, 'MID',
                    sal//100, 5, 'MID',
                    sal//100, 6, 'HIGH',
                    sal//100, 7, 'HIGH',
                    sal//100, 8, 'HIGH',
                    sal//100, 9, 'TOP')
                    
from emp;

select grade
from salgrade;

select ename, decode(mod(empno, 2), 0, '백군'
                                    , 1, '청군'
                                    , '예외') as "팀"
from emp;

--------------------

select ename, deptno, sal as 올해연봉,
    decode(deptno, 10, sal*1.2
                , 20, sal*1.1
                    , sal) as 내년연봉
from emp;



----------------------

select sum(sal) as 급여합계,
        avg(sal) as 평균급여,
        max(sal) as 최대급여,
        min(sal) as 최소급여
        

select ename, sal,
decode(ceil(sal/300)-1, 0, 'LOW',
1, 'MID',
2, 'HIGH',
'TOP') as grade
from emp;

select ename, sal,
    case ceil(sal/300)-1 when 0 then 'LOW'
                        when 1 then 'MID'
                        when 2 then 'HIGH'
                        else 'TOP'
                        end as grade
from emp;

select ename, sal,
    case when sal <= 300 then 'LOW'
     when sal <= 600 then 'MID'
     when sal <= 900 then 'HIGH'
    else 'TOP'
    end as grade
from emp;

select deptno, avg(sal)
from emp
where avg(sal) >= 500
group by deptno;

select deptno, avg(sal) as avg_sal
from emp
where deptno in (10,20)
group by deptno;

select *
from emp;

select job
, sum(decode(deptno, '10', sal)) as d10
, sum(decode(deptno, '20', sal)) as d20
, sum(decode(deptno, '30', sal)) as d30
, sum(sal)
from emp
group by job;

select e.ename, e.deptno, d.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno
order by ename;

select e.ename as 사원명
,e.sal as 급여
,s.grade as 등급
from emp e, salgrade s
where s.losal <= e.sal and e.sal <= s.hisal;

-- outer join
select e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno(+)
order by ename;

-- right outer join
select e.ename, d.dname
from emp e, dept d
where e.deptno(+) = d.deptno
order by ename;

-- self join
select e.ename as 사원
, m.ename as 멘토
from emp e, emp m
where e.mgr = m.empno;


-- cross join
select e.ename, e.deptno, d.deptno, d.dname
from emp e cross join dept d;

-- natural join
select ename, dname
from emp natural join dept;

-- EQUI JOIN
select e.ename, d.danme
from emp e inner join dept d
on e.deptno = d.deptno
order by ename;

-- NON EQUI JOIN
select e.ename as
,e.sal
,s.grade

-- left outer join
select e.ename, d.dname
from emp e left outer join dept d
on e.deptno = d.deptno
order by ename;

-- right outer join
select e.ename, d.dname
from emp e right outer join dept d
on e.deptno = d.deptno
order by ename;

-- full outer join
select e.ename, d.dname
from emp e full outer join dept d
on e.deptno = d.deptno
order by ename;

-- self join
select e.ename as 사원
, m.ename as 멘토
from emp e, emp m
where e.mgr = m.empno;

--------------------------------------------------

--Threeways JOIN

-- 사원명 | 부서명 | 등급 
select e.ename as 사원명
, nvl(d.dname, ''대기발령) as 부서명
, s.grade as 등급 
from emp e, dept d, salgrade s
where e.deptno = d.deptno(+)
and e.sal between s.losal and s.hisal;


-- Threeways JOIN (ANSI)
-- 사원명 | 부서명 | 등급
  
select e.ename as 사원명
, d.dname as 부서명
, e.sal as 급여
, s.grade as 등급 
from emp e
left join dept d
on e.deptno = d.deptno
inner join salgrade s
on e.sal between s.losal and s.hisal;




---------------------------------------------------
-- 서브쿼리
select ename, sal
from emp
ㅈhere sal < (select sal
from emp
where ename='조향기');
from emp
where deptno = (select deptno
from emp
where ename = '이문세');


-- 이문세가 속한 부서가 아닌 소속의 모든 사원 출력
select ename, deptno
from emp
where deptno <> (select deptno
from emp
where ename = '이문세');

-- 가장 많은 급여를 받는 사원의 이름과 급여 출력
select ename, sal
from emp
where sal = (select max(sal)
from emp);


select ename, sal
from emp
where deptno in (
select distinct deptno
from emp
where sal > 500);

select ename, sal
from emp
where sal > ALL (select sal
from emp
where deptno = 30);

select ename, sal
from emp
where sal > ANY (select sal
from emp
where deptno = 30);

select *
from dept
where EXISTS (select *
from emp
where emp.deptno=dept.deptno);

 