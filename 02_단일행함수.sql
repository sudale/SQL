-- 단일행 함수

-- 문자함수
-- 대소문자 변환함수
SELECT UPPER ('SQL Course'),
           LOWER ('SQL Course'),
           INITCAP ('SQL Course')
FROM DUAL; 
-- 테스트용 테이블 (1행만 나옴) 을 이용하여 연습

-- 문자조작함수
SELECT CONCAT ('헬로우','월드'),
           SUBSTR ('ABCDEFG',3,4),
           LENGTH ('ABCDEFG'),
           INSTR ('ABCDEFG', 'D')
FROM DUAL;
-- 공백 없애기 TRIM
SELECT TRIM ('     헬로우     '), ('     헬로우     ')
FROM DUAL;

-- 문자형 함수 예제
SELECT department_id, last_name
FROM EMPLOYEES
WHERE lower(LAST_NAME) = 'higgins'; -- 대소문자 섞여있을경우 조회가능

-- 문자열 바꾸기
SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') 적용결과
FROM employees;

--예제1
select last_name 이름, lower (last_name) 소문자, upper (last_name) 대문자, email 이메일, initcap (email)
from employees;
--예제2
select job_id 직업명, substr (job_id, 1,2) 앞의2개 
from employees;

-- 숫자형 함수
-- ROUND 반올림
SELECT ROUND(15.193, 1) 소수첫째,
           ROUND(15.193, 0) ,
           ROUND(15.193, 0) 정수,
           ROUND(15.193, -1) "10의자리"
FROM DUAL;
-- TRUNC 버린다
SELECT TRUNC (15.79, 1) 소수첫째,
           TRUNC (15.79, 0) 정수,
           TRUNC (15.79, -1) "10의자리"
FROM DUAL;
-- MOD 나누기
SELECT EMPLOYEE_ID 짝수, LAST_NAME
FROM employees
WHERE MOD (EMPLOYEE_ID, 2) = 0
ORDER BY 1;

--예제
SELECT salary, ROUND(SALARY/30, 0) 정수,
                    ROUND(SALARY/30, 1) 소수첫째,
                    ROUND(SALARY/30, -1) "10의자리"
FROM employees;

-- 날짜함수
SELECT sysdate 
FROM dual;
-- 날짜를 반올림 일(시간을반올림), 월(날짜를반올림), 년(월을반올림)
SELECT round ( sysdate, 'dd') 일,
           round ( sysdate, 'mm') 월,
           round ( sysdate, 'yyyy') 년도,
           months_between ('2017/10/10', '2017/07/10') 월차이,
           add_months ('2017/07/10', 3) 애드먼쓰
FROM dual;
-- 날짜와 숫자 계산법
SELECT sysdate-1 어제, sysdate 오늘, sysdate+1 내일
FROM dual;
-- 90번 부서 직원들의 오늘까지의 근무일수
SELECT last_name, floor(sysdate - hire_date) 근무일수
FROM employees
WHERE department_id = 90;

SELECT employee_id, hire_date,
           floor(months_between(sysdate,hire_date)) 근무월수,
           add_months(hire_date, 6) "6개월 추가",
           next_day(hire_date, '금요일') next_day,
           --1(일),2(월),3(화),4(수)~
           last_day(hire_date) last_day
           --달의 마지막 날           
FROM employees
WHERE months_between(sysdate, hire_date) < 200;

--예제
SELECT sysdate, hire_date, floor(months_between(sysdate,hire_date))
FROM employees
WHERE department_id = 100;
--예제
SELECT hire_date, add_months(hire_date, 3) 더하기_3개월, add_months(hire_date, -3) 빼기3개월
FROM employees
WHERE employee_id BETWEEN 100 and 106;

-- 변환형 함수 (날짜, 숫자, 문자를 변환하는 함수)

-- 숫자를 문자로 변환
-- 콤마예제
SELECT to_char(123456789,'999,999,999') comma
FROM dual;
-- 소숫점예제
SELECT to_char(12311111.45678,'999,999,999.999') period
FROM dual;
-- $표지예제
SELECT TO_CHAR(12345678,'$999,999,999') dollar  
FROM DUAL;
-- Local 화폐 표시 예제 (한국의 경우 ￦로 자동 변환 됨)
SELECT TO_CHAR(12345678,'L999,999,999') local  
FROM DUAL;
-- 왼쪽에 0을 삽입
SELECT TO_CHAR(123,'09999') zero 
FROM DUAL;  
-- 16진수로 변환
SELECT TO_CHAR(123,'XXXX') hexadecimal  
FROM DUAL;

-- 날짜를 문자로 변환
-- 년,월,일,시,분,초 예제
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') sysdate
FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD AM HH:MI:SS') 현재날짜
FROM DUAL;

--예제1
SELECT employee_id, TO_CHAR(HIRE_DATE, 'MM-YY') 입사월
FROM employees
WHERE department_id = 100;
--예제2
SELECT last_name 이름, TO_CHAR (SALARY,'$99,999.99') 월급
FROM employees
WHERE salary > 10000
ORDER BY salary DESC;

-- TO_DATE
-- DATE 타입으로 변환하는 예제
SELECT TO_DATE ('2011-01-01', 'YYYY-MM-DD')
FROM DUAL;

-- TO_NUMBER
-- 문자를 숫자로 변환하는 간단한 예제
SELECT TO_NUMBER ('01210616') +100
FROM DUAL;


-- NULL 관련 함수
-- 매니저가 없는 값을 0으로 바꾸어서 출력하는 예제
SELECT last_name, nvl(manager_id, 0) 매니저
FROM employees
WHERE last_name = 'King';

SELECT last_name, nvl2(manager_id, 1, 0) 매니저
FROM employees
WHERE last_name = 'King';

--예제
SELECT last_name 이름, salary 월급, nvl(commission_pct, 0) 커미션, 
           salary*12+salary*12*nvl(commission_pct, 0) 연봉
FROM employees
ORDER BY 연봉 DESC;
--예제
SELECT last_name 이름, salary 월급, nvl(commission_pct, 0) 커미션, 
           salary*12+salary*12*nvl(commission_pct, 0) 연봉,
           nvl2(commission_pct, '월급+보너스' , '월급만') 연봉계산
FROM employees
ORDER BY 연봉 DESC;


-- DECODE 함수
SELECT last_name 이름, job_id, salary, 
        DECODE(JOB_ID, 'IT_PROG',  SALARY * 1.10,
                                'IT_CLERK', SALARY * 1.15,
                                'IT_REP',     SALARY * 1.20,
                                                SALARY) "수정월급"
FROM employees;

--예제
SELECT last_name 이름, job_id 직무, salary 월급,
            DECODE(TRUNC(SALARY/2000), 0 , 0.00,
                                                          1 , 0.09,
                                                          2 , 0.20,
                                                          3 , 0.30,
                                                          4 , 0.40,
                                                          5 , 0.42,
                                                          6 , 0.44,
                                                               0.45) 세율
FROM EMPLOYEES;


-- CASE 함수
SELECT last_name 이름, job_id, salary,
    CASE  WHEN salary<5000   THEN 'Low'
             WHEN salary<10000  THEN 'Medium'
             WHEN salary<20000  THEN 'Good'
             ELSE                                 'Excellent'  
    END "급여 수준"
FROM employees;

--예제
SELECT employee_id, first_name, last_name, salary,
    CASE WHEN SALARY>=9000 THEN '상위급여'
            WHEN SALARY>=6000 THEN '중위급여'
            ELSE                                    '하위급여'
    END "급여등급"
FROM employees
WHERE job_id = 'IT_PROG';

