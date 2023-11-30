select employee_id, salary, salary*1.2
from employees;


begin
  dbms_oytput.put_line
  System.out.println()
end;

set serveroutput on

begin
	for i in 1..10 loop
		dbms_output.put_line('Hello World!');
	end loop;
end;

select * from user_objects
where object_type = 'PROCEDURE';
\
CREATE OR REPLACE PROCEDURE get_employees_sum_sal_by_department_id(p_department_id NUMBER) IS
  v_total_salary NUMBER := 0;
BEGIN
  -- 해당 부서의 급여 합계를 계산
  SELECT NVL(SUM(salary), 0) INTO v_total_salary
  FROM employees
  WHERE department_id = p_department_id;

  -- 결과 출력
  DBMS_OUTPUT.PUT_LINE('부서 ' || p_department_id || '의 총 급여 합계: ' || v_total_salary);
END;
/
begin
get_employees_sum_sal_by_department_id(10)
end;

  drop table t1 purge;

  create table t1 (col1 number, col2 number);

  declare
    v_employee_id  employees.employee_id%type;
    v_salary       employees.salary%type;
  begin
    select employee_id, salary into v_employee_id, v_salary
    from employees
    where employee_id = 141;

    if v_salary < 5000 then
      dbms_output.put_line('Are you kidding me?');
    else
      insert into t1(col1, col2)
      values (v_employee_id, v_salary);
    end if;

    commit;
  end;
  /
  
    create or replace procedure p1(
    p_employee_id employees.employee_id%type
  )
  is
    v_employee_id  employees.employee_id%type;
    v_salary       employees.salary%type;
  begin
    select employee_id, salary into v_employee_id, v_salary
    from employees
    where employee_id = p_employee_id;

    if v_salary < 5000 then
      dbms_output.put_line('Are you kidding me?');
    else
      insert into t1(col1, col2)
      values (v_employee_id, v_salary);
    end if;

    commit;
  end;
  \
  
create or replace procedure get_employees_sum_sal_by_department_id(
    p_department_id employees.employee_id%type
)
is
  v_sum_sal number;
begin
  select sum(salary) into v_sum_sal
  from employees
  where department_id = p_department_id;

  dbms_output.put_line(v_sum_sal);
end;
/
set serveroutput on;

begin
get_employees_sum_sal_by_department_id(p_department_id => 10);
end;



==========================================================================

# ChatGPT를 활용해 PL/SQL 패키지 만들기
  
  (1) 테이블 생성

  drop table books purge;

  create table books
  (id    number generated as identity primary key,
   name  varchar2(30),
   price number(10, 2));


  (2) 위 테이블에 CRUD하는 stand-alone subprogram(stored procedure 및 stored function) 만들어줘

  create or replace procedure insert_book (
    p_name  in varchar2,
    p_price in number)
  as
  begin
    insert into books (name, price)
    values (p_name, p_price);
  end insert_book;
  /

  create or replace function read_book_by_id (
    p_id in number
  )
    return sys_refcursor 
  as
    v_cursor sys_refcursor;
  begin
    open v_cursor for
      select name, price
      from books
      where id = p_id;

    return v_cursor;
  end read_book_by_id;
  /

  create or replace procedure update_book_by_id (
    p_id    in number,
    p_name  in varchar2, 
    p_price in number)
  as
  begin
    update books
    set name = p_name,
        price = p_price
    where id = p_id;
  end update_book_by_id;
  /

  create or replace procedure delete_book_by_id (
    p_id in number
  )
  as
  begin
    delete from books
    where id = p_id;
  end delete_book_by_id;
  /

    -------

  select * from books;

  begin
    insert_book('자바 입문', 10000);
    insert_book('데이터베이스 활용', 15000);
    commit;
  end;
  / 

  select * from books;

    -------

  declare
    v_cursor sys_refcursor;
    v_name   varchar2(30);
    v_price  number(10, 2);
  begin
    v_cursor := read_book_by_id(1);

    fetch v_cursor into v_name, v_price;
    dbms_output.put_line('Name: ' || v_name || ', Price: ' || v_price);

    close v_cursor;
  end;
  /

  -------

  select * from books;

  begin
    update_book_by_id(1, '자바 입문', 12000);
    commit;
  end;
  /

  select * from books;

  -------

  select * from books;

  begin
    delete_book_by_id(1);
    commit;
  end;
  /

  select * from books;


(3) 위 테이블에 CRUD하는 패키지 만들어줘

