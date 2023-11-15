create table board(
no number(5),
title varchar2(34) not null,
re number(3) default 0,
regdate date default sysdate);

create sequence seq_board
start with 1 increment by 1 nocache;

begin
    for i in 1..10002 loop
    insert into board
    values(seq_board.nextval,
 'With A Little Help From My Friends',
      trunc(dbms_random.value(0,100)),
      sysdate-((10002-i)/24/6));
 end loop;
 end;
  /
  
set pages 50000;
col regdate for a20;
col title for a34;
col re for 99;
col no for 99999;

select no, title, re,
to_char(regdate,'YYYY-MM-DD hh24:mi:ss') as regdate
from board
where regdate > sysdate - 1/24
order by no desc;
 
 select count(*) from board;
 
 define thisPage=1;
 define pageSize=5;
 
select rownum, no, title, re,
to_char(regdate,'YYYY-MM-DD') as regdate
from board
where rownum between (&thisPage-1)*&pageSize+1 and &thisPage*&pageSize
order by no desc;

define thisPage = 2/

select A.*
from   (select no, title, re,
               to_char(regdate,'YYYY-MM-DD') as regdate
       from    board
order by no desc) A
where rownum between (&thisPage-1)*&pageSize+1 and &thisPage*&pageSize;

select B.*
from   (select rownum as rnum, A.*
from (select no, title, re, to_char(regdate,'YYYY-MM-DD') as regdate
from board
order by no desc) A) B
where rnum between (&thisPage-1)*&pageSize+1
and    &thisPage*&pageSize;

define thisPage=1;

select B.*
from (select rownum as rnum, A.*
from (select no, title, re,
to_char(regdate, 'YYYY-MM-DD') as regdate
from board
order by no desc) A) B
where rnum between (&thisPage-1)*&pageSize+1
and &thisPage*&pageSize;

define thisPage=2/