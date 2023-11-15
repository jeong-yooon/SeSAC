create user tester1
identified by 1234
default tablespace users
temporary

grant connect,
resource,
create session,
create table,create procedure,
create trigger,
create view,
create sequence
to tester1;

create table dept(
deptno number(2) constraint pk_dept primary key,
dname varchar2(14),
loc varchar2;

----------------------

create sequence test_seq
cache 10;

select test_seq.nextval from dual;

select test_seq.currval from dual;

------------------------

-- 시퀀스 객체 생성하기
create sequence dept_deptno_seq
start with 10
increment by 10;

-- user_sequences의 테이블 구조 살피기
desc user_sequences;

-- 시퀀스 객체 정보 살피기 
select sequence_name, min_value, max_value, increment_by, cycle_flag
from user_sequences;


-- 시퀀스 객체로부터 새로운 값 생성하기
select dept_deptno_seq.nextval from dual;

-- 시퀀스 객체로부터 현재 값 알아내기
select dept_deptno_seq.currval from dual;

-- 시퀀스 객체로부터 새로운 값 생성하기
select dept_deptno_seq.nextval from dual;

--------------------------

-- 사원 번호를 자동으로 부여하기 위한 시퀀스 객체 생성하기
create sequence emp_seq
start with 1
 increment by 1
 maxvalue 100000;
 
 -- 사원 정보 추가하기 
 insert into emp01
 values(emp_seq.nextval, '홍길동', SYSDATE);


-- 사원 번호를 자동으로 부여하기 위한 시퀀스 객체 생성하기
create sequence emp_seq
start with 1
increment by 1
maxvalue 100000;

-- 사원 테이블 제거하기
drop table emp01;

-- 사원 테이블 생성하기
create table emp01(
empno number(4) primary key,
ename varchar(10),
hiredate date
);

-- 제약 조건 확인하기
select constraint_name, constraint_type, table_name
from user_constraints
where table_name in('EMP01');

-- 제약 조건이 부여된 컬럼 확인하기
select constraint_name, column_name, table_name
from user_cons_columns
where table_name in ('EMP01');

-- 사원 정보 추가하기
insert into emp01
values(emp_seq.nextval, '홍길동', SYSDATE);
insert into emp01
values(emp_seq.nextval, '강감찬', SYSDATE);

-- 사원 정보 조회하기
select * froom emp01;


-- 시퀀스 객체 정보 살피기
select sequence_name, min_value, max_value, increment_by, cycle_flag
from user_sequences;

-- 시퀀스 객체 제거하기
drop sequence dept_deptno_seq;

-- 시퀀스 객체 정보 살피기
select sequence_name, min_value, max_value, increment_by, cycle_flag
from user_sequences;






-- user_ind_dolumns 데이터 딕셔너리로 인덱스 확인하기
select index_name, table_name, columns_name
from user_ind_columns
where table_name in('EMP', 'DEPT');

-- 사원 테이블 제거하기
drop table emp01;

-- 사원 테이블 생성하기
create table emp01
as
select * from emp;

-- user_ind_columns 데이터 딕셔너리로 인덱스 확인하기
select table_name, index_name, column_name
from user_ind_columns
where table_name in ('EMP', 'EMP01');

--------------------------------------
begin
for i in 100001..200000 loop
insert into emp01 values(i, 'test'|| i



select count(*) from emp01;
select * from emp01;

update emp01 set
ename = 'syj'
where empno = 1111;

set timing on;

select distinct empno, ename from emp01 where ename='syj';

create index idx_emp01_ename
on emp01(ename);

drop index idx_emp01_ename
on emp01(ename);

select distinct empno, enmae from emp01 where ename='syj';
create unique index idx_emp01_ename
on emp01(ename);

-------------------------

-- 부서 테이블 제거하기
drop table dept01;

-- 빈 부서 테이블 생성하기
create table dept01
as
select * from dept where 1=0;

-- 부서 테이블에 데이터 추가하기
insert into dept01 values(10, '인사과', '서울');
insert into dept01 values(20, '총무과', '대전');
insert into dept01 values(30, '교육팀', '대전');

-- 부서 테이블에 데이터 조회하기
select * from dept01;

-- 고유 인덱스 지정하기
create UNIQUE index IDX_DEPT01_DEPNO
on dept01(deptno);

-- 이미 존재하는 고유 인덱스를 생성할 경우 오류가 발생하는 예
create UNIQUE index IDX_DEPT01_LOC
on dept01(loc);

-- 비고유 인덱스 생성하기
create index IDX_DEPT01_LOG
on dept01(loc);

----------------------------

-- 결합 인덱스 생성하기
create index idx_dept01_com
on dept01(deptno, dname);

-- user_ind_coluns 테이블로 인덱스가 지정된 컬럼 확인하기
select index_name, column_name
from user_ind_columns
where table_name in('dept01');

----------------------------

-- 함수 기반 인덱스 생성하기
create index idx_emp01_annsal
on emp01(sal*12);

-- user_ind_columns 테이블로 인덱스가 지정된 컬럼 확인하기
select index_name, column_name
from user_ind_columns
where table_name in('emp01');

-----------------------------

-- tester1 사용자로 접속하기
grant select on tester1.dept to tester4;

-- 사용자 접속하기
-- 권한 부여하기
grant select on tester1.dept to tester2;
