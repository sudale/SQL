SELECT SYSDATE FROM DUAL;
--실습용 계정 HR을 설정하고 비밀번호를 2130로 설정
ALTER USER HR ACCOUNT UNLOCK IDENTIFIED BY 2130;

@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql
alter user scott identified by 2130;