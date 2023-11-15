SELECT
    ace.employees.last_name         AS 사원명,
    ace.departments.department_name AS 부서명,
    ace.locations.city              AS 도시,
    ace.countries.country_name      AS 나라,
    ace.regions.region_name         AS 대륙,
    employees1.last_name            AS 사수명
FROM
    ace.employees
    LEFT JOIN ace.departments ON ace.employees.department_id = ace.departments.department_id
    LEFT JOIN ace.locations ON ace.departments.location_id = ace.locations.location_id
    INNER JOIN ace.countries ON ace.locations.country_id = ace.countries.country_id
    INNER JOIN ace.regions ON ace.countries.region_id = ace.regions.region_id
    LEFT JOIN ace.employees employees1 ON ace.employees.manager_id = employees1.employee_id;
    
    
create table members(
userid varchar2(20) primary key,
userpw varchar2(256) not null);


insert into members
values('xci', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db');
commit;
alter table members
add (name varchar2(20));
update members set name='최정윤' where userid='xci';
commit;

DELETE FROM members
WHERE userid = 'xci';
DROP TABLE members;
COMMIT;
SELECT * FROM members;