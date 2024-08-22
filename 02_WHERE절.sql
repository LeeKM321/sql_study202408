
SELECT * FROM employees;

-- WHERE절 비교 (데이터 값은 대/소문자를 구분합니다.)
SELECT
    first_name, last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG';


SELECT
    *
FROM employees
WHERE last_name = 'King';


SELECT
    *
FROM employees
WHERE department_id = 50;


SELECT
    *
FROM employees
WHERE salary >= 15000
AND salary < 20000;


SELECT
    *
FROM employees
WHERE hire_date = '04/01/30';


-- 데이터의 행 제한 (BETWEEN, IN, LIKE)
SELECT 
    *
FROM employees
WHERE salary BETWEEN 15000 AND 20000;


SELECT 
    *
FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';


-- IN 연산자의 사용 (특정 값들과 비교할 때 사용)
SELECT
    *
FROM employees
WHERE manager_id IN (100, 101, 102);


SELECT
    *
FROM employees
WHERE job_id IN ('IT_PROG', 'AD_VP');


-- LIKE 연산자 (지정 문자열 포함 여부)
-- %는 어떠한 문자든, _는 데이터의 자리(위치)를 표현할 때
SELECT
    first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '03%';


SELECT
    first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%15';


SELECT
    first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%05%';


SELECT
    first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '___05%';


-- IS NULL: (null값을 찾음)
SELECT
    *
FROM employees
WHERE commission_pct IS NULL;

SELECT
    *
FROM employees
WHERE commission_pct IS NOT NULL;


-- AND, OR
-- AND가 OR보다 연산 순서가 빠름.
SELECT
    *
FROM employees
WHERE job_id = 'IT_PROG'
OR job_id = 'FI_MGR'
AND salary >= 6000;

SELECT
    *
FROM employees
WHERE (job_id = 'IT_PROG'
OR job_id = 'FI_MGR')
AND salary >= 6000;


-- 데이터의 정렬 (SELECT 구문의 가장 마지막에 배치됩니다.)
-- ASC: 오름차(ascending)
-- DESC: 내림차 (descending)
SELECT
    *
FROM employees
ORDER BY hire_date;

SELECT
    *
FROM employees
ORDER BY hire_date DESC;


SELECT
    *
FROM employees
WHERE job_id = 'IT_PROG'
ORDER BY first_name ASC;


SELECT
    first_name,
    salary*12 AS pay
FROM employees
ORDER BY pay DESC;
















