-- conn tester1
select *
from dept01;

-- 테이블 내용 변경하기 
update dept01
set loc = (select loc from dept01
where deptno=20)
where deptno=40;


-- 테이블의 내용을 전부 삭제하기 
delete emp02;

-- 테이블에 데이터 추가하기
insert into emp02
select * from emp;

drop table emp02 purge;

create table emp02
as
select * from emp;

-- 데이터 삭제하
delete emp02
where deptno = (select dptno
from dept
where dname='영업부');


select ename, sal
from emp
where sal > (select max(sal), min(sal) from emp);

select ename, sal, deptno
from emp
where deptno = (select distinct deptno  
from emp
where sal > 500);

update table emp
set sal = sal + 100
where deptno = (select deptno
from dept
where dname = '경리부');

select * from emp
where deptno = (select deptno
from dept
where dname = '경리부');

delete emp
where ename = (select ename from emp
where empno = 1001);

insert into dept01
select * from dept01;

select * into emp2 from emp;

select * from emp;

delete emp06;
create table emp06
as
select * from emp;

INSERT INTO emp06
select * from emp;

select * from emp06;
select * from dept;

select ename, sal
from emp06
where ename = (select ename from emp where sal);

SELECT ename, sal, job
FROM emp06
WHERE job != '과장' AND sal > (SELECT MIN(sal) FROM emp06 WHERE job = '과장');

UPDATE emp06
SET sal = sal + 100
WHERE deptno IN (SELECT deptno FROM dept WHERE loc = '인천');

delete from emp06
WHERE deptno IN (SELECT deptno FROM dept WHERE loc = '인천');

SELECT e.ename, e.deptno
FROM emp06 e
WHERE e.deptno IN (SELECT deptno FROM emp06 WHERE ename = '이문세');

SELECT *
FROM emp06
WHERE job = (SELECT job FROM emp06 WHERE ename = '이문세');

SELECT ename, sal
FROM emp06
WHERE sal >= (SELECT sal FROM emp06 WHERE ename = '이문세');

SELECT ename, deptno
FROM emp06
WHERE deptno in (SELECT deptno FROM dept WHERE loc = '인천');

SELECT ename, sal, mgr
FROM emp06
WHERE mgr in (SELECT empno FROM emp06 WHERE ename = '감우성');

SELECT  empno, ename, sal, deptno
FROM    emp e
WHERE   sal = ( SELECT  max(sal)
                FROM    emp e2
                WHERE   e.deptno = e2.deptno
                GROUP   BY deptno );

select deptno, dname, loc
from dept
where deptno in
(select distinct deptno from emp
where job = '과장');

SELECT ename, sal, job
FROM emp06 e
WHERE EXISTS (
    SELECT 1
    FROM emp06
    WHERE job = '과장' AND sal < e.sal
);

-- 필요한 쿼리만 작성해서 저장한 가상 테이블 뷰
create view testview
as
select ename, sal from emp;
select * from testview;

-- emp를 원본 테이블로 하여 emp_copy 테이블 생성하기
create table emp_copy
as
select * from emp;

select * from emp_copy;

-- 30번 부서에 소속된 사원 정보 출력하기
select empno, ename, deptno
from emp_copy
where deptno=30;

-- 30번 부서에 소속된 사원 정보 출력하는 뷰 정의하기
create view emp_view30
as
select empno, ename, deptno
from emp_copy
where deptno=30;

-- 30번 부서에 소속된 사원 정보를 출력하는 뷰 사용하기
select * from emp_view30;

-- user_views 테이블의 구조 살피기
desc USER_VIEWS;

-- 뷰에 insert 문으로 데이터 추가하기
insert into emp_view30
values(1111, 'aaaa', 30);

-- 30번 부서에 소속된 사원 정보를 출력하는 뷰 사용하기
select *
from emp_view30;

-- 기본 테이블을 살피기
select * from emp_copy;

-- 사원 테이블과 부서 테이블을 조인하기
create view emp_view_dept as
select e.empno, e.ename, e.sal, e.deptno, d.dname, d.loc
from emp_copy e, dept d
where e.deptno = d.deptno;

-- 사원 테이블과 부서 테이블을 조인한 뷰 사용하기
select * from emp_view_dept;

-- 뷰 삭제하기 
drop view emp_view_dept;

-- create view로 뷰를 수정하는 오류를 범한 예
create view emp_view30
as
select empno, ename, sal, comm, deptno
from emp_copy
where deptno=30;

-- 테이블이 존재하지 않음을 확인하기
desc employees;

-- 30번 부서에 소속된 사원을 조회하는 뷰 정의하기
create or replace view employees_view
as
select empno, ename, deptno
from employees
where deptno=30;

