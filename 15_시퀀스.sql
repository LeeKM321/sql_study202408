
-- 시퀀스 (순차적으로 증가, 감소하는 값을 만들어 주는 기능)

CREATE SEQUENCE test_seq
    START WITH 1 -- 시작값 (기본값은 증가할 때 최소값, 감소할 때 최대값)
    INCREMENT BY 1 -- 증가값 (양수면 증가, 음수면 감소, 기본값 1)
    MAXVALUE 10 -- 최대값 (기본값은 증가일 때 1027, 감소일 때 -1)
    MINVALUE 1 -- 최소값 (기본값은 증가일 때 1 감소일 때 -1028)
    NOCACHE -- 캐시 메모리 사용 여부 (CACHE)
    NOCYCLE; -- 순환 여부 (NOCYCLE이 기본, 순환시킬거면 CYCLE)
    
    
CREATE TABLE test_tbl (
    test_no NUMBER(2) PRIMARY KEY,
    test_msg VARCHAR2(100)
);

-- 시퀀스 사용하기 (NEXTVAL, CURRVAL)

INSERT INTO test_tbl
VALUES(test_seq.NEXTVAL, 'test'); -- INSERT 실행 시 시퀀스의 다음 값 활용.

SELECT * FROM test_tbl;

SELECT test_seq.CURRVAL FROM dual; -- 현재 시퀀스의 값 확인

-- 시퀀스 속성 수정 (직접 수정이 가능)
-- START WITH은 수정이 불가능합니다.
ALTER SEQUENCE test_seq MAXVALUE 9999;
ALTER SEQUENCE test_seq INCREMENT BY -5;
ALTER SEQUENCE test_seq MINVALUE 0;



-- 시퀀스 값을 다시 처음으로 돌리는 방법
ALTER SEQUENCE test_seq INCREMENT BY 1;
SELECT test_seq.NEXTVAL FROM dual;


















