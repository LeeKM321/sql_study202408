
-- 계층형 쿼리 
-- START WITH : 계층의 첫 단계를 어디서 시작할 것인지의 대한 조건
-- CONNECT BY PRIOR 자식 = 부모  -> 순방향 탐색
-- CONNECT BY 자식 = PRIOR 부모  -> 역방향 탐색
-- ORDER SIBLINGS BY : 같은 레벨끼리의 정렬을 정함.

SELECT employee_id, first_name, manager_id FROM employees;

SELECT
    employee_id, first_name, manager_id, LEVEL, -- 계층의 깊이를 나타내는 키워드
    SYS_CONNECT_BY_PATH(first_name, '/') AS 계층구조
FROM 
    employees
START WITH manager_id IS NULL -- 계층 구조를 최상위 관리자부터 시작하겠다.
CONNECT BY PRIOR employee_id = manager_id -- 한 직원의 manager_id가 상위 직원의 employee_id와 일치하는 경우 부모-자식 관계를 형성하겠다.
AND LEVEL <= 2; -- 특정 깊이까지만 정보를 확인할 때.
-- ORDER SIBLINGS BY first_name; 

SELECT
    LEVEL,
    LPAD(' ', 2*(LEVEL-1)) || first_name AS 조직인원,
    employee_id, manager_id
FROM employees
-- START WITH manager_id IS NULL 
START WITH employee_id = 107
CONNECT BY employee_id = PRIOR manager_id;





















