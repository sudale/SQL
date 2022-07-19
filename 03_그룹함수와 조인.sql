-- 그룹함수 (다중행 함수, 집계함수)
SELECT ROUND( AVG(salary) ) 평균값,
           MAX(salary) 최대값,
           MIN(salary) 최소값, 
           SUM(salary) 합계,
           COUNT(SALARY) 카운트
FROM employees
WHERE job_id LIKE '%REP%';

SELECT *
FROM employees
WHERE job_id
LIKE '%REP%';

-- 카운트 COUNT : 행의 갯수를 출력하는데 널값은 제외 단(*) 일때는 전체 카운트
SELECT COUNT (COMMISSION_PCT)
FROM employees;

SELECT COUNT (DISTINCT DEPARTMENT_ID)
FROM EMPLOYEES;
-- 직계함수들은 널값을 제외하고 계산됨
SELECT AVG(COMMISSION_PCT)
FROM employees;
-- 전체평균 (없는사람0)
SELECT AVG ( NVL ( COMMISSION_PCT, 0 ) )
FROM employees;

-- GROUP BY 절 : 특정 그룹으로 나누어서 그룹함수를 사용
SELECT department_id 부서번호, ROUND ( AVG ( SALARY ) ) 평균급여
FROM employees
GROUP BY department_id
ORDER BY 부서번호;

-- 그룹열이 여러개일때
SELECT department_id 부서번호, job_id 직종, ROUND( AVG(SALARY) ) 평균월급
FROM employees
GROUP BY department_id, job_id;

--예제1
SELECT department_id 부서명, COUNT ( EMPLOYEE_ID ) 사원수,
          MAX (SALARY) 최고급여, MIN (SALARY) 최소급여,
          SUM (SALARY) 급여합계, ROUND ( AVG (SALARY) ) 평균급여
FROM employees
GROUP BY department_id
ORDER BY 급여합계 DESC;
--예제2
SELECT department_id 부서번호, job_id 직종, SUM (SALARY), COUNT (EMPLOYEE_ID) 직원수
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;
--예제3
SELECT ROUND ( AVG (MAX (SALARY))) 부서별최고월급평균,  
          ROUND ( AVG (MIN (SALARY))) 부서별최저월급평균
FROM employees
GROUP BY department_id;

-- HAVING 조건절
SELECT department_id 부서명, COUNT(*) 사원수
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;

--예제1
SELECT job_id 직종, SUM(SALARY) 월급여합계
FROM employees
WHERE job_id <> 'AC_MGR'
GROUP BY job_id
HAVING AVG(SALARY) > 10000
ORDER BY SUM(SALARY) DESC;
--예제2
SELECT DEPARTMENT_ID 부서번호, ROUND(AVG(SALARY)) 평균급여
FROM employees
WHERE department_id <> '40'
GROUP BY DEPARTMENT_ID
HAVING ROUND(AVG(SALARY)) <= 7000;
--예제3
SELECT JOB_ID, SUM(SALARY) 급여총액
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(SALARY) >= 13000
ORDER BY SUM(SALARY) DESC;

-- JOIN
SELECT e.department_id 직원번호, e.last_name 직원이름,
          e.department_id 부서번호, d.department_name 부서명
FROM employees E JOIN departments D
ON E.DEPARTMENT_ID = d.department_id;

--예제
SELECT DEPARTMENT_NAME 부서명, CITY 도시명, COUNTRY_NAME 국가명
FROM  departments D
JOIN locations L
   ON d.location_id = l.location_id
JOIN countries C
   ON l.COUNTRY_id = c.country_id
WHERE l.city in ('London', 'Seattle')
and c.country_name like 'United%';


-- JOIN - 자체 조인
SELECT E.LAST_NAME 직원, M.LAST_NAME 매니저
FROM employees E
JOIN employees M
ON e.manager_id = m.employee_id;

-- 외부 JOIN
SELECT E.LAST_NAME 직원, D.DEPARTMENT_ID 부서번호, D.DEPARTMENT_NAME 부서명
FROM employees E
RIGHT OUTER JOIN departments D
ON E.DEPARTMENT_ID = d.department_id;

--예제
SELECT C.COUNTRY_NAME 국가, C.COUNTRY_ID 국가번호, L.LOCATION_ID 지역번호, L.CITY 도시
FROM locations L
RIGHT OUTER JOIN countries C
ON l.country_id = c.country_id
ORDER BY 지역번호 DESC;

-- 교차 JOIN
SELECT COUNTRY_NAME 국가, REGION_NAME 지역이름
FROM countries C
CROSS JOIN regions R;

--예제1
SELECT d.department_name 부서명, d.manager_id 매니저번호, 
          E.LAST_NAME||' '||FIRST_NAME "매니저이름",
          e.phone_number 전화번호
FROM departments D
JOIN employees E
ON D.manager_id = e.employee_id;
--예제2
SELECT e.employee_id 사원번호, e.hire_date 고용일자, j.job_id 직종, j.job_title 직책
FROM employees E
JOIN jobs J
ON e.job_id = j.job_id;
--예제3
SELECT to_char(e.hire_date,'yyyy') 입사년도, avg (e.salary) 평균급여
FROM employees e
JOIN jobs j
on e.job_id = j.job_id
WHERE job_title = 'Sales Manager'
GROUP BY to_char(e.hire_date,'yyyy')
ORDER BY to_char(e.hire_date,'yyyy');
--예제4
SELECT city, round ( avg ( e.salary) ), count (*)
FROM employees e
join departments d
on e.department_id = d.department_id
JOIN locations l
on l.location_id = d.location_id
GROUP BY city
HAVING not COUNT(*) >=10
ORDER by round ( avg ( e.salary) );
--예제5
SELECT e.employee_id, e.last_name, e.salary, m.last_name, m.salary
FROM employees E
JOIN employees M
ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;