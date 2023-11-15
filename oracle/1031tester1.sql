create table emp02
as
select * from emp;

desc emp02;
describe emp02;
desc emp;
describe emp;

create table emp03
as
select empno, ename from emp;

select * from emp03;

create table emp06
as
select * from emp where 1=0;
-- where 1=0; 조건은 항상 거짓이기 때문에 테이블의 데이터는 가져오지 않고 구조만 복사하게 된다.


-- dept 테이블과 동일한 구조의 테이블 이름을 dept02로 하여 빈 테이블 생성하
create table dept01
as
select * from dept where 1=0;

-- 테이블 구조 살피기
desc dept01;

-- 테이블 내용 살피기 
select * from dept01;

-- 테이블에 내용 추가하기
insert into dept01
select * from dept

-- emp03 테이블 제거 (휴지통으로 이동한다.)
drop table emp03;

-- emp03 테이블 제거 (휴지통으로 이동하지 않고 영구삭제한다.)
drop table emp03 purge;



-- 사원 정보를 저장하기 위한 테이블 생성하기
create table emp01 (
empno number(4),
ename varchar2(14),
sal number(7, 3)
);

-- 사원 테이블에 날짜 타입을 가지는 birth 컬럼 추가하기 
alter table emp01
add(birth date);

desc emp01;

select * from tab;
select * from user_tables;
select * from user_objects;

-- 테이블 제거하기
drop table emp02;
desc emp02;

-- 삭제 테이블 복구하기 
flashback table emp02 to before drop;
select * from tab;

-- 테이블 삭제 후 휴지통 비우기
drop table emp02 purge;
purge recyclebin;


select * from user_sequences;

-- all_tables로 테이블에 대한 정보 조회하기
show user;
select * from all_tables;

select * from dba_tables;

-- conn tester1
-- 부서 정보를 저장하기 위한 테이블 생성하기 
create table dept01(
depno number(2),
dname varchar2(14),
loc varchar2(13)
);
desc dept01;

-- 경리부를 입력하기
insert into dept01 values(10, '경리부', '서울');
insert into dept01(deptno, dname) values(20, '테스트');
select * from dept01;

-- 명시적으로 NULL값 삽입하기 
insert into dept01
values(40, '전산부', NULL);

select * from dept01;

-- 공백문자 삽입하기
insert into dept01
values(50, '기획부', '');

select * from dept01;

-- 사원 정보를 저장하기 위한 테이블 생성하기
create table emp02(
empno number(4),
ename varchar2(10),
job varchar2(9),
hiredate date,
deptno number(2)
);

desc emp02;

-- TO_DATE 함수로 날짜 데이터 입력하기
insert into emp02
values(1002, '한예슬', '대리', to_date('2014, 05, 01', 'YYYY, MM, DD'), 20);
select * from emp02;

insert into emp02
values(7020, 'JERRY', 'salesman', sysdate, 30);
select * from emp02;

update dept01
set dname='생산부'
where deptno=10;

-- WHERE 절로 특정 로우만 수정하기 
update dept01
set dname = '생산부', loc='부산'
where deptno=20;
commit;

update dept01
set dname = 'todtksqn', loc='부산';

delete dept01;
rollback;

select * from dept01;

-- where 절로 특정 로우만 삭제하기 
delete dept01
where deptno=10;

delete dept01;

delete emp02;

select * from emp02;

rollback;

select * from emp02;
savepoint a;
delete emp02 where empno = (select max(empno) from emp02);
savepoint b;
delete emp02 where empno = (select max(empno) from emp02);
savepoint c;
delete emp02 where empno = (select max(empno) from emp02);
rollback to c;
rollback to a;

select ename, sal from emp;

update emp set sal=sal*1.2 where ename='조인성';
update emp set sal=sal*1.2 where empno=1002;
rollback;

insert into dept
values(10, 'test', 'test');

select * from dept;

insert into dept(deptno, dname, loc)
values(null, '개발부', '서울');

select * from user_constraints;

create table test01(
name varchar2(10) not null);
create table test02(
name varchar2(10) check(name is not null));
create table test03(
name varchar2(10),
constraint ck_mycheck check(name is not null));

select constraint_name, constraint_type, table_name
from user_constraints;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS;

create table emp02(
empno number(4) NOT NULL,
ename varchar2 (10) not null,
job varchar2(9),
deptno number(2)
);

insert into emp02
values(null, null, '사원', 30);

desc emp02;

insert into emp02
values(1000, '허준', '사원', 30);

create table emp03(
empno number(4) UNIQUE,
ename varchar2(10) NOT NULL,
job varchar2(9),
deptno number(2)
);

insert into emp03 values(1000, '허준', '사원', 30);
insert into emp03 values(1000, '홍길동', '과장', 20);
insert into emp03 values(null, '안중근', '과장', 20);
insert into emp03 values(null, '이순신', '부장', 10);

select * from emp03;
-- unique = primary key - not null;


select * from user_indexes;

create table emp04(
empno number(4) constraint emp04_empno_uk unique,
ename varchar2(10) constraint emp04_ename_nn not null,
job varchar2(9),
deptno number(2)
);

select constraint_name, constraint_type, table_name
from user_constraints
where table_name in ('EMP04');

-- primary key 제약조건을 주어 테이블 생성하기 
create table emp05(
empno number(4)
CONSTRAINT EMP05_EMPNO_PK PRIMARY KEY,
ename varchar2(10)
CONSTRAINT EMP05_ENAME_NN NOT NULL,
job varchar2(9),
deptno number(2)
);

-- 사원 정보 추가하기
insert into emp05 values(1000, '허준', '사원', 30);
insert into emp05 values(1000, '홍길동', '과장', 20);
insert into emp05 values(1000, '이순신', '과장', 20);

desc user_constraints;

-- 제약 조건 살피기 
select constraint_name, constraint_type, table_name, table_name
from user_constarints
where table_name in('DEPT');

-- 외래키 제약조건을 주어 테이블 생성하기
create table emp06(
empno number(4)
CONSTRAINT EMP06_EMPNO_PK PRIMARY KEY,
ename varchar2(10)
CONSTRAINT EMP06_ENAME_NN NOT NULL,
job varchar2(9),
deptno number(2)
CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT(DEPTNO)
);

-- 새로운 사원을 30번 부서에 소속시킥
insert into emp06
values(1010, '홍길동', '사원', 30);

-- 사원 테이블 살피기
select *
from emp06;

-- 새로운 사원을 존재하지 않는 50번 부서에 소속시키기
insert into emp06
values(1010, '홍길동', '사원', 50);

-- 제약조건 살피기
select constraint_name, constraint_type, r_constraint_name, table_name
from user_constraints
where table_name in ('EMP06');


-- CHECK 제약조건을 주어 테이블 생성하기
create table emp07(
empno numer(4)
CONSTRAINT EMP07_EMPNO_PK PRIMARY KEY,
ename varchar2(10)
CONSTRAINT EMP07_ENAME_NN NOT NULL,
sal number(7, 2) CONSTRAINT EMP07_SAL_CK
CHECK(SAL BETWEEN 500 AND 5000),
gender varchar2(1) CONSTRAINT EMP07_GENDER_CK
CHECK(GENDER IN('M', 'F'))
);





