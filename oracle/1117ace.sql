-- 6가지 유형의 SELECT 문장과 적절한 변수 설정

-- [1] 

create or replace procedure p1 (
p_employee_id in  employees.employee_id%type,
p_salary      out employees.salary%type      
)
is
v_salary employees.salary %type;
begin
select salary into v_salary
from employees
where employee_id = p_employee_id;

p_salary := v_salary;
end;
/

show errors

desc p1

set serveroutput on

declare
v_id  number := 100;
v_ret number;
begin
p1(v_id, v_ret);
dbms_output.put_line(v_id||'의 급여는 '||v_ret);
end;
/

---

-- [2] 행 하나를 리턴하는 SELECT 문

create or replace procedure p1 (
p_employee_id in  employees.employee_id%type,
p_last_name   out employees.last_name%type,
p_salary      out employees.salary%type,
p_job_id      out employees.job_id%type  
)
is
employee_row employees%rowtype;
begin
select * into employee_row
from employees
where employee_id = p_employee_id;

p_last_name := employee_row.last_name;
p_salary    := employee_row.salary;
p_job_id    := employee_row.job_id;
end;
/

declare
v_employee_id employees.employee_id%type := 100;
v_last_name   employees.last_name%type;
v_salary      employees.salary%type;
v_job_id      employees.job_id%type; 
begin
p1(v_employee_id, v_last_name, v_salary, v_job_id);
dbms_output.put_line(v_employee_id);
dbms_output.put_line(v_last_name);
dbms_output.put_line(v_salary);
dbms_output.put_line(v_job_id);
end;
/


create or replace procedure p1 (
p_employee_id  in  employees.employee_id%type,
p_employee_row out employees%rowtype  
)
is
begin
select * into p_employee_row
from employees
where employee_id = p_employee_id;
end;
/

declare
v_employee_id employees.employee_id%type := 100;
employee_row  employees%rowtype ;
begin
p1(v_employee_id, employee_row);
dbms_output.put_line(v_employee_id);
dbms_output.put_line(employee_row.last_name);
dbms_output.put_line(employee_row.salary);
dbms_output.put_line(employee_row.job_id);
end;
/


-- [3] 행 하나의 몇몇 컬럼을 리턴하는 SELECT 문

create or replace procedure p1(
p_employee_id  in  employees.employee_id%type
)
is
TYPE employee_record_type IS RECORD (
  last_name employees.last_name%type, 
  salary    employees.salary%type,
  job_id    employees.job_id%type);

employee_row employee_record_type;
begin
select last_name, salary, job_id into employee_row
from employees
where employee_id = p_employee_id;

dbms_output.put_line(employee_row.last_name);
dbms_output.put_line(employee_row.salary);
dbms_output.put_line(employee_row.job_id);
end;
/

exec p1(100)
exec p1(101)

↓↓

create or replace package pack_datatypes
is

TYPE employee_record_type IS RECORD (
  last_name employees.last_name%type, 
  salary    employees.salary%type,
  job_id    employees.job_id%type);

end;
/

create or replace procedure p1(
p_employee_id  in  employees.employee_id%type
)
is
employee_row pack_datatypes.employee_record_type;
begin
select last_name, salary, job_id into employee_row
from employees
where employee_id = p_employee_id;

dbms_output.put_line(employee_row.last_name);
dbms_output.put_line(employee_row.salary);
dbms_output.put_line(employee_row.job_id);
end;
/

exec p1(100)
exec p1(101)

↓↓

create or replace procedure p1 (
p_employee_id  in  employees.employee_id%type,
p_employee_row out pack_datatypes.employee_record_type
)
is
begin
select last_name, salary, job_id into p_employee_row
from employees
where employee_id = p_employee_id;
end;
/

declare
v_employee_id employees.employee_id%type := 100;
employee_row  pack_datatypes.employee_record_type; 
begin
p1(v_employee_id, employee_row);
dbms_output.put_line(v_employee_id);
dbms_output.put_line(employee_row.last_name);
dbms_output.put_line(employee_row.salary);
dbms_output.put_line(employee_row.job_id);
end;
/

