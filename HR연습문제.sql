--����1 �μ��� ������
SELECT department_name, COUNT(*)
FROM departments D
JOIN employees E
ON d.department_id = e.department_id
GROUP BY department_name
ORDER BY COUNT(*) DESC;

--����2 �μ��� ��� �޿�
SELECT department_name, ROUND ( AVG(SALARY),-1) AVG_SAL
FROM departments D
JOIN employees E
ON d.department_id = e.department_id
GROUP BY department_name
ORDER BY ROUND ( AVG(SALARY),-1) DESC;

--����3 ��å�� ��� �޿� (����7��)
SELECT A.*
FROM (SELECT JOB_TITLE, ROUND (AVG (SALARY) ) AVG_SAL
FROM employees E
JOIN jobs J
ON E.JOB_ID = J.JOB_ID
GROUP BY JOB_TITLE
ORDER BY ROUND (AVG(SALARY)) DESC) A
WHERE ROWNUM <=7;

--����4 �ڽ��� �Ŵ��� ���� ������ �޿��� �޴� ���
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.SALARY
FROM employees E
JOIN employees M
ON E.MANAGER_ID = M.EMPLOYEE_ID
WHERE E.SALARY > M.SALARY;

--����5 JOB TITLE�� SALE- �� ������, �޿��� 9,000~10,000�� ����
SELECT FIRST_NAME||' '||LAST_NAME emp_name, salary
FROM employees E
JOIN JOBS J
ON E.JOB_ID = J.JOB_ID
WHERE SALARY BETWEEN 9000 and 10000  and job_title = 'Sales Representative'
ORDER by salary desc;

--����6 �޿������� ���� ���� ���޼� (�޿������� 30,000�̻����޸�)
SELECT job_title, sum(salary)
from employees e
join jobs j
on e.job_id = j.job_id
GROUP by job_title
having sum(salary) > 30000
ORDER by sum(salary) desc;

--����7 �� ���ú� ��տ��� ���������� ����3������
SELECT A.* 
FROM (
SELECT city, round ( avg (salary) ) avg_salary
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
group by city
ORDER BY round ( avg (salary) ) DESC
) A
WHERE ROWNUM <=3;


--����8 ��å��SALES MANAGER�� ������� �Ի�⵵�� ���޿� ���
SELECT to_char(hire_date, 'yyyy') hire_year , round ( avg (salary) ) avg_sal
FROM employees e
join jobs j
on e.job_id = j.job_id
where job_title in 'Sales Manager'
group by to_char(hire_date, 'yyyy')
ORDER by to_char(hire_date, 'yyyy');

--����9 �� ���ÿ� �ִ� ���μ� �������� ��ձ޿�
SELECT city, round ( avg ( salary) ) avg_salary, count(*) emp_cnt
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
group by city
having not count(*) >= 10
order by avg_salary;

--����10 ���ſ� �ٹ������� �ִ� �����
SELECT h.employee_id, FIRST_NAME||' '||LAST_NAME emp_name
from employees e
join job_history h
on  h.employee_id = e.employee_id
join  jobs j
on h.job_id = j.job_id
where job_title = 'Public Accountant';

--����11 2007�⿡ �Ի��� ��������ȸ, �μ��� ��ġ���� ���� �����ǰ��, NOT ASSIGNED�����
SELECT employee_id, first_name, last_name, nvl( department_name, '<Not Assigned>')
from employees e
LEFT join departments d
on e.department_id = d.department_id
where to_char( hire_date , 'yyyy') = 2007
order by employee_id;

--����12 �μ����� ���� ���� �޿��� �ް� �ִ� ����
SELECT D.DEPARTMENT_NAME, EE.EMPLOYEE_ID, EE.LAST_NAME, EE.SALARY
FROM ( 
        SELECT E.DEPARTMENT_ID, MIN(E.SALARY) MIN_SAL
        FROM EMPLOYEES E 
        WHERE E.DEPARTMENT_ID IS NOT NULL
        GROUP BY E.DEPARTMENT_ID) A JOIN EMPLOYEES EE
                                                  ON A.DEPARTMENT_ID = EE.DEPARTMENT_ID
                                                   AND EE.SALARY = A.MIN_SAL
                                                   JOIN DEPARTMENTS D
                                                   ON EE.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY EE.DEPARTMENT_ID, EE.LAST_NAME;

--����13 �޿��� ���� �޴� ������� ��ȸ 6~10��°���� ����
SELECT AB.LAST_NAME, AB.FIRST_NAME, AB.SALARY
FROM
( SELECT ROWNUM AS RN , A.*
FROM (
SELECT LAST_NAME, FIRST_NAME, SALARY
FROM EMPLOYEES 
ORDER BY SALARY DESC
) A
) AB
WHERE RN BETWEEN 6 AND 10;

delete from employees
where first_name = '���';

--����14 SALES�μ��� ���� ����, �޿��� 100�� �μ��� ��պ��� ���Թ޴� �����������
SELECT FIRST_NAME, SALARY, DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE DEPARTMENT_NAME = 'Sales'
and salary < (select round(avg(salary)) from employees where department_id = 100) ;

--����15 �μ��� �Ի���� ������, �������� 5�� �̻��� �μ������
SELECT department_name, to_char(hire_date, 'mm') mm, count(*)
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
group by department_name, to_char(hire_date, 'mm')
having count(*) >=5
order by department_name;

--����16 Ŀ�̼��� ���� ���̹޴� ����4������
select a.*
from (
SELECT department_name, first_name, salary, commission_pct
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
where commission_pct is not null
order by commission_pct desc, salary desc
) a
where rownum <=4;