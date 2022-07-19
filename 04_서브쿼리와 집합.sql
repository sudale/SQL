-- 서브쿼리

-- POPP 직원보다 고용일 이최군에 고용한사람
-- 주의점 : 단일행 서브쿼리를 사용할때는 서브쿼리의 결과가 비교하는 데이터와 같고 하나만 출력되어야함
SELECT LAST_NAME 이름, HIRE_DATE 고용일자
FROM employees
WHERE HIRE_DATE > ( SELECT HIRE_DATE FROM EMPLOYEES WHERE LAST_NAME = 'Popp' );

-- 그룹함수의 결과를 서브쿼리로 사용
SELECT last_name 이름, job_id 직종, salary 급여
from employees
WHERE salary = ( SELECT min ( salary) from employees );

--예제
SELECT last_name, salary
FROM employees
where salary > (SELECT salary FROM employees WHERE last_name = 'Abel' );
--예제
SELECT employee_id 직원번호, last_name 이름, department_id 부서번호, salary 급여
FROM employees
where salary > ( SELECT salary from employees WHERE last_name = 'Bull' )
        and department_id = ( SELECT department_id from employees WHERE last_name = 'Bull' );
--예제
SELECT last_name, salary, manager_id
FROM employees
WHERE manager_id = ( SELECT employee_id from employees where last_name = 'Russell');
--예제
SELECT *
from employees
where job_id = ( SELECT job_id FROM jobs where job_title = 'Stock Manager' );


-- 다중행 서브쿼리 (서브쿼리 결과가 여러개의 행으로 출력)
SELECT department_id, employee_id, last_name
from employees
WHERE salary in (SELECT MIN(salary) FROM employees GROUP BY department_id)
ORDER BY department_id;

-- ANY 연산자 서브쿼리의 멀티열중 어느 하나라도 만족하면 가능
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ANY
                    ( SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG'
ORDER BY salary DESC;

-- ALL 연산자 서브쿼리의 모든 멀티열을 만족시켜야함
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ALL
                    ( SELECT salary FROM employees WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

--예제
SELECT employee_id, first_name, job_id 직종, salary 급여
from employees
where manager_id IN ( SELECT manager_id from employees WHERE department_id = 20 )
and department_id <> 20;
--예제
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < any (SELECT salary FROM employees where job_id = 'ST_MAN' )
ORDER BY SALARY, LAST_NAME DESC;
--예제
SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID, SALARY
FROM employees
WHERE SALARY < ALL ( SELECT salary FROM employees WHERE job_id = 'IT_PROG' );


-- 다중열 서브쿼리
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
WHERE (manager_id, job_id) IN (SELECT manager_id, job_id FROM employees WHERE first_name = 'Bruce')
AND first_name <> 'Bruce';

--부서별 최소급여를 받는 사원의 정보
select department_id 부서번호, employee_id 사원번호, first_name, salary
from employees
where (department_id, salary) in  (select department_id, min(salary) from employees group by department_id)
order by department_id;
--예제
SELECT FIRST_NAME, JOB_ID, SALARY, DEPARTMENT_ID
FROM employees
WHERE (JOB_ID, SALARY) IN ( SELECT JOB_ID, MIN(SALARY) FROM employees GROUP BY JOB_ID)
ORDER BY SALARY DESC;

-- 집합연산자

-- union을 이용한 합집합
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

-- intersect를 이용한 교집합
select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;

-- minus를 이용한 차집합
select employee_id, job_id
from employees
minus
select employee_id, job_id
from job_history;

--예제1
SELECT department_id
from employees
union
select department_id
from departments;
--예제2
SELECT department_id
from employees
union all
select department_id
from departments;
--예제3
SELECT department_id
from employees
intersect
select department_id
from departments;
--예제4
SELECT department_id
from departments
minus
select department_id
from employees;

-- 트랜잭션

-- 