↓↓

create or replace view view_for_row_type
as
select last_name, salary, job_id 
from employees;

create or replace procedure p1 (
p_employee_id  in  employees.employee_id%type,
p_employee_row out view_for_row_type%rowtype
)
is
employee_row view_for_row_type%rowtype;
begin
select last_name, salary, job_id into p_employee_row
from employees
where employee_id = p_employee_id;
end;
/

declare
v_employee_id employees.employee_id%type := 100;
employee_row  view_for_row_type%rowtype; 
begin
p1(v_employee_id, employee_row);
dbms_output.put_line(v_employee_id);
dbms_output.put_line(employee_row.last_name);
dbms_output.put_line(employee_row.salary);
dbms_output.put_line(employee_row.job_id);
end;
/


-- [4] 같은 유형의 값 여러 개를 리턴하는 SELECT 문

create or replace procedure p1 (
p_department_id in employees.department_id%type
)
is
TYPE employees_salary_tab_type IS TABLE OF employees.salary%type
 INDEX BY pls_integer;

emp_sal_tab employees_salary_tab_type;
begin
select salary BULK COLLECT INTO emp_sal_tab
from employees
where department_id = p_department_id;

for i in emp_sal_tab.first .. emp_sal_tab.last loop
  dbms_output.put_line(emp_sal_tab(i));
end loop;
end;
/

exec p1(20)
exec p1(50)

↓↓

create or replace package pack_datatypes
is

TYPE employee_record_type IS RECORD (
  last_name employees.last_name%type, 
  salary    employees.salary%type,
  job_id    employees.job_id%type);

TYPE employees_salary_tab_type IS TABLE OF employees.salary%type
 INDEX BY pls_integer;

end;
/

create or replace procedure p1 (
p_department_id in  employees.department_id%type,
p_emp_sal_tab   out pack_datatypes.employees_salary_tab_type
)
is
begin
select salary BULK COLLECT INTO p_emp_sal_tab
from employees
where department_id = p_department_id;
end;
/


create or replace procedure p1_print (
p_department_id in employees.department_id%type    
)
is
emp_sal_tab pack_datatypes.employees_salary_tab_type;
begin
p1(p_department_id, emp_sal_tab);

for i in emp_sal_tab.first .. emp_sal_tab.last loop
  dbms_output.put_line(emp_sal_tab(i));
end loop;
end;
/

exec p1_print(20)
exec p1_print(50)


-- [5] 행 여러 개를 리턴하는 SELECT 문 

create or replace procedure p1(
p_department_id in employees.department_id%type
)
is
TYPE employees_table_type IS TABLE OF employees%rowtype
  INDEX BY pls_integer;

employees_tab employees_table_type;
begin
select * BULK COLLECT INTO employees_tab
from employees
where department_id = p_department_id;

for i in employees_tab.first .. employees_tab.last loop
  dbms_output.put_line(employees_tab(i).last_name||', '||employees_tab(i).salary);
end loop;
end;
/

exec p1(20)
exec p1(50)


[6] 몇몇 컬럼을 포함하는 행 여러 개를 리턴하는 SELECT 문

create or replace procedure p1(
p_department_id in employees.department_id%type
)
is

TYPE employee_record_type IS RECORD (
  last_name employees.last_name%type, 
  salary    employees.salary%type,
  job_id    employees.job_id%type);

TYPE employees_table_type IS TABLE OF employee_record_type
  INDEX BY pls_integer;

employees_tab employees_table_type;
begin
select last_name, salary, job_id BULK COLLECT INTO employees_tab
from employees
where department_id = p_department_id;

for i in employees_tab.first .. employees_tab.last loop
  dbms_output.put_line(employees_tab(i).last_name||', '||employees_tab(i).salary);
end loop;
end;
/

exec p1(20)
exec p1(50)