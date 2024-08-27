
-- 사용자 계정 확인
SELECT * FROM all_users;


-- 계정 생성 명령
CREATE USER user1 IDENTIFIED BY user1;


/*
DCL: GRANT(권한 부여), REVOKE(권한 회수)

CREATE USER -> 데이터베이스 유저 생성 권한
CREATE SESSION -> 데이터베이스 접속 권한
CREATE TABLE -> 테이블 생성 권한
CREATE VIEW -> 뷰 생성 권한
CREATE SEQUENCE -> 시퀀스 생성 권한
ALTER ANY TABLE -> 어떠한 테이블도 수정할 수 있는 권한
INSERT ANY TABLE -> 어떠한 테이블에도 데이터를 삽입하는 권한.
SELECT ANY TABLE...

SELECT ON [테이블 이름] TO [유저 이름] -> 특정 테이블만 조회할 수 있는 권한.
INSERT ON....
UPDATE ON....

- 관리자에 준하는 권한을 부여하는 구문.
RESOURCE, CONNECT, DBA TO [유저 이름]
*/

GRANT CREATE SESSION TO user1;

GRANT SELECT ON hr.departments TO user1;
GRANT INSERT ON hr.departments TO user1;

GRANT CREATE TABLE TO user1;

GRANT RESOURCE, CONNECT, DBA TO user1;

REVOKE RESOURCE, CONNECT, DBA FROM user1;

-- ROLE: 특정 권한들의 모음. 일괄적으로 권한을 부여하거나 회수하기 위해 사용.

CREATE ROLE my_team_role;

GRANT SELECT, UPDATE ON hr.employees TO my_team_role;

GRANT my_team_role TO user1;



SET SERVEROUTPUT ON;

CREATE PROCEDURE guguproc
    (p_dan IN NUMBER) -- 매개변수
IS -- 익명블록의 DECLARE(선언부)
BEGIN 
    dbms_output.put_line(p_dan || '단');
    FOR i IN 1..9 -- .을 두개 작성해서 범위를 표현
    LOOP
        dbms_output.put_line(p_dan || ' x ' || i || ' = ' || p_dan*i);
    END LOOP;
END;

EXEC guguproc(7);


















