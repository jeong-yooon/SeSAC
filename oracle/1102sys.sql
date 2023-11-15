create user tester2
identified by 1234;

-- 권한부여 
grant connect, resource to tester2;

-- 권한 회수 
revoke connect, resource from tester2;

-- 권한 부여 
grant create session to tester2;
grant create table to tester2;


-----------------------------------

create user tester3 identified by 1234;

grant create session to tester3;
grant create table to tester3;

grant create session to tester3
with admin option;

create user tester4 identified by 1234;

----------------------------------

create user tester5 identified by 1234;

grant connect, resource to tester5;