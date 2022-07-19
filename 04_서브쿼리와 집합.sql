-- ��������

-- POPP �������� ����� ���ֱ��� ����ѻ��
-- ������ : ������ ���������� ����Ҷ��� ���������� ����� ���ϴ� �����Ϳ� ���� �ϳ��� ��µǾ����
SELECT LAST_NAME �̸�, HIRE_DATE �������
FROM employees
WHERE HIRE_DATE > ( SELECT HIRE_DATE FROM EMPLOYEES WHERE LAST_NAME = 'Popp' );

-- �׷��Լ��� ����� ���������� ���
SELECT last_name �̸�, job_id ����, salary �޿�
from employees
WHERE salary = ( SELECT min ( salary) from employees );

--����
SELECT last_name, salary
FROM employees
where salary > (SELECT salary FROM employees WHERE last_name = 'Abel' );
--����
SELECT employee_id ������ȣ, last_name �̸�, department_id �μ���ȣ, salary �޿�
FROM employees
where salary > ( SELECT salary from employees WHERE last_name = 'Bull' )
        and department_id = ( SELECT department_id from employees WHERE last_name = 'Bull' );
--����
SELECT last_name, salary, manager_id
FROM employees
WHERE manager_id = ( SELECT employee_id from employees where last_name = 'Russell');
--����
SELECT *
from employees
where job_id = ( SELECT job_id FROM jobs where job_title = 'Stock Manager' );


-- ������ �������� (�������� ����� �������� ������ ���)
SELECT department_id, employee_id, last_name
from employees
WHERE salary in (SELECT MIN(salary) FROM employees GROUP BY department_id)
ORDER BY department_id;

-- ANY ������ ���������� ��Ƽ���� ��� �ϳ��� �����ϸ� ����
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ANY
                    ( SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG'
ORDER BY salary DESC;

-- ALL ������ ���������� ��� ��Ƽ���� �������Ѿ���
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ALL
                    ( SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

--����
SELECT employee_id, first_name, job_id ����, salary �޿�
from employees
where manager_id IN ( SELECT manager_id from employees WHERE department_id = 20 )
and department_id <> 20;
--����
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < any (SELECT salary FROM employees where job_id = 'ST_MAN' )
ORDER BY SALARY, LAST_NAME DESC;
--����
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY
FROM employees
WHERE SALARY < ALL ( SELECT salary FROM employees WHERE job_id = 'IT_PROG' );


-- ���߿� ��������
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
WHERE (manager_id, job_id) IN (SELECT manager_id, job_id FROM employees WHERE first_name = 'Bruce')
AND first_name <> 'Bruce';

--�μ��� �ּұ޿��� �޴� ����� ����
select department_id �μ���ȣ, employee_id �����ȣ, first_name, salary
from employees
where (department_id, salary) in  (select department_id, min(salary) from employees group by department_id)
order by department_id;
--����
SELECT FIRST_NAME, JOB_ID, SALARY, DEPARTMENT_ID
FROM employees
WHERE (JOB_ID, SALARY) IN ( SELECT JOB_ID, MIN(SALARY) FROM employees GROUP BY JOB_ID)
ORDER BY SALARY DESC;

-- ���տ�����

-- union�� �̿��� ������
SELECT employee_id, job_id
from employees
union
select employee_id, job_id
from job_history;

SELECT employee_id, job_id
from employees
union all
select employee_id, job_id
from job_history;

-- intersect�� �̿��� ������
select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;

-- minus�� �̿��� ������
select employee_id, job_id
from employees
minus
select employee_id, job_id
from job_history;

--����1
SELECT department_id
from employees
union
select department_id
from departments;
--����2
SELECT department_id
from employees
union all
select department_id
from departments;
--����3
SELECT department_id
from employees
intersect
select department_id
from departments;
--����4
SELECT department_id
from departments
minus
select department_id
from employees;

-- Ʈ�����

-- 