-- 기본 테이블 없이 뷰 정의하기
create or replace FORCE view employees_view
as
select empno, ename, deptno
from employees
where depno=30;

-- 뷰 내용 살피기
select view_name, text
from user_views;

-- 기본 테이블이 있는 경우에만 뷰가 생성되도록 하기
create or replace NOFORCE view existtable_view
as
select empno, ename, deptno
from employees
shere deptno=30;

-- 뷰 내용 살피기
select view_name, tet
from user_views;

-- force | noforce 옵션 없이 뷰 정의하기
create or replace view existtable_view
as
select empno, ename, deptno
from employees
where deptno=30;

-- 30번 부서에 소속된 사원을 조회하는 뷰 정의하기
create or replace view emp_view30
as
select empno, ename, sal, comm, deptno
from emp_copy
where deptno=30;

-- 30번 부서에 소속된 사원 정보를 출력하는 뷰 사용하기
select *
from emp_view30;

-- 급여가 1200 이상인 사원을 20번 부서로 변경하기
update emp_view30 set deptno=20
where sal>=1200;

-- 30번 부서에 소속된 사원 정보를 출력하는 뷰 사용하기
select *
from emp_view30;

-- 조건 컬럼 값을 변경하지 못하는 뷰 정의하기
create or replace view VIEW_CHK30
as
select empno, ename, sal, comm, deptno
from emp_copy
where deptno=30 WITH CHECK OPTION;

-- 30번 부서에 소속된 사원을 조회하는 뷰 정의하기
create or replace view view_chk30
as
select empno, ename, sal, comm, deptno
from emp_copy
where deptno=30 with check option;

select * from view_chk30;
update view_chk30 set deptno=20
where sal >= 300;

-- emp을 원본 테이블로 하여 emp_copy 테이블 생성하기
create table mp_copy2
as
select * from emp;

-- 조건 컬럼 값을 변경하지 못하는 뷰 정의하기
create or replace view VIEW_CHK30
as
select empno, ename, sal, comm, deptno
from emp_copy2
where deptno=30 WITH CHECK OPTION;

-- 급여가 1200 이상인 사원은 20번 부서로 변경하기
update VIEW_CHK30 set deptno=20
where sal >=1200;

-- 30번 부서에 소속된 사원 정보를 출력하는 뷰 사용하기
select *
from VIEW_CHK30;

-- 조건 컬럼 값을 변경하지 못하는 뷰 정의하기
create or replace view VIEW_READ30
as
select empno, ename, sal, comm, deptno
from emp_fopy2
where deptno=30 WITH READ ONLY;

-- 커미션을 모두 2000으로 변경하기
update VIEW_READ30 set COMM=2000;

-- 인라인 뷰로 입사일이 빠른 사람 5명만 출력하기
select rownum, empno, ename, hiredate
from (select empno, ename, hiredate
from emp
order by hiredate)
where rownum<=5;

-- 인라인 뷰로 원하는 범위 사람 출력하기
select B.*
from (select rownum as rnum, A.*
from (select empno, ename, hiredate
from emp
order by hiredate) A) B
where rnum between 11 and 20;

-------------------------------

select * from emp;

select deptno, job, sum(sal)
from emp
group by deptno, job
order by 1,2;

select * from emp;

create table myno (
    no number
);

begin
for i in 1..100 loop
insert into myno values(i);
end loop;
end;
/

commit;

-- "myno" 테이블에서 "no" 열의 값을 선택합니다.
select no from myno;

-- 복잡한 서브쿼리와 DECODE 함수를 사용하여 데이터를 추출합니다.
select 
    decode(no, 1, deptno, 2, deptno) as selected_deptno,  -- "no" 값이 1인 경우 "deptno" 선택
    decode(no, 1, job) as selected_job,  -- "no" 값이 1인 경우 "job" 선택
    sum(sumsal) as total_salary  -- 급여 합계 계산
from (
    -- "emp" 테이블에서 부서 번호 ("deptno")와 직무 ("job")를 그룹화하고 각 그룹의 급여 합계 계산
    select deptno, job, sum(sal) as sumsal
    from emp
    group by deptno, job
    order by 1, 2  -- 부서 번호와 직무에 따라 정렬
)
cross join (
    -- "myno" 테이블에서 "no" 값이 1부터 3까지 선택하고 오름차순으로 정렬
    select no from myno where no <= 3 order by no
)
-- "no" 값에 따라 그룹화하고 "deptno" 및 "job"에 따라 정렬
group by decode(no, 1, deptno, 2, deptno), decode(no, 1, job)
order by 1, 2;  -- "deptno" 및 "job"에 따라 정렬
