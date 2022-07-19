-- DDL ���̺� ���� ���� ����
-- ���̺� �����ϱ�
CREATE TABLE �׽�Ʈ
(
  ���ڿ� VARCHAR2 (100),
  ����   NUMBER,
  ��¥   DATE DEFAULT SYSDATE
);

INSERT INTO �׽�Ʈ VALUES ( '�ϳ�', 1, SYSDATE );
INSERT INTO �׽�Ʈ VALUES ( '��', 2, SYSDATE );
INSERT INTO �׽�Ʈ VALUES ( '��', 3, SYSDATE );
INSERT INTO �׽�Ʈ VALUES ( '��', 4, SYSDATE );

SELECT * FROM �׽�Ʈ;

-- ���̺� �����ϱ�
DROP TABLE TEST;
DROP TABLE �׽�Ʈ;

--����1
CREATE TABLE sample_proudct (
 product_id number,
 product_name varchar2 (20),
 menu_date date default sysdate
 );
 
drop table sample_proudct;

select* from sample_proudct;

-- ���� ����
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

-- not null�� �ΰ� ������, unique �ߺ� ��� ����
drop table emp1;
create table emp1 (
        eno          number (3) constraint emp1_eno_pk primary key,
        emp_name  varchar2 (20) constraint emp1_ename_nn not null,
        email         varchar2 (30),
        constraint emp1_email_uk unique (email)
        );
        
desc emp1;

select * from emp1;
insert into emp1 values ( 100, '�浿', 'kill@naver.com' );
insert into emp1 values ( 101, '���', 'peng@naver.com' );

-- check ���� ����
CREATE TABLE emp (
        eno          NUMBER(3),
        emp_name  VARCHAR2(20),
        sal            number(10),
        CONSTRAINT emp_sal_check check (sal>1000)
        -- sal ���� ������������ 1000���� ū������ ��.
);

insert into emp values ( 200, '�浿', 1200 );
insert into emp values ( 201, '���', 800 );

drop table emp;

DROP TABLE emp;

CREATE TABLE emp(
    eno     NUMBER(4) PRIMARY KEY,
    ename  VARCHAR2(20) NOT NULL,
    password     VARCHAR2(13) UNIQUE CHECK (LENGTH(password) >= 8),
    gender VARCHAR2(6) CHECK (gender IN ('����', '����'))
);

insert into emp values ( 1000, '�浿', '12345678', '����' );
insert into emp values ( 1010, '���', '123456789', '����' );

select* from emp;

--����
CREATE table members(
    member_id       number(2) primary key,
    first_name        varchar2(50) not null,
    last_name        varchar2(50) not null,
    gender           varchar2(5) check( gender in ('MAN', 'WOMAN') ),
    birth_day         date default sysdate,
    email             varchar2(200) unique not null
    );
    
DESC MEMBERS;

-- �⺻Ű �ܷ�Ű �����
-- ������ ���̺� �μ����̺� �����
CREATE TABLE dept(
    dno NUMBER(4),
    dname VARCHAR2(20),
    CONSTRAINT dept_dno_pk PRIMARY KEY(dno)
);
INSERT INTO DEPT VALUES (1000, '���ߺ�');

-- �μ����̺� �μ���ȣ�� �����ϴ� �ܷ�Ű DNO�� ������
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

INSERT INTO DEPT VALUES (10, '���ߺ�');
INSERT INTO DEPT VALUES (20, '������');
INSERT INTO DEPT VALUES (30, 'ȸ���');
INSERT INTO DEPT VALUES (40, '������');
INSERT INTO DEPT VALUES (50, '������');

INSERT INTO EMP VALUES (1010, '�浿', 200, 10);
INSERT INTO EMP VALUES (1020, '���', 180, 20);
INSERT INTO EMP VALUES (1030, '����', 220, 30);
INSERT INTO EMP VALUES (1040, '���', 250, 40);
INSERT INTO EMP VALUES (1050, '����', 300, 50);

SELECT* FROM EMP;

-- ���� ���� ��ȸ
SELECT *
FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'EMP'; --���̺� ���� �빮��!

-- �������� �߰�
CREATE TABLE ���� (
  CNO VARCHAR2(2) , 
  CNAME VARCHAR2(20) 
);
insert into ���� values ('01', '�����ͺ��̽�');
insert into ���� values ('02', '���α׷���');
insert into ���� values ('03', '�ڹ�');
select* from ����;

create table �л� (
    sno varchar2(4),
    sname varchar2(50),
    cno varchar2(2)
);
insert into �л� values ('0414', 'ȫ�浿', '01');
insert into �л� values ('0415', '�Ӳ���', '02');
insert into �л� values ('0416', '�̼���', '03');
select* from �л�;

-- ���������� �л�, ���� ���̺� ���������� �߰�����
-- �⺻Ű �߰�
alter table ����
add constraint class_cno_pk primary key (cno);
alter table �л�
add constraint student_sno_pk primary key (cno);
-- ����ũ �߰�
alter table ����
add constraint class_cname_uk unique (cname);
-- not null ���� (modify)
alter table �л�
modify sname constraint student_sname_nn not null;
-- �ܷ�Ű�� �л� ���̺� �߰�
alter table �л�
add constraint student_cno_fk foreign key (cno) references ����(cno);

-- �������� �����ϱ�
alter table ����
drop primary key cascade; -- cascade�� ������ ����Ǵ� ���������� ���� ����
alter table ����
drop unique (cname);
alter table �л�
drop primary key;
alter table �л�
drop constraint STUDENT_SNAME_NN;

drop table emp1;

-- create table ���̺��̸� as select��
-- select���� ����� ���� ���� ���̺� ����
create table emp_tempt
as
select* from employees
where 1 <> 1; --�׻�����̹Ƿ� �������̺��� �������� ����Ǿ� �����

-- ���ϴ� ���� �ุ �����ϱ�
create table emp80
as
select employee_id ������ȣ, last_name �̸�, salary*12 ����, hire_Date �������
from employees
where department_id = 80;

--����
drop table stmans;
create table stmans
as
select employee_id id, job_id job, salary sal
from employees
where job_id = 'ST_MAN';

select* from stmans;