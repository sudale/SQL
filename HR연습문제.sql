--예제1 부서별 직원수
SELECT department_name, COUNT(*)
FROM departments D
JOIN employees E
ON d.department_id = e.department_id
GROUP BY department_name
ORDER BY COUNT(*) DESC;

--예제2 부서별 평균 급여
SELECT department_name, ROUND ( AVG(SALARY),-1) AVG_SAL
FROM departments D
JOIN employees E
ON d.department_id = e.department_id
GROUP BY department_name
ORDER BY ROUND ( AVG(SALARY),-1) DESC;

--예제3 직책별 평균 급여 (상위7개)
SELECT A.*
FROM (SELECT JOB_TITLE, ROUND (AVG (SALARY) ) AVG_SAL
FROM employees E
JOIN jobs J
ON E.JOB_ID = J.JOB_ID
GROUP BY JOB_TITLE
ORDER BY ROUND (AVG(SALARY)) DESC) A
WHERE ROWNUM <=7;

--예제4 자신의 매니저 보다 더많은 급여를 받는 사람
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.SALARY
FROM employees E
JOIN employees M
ON E.MANAGER_ID = M.EMPLOYEE_ID
WHERE E.SALARY > M.SALARY;

--예제5 JOB TITLE이 SALE- 인 직원중, 급여가 9,000~10,000인 직원
SELECT FIRST_NAME||' '||LAST_NAME emp_name, salary
FROM employees E
JOIN JOBS J
ON E.JOB_ID = J.JOB_ID
WHERE SALARY BETWEEN 9000 and 10000  and job_title = 'Sales Representative'
ORDER by salary desc;

--예제6 급여총합이 가장 높은 직급순 (급여총합이 30,000이상직급만)
SELECT job_title, sum(salary)
from employees e
join jobs j
on e.job_id = j.job_id
GROUP by job_title
having sum(salary) > 30000
ORDER by sum(salary) desc;

--예제7 각 도시별 평균연봉 높은순으로 상위3개도시
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


--예제8 직책이SALES MANAGER인 사원들의 입사년도별 평귝급여 출력
SELECT to_char(hire_date, 'yyyy') hire_year , round ( avg (salary) ) avg_sal
FROM employees e
join jobs j
on e.job_id = j.job_id
where job_title in 'Sales Manager'
group by to_char(hire_date, 'yyyy')
ORDER by to_char(hire_date, 'yyyy');

--예제9 각 도시에 있는 모든부서 직원들의 평균급여
SELECT city, round ( avg ( salary) ) avg_salary, count(*) emp_cnt
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
group by city
having not count(*) >= 10
order by avg_salary;

--예제10 과거에 근무한적이 있는 모든사원
SELECT h.employee_id, FIRST_NAME||' '||LAST_NAME emp_name
from employees e
join job_history h
on  h.employee_id = e.employee_id
join  jobs j
on h.job_id = j.job_id
where job_title = 'Public Accountant';

--예제11 2007년에 입사한 직원들조회, 부서에 배치되지 않은 직원의경우, NOT ASSIGNED로출력
SELECT employee_id, first_name, last_name, nvl( department_name, '<Not Assigned>')
from employees e
LEFT join departments d
on e.department_id = d.department_id
where to_char( hire_date , 'yyyy') = 2007
order by employee_id;

--예제12 부서별로 가장 적은 급여를 받고 있는 직원
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

--예제13 급여를 많이 받는 순서대로 조회 6~10번째까지 직원
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
where first_name = '펭수';

--예제14 SALES부서에 속한 직원, 급여는 100번 부서의 평균보다 적게받는 직원정보출력
SELECT FIRST_NAME, SALARY, DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE DEPARTMENT_NAME = 'Sales'
and salary < (select round(avg(salary)) from employees where department_id = 100) ;

--예제15 부서별 입사월별 직원수, 직원수가 5명 이상인 부서만출력
SELECT department_name, to_char(hire_date, 'mm') mm, count(*)
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
group by department_name, to_char(hire_date, 'mm')
having count(*) >=5
order by department_name;

--예제16 커미션을 가장 많이받는 상위4명정보
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