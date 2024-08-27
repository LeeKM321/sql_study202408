
/*
view는 제한적인 자료만 보기 위해 사용하는 가상 테이블의 개념입니다.
뷰는 기본 테이블로 유도된 가상 테이블이기 때문에
필요한 컬럼만 저장해 두면 관리가 용이해 집니다.
뷰는 가상테이블로 실제 데이터가 물리적으로 저장된 형태는 아닙니다.
뷰를 통해서 데이터에 접근하면 원본 데이터는 안전하게 보호될 수 있습니다.
*/
SELECT * FROM user_sys_privs; -- 권한 확인

-- 단순 뷰: 하나의 테이블을 이용하여 생성한 뷰
-- 뷰의 컬럼명은 함수 호출문, 연산식 등 같은 가상 표현식이면 안됩니다.

SELECT
    employee_id,
    first_name || ' ' || last_name,
    job_id,
    salary
FROM employees
WHERE department_id = 60;


CREATE VIEW view_emp AS (
    SELECT
        employee_id,
        first_name || ' ' || last_name AS full_name,
        job_id,
        salary
    FROM employees
    WHERE department_id = 60
);

SELECT * FROM view_emp;


-- 복합 뷰
-- 여러 테이블을 조인하여 필요한 데이터만 저장하고 빠른 확인을 위해 사용. (재사용성 증가)
CREATE VIEW view_emp_dept_job AS (
    SELECT
        e.employee_id,
        e.first_name || ' ' || e.last_name AS full_name,
        d.department_name,
        j.job_title
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    LEFT JOIN jobs j
    ON e.job_id = j.job_id
)
ORDER BY e.employee_id;


SELECT * FROM view_emp_dept_job;

-- 뷰의 수정 (CREATE OR REPLACE)
-- 동일 이름으로 해당 구문을 사용하면 데이터가 변경되면서 새롭게 생성됩니다.
-- 기존에 존재하지 않았다면 새롭게 CREATE 됩니다.
CREATE OR REPLACE VIEW view_emp_dept_job AS (
    SELECT
        e.employee_id,
        e.first_name || ' ' || e.last_name AS full_name,
        d.department_name,
        j.job_title,
        e.salary
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    LEFT JOIN jobs j
    ON e.job_id = j.job_id
)
ORDER BY e.employee_id;


SELECT
    job_title,
    AVG(salary) AS avg
FROM view_emp_dept_job
GROUP BY job_title
ORDER BY avg DESC; -- SQL 구문이 간결해짐.


-- 뷰 삭제
DROP VIEW view_emp;

/*
VIEW에 INSERT가 일어나는 경우 실제 테이블에도 반영이 됩니다.
그래서 VIEW의 INSERT, UPDATE, DELETE에는 많은 제약 사항이 따릅니다.
원본 테이블이 NOT NULL인 경우 VIEW에 INSERT가 불가능합니다.
VIEW에서 사용하는 컬럼이 가상열인 경우에도 안됩니다.
*/

SELECT * FROM view_emp_dept_job;

INSERT INTO view_emp_dept_job
VALUES(300, 'test', 'test', 'test', 10000); -- 안됨.


-- JOIN된 뷰(복합 뷰)의 경우에는 한 번에 삽입할 수 없습니다.
INSERT INTO view_emp_dept_job
    (employee_id, department_name, job_title, salary)
VALUES(300, 'test', 'test', 10000);

-- 원본 테이블 컬럼 중 NOT NULL 컬럼이 존재하고, 그 컬럼을 view에서 지목할 수 없다면
-- INSERT가 불가능합니다.
INSERT INTO view_emp
    (employee_id, job_id, salary)
VALUES(300, 'test', 10000);


DELETE FROM view_emp_dept_job
WHERE employee_id = 107;


SELECT * FROM view_emp;
SELECT * FROM employees;

ROLLBACK;


-- WITH CHECK OPTION -> 조건 제약 컬럼
-- 뷰를 생성할 때 사용한 조건 컬럼은 뷰를 통해서 변경할 수 없게 해주는 키워드
CREATE OR REPLACE VIEW view_emp_test AS (
    SELECT
        employee_id,
        first_name,
        last_name,
        email,
        hire_date,
        job_id,
        department_id
    FROM employees
    WHERE department_id = 60
);
-- WITH CHECK OPTION CONSTRAINT view_emp_test_ck;

SELECT * FROM view_emp_test;
DROP VIEW view_emp_test;


UPDATE view_emp_test
SET department_id = 100
WHERE employee_id = 107;


-- 읽기 전용 뷰 -> SELECT만 허용. DML 연산을 막음.
CREATE OR REPLACE VIEW view_emp_test AS (
    SELECT
        employee_id,
        first_name,
        last_name,
        email,
        hire_date,
        job_id,
        department_id
    FROM employees
    WHERE department_id = 60
)
WITH READ ONLY;















