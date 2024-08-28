
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


-- RANK(): 각 그룹별 순위를 부여
-- 값이 동일하면 같은 순위를 부여, 순위가 건너뛰어집니다. ex) 1등 두명 -> 그다음 3등
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_num
FROM employees;


-- DENSE_RANK(): RANK()와 유사하지만, 순위가 건너뛰어지지 않음
-- ex) 1등 두명? -> 다음은 2등.
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_num
FROM employees;




-- LEAD(): 현재 행 이후의 값을 가져옴.
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    LEAD(salary, 1) OVER (ORDER BY salary) AS next_salary,
    LEAD(salary, 1) OVER (ORDER BY salary) - salary AS salary_diff
FROM employees;


-- LAG(): 이전 행에 있는 값을 불러옴.
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    LAG(salary, 1) OVER (ORDER BY salary) AS prev_salary
FROM employees;


-- FIRST_VALUE(컬럼): 컬럼별 첫번째 행의 값을 반환합니다. 
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary DESC) AS 부서별최고급여
FROM employees;


-- LAST_VALUE(salary): 각 부서별 가장 낮은 급여를 가져오기.
-- LAST_VALUE는 기본적으로 현재 행에서 윈도우 범위 내 마지막 값을 가져오므로
-- 전체 범위로 확장해 주기 위해서 ROWS BETWEEN을 사용합니다.
-- 현재 행의 마지막 값이 아닌 내가 지정한 그룹으로 윈도우 범위를 확장하기 위해 추가.
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    LAST_VALUE(salary) OVER 
    (PARTITION BY department_id 
    ORDER BY salary DESC
     ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS 부서별최저급여
FROM employees;


-- NTILE(N): 데이터를 N개의 그룹으로 나누는데 사용하는 함수.
-- ex) 전체 행이 10이고, NTILE(4) -> 4개의 그룹으로 찢어준다.
-- 11 22 33 44 -> 나머지는 작은 숫자쪽으로 한개씩 -> 111 222 33 44
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    NTILE(7) OVER (PARTITION BY department_id ORDER BY salary DESC) AS ntile_2
FROM employees;

SELECT COUNT(*)
FROM employees
WHERE department_id = 50;




















