-- 새로운 사용자만들기
CREATE USER john IDENTIFIED BY 1234;
-- 존에게 접속 권한을 주기 GRANT 권한 TO 유저
GRANT CREATE SESSION TO JOHN;
-- 권한들의 묶음 ROLE / CONNECT,RESOURCE,DBA(관리자권한) 주기
GRANT CONNECT, RESOURCE TO JOHN;
-- 테이블 생성 권한
GRANT CREATE TABLE TO JOHN;
-- 뷰 생성 권한
GRANT CREATE VIEW TO JOHN;
-- 권한을 회수, 없애는 방법
-- REVOKE 권한명 FROM 계정;
REVOKE CREATE VIEW FROM JOHN;
REVOKE CREATE TABLE FROM JOHN;
REVOKE RESOURCE FROM JOHN;
-- 계정삭제 (관련된 모든 내용 삭제0
DROP USER JOHN CASCADE;

-- PL/SQL
-- 익명블록
-- 출력을 위한 옵션
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('헬로우월드!');
END;
/

DECLARE
    MESSAGE VARCHAR2(100) := '변수에 입력';
BEGIN
    DBMS_OUTPUT.PUT_LINE( MESSAGE );
END;
/

DECLARE
    V_NAME EMP.ENAME%TYPE;
BEGIN
    V_NAME := '홍길동';
    DBMS_OUTPUT.PUT_LINE (V_NAME);
END;
/

CREATE OR REPLACE PROCEDURE update_sal 
 (in_empno IN NUMBER)      
 IS 
 BEGIN 
   UPDATE emp 
   SET sal = sal  * 1.1 
   WHERE empno = in_empno; 
--   COMMIT; 
 END update_sal; 
 / 
 
EXECUTE update_sal(7369);
EXEC UPDATE_sal(7499);

-- adjust_salary(직원번호, 임금인상률%)
CREATE OR REPLACE PROCEDURE adjust_salary(
    in_empno IN emp.empno%TYPE,
    in_percent IN NUMBER
) IS
BEGIN
   -- 직원번호의 임금을 in_percent% 만큼 올림
   UPDATE emp
   SET sal = sal + sal * in_percent / 100
   WHERE empno = in_empno;
--   commit;
END;
/
select * from emp;
-- scott 직원의 월급을 10% 인상하라
EXECUTE adjust_salary(7839, 50);

UPDATE EMP
SET SAL = 5000
WHERE EMPNO = 7839;

UPDATE EMP
SET SAL = 800
WHERE EMPNO = 7369;

-- 테스트 테이블에 100개의 테스트 테이블 입력
DECLARE
    v_cnt NUMBER := 1;
BEGIN

    LOOP
        INSERT INTO TEST(ID,NAME)
        VALUES(v_cnt, '테스트'||to_char(v_cnt) );
    
        v_cnt := v_cnt+1;
    
        EXIT WHEN v_cnt > 100;
        -- 변수 V_CNT가 100이 넘으면 종료          
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('데이터 입력 완료');
    DBMS_OUTPUT.PUT_LINE(v_cnt-1 || '개의 데이터가 입력되었습니다');

END;
/