===============sanmin==================
  create or replace package pack_books
  is
    procedure insert_book (
      p_name  in varchar2,
      p_price in number);

    function read_book_by_id (
      p_id in number
    )
      return sys_refcursor;

    procedure update_book_by_id (
      p_id    in number,
      p_name  in varchar2, 
      p_price in number);

    procedure delete_book_by_id (
      p_id in number
    );
  end pack_books;
  /

  create or replace package body pack_books
  is

    function price_check(
      p_price in number
    ) 
      return varchar2
    is
    begin
      if p_price >= 0 then
        return 'True';
      else
        return 'False';
      end if; 
    end;

    procedure insert_book (
      p_name  in varchar2,
      p_price in number)
    as 
    begin
      if price_check(p_price) = 'True' then
        insert into books (name, price)
        values (p_name, p_price);
      else
        dbms_output.put_line('가격은 0원 미만일 수 없습니다.');
      end if;
    end insert_book;
  
    function read_book_by_id (
      p_id in number
    )
      return sys_refcursor 
    as
      v_cursor sys_refcursor;
    begin
      open v_cursor for
        select name, price
        from books
        where id = p_id;

      return v_cursor;
    end read_book_by_id;
 
    procedure update_book_by_id (
      p_id    in number,
      p_name  in varchar2, 
      p_price in number)
    as
    begin
      update books
      set name = p_name,
          price = p_price
      where id = p_id;
    end update_book_by_id;

    procedure delete_book_by_id (
      p_id in number
    )
    as
    begin
      delete from books
      where id = p_id;
    end delete_book_by_id;

  end pack_books;
  /

  desc pack_books
  
  ---------------
  
    set serveroutput on

  truncate table books;

  exec pack_books.insert_book('자바 입문', 10000);
  exec pack_books.insert_book('데이터베이스 활용', -1000);

  select * from books;

  drop procedure insert_book;
  drop procedure update_book_by_id;
  drop function read_book_by_id;
  drop procedure delete_book_by_id ;

  select * from user_objects
  where object_type in ('PROCEDURE', 'FUNCTION', 'PACKAGE', 'PACKAGE BODY');
  
  select * from user_source
  where name = 'PACK_BOOKS';
  
  ===============jeongyun================
  
  CREATE OR REPLACE PACKAGE book_management_pkg AS
  -- Insert a new book
  PROCEDURE insert_book(
    p_name  IN VARCHAR2,
    p_price IN NUMBER
  );

  -- Read book details by ID
  FUNCTION read_book_by_id(
    p_id IN NUMBER
  ) RETURN SYS_REFCURSOR;

  -- Update book details by ID
  PROCEDURE update_book_by_id(
    p_id    IN NUMBER,
    p_name  IN VARCHAR2,
    p_price IN NUMBER
  );

  -- Delete a book by ID
  PROCEDURE delete_book_by_id(
    p_id IN NUMBER
  );

END book_management_pkg;
/

CREATE OR REPLACE PACKAGE BODY book_management_pkg AS
  -- Insert a new book
  PROCEDURE insert_book(
    p_name  IN VARCHAR2,
    p_price IN NUMBER
  ) AS
  BEGIN
    INSERT INTO books (name, price)
    VALUES (p_name, p_price);
    COMMIT;
  END insert_book;

  -- Read book details by ID
  FUNCTION read_book_by_id(
    p_id IN NUMBER
  ) RETURN SYS_REFCURSOR AS
    v_cursor SYS_REFCURSOR;
  BEGIN
    OPEN v_cursor FOR
      SELECT name, price
      FROM books
      WHERE id = p_id;

    RETURN v_cursor;
  END read_book_by_id;

  -- Update book details by ID
  PROCEDURE update_book_by_id(
    p_id    IN NUMBER,
    p_name  IN VARCHAR2,
    p_price IN NUMBER
  ) AS
  BEGIN
    UPDATE books
    SET name = p_name,
        price = p_price
    WHERE id = p_id;
    COMMIT;
  END update_book_by_id;

  -- Delete a book by ID
  PROCEDURE delete_book_by_id(
    p_id IN NUMBER
  ) AS
  BEGIN
    DELETE FROM books
    WHERE id = p_id;
    COMMIT;
  END delete_book_by_id;

END book_management_pkg;
/

-- Insert a new book
BEGIN
  book_management_pkg.insert_book('새로운 책', 20000);
END;


-- Read book details by ID
DECLARE
  v_cursor SYS_REFCURSOR;
  v_name   VARCHAR2(30);
  v_price  NUMBER(10, 2);
BEGIN
  v_cursor := book_management_pkg.read_book_by_id(1);

  FETCH v_cursor INTO v_name, v_price;
  DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ', Price: ' || v_price);

  CLOSE v_cursor;
END;

-- Update book details by ID
BEGIN
  book_management_pkg.update_book_by_id(1, '업데이트된 책', 25000);
END;

-- Delete a book by ID
BEGIN
  book_management_pkg.delete_book_by_id(1);
END;

-------------------

-- 패키지 삭제
DROP PACKAGE book_management_pkg;

-- 테이블 삭제
DROP TABLE books PURGE;

-- 테이블 생성
CREATE TABLE books (
  id    NUMBER GENERATED AS IDENTITY PRIMARY KEY,
  name  VARCHAR2(30),
  price NUMBER(10, 2)
);

-- 패키지 생성
CREATE OR REPLACE PACKAGE book_management_pkg AS
  -- Insert a new book
  PROCEDURE insert_book(
    p_name  IN VARCHAR2,
    p_price IN NUMBER
  );

  -- Read book details by ID
  FUNCTION read_book_by_id(
    p_id IN NUMBER
  ) RETURN SYS_REFCURSOR;

  -- Update book details by ID
  PROCEDURE update_book_by_id(
    p_id    IN NUMBER,
    p_name  IN VARCHAR2,
    p_price IN NUMBER
  );

  -- Delete a book by ID
  PROCEDURE delete_book_by_id(
    p_id IN NUMBER
  );

END book_management_pkg;
/

-- 테이블 초기 데이터 삽입
BEGIN
  INSERT INTO books (name, price) VALUES ('자바 입문', 10000);
  INSERT INTO books (name, price) VALUES ('데이터베이스 활용', 15000);
  COMMIT;
END;
/


