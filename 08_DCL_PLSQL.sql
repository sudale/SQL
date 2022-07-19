-- ���ο� ����ڸ����
CREATE USER john IDENTIFIED BY 1234;
-- ������ ���� ������ �ֱ� GRANT ���� TO ����
GRANT CREATE SESSION TO JOHN;
-- ���ѵ��� ���� ROLE / CONNECT,RESOURCE,DBA(�����ڱ���) �ֱ�
GRANT CONNECT, RESOURCE TO JOHN;
-- ���̺� ���� ����
GRANT CREATE TABLE TO JOHN;
-- �� ���� ����
GRANT CREATE VIEW TO JOHN;
-- ������ ȸ��, ���ִ� ���
-- REVOKE ���Ѹ� FROM ����;
REVOKE CREATE VIEW FROM JOHN;
REVOKE CREATE TABLE FROM JOHN;
REVOKE RESOURCE FROM JOHN;
-- �������� (���õ� ��� ���� ����0
DROP USER JOHN CASCADE;

-- PL/SQL
-- �͸���
-- ����� ���� �ɼ�
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('��ο����!');
END;
/

DECLARE
    MESSAGE VARCHAR2(100) := '������ �Է�';
BEGIN
    DBMS_OUTPUT.PUT_LINE( MESSAGE );
END;
/

DECLARE
    V_NAME EMP.ENAME%TYPE;
BEGIN
    V_NAME := 'ȫ�浿';
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

-- adjust_salary(������ȣ, �ӱ��λ��%)
CREATE OR REPLACE PROCEDURE adjust_salary(
    in_empno IN emp.empno%TYPE,
    in_percent IN NUMBER
) IS
BEGIN
   -- ������ȣ�� �ӱ��� in_percent% ��ŭ �ø�
   UPDATE emp
   SET sal = sal + sal * in_percent / 100
   WHERE empno = in_empno;
--   commit;
END;
/
select * from emp;
-- scott ������ ������ 10% �λ��϶�
EXECUTE adjust_salary(7839, 50);

UPDATE EMP
SET SAL = 5000
WHERE EMPNO = 7839;

UPDATE EMP
SET SAL = 800
WHERE EMPNO = 7369;

-- �׽�Ʈ ���̺� 100���� �׽�Ʈ ���̺� �Է�
DECLARE
    v_cnt NUMBER := 1;
BEGIN

    LOOP
        INSERT INTO TEST(ID,NAME)
        VALUES(v_cnt, '�׽�Ʈ'||to_char(v_cnt) );
    
        v_cnt := v_cnt+1;
    
        EXIT WHEN v_cnt > 100;
        -- ���� V_CNT�� 100�� ������ ����          
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('������ �Է� �Ϸ�');
    DBMS_OUTPUT.PUT_LINE(v_cnt-1 || '���� �����Ͱ� �ԷµǾ����ϴ�');

END;
/