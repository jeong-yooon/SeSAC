select * from tab;

select last_name, to_char(dhire_date, 'YYYY/MM/DD') as hire_date
from employees;

select * from employees;

-- employees 에서 이름(last_name), 급여(salary), 연봉(salary*12+salary*commission_pct) 출력
SELECT last_name as 이름, salary as 급여, (salary * 12 + salary * nvl(commission_pct,0)) as 연봉 from employees;

select last_name, department_id
from employees
where department_id is not null;

select last_name, salary, job_id
from employees
where salary >= 10000 and job_id like '%man%';

select department_id from departments
minus
select distinct department_id from employees
where job_id = '%st_clerk%';

select *
from job_history;

select country_id, country_name
from countries
where country_id not in (
    select country_id, country_name
    from locations);
    
    
select *
from job_history;
    
select job_id, department_id
from job_history
where department_id = 10 or department_id = 50 or department_id = 20
order by (
          CASE department_id
          WHEN 10 THEN 1
          WHEN 50 THEN 2
          WHEN 20 THEN 3
          ELSE 4
          END
         );


select job_id, department_id, 1 a_dummy
from employees
where department_id = 10
union
select job_id, department_id, 2 a_dummy
from employees
where department_id = 50
union
select job_id, department_id, 3 a_dummy
from employees
where department_id = 20
order by a_dummy;

select last_name, department_id, nvl(null,' ') as department_name
from employees
union
select department_id, department_name, nvl(null,' ') as department_name
from departments;

select *
from employees;

select job_id
, sum(decode(department_id, '90', salary)) as d10
, sum(decode(department_id, '60', salary)) as d20
, sum(decode(department_id, '50', salary)) as d30
, sum(decode(department_id, '80', salary)) as d40
, sum(decode(department_id, '10', salary)) as d50
, sum(decode(department_id, '20', salary)) as d60
, sum(decode(department_id, '110', salary)) as d70
, sum(salary)
from employees
group by job_id;

select *
from employees;

select * 
from departments;

select * 
from job_grades;

-- EQUI JOIN
select e.department_id, e.first_name, e.last_name, d.department_id, d.dname
from employees e, departments d
where e.deptno = d.deptno
order by ename;


-- NON EQUI JOIN
-- employees.last_name      사원명
-- employees.salary         급여
-- job_grades.grade_level   등급

select e.last_name as 사원명
, e.salary as 급여
, j.grade_level as 등급 
from employees e, job_grades j
where e.salary between j.lowest_sal and j.highest_sal;

-- left outer join
select last_name, department_name
from employees e, departments d
where e.department_id = d.department_id(+);

-- right outer join
select e.last_name, d.department_name
from employees e, departments d
where e.employee_id(+) = d.manager_id;

-- SELF JOIN
-- 사원명         |   상사명 출력
-- last_name    |   last_name
select *
from employees;

-- full outer join
select  e.last_name as 사원명
, m.last_name as 상사명 
from employees e, employees m
where e.manager_id = m.employee_id(+);

-- natural join
select last_name, department_name
from emplyees natural join departments;

--select last_name, department_name
--from employees join departments;
--using(department_id) 

----------------------------------------------------------------------

-- EQUI JOIN
select e.department_id, e.first_name, e.last_name, d.department_id, d.dname
from employees e join departments d
on e.deptno = d.deptno
order by ename;


-- NON EQUI JOIN
-- employees.last_name      사원명
-- employees.salary         급여
-- job_grades.grade_level   등급

select e.last_name as 사원명
, e.salary as 급여
, j.grade_level as 등급 
from employees e join job_grades j
on e.salary between j.lowest_sal and j.highest_sal;

-- left outer join
select last_name, department_name
from employees e left outer join departments d
on e.department_id = d.department_id;

-- right outer join
select e.last_name, d.department_name
from employees e right outer join departments d
on e.employee_id = d.manager_id;

-- SELF JOIN
-- 사원명         |   상사명 출력
-- last_name    |   last_name
select *
from employees;

-- full outer join
select  e.last_name as 사원명
, m.last_name as 상사명 
from employees e full outer join employees m
on e.manager_id = m.employee_id;

-------------------------------------------------

select last_name, department_name
from employees e, departments d;

select last_name, department_name
from employees natural join departments;

select last_name, department_name
from employees join departments
using(department_id);  

--------------------------------------------------
-- 사원명 (employees.last_name)
-- 부서명 (departments.department_id)
-- 등급 (job_grades.grade_level)
-- Threeways join (oracle)
--------------------------------------------------

select e.last_name as 사원명
, d.department_name as 부서명
, j.grade_level as 등급
from employees e, departments d, job_grades j
where e.department_id = d.department_id(+)
and e.salary between j.lowest_sal and j.highest_sal;


--------------------------------------------------
-- 사원명 (employees.last_name)
-- 부서명 (departments.department_id)
-- 급여 (employees.salary)
-- 등급 (job_grades.grade_level)
-- Threeways join (ANSI)
--------------------------------------------------


select e.last_name as 사원명
, d.department_id as 부서명
, e.salary as 급여
, j.grade_level as 등급 
from employees e
left join departments d
on e.department_id = d.department_id
inner join job_grades j
on e.salary between j.lowest_sal and j.highest_sal;

select e.last_name  as 사원명
, d.department_name as 부서명
, m.last_name       as 사수명
, lo.city           as 도시명
from employees e, departments d, employees m, locations lo, jobs j
where e.department_id = d.department_id(+)
and e.manager_id = m.employee_id(+)
and d.location_id =  lo.location_id(+)
and e.job_id = j.job_id;

select e.last_name as 사원명
, e.salary as 급여
, j.grade_level as 등급
, d.department_name as 부서명 
, lo.city as 도시명 
, c.country_name as 나라명
from employees e
inner join job_grades j
on e.salary between j.lowest_sal and j.highest_sal
left join departments d
on e.department_id = d.department_id
left join locations lo
on d.location_id = lo.location_id
join countries c
on lo.country_id = c.country_id;

-- oracle join
-- 사원명 | 부서명 | 사수명 | 도시명 | 업무
select e.last_name  as 사원명
, d.department_name as 부서명
, m.last_name       as 사수명
, lo.city           as 도시명
from employees e, departments d, employees m, locations lo, jobs j
where e.department_id = d.department_id(+)
and e.manager_id = m.employee_id(+)
and d.location_id =  lo.location_id(+)
and e.job_id = j.job_id;

-- ansi join
-- 사원명 | 급여 | 등급 | 부서명 | 도시명 | 나라명
select e.last_name  as 사원명
, d.department_name as 부서명
, m.last_name       as 사수명
, lo.city           as 도시명
, c.country_name as 나라명
from employees e, departments d, employees m, locations lo, jobs j
where e.department_id = d.department_id(+)
and e.manager_id = m.employee_id(+)
and d.location_id =  lo.location_id(+)
and e.job_id = j.job_id;

-- conn ace
select last_name, salary
from employees
where salary = (select avg(salary)
from employees);

-- 전체 사원의 평균급여보다 적은 급여를 받고 있는 사원들의 이름을 출력
-- Mourgos의 직속 부하사원 이름(last_name)들을 모두 출력
select last name
from employees
where manager_id=(select employee_id
from employees
where last_name = 'Mourgos');

-- 업무가 IT_PROG인 사원들의 평균급여보다 적은 급여를 받는 사원들을 출력
select last_name, salary
from employees
where salary < (select avg(salary)
from employees
where job_id = 'IT_PROG');


