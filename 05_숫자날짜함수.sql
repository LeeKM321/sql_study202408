
-- 숫자함수
-- ROUND(반올림)
-- 원하는 반올림 위치를 매개값으로 지정. 음수를 주는 것도 가능.
SELECT
    ROUND(3.1415, 3), ROUND(45.923, 0), ROUND(45.923, -1)
FROM dual;

-- TRUNC(절사)
-- 정해진 소수점 자리수까지 잘라냅니다.
SELECT
    TRUNC(3.1415, 3), TRUNC(45.923, 0), TRUNC(45.923, -1)
FROM dual;

-- ABS (절대값)
SELECT ABS(-34) FROM dual;

-- CEIL(올림), FLOOR(내림)
SELECT CEIL(3.14), FLOOR(3.14)
FROM dual;

-- MOD(나머지 나눗셈 연산)
SELECT
    10 / 4, MOD(10, 4)
FROM dual;


-------------------------------------------------------------

-- 날짜 함수
-- sysdate: 컴퓨터의 현재 날짜, 시간 정보를 가져와서 제공하는 키워드 -> 시간 있음!
SELECT sysdate FROM dual;
SELECT systimestamp FROM dual; -- -> 더 세밀한 시간과 표준시 정보까지 제공.

-- 날짜 연산
SELECT sysdate + 1 FROM dual; -- 일자 덧셈 연산이 가능.

-- 날짜 타입과 날짜 타입은 뺄셈 연산을 지원합니다.
-- 덧셈은 허용하지 않습니다.
SELECT
    first_name,
    sysdate - hire_date
FROM employees; -- 일자

SELECT
    first_name,
    (sysdate - hire_date) / 7
FROM employees; -- 주수

SELECT
    first_name,
    (sysdate - hire_date) / 365
FROM employees; -- 년수


-- 날짜 반올림, 절사
SELECT ROUND(sysdate) FROM dual;
SELECT ROUND(sysdate, 'year') FROM dual; -- 년 기준으로 반올림
SELECT ROUND(sysdate, 'month') FROM dual; -- 월 기준으로 반올림
SELECT ROUND(sysdate, 'day') FROM dual; -- 주 기준으로 반올림 (해당 주의 일요일 날짜)


SELECT TRUNC(sysdate) FROM dual;
SELECT TRUNC(sysdate, 'year') FROM dual; -- 년 기준으로 절사
SELECT TRUNC(sysdate, 'month') FROM dual; -- 월 기준으로 절사
SELECT TRUNC(sysdate, 'day') FROM dual; -- 주 기준으로 절사 (해당 주의 일요일 날짜)




















