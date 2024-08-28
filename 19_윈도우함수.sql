
-- ROW_NUMBER(): 각 그룹 내에서 각 행에 고유한 순번을 부여.
-- 중복된 값이 있어도 순번은 중복되지 않습니다.

-- PARTITION BY department_id: 부서별로 데이터를 그룹화
-- ORDER BY salary DESC: 각 그룹 내에서 급여를 내림차순 정렬
-- 그 후에 순차적으로 고유한 순번 부여.
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_num
FROM employees;





























