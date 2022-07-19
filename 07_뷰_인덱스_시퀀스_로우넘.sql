--뷰 view = 가상의 테이블
--단순한 뷰 만들기
create view EMP_V1 (직원번호, 이름, 성, 이메일, 고용일, 직종)
as
select employee_id, first_name, last_name, email, hire_date,
job_id
from employees;

select *
from emp_v1;
--뷰에 데이터 입력시, 실제로는 뷰를 만들때 사용한 테이블에 입력됨
--뷰는 실제 저장된 테이블이 아님.
insert into EMP_V1
values (333, '펭수','김', 'peng', sysdate, 'IT_PROG');

SELECT *
from employees
where employee_id =333;

--복잡한 뷰 만들기
--그룹함수를 사용한 뷰는 DML (입력, 삭제, 수정) 불가
--or replace 있으면 수정을 해라라는 명령문
create or replace view 부서별_직원_보고서
as
select department_id 부서번호, count(*) 직원수,
round(avg(salary))평균급여
from employees
group by department_id
order by department_id;
--읽기만 가능한 뷰
--90번 부서 직원들의 읽기 전용 뷰

create or replace view EMP90_read (직원번호, 이름, 성, 이메일,
고용일, 직종)
as 
select employee_id, first_name, last_name, 
email, hire_date,job_id
from employees
where department_id=90
with read only;

select *
from emp90_read;
--DML 작업 안됨

--인덱스 조회하기 (기본키 열은 자동으로 인덱스가 생성됨)
select*
from all_ind_columns
where table_name = 'DEPARTMENTS';--table 이름은 대문자


--인덱스 실습용 테이블 만들기
drop table members;
create table members(
member_id INT,
first_name varchar2(100) not null,
last_name varchar2(100) not null,
gender char(1) not null,
dob date not null,
email varchar2(255) not null,
primary key (member_id));

--라스트 네임으로 검색
explain plan for
select *
from members
where last_name = 'Harse';

--sql 실행보고서 확인
select
plan_table_output
from table(DBMS_xplan.display());

--인덱스 만들기
create index member_last_name_i
on members(last_name);
--인덱스 조회하기
select*
from all_ind_columns
where table_name = 'MEMBERS';
--인덱스 삭제하기
drop index member_last_name_i;

--멀티 인덱스 (열1, 열2,...) 여러 열을 같이 인덱스
create index members_name_i
on members(last_name, first_name);

select*
from all_ind_columns
where table_name = 'MEMBERS';

--검색하기
explain plan for
select * from members
where last_name LIKE'A%' AND first_name LIKE 'M%';
--sql 실행보고서 확인
select
plan_table_output
from table(DBMS_XPLAN.DISPLAY());

-- 시퀀스
-- 시퀀스 만들기
create SEQUENCE 시퀀스1;
drop sequence 시퀀스1;

-- 시퀀스 정보 확인
select* from user_sequences
where sequence_name = '시퀀스1';

-- 시퀀스 사용법 (.nextval, .currval)
select 시퀀스1.nextval from dual;
select 시퀀스1.currval from dual;

create table 직원 (
    emp_id number(6) primary key, 
    name varchar2(50) not null
);

-- 시퀀스를 이용해서 직원의 id를 입력
-- 100000 시작하고 10씩 증가하는 시퀀스2 만들기
create sequence 시퀀스2
start with 100000
increment by 10;
-- 직원 테이블에 입력하기
insert into 직원 values (시퀀스2.nextval, '펭수');
insert into 직원 values (시퀀스2.nextval, '길동');
insert into 직원 values (시퀀스2.nextval, '길수');
insert into 직원 values (시퀀스2.nextval, '펭현');
insert into 직원 values (시퀀스2.nextval, '펭펭');
select * from 직원;

-- emp_id 직원번호를 시퀀스1로 업데이트
update 직원
set emp_id = 시퀀스1.nextval;

-- 로우넘 ROWNUM
-- 위에서 몇번째까지만 출력시
SELECT rownum, emp.*
from emp
where rownum <=5;

-- 중간에 몇개 행 6~10번 (서브쿼리로 먼저 순서를 RN으로 매긴다음 바깥의 
--                               MAIN쿼리에서 RN의 중간 값들을 출력)
SELECT E.*
FROM (SELECT ROWNUM AS RN, EMP.* FROM EMP) E
WHERE RN BETWEEN 6 AND 10;

-- 직원들중 가장 월급이 많은 사람 top5
select * from emp order by sal desc;
-- 서브쿼리에 정렬을 먼저 하고 rownum으로 제한한다
SELECT ROWNUM, A.*
FROM (
    SELECT EMPNO, ENAME, SAL FROM EMP ORDER BY SAL DESC
) A
WHERE ROWNUM <= 5;