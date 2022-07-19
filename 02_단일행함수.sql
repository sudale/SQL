-- ������ �Լ�

-- �����Լ�
-- ��ҹ��� ��ȯ�Լ�
SELECT UPPER ('SQL Course'),
           LOWER ('SQL Course'),
           INITCAP ('SQL Course')
FROM DUAL; 
-- �׽�Ʈ�� ���̺� (1�ุ ����) �� �̿��Ͽ� ����

-- ���������Լ�
SELECT CONCAT ('��ο�','����'),
           SUBSTR ('ABCDEFG',3,4),
           LENGTH ('ABCDEFG'),
           INSTR ('ABCDEFG', 'D')
FROM DUAL;
-- ���� ���ֱ� TRIM
SELECT TRIM ('     ��ο�     '), ('     ��ο�     ')
FROM DUAL;

-- ������ �Լ� ����
SELECT department_id, last_name
FROM EMPLOYEES
WHERE lower(LAST_NAME) = 'higgins'; -- ��ҹ��� ����������� ��ȸ����

-- ���ڿ� �ٲٱ�
SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') ������
FROM employees;

--����1
select last_name �̸�, lower (last_name) �ҹ���, upper (last_name) �빮��, email �̸���, initcap (email)
from employees;
--����2
select job_id ������, substr (job_id, 1,2) ����2�� 
from employees;

-- ������ �Լ�
-- ROUND �ݿø�
SELECT ROUND(15.193, 1) �Ҽ�ù°,
           ROUND(15.193, 0) ,
           ROUND(15.193, 0) ����,
           ROUND(15.193, -1) "10���ڸ�"
FROM DUAL;
-- TRUNC ������
SELECT TRUNC (15.79, 1) �Ҽ�ù°,
           TRUNC (15.79, 0) ����,
           TRUNC (15.79, -1) "10���ڸ�"
FROM DUAL;
-- MOD ������
SELECT EMPLOYEE_ID ¦��, LAST_NAME
FROM employees
WHERE MOD (EMPLOYEE_ID, 2) = 0
ORDER BY 1;

--����
SELECT salary, ROUND(SALARY/30, 0) ����,
                    ROUND(SALARY/30, 1) �Ҽ�ù°,
                    ROUND(SALARY/30, -1) "10���ڸ�"
FROM employees;

-- ��¥�Լ�
SELECT sysdate 
FROM dual;
-- ��¥�� �ݿø� ��(�ð����ݿø�), ��(��¥���ݿø�), ��(�����ݿø�)
SELECT round ( sysdate, 'dd') ��,
           round ( sysdate, 'mm') ��,
           round ( sysdate, 'yyyy') �⵵,
           months_between ('2017/10/10', '2017/07/10') ������,
           add_months ('2017/07/10', 3) �ֵ�վ�
FROM dual;
-- ��¥�� ���� ����
SELECT sysdate-1 ����, sysdate ����, sysdate+1 ����
FROM dual;
-- 90�� �μ� �������� ���ñ����� �ٹ��ϼ�
SELECT last_name, floor(sysdate - hire_date) �ٹ��ϼ�
FROM employees
WHERE department_id = 90;

SELECT employee_id, hire_date,
           floor(months_between(sysdate,hire_date)) �ٹ�����,
           add_months(hire_date, 6) "6���� �߰�",
           next_day(hire_date, '�ݿ���') next_day,
           --1(��),2(��),3(ȭ),4(��)~
           last_day(hire_date) last_day
           --���� ������ ��           
FROM employees
WHERE months_between(sysdate, hire_date) < 200;

--����
SELECT sysdate, hire_date, floor(months_between(sysdate,hire_date))
FROM employees
WHERE department_id = 100;
--����
SELECT hire_date, add_months(hire_date, 3) ���ϱ�_3����, add_months(hire_date, -3) ����3����
FROM employees
WHERE employee_id BETWEEN 100 and 106;

-- ��ȯ�� �Լ� (��¥, ����, ���ڸ� ��ȯ�ϴ� �Լ�)

-- ���ڸ� ���ڷ� ��ȯ
-- �޸�����
SELECT to_char(123456789,'999,999,999') comma
FROM dual;
-- �Ҽ�������
SELECT to_char(12311111.45678,'999,999,999.999') period
FROM dual;
-- $ǥ������
SELECT TO_CHAR(12345678,'$999,999,999') dollar  
FROM DUAL;
-- Local ȭ�� ǥ�� ���� (�ѱ��� ��� �ܷ� �ڵ� ��ȯ ��)
SELECT TO_CHAR(12345678,'L999,999,999') local  
FROM DUAL;
-- ���ʿ� 0�� ����
SELECT TO_CHAR(123,'09999') zero 
FROM DUAL;  
-- 16������ ��ȯ
SELECT TO_CHAR(123,'XXXX') hexadecimal  
FROM DUAL;

-- ��¥�� ���ڷ� ��ȯ
-- ��,��,��,��,��,�� ����
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') sysdate
FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD AM HH:MI:SS') ���糯¥
FROM DUAL;

--����1
SELECT employee_id, TO_CHAR(HIRE_DATE, 'MM-YY') �Ի��
FROM employees
WHERE department_id = 100;
--����2
SELECT last_name �̸�, TO_CHAR (SALARY,'$99,999.99') ����
FROM employees
WHERE salary > 10000
ORDER BY salary DESC;

-- TO_DATE
-- DATE Ÿ������ ��ȯ�ϴ� ����
SELECT TO_DATE ('2011-01-01', 'YYYY-MM-DD')
FROM DUAL;

-- TO_NUMBER
-- ���ڸ� ���ڷ� ��ȯ�ϴ� ������ ����
SELECT TO_NUMBER ('01210616') +100
FROM DUAL;


-- NULL ���� �Լ�
-- �Ŵ����� ���� ���� 0���� �ٲپ ����ϴ� ����
SELECT last_name, nvl(manager_id, 0) �Ŵ���
FROM employees
WHERE last_name = 'King';

SELECT last_name, nvl2(manager_id, 1, 0) �Ŵ���
FROM employees
WHERE last_name = 'King';

--����
SELECT last_name �̸�, salary ����, nvl(commission_pct, 0) Ŀ�̼�, 
           salary*12+salary*12*nvl(commission_pct, 0) ����
FROM employees
ORDER BY ���� DESC;
--����
SELECT last_name �̸�, salary ����, nvl(commission_pct, 0) Ŀ�̼�, 
           salary*12+salary*12*nvl(commission_pct, 0) ����,
           nvl2(commission_pct, '����+���ʽ�' , '���޸�') �������
FROM employees
ORDER BY ���� DESC;


-- DECODE �Լ�
SELECT last_name �̸�, job_id, salary, 
        DECODE(JOB_ID, 'IT_PROG',  SALARY * 1.10,
                                'IT_CLERK', SALARY * 1.15,
                                'IT_REP',     SALARY * 1.20,
                                                SALARY) "��������"
FROM employees;

--����
SELECT last_name �̸�, job_id ����, salary ����,
            DECODE(TRUNC(SALARY/2000), 0 , 0.00,
                                                          1 , 0.09,
                                                          2 , 0.20,
                                                          3 , 0.30,
                                                          4 , 0.40,
                                                          5 , 0.42,
                                                          6 , 0.44,
                                                               0.45) ����
FROM EMPLOYEES;


-- CASE �Լ�
SELECT last_name �̸�, job_id, salary,
    CASE  WHEN salary<5000   THEN 'Low'
             WHEN salary<10000  THEN 'Medium'
             WHEN salary<20000  THEN 'Good'
             ELSE                                 'Excellent'  
    END "�޿� ����"
FROM employees;

--����
SELECT employee_id, first_name, last_name, salary,
    CASE WHEN SALARY>=9000 THEN '�����޿�'
            WHEN SALARY>=6000 THEN '�����޿�'
            ELSE                                    '�����޿�'
    END "�޿����"
FROM employees
WHERE job_id = 'IT_PROG';

