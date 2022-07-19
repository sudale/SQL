-- SELECT 조회
-- 부서(department) 테이블에 모든 열 조회
SELECT * 
FROM departments;
-- as는 별칭, 조회할 열 이름만 검색가능
SELECT department_name as 부서이름
FROM departments;
-- 우선 테이블명을 FROM에 적고 CRTL+SPACE 자동으로 열이름을 불러온다
SELECT department_id 부서번호, department_name 부서이름
FROM departments;

-- 직원(employees) 테이블 월급
SELECT salary 월급
FROM employees;
-- 전체 직원 월급에 100추가 해서 새 열만들기
SELECT last_name 이름,  salary 월급, salary + 100 보너스월급
FROM employees;
-- 전체 직원 월급에 -10% 해서 새 열만들기
SELECT last_name 이름,  salary 월급, salary  - salary*0.10 새월급
FROM employees;

-- 중복값 제거 DISTINCT
-- 같은 직업은 제거(통합)하고 조회
SELECT DISTINCT job_id 직업
FROM employees;

-- 예제1
SELECT employee_id, first_name, last_name
FROM  employees;
-- 예제2
SELECT first_name 이름, salary 월급, salary + salary*1.10 AS뉴셀러리
FROM employees;
-- 예제3
SELECT employee_id 사원번호, first_name 이름, last_name 성
FROM  employees;

-- 연결 연산자 || (문자열을 합침)
SELECT employee_id, first_name||' '||last_name, email||'@company.com' 이메일
FROM employees;

-- WHERE 절 (조건문)
-- 직원들중 월급이 14000초과인 직원
SELECT *
FROM employees
WHERE salary > 14000;
-- 이름이 King인 사람
SELECT *
FROM employees
WHERE last_name = 'King'; -- 문자열은 ''한따옴표를 붙이고, 대소문자를 가림
-- 고용 일자가 2002년 6월 10일 이전
SELECT *
FROM employees
WHERE hire_date < '2002/06/10'; -- 문자열안에 날짜형식으로 적으면 자동 변환됨

--예제1
SELECT *
FROM employees
WHERE employee_id = 100;
--예제2
SELECT *
FROM employees
WHERE first_name = 'David';
--예제3
SELECT *
FROM employees
WHERE employee_id <= 105;
--예제4
SELECT *
FROM job_history
WHERE start_date > '06/03/03';
--예제5
SELECT *
FROM departments
WHERE location_id <> 1700;

-- 논리 연산자

-- 80번 부서이면서 월급이 10000보다 많은 직원 또는 60번 부서직원
SELECT last_name, department_id, salary
FROM employees
WHERE department_id = 60 OR ( department_id = 80 AND salary > 10000 ) ;
-- 부서번호는 80또는 60이면서 월급이 10000보다 많은 직원
SELECT last_name, department_id, salary
FROM employees
WHERE ( department_id = 60 OR department_id = 80 ) AND salary > 10000  ;

--예제1
SELECT job_id, salary
FROM employees
WHERE job_id = 'IT_PROG'  AND salary > 4000;
--예제2
SELECT job_id, salary
FROM employees
WHERE job_id = 'IT_PROG' OR job_id = 'FI_ACCOUNT' AND salary > 4000;

-- IN연산자 OR을 여러개 쓰는 대신에 사용가능
SELECT *
FROM employees
WHERE salary in (4000,3000,2700);

--예제1
SELECT *
FROM employees
WHERE salary IN (1000,17000,24000);
--예제2
SELECT *
FROM employees
WHERE department_id NOT IN (30,50,80,100,110);

-- BETWEEN 사이값 A and B
SELECT *
FROM employees
WHERE salary BETWEEN 9000 AND 10000;

--예제1
SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;
--예제2
SELECT *
FROM employees
WHERE hire_date BETWEEN '04/01/01' AND '04/12/30';
--예제3
SELECT *
FROM employees
WHERE salary NOT BETWEEN 7000 AND 17000;

-- LIKE 연산자 문자열 조회시 명확하지 않을경우 사용
SELECT *
FROM employees
WHERE last_name LIKE 'B%';
-- %가 앞뒤에 있을경우 사이값에 b가 있으면 전부 조회
SELECT *
FROM employees
WHERE last_name LIKE '%b%';
-- %가앞에 있을 경우에는 맨 뒷글자가 y로 끝나는 경우
SELECT *
FROM employees
WHERE last_name LIKE '%y';

--예제1
SELECT *
FROM employees
WHERE job_id like '%AD%';
--예제2
SELECT *
FROM employees
WHERE job_id LIKE '%AD___';
--예제3
SELECT *
FROM employees
WHERE phone_number LIKE '%1234';
--예제4
SELECT *
FROM employees
WHERE phone_number NOT LIKE '%3%' AND phone_number LIKE '%9';
--예제5
SELECT *
FROM employees
WHERE job_id LIKE '%MGR%' OR job_id LIKE '%ASST%';

-- NULL 은 값을 입력안했을때 ( 0 이나 공백 ' ' 이 아니다)
-- NULL 을 검색하기 위해 is NULL 을 사용한다
SELECT *
FROM employees
WHERE commission_pct IS NULL;

--예제
SELECT *
FROM employees
WHERE manager_id IS NULL;

-- ORDER BY + 열 + ASC OR DESC : 열의 오름차순 또는 내림차순으로 정렬
-- 월급이 큰 사람순으로 정렬
SELECT *
FROM employees
ORDER BY salary DESC; --ASC (작은순) 은 생략가능

-- 정렬 열이 2개 이상일때 첫번째 열로 정렬후 두번째 열 정렬
SELECT department_id, employee_id, first_name, last_name
FROM employees
ORDER BY department_id, employee_id;

-- 별칭으로 정렬
SELECT department_id, employee_id, salary*12 연봉
FROM employees
ORDER BY 연봉 DESC;

--예제1
SELECT employee_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;
--예제2
SELECT *
FROM employees
WHERE job_id LIKE '%CLERK%'
ORDER BY SALARY DESC;
--예제3
SELECT employee_id 직원번호, last_name 직원이름, department_id 부서번호, salary 월급
FROM employees
WHERE employee_id BETWEEN 120 AND 150
ORDER BY 부서번호 DESC, 월급 DESC;


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

SELECT employee_id 직원번호, first_name 직원이름, department_id 부서번호, salary 월급
FROM employees
WHERE employee_id BETWEEN 120 AND 150
ORDER BY salary DESC;