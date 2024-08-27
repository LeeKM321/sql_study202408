

-- ROLLUP(arg1, arg2) -> arg1과 arg2로 그룹화. -> 각 그룹별 SUM(salary)
-- -> arg1 그룹의 SUM(salary) -> 마지막에는 전체 SUM(salary)
-- 특정 컬럼들의 단계적 합계를 계산.
-- 부서별 급여 합계
-- 부서와 직무 조합별 급여 합계
-- 전체 급여 합계
SELECT
    department_id, 
    job_id, 
    SUM(salary) AS total_salary
FROM employees
GROUP BY ROLLUP(department_id, job_id);


-- CUBE(arg1, arg2): 모든 가능한 조합을 고려하여 집계.
-- 직무별 급여 합계
-- 부서별 급여 합계
-- 부서와 직무 조합별 급여 합계
-- 전체 급여 합계
SELECT
    department_id, 
    job_id, 
    SUM(salary) AS total_salary
FROM employees
GROUP BY CUBE(department_id, job_id);


-- GROUPING SETS(arg1, arg2): 주어진 그룹 집합에 대해서만 집계
-- 직무별 급여 합계
-- 부서별 급여 합계
SELECT
    department_id, 
    job_id, 
    SUM(salary) AS total_salary
FROM employees
GROUP BY GROUPING SETS (department_id, job_id);


-- GROUPING(): 이 함수가 직접 그룹 집계를 하지는 않음.
-- 결과에서 특정 열이 집계가 되었는지의 여부를 확인하여 값을 임의로 집어 넣을때 사용.
-- ROLLUP, CUBE, GROUPING SETS에서 모두 사용 가능.
SELECT
    CASE GROUPING(department_id) WHEN 1 THEN 9999 ELSE department_id END AS dept_id, 
    CASE GROUPING(job_id) WHEN 1 THEN 'total' ELSE job_id END AS job_id, 
    SUM(salary) AS total_salary
FROM employees
WHERE department_id IS NOT NULL
GROUP BY CUBE (department_id, job_id);



















