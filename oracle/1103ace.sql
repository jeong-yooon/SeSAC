select last_name, level from employees;
start with last_name = 'King';
connect by manager_id = prior employee_id;

describe employees;

SELECT employee_id, manager_id,
LEVEL,
CONNECT_BY_ROOT last_name AS 대표, CONNECT_BY_ISLEAF AS 막내, sys_connect_by_path(last_name, '/') AS PATH, lpad(' ', (LEVEL - 1) * 3) || last_name AS last_name, PRIOR last_name
FROM employees
START WITH manager_id IS NULL
CONNECT BY manager_id = PRIOR employee_id
ORDER SIBLINGS BY employee_id ASC;

select department_id, job_id, null as manager_id, avg(salary) as avgsal 
from employees
group by department_id, job_id
union all
select null, job_id, manager_id, avg(salary) as avgsal 
from employees
group by job_id, manager_id;

select department_id, job_id, manager_id, avg(salary)
from employees
group by grouping sets ((department_id, job_id),(job_id, manager_id));