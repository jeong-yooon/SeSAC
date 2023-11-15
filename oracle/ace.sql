select * from tab;

select last_name, to_char(dhire_date, 'YYYY/MM/DD') as hire_date
from employees;

select * from employees;

-- employees 에서 이름(last_name), 급여(salary), 연봉(salary*12+salary*commission_pct) 출력
SELECT last_name as 이름, salary as 급여, (salary * 12 + salary * nvl(commission_pct,0)) as 연봉 from employees;

select last_name, department_id
from employees
where department_id is not null;
