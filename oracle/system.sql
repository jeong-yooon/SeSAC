create user tester1
identified by 1234
account unlock;

alter user tester1
identified by 1234;

alter user tester1
default tablespace users
temporary tablespace temp
quota unlimited on users;

select username from dba_users
where username like '%TESTER%';

grant connect,
    resource,
    create session,
    create table,
    create procedure,
    create trigger,
    create view,
    create sequence
to tester1;