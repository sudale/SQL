-- �׷��Լ� (������ �Լ�, �����Լ�)
SELECT ROUND( AVG(salary) ) ��հ�,
           MAX(salary) �ִ밪,
           MIN(salary) �ּҰ�, 
           SUM(salary) �հ�,
           COUNT(SALARY) ī��Ʈ
FROM employees
WHERE job_id LIKE '%REP%';

SELECT *
FROM employees
WHERE job_id
LIKE '%REP%';

-- ī��Ʈ COUNT : ���� ������ ����ϴµ� �ΰ��� ���� ��(*) �϶��� ��ü ī��Ʈ
SELECT COUNT (COMMISSION_PCT)
FROM employees;

SELECT COUNT (DISTINCT DEPARTMENT_ID)
FROM EMPLOYEES;
-- �����Լ����� �ΰ��� �����ϰ� ����
SELECT AVG(COMMISSION_PCT)
FROM employees;
-- ��ü��� (���»��0)
SELECT AVG ( NVL ( COMMISSION_PCT, 0 ) )
FROM employees;

-- GROUP BY �� : Ư�� �׷����� ����� �׷��Լ��� ���
SELECT department_id �μ���ȣ, ROUND ( AVG ( SALARY ) ) ��ձ޿�
FROM employees
GROUP BY department_id
ORDER BY �μ���ȣ;

-- �׷쿭�� �������϶�
SELECT department_id �μ���ȣ, job_id ����, ROUND( AVG(SALARY) ) ��տ���
FROM employees
GROUP BY department_id, job_id;

--����1
SELECT department_id �μ���, COUNT ( EMPLOYEE_ID ) �����,
          MAX (SALARY) �ְ�޿�, MIN (SALARY) �ּұ޿�,
          SUM (SALARY) �޿��հ�, ROUND ( AVG (SALARY) ) ��ձ޿�
FROM employees
GROUP BY department_id
ORDER BY �޿��հ� DESC;
--����2
SELECT department_id �μ���ȣ, job_id ����, SUM (SALARY), COUNT (EMPLOYEE_ID) ������
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;
--����3
SELECT ROUND ( AVG (MAX (SALARY))) �μ����ְ�������,  
          ROUND ( AVG (MIN (SALARY))) �μ��������������
FROM employees
GROUP BY department_id;

-- HAVING ������
SELECT department_id �μ���, COUNT(*) �����
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;

--����1
SELECT job_id ����, SUM(SALARY) ���޿��հ�
FROM employees
WHERE job_id <> 'AC_MGR'
GROUP BY job_id
HAVING AVG(SALARY) > 10000
ORDER BY SUM(SALARY) DESC;
--����2
SELECT DEPARTMENT_ID �μ���ȣ, ROUND(AVG(SALARY)) ��ձ޿�
FROM employees
WHERE department_id <> '40'
GROUP BY DEPARTMENT_ID
HAVING ROUND(AVG(SALARY)) <= 7000;
--����3
SELECT JOB_ID, SUM(SALARY) �޿��Ѿ�
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(SALARY) >= 13000
ORDER BY SUM(SALARY) DESC;

-- JOIN
SELECT e.department_id ������ȣ, e.last_name �����̸�,
          e.department_id �μ���ȣ, d.department_name �μ���
FROM employees E JOIN departments D
ON E.DEPARTMENT_ID = d.department_id;

--����
SELECT DEPARTMENT_NAME �μ���, CITY ���ø�, COUNTRY_NAME ������
FROM  departments D
JOIN locations L
   ON d.location_id = l.location_id
JOIN countries C
   ON l.COUNTRY_id = c.country_id
WHERE l.city in ('London', 'Seattle')
and c.country_name like 'United%';


-- JOIN - ��ü ����
SELECT E.LAST_NAME ����, M.LAST_NAME �Ŵ���
FROM employees E
JOIN employees M
ON e.manager_id = m.employee_id;

-- �ܺ� JOIN
SELECT E.LAST_NAME ����, D.DEPARTMENT_ID �μ���ȣ, D.DEPARTMENT_NAME �μ���
FROM employees E
RIGHT OUTER JOIN departments D
ON E.DEPARTMENT_ID = d.department_id;

--����
SELECT C.COUNTRY_NAME ����, C.COUNTRY_ID ������ȣ, L.LOCATION_ID ������ȣ, L.CITY ����
FROM locations L
RIGHT OUTER JOIN countries C
ON l.country_id = c.country_id
ORDER BY ������ȣ DESC;

-- ���� JOIN
SELECT COUNTRY_NAME ����, REGION_NAME �����̸�
FROM countries C
CROSS JOIN regions R;

--����1
SELECT d.department_name �μ���, d.manager_id �Ŵ�����ȣ, 
          E.LAST_NAME||' '||FIRST_NAME "�Ŵ����̸�",
          e.phone_number ��ȭ��ȣ
FROM departments D
JOIN employees E
ON D.manager_id = e.employee_id;
--����2
SELECT e.employee_id �����ȣ, e.hire_date �������, j.job_id ����, j.job_title ��å
FROM employees E
JOIN jobs J
ON e.job_id = j.job_id;
--����3
SELECT to_char(e.hire_date,'yyyy') �Ի�⵵, avg (e.salary) ��ձ޿�
FROM employees e
JOIN jobs j
on e.job_id = j.job_id
WHERE job_title = 'Sales Manager'
GROUP BY to_char(e.hire_date,'yyyy')
ORDER BY to_char(e.hire_date,'yyyy');
--����4
SELECT city, round ( avg ( e.salary) ), count (*)
FROM employees e
join departments d
on e.department_id = d.department_id
JOIN locations l
on l.location_id = d.location_id
GROUP BY city
HAVING not COUNT(*) >=10
ORDER by round ( avg ( e.salary) );
--����5
SELECT e.employee_id, e.last_name, e.salary, m.last_name, m.salary
FROM employees E
JOIN employees M
ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;