-- SELECT ��ȸ
-- �μ�(department) ���̺� ��� �� ��ȸ
SELECT * 
FROM departments;
-- as�� ��Ī, ��ȸ�� �� �̸��� �˻�����
SELECT department_name as �μ��̸�
FROM departments;
-- �켱 ���̺���� FROM�� ���� CRTL+SPACE �ڵ����� ���̸��� �ҷ��´�
SELECT department_id �μ���ȣ, department_name �μ��̸�
FROM departments;

-- ����(employees) ���̺� ����
SELECT salary ����
FROM employees;
-- ��ü ���� ���޿� 100�߰� �ؼ� �� �������
SELECT last_name �̸�,  salary ����, salary + 100 ���ʽ�����
FROM employees;
-- ��ü ���� ���޿� -10% �ؼ� �� �������
SELECT last_name �̸�,  salary ����, salary  - salary*0.10 ������
FROM employees;

-- �ߺ��� ���� DISTINCT
-- ���� ������ ����(����)�ϰ� ��ȸ
SELECT DISTINCT job_id ����
FROM employees;

-- ����1
SELECT employee_id, first_name, last_name
FROM  employees;
-- ����2
SELECT first_name �̸�, salary ����, salary + salary*1.10 AS��������
FROM employees;
-- ����3
SELECT employee_id �����ȣ, first_name �̸�, last_name ��
FROM  employees;

-- ���� ������ || (���ڿ��� ��ħ)
SELECT employee_id, first_name||' '||last_name, email||'@company.com' �̸���
FROM employees;

-- WHERE �� (���ǹ�)
-- �������� ������ 14000�ʰ��� ����
SELECT *
FROM employees
WHERE salary > 14000;
-- �̸��� King�� ���
SELECT *
FROM employees
WHERE last_name = 'King'; -- ���ڿ��� ''�ѵ���ǥ�� ���̰�, ��ҹ��ڸ� ����
-- ��� ���ڰ� 2002�� 6�� 10�� ����
SELECT *
FROM employees
WHERE hire_date < '2002/06/10'; -- ���ڿ��ȿ� ��¥�������� ������ �ڵ� ��ȯ��

--����1
SELECT *
FROM employees
WHERE employee_id = 100;
--����2
SELECT *
FROM employees
WHERE first_name = 'David';
--����3
SELECT *
FROM employees
WHERE employee_id <= 105;
--����4
SELECT *
FROM job_history
WHERE start_date > '06/03/03';
--����5
SELECT *
FROM departments
WHERE location_id <> 1700;

-- �� ������

-- 80�� �μ��̸鼭 ������ 10000���� ���� ���� �Ǵ� 60�� �μ�����
SELECT last_name, department_id, salary
FROM employees
WHERE department_id = 60 OR ( department_id = 80 AND salary > 10000 ) ;
-- �μ���ȣ�� 80�Ǵ� 60�̸鼭 ������ 10000���� ���� ����
SELECT last_name, department_id, salary
FROM employees
WHERE ( department_id = 60 OR department_id = 80 ) AND salary > 10000  ;

--����1
SELECT job_id, salary
FROM employees
WHERE job_id = 'IT_PROG'  AND salary > 4000;
--����2
SELECT job_id, salary
FROM employees
WHERE job_id = 'IT_PROG' OR job_id = 'FI_ACCOUNT' AND salary > 4000;

-- IN������ OR�� ������ ���� ��ſ� ��밡��
SELECT *
FROM employees
WHERE salary in (4000,3000,2700);

--����1
SELECT *
FROM employees
WHERE salary IN (1000,17000,24000);
--����2
SELECT *
FROM employees
WHERE department_id NOT IN (30,50,80,100,110);

-- BETWEEN ���̰� A and B
SELECT *
FROM employees
WHERE salary BETWEEN 9000 AND 10000;

--����1
SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;
--����2
SELECT *
FROM employees
WHERE hire_date BETWEEN '04/01/01' AND '04/12/30';
--����3
SELECT *
FROM employees
WHERE salary NOT BETWEEN 7000 AND 17000;

-- LIKE ������ ���ڿ� ��ȸ�� ��Ȯ���� ������� ���
SELECT *
FROM employees
WHERE last_name LIKE 'B%';
-- %�� �յڿ� ������� ���̰��� b�� ������ ���� ��ȸ
SELECT *
FROM employees
WHERE last_name LIKE '%b%';
-- %���տ� ���� ��쿡�� �� �ޱ��ڰ� y�� ������ ���
SELECT *
FROM employees
WHERE last_name LIKE '%y';

--����1
SELECT *
FROM employees
WHERE job_id like '%AD%';
--����2
SELECT *
FROM employees
WHERE job_id LIKE '%AD___';
--����3
SELECT *
FROM employees
WHERE phone_number LIKE '%1234';
--����4
SELECT *
FROM employees
WHERE phone_number NOT LIKE '%3%' AND phone_number LIKE '%9';
--����5
SELECT *
FROM employees
WHERE job_id LIKE '%MGR%' OR job_id LIKE '%ASST%';

-- NULL �� ���� �Է¾������� ( 0 �̳� ���� ' ' �� �ƴϴ�)
-- NULL �� �˻��ϱ� ���� is NULL �� ����Ѵ�
SELECT *
FROM employees
WHERE commission_pct IS NULL;

--����
SELECT *
FROM employees
WHERE manager_id IS NULL;

-- ORDER BY + �� + ASC OR DESC : ���� �������� �Ǵ� ������������ ����
-- ������ ū ��������� ����
SELECT *
FROM employees
ORDER BY salary DESC; --ASC (������) �� ��������

-- ���� ���� 2�� �̻��϶� ù��° ���� ������ �ι�° �� ����
SELECT department_id, employee_id, first_name, last_name
FROM employees
ORDER BY department_id, employee_id;

-- ��Ī���� ����
SELECT department_id, employee_id, salary*12 ����
FROM employees
ORDER BY ���� DESC;

--����1
SELECT employee_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;
--����2
SELECT *
FROM employees
WHERE job_id LIKE '%CLERK%'
ORDER BY SALARY DESC;
--����3
SELECT employee_id ������ȣ, last_name �����̸�, department_id �μ���ȣ, salary ����
FROM employees
WHERE employee_id BETWEEN 120 AND 150
ORDER BY �μ���ȣ DESC, ���� DESC;


SELECT *
FROM employees
WHERE job_id like '%AD%';

SELECT *
FROM employees
WHERE job_id LIKE 'AD___';

SELECT *
FROM employees
WHERE phone_number LIKE '%1234';

SELECT *
FROM employees
WHERE phone_number  NOT LIKE '%3%' AND phone_number LIKE '%9';

SELECT employee_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;

SELECT *
FROM employees
WHERE job_id LIKE '%CLERK%'
ORDER BY salary DESC;

SELECT employee_id ������ȣ, first_name �����̸�, department_id �μ���ȣ, salary ����
FROM employees
WHERE employee_id BETWEEN 120 AND 150
ORDER BY salary DESC;