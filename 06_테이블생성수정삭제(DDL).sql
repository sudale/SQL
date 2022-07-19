-- DDL 테이블 생성 수정 삭제
-- 테이블 생성하기
CREATE TABLE 테스트
(
  문자열 VARCHAR2 (100),
  숫자   NUMBER,
  날짜   DATE DEFAULT SYSDATE
);

INSERT INTO 테스트 VALUES ( '하나', 1, SYSDATE );
INSERT INTO 테스트 VALUES ( '둘', 2, SYSDATE );
INSERT INTO 테스트 VALUES ( '셋', 3, SYSDATE );
INSERT INTO 테스트 VALUES ( '넷', 4, SYSDATE );

SELECT * FROM 테스트;

-- 테이블 삭제하기
DROP TABLE TEST;
DROP TABLE 테스트;

--예제1
CREATE TABLE sample_proudct (
 product_id number,
 product_name varchar2 (20),
 menu_date date default sysdate
 );
 
drop table sample_proudct;

select* from sample_proudct;

-- 제약 조건
drop table emp;
create table emp (
         eno       number (3) constraint emp_eno_pk primary key,
         emp_name  varchar2 (20)
         );
        
create table emp (
         eno       number (3) ,
         emp_name  varchar2 (20),
         constraint emp_eno_pk primary key (eno)
         );
         
desc emp;
drop table emp cascade constraint;

-- not null은 널값 허용안함, unique 중복 허용 안함
drop table emp1;
create table emp1 (
        eno          number (3) constraint emp1_eno_pk primary key,
        emp_name  varchar2 (20) constraint emp1_ename_nn not null,
        email         varchar2 (30),
        constraint emp1_email_uk unique (email)
        );
        
desc emp1;

select * from emp1;
insert into emp1 values ( 100, '길동', 'kill@naver.com' );
insert into emp1 values ( 101, '펭수', 'peng@naver.com' );

-- check 제약 조건
CREATE TABLE emp (
        eno          NUMBER(3),
        emp_name  VARCHAR2(20),
        sal            number(10),
        CONSTRAINT emp_sal_check check (sal>1000)
        -- sal 열의 제약조건으로 1000보다 큰수여야 함.
);

insert into emp values ( 200, '길동', 1200 );
insert into emp values ( 201, '펭수', 800 );

drop table emp;

DROP TABLE emp;

CREATE TABLE emp(
    eno     NUMBER(4) PRIMARY KEY,
    ename  VARCHAR2(20) NOT NULL,
    password     VARCHAR2(13) UNIQUE CHECK (LENGTH(password) >= 8),
    gender VARCHAR2(6) CHECK (gender IN ('남성', '여성'))
);

insert into emp values ( 1000, '길동', '12345678', '남성' );
insert into emp values ( 1010, '길순', '123456789', '여성' );

select* from emp;

--예제
CREATE table members(
    member_id       number(2) primary key,
    first_name        varchar2(50) not null,
    last_name        varchar2(50) not null,
    gender           varchar2(5) check( gender in ('MAN', 'WOMAN') ),
    birth_day         date default sysdate,
    email             varchar2(200) unique not null
    );
    
DESC MEMBERS;

-- 기본키 외래키 만들기
-- 참조할 테이블 부서테이블 만들기
CREATE TABLE dept(
    dno NUMBER(4),
    dname VARCHAR2(20),
    CONSTRAINT dept_dno_pk PRIMARY KEY(dno)
);
INSERT INTO DEPT VALUES (1000, '개발부');

-- 부서테이블에 부서번호를 참조하는 외래키 DNO를 만들자
DROP TABLE EMP;
CREATE TABLE EMP (
        ENO          NUMBER(4),
        EMP_NAME VARCHAR2(20),
        SAL           NUMBER(10),
        DNO          NUMBER(4),
        FOREIGN KEY (DNO) REFERENCES DEPT (DNO)
        );
        
SELECT* FROM DEPT;
DELETE FROM DEPT;

INSERT INTO DEPT VALUES (10, '개발부');
INSERT INTO DEPT VALUES (20, '영업부');
INSERT INTO DEPT VALUES (30, '회계부');
INSERT INTO DEPT VALUES (40, '관리부');
INSERT INTO DEPT VALUES (50, '안전부');

INSERT INTO EMP VALUES (1010, '길동', 200, 10);
INSERT INTO EMP VALUES (1020, '길순', 180, 20);
INSERT INTO EMP VALUES (1030, '길촌', 220, 30);
INSERT INTO EMP VALUES (1040, '길수', 250, 40);
INSERT INTO EMP VALUES (1050, '사장', 300, 50);

SELECT* FROM EMP;

-- 제약 조건 조회
SELECT *
FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'EMP'; --테이블 명은 대문자!

-- 제약조건 추가
CREATE TABLE 수업 (
  CNO VARCHAR2(2) , 
  CNAME VARCHAR2(20) 
);
insert into 수업 values ('01', '데이터베이스');
insert into 수업 values ('02', '프로그래밍');
insert into 수업 values ('03', '자바');
select* from 수업;

create table 학생 (
    sno varchar2(4),
    sname varchar2(50),
    cno varchar2(2)
);
insert into 학생 values ('0414', '홍길동', '01');
insert into 학생 values ('0415', '임꺽정', '02');
insert into 학생 values ('0416', '이순신', '03');
select* from 학생;

-- 위에서만든 학생, 수업 테이블에 제약조건을 추가하자
-- 기본키 추가
alter table 수업
add constraint class_cno_pk primary key (cno);
alter table 학생
add constraint student_sno_pk primary key (cno);
-- 유니크 추가
alter table 수업
add constraint class_cname_uk unique (cname);
-- not null 수정 (modify)
alter table 학생
modify sname constraint student_sname_nn not null;
-- 외래키를 학생 테이블에 추가
alter table 학생
add constraint student_cno_fk foreign key (cno) references 수업(cno);

-- 제약조건 삭제하기
alter table 수업
drop primary key cascade; -- cascade는 삭제시 관계되는 제약조건을 같이 삭제
alter table 수업
drop unique (cname);
alter table 학생
drop primary key;
alter table 학생
drop constraint STUDENT_SNAME_NN;

drop table emp1;

-- create table 테이블이름 as select문
-- select문의 결과를 새로 만든 테이블에 저장
create table emp_tempt
as
select* from employees
where 1 <> 1; --항상거짓이므로 직원테이블의 열구조만 복사되어 저장됨

-- 원하는 열과 행만 복사하기
create table emp80
as
select employee_id 직원번호, last_name 이름, salary*12 연봉, hire_Date 고용일자
from employees
where department_id = 80;

--예제
drop table stmans;
create table stmans
as
select employee_id id, job_id job, salary sal
from employees
where job_id = 'ST_MAN';

select* from stmans;