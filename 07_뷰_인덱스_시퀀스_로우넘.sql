--�� view = ������ ���̺�
--�ܼ��� �� �����
create view EMP_V1 (������ȣ, �̸�, ��, �̸���, �����, ����)
as
select employee_id, first_name, last_name, email, hire_date,
job_id
from employees;

select *
from emp_v1;
--�信 ������ �Է½�, �����δ� �並 ���鶧 ����� ���̺� �Էµ�
--��� ���� ����� ���̺��� �ƴ�.
insert into EMP_V1
values (333, '���','��', 'peng', sysdate, 'IT_PROG');

SELECT *
from employees
where employee_id =333;

--������ �� �����
--�׷��Լ��� ����� ��� DML (�Է�, ����, ����) �Ұ�
--or replace ������ ������ �ض��� ��ɹ�
create or replace view �μ���_����_����
as
select department_id �μ���ȣ, count(*) ������,
round(avg(salary))��ձ޿�
from employees
group by department_id
order by department_id;
--�б⸸ ������ ��
--90�� �μ� �������� �б� ���� ��

create or replace view EMP90_read (������ȣ, �̸�, ��, �̸���,
�����, ����)
as 
select employee_id, first_name, last_name, 
email, hire_date,job_id
from employees
where department_id=90
with read only;

select *
from emp90_read;
--DML �۾� �ȵ�

--�ε��� ��ȸ�ϱ� (�⺻Ű ���� �ڵ����� �ε����� ������)
select*
from all_ind_columns
where table_name = 'DEPARTMENTS';--table �̸��� �빮��


--�ε��� �ǽ��� ���̺� �����
drop table members;
create table members(
member_id INT,
first_name varchar2(100) not null,
last_name varchar2(100) not null,
gender char(1) not null,
dob date not null,
email varchar2(255) not null,
primary key (member_id));

--��Ʈ �������� �˻�
explain plan for
select *
from members
where last_name = 'Harse';

--sql ���ຸ�� Ȯ��
select
plan_table_output
from table(DBMS_xplan.display());

--�ε��� �����
create index member_last_name_i
on members(last_name);
--�ε��� ��ȸ�ϱ�
select*
from all_ind_columns
where table_name = 'MEMBERS';
--�ε��� �����ϱ�
drop index member_last_name_i;

--��Ƽ �ε��� (��1, ��2,...) ���� ���� ���� �ε���
create index members_name_i
on members(last_name, first_name);

select*
from all_ind_columns
where table_name = 'MEMBERS';

--�˻��ϱ�
explain plan for
select * from members
where last_name LIKE'A%' AND first_name LIKE 'M%';
--sql ���ຸ�� Ȯ��
select
plan_table_output
from table(DBMS_XPLAN.DISPLAY());

-- ������
-- ������ �����
create SEQUENCE ������1;
drop sequence ������1;

-- ������ ���� Ȯ��
select* from user_sequences
where sequence_name = '������1';

-- ������ ���� (.nextval, .currval)
select ������1.nextval from dual;
select ������1.currval from dual;

create table ���� (
    emp_id number(6) primary key, 
    name varchar2(50) not null
);

-- �������� �̿��ؼ� ������ id�� �Է�
-- 100000 �����ϰ� 10�� �����ϴ� ������2 �����
create sequence ������2
start with 100000
increment by 10;
-- ���� ���̺� �Է��ϱ�
insert into ���� values (������2.nextval, '���');
insert into ���� values (������2.nextval, '�浿');
insert into ���� values (������2.nextval, '���');
insert into ���� values (������2.nextval, '����');
insert into ���� values (������2.nextval, '����');
select * from ����;

-- emp_id ������ȣ�� ������1�� ������Ʈ
update ����
set emp_id = ������1.nextval;

-- �ο�� ROWNUM
-- ������ ���°������ ��½�
SELECT rownum, emp.*
from emp
where rownum <=5;

-- �߰��� � �� 6~10�� (���������� ���� ������ RN���� �ű���� �ٱ��� 
--                               MAIN�������� RN�� �߰� ������ ���)
SELECT E.*
FROM (SELECT ROWNUM AS RN, EMP.* FROM EMP) E
WHERE RN BETWEEN 6 AND 10;

-- �������� ���� ������ ���� ��� top5
select * from emp order by sal desc;
-- ���������� ������ ���� �ϰ� rownum���� �����Ѵ�
SELECT ROWNUM, A.*
FROM (
    SELECT EMPNO, ENAME, SAL FROM EMP ORDER BY SAL DESC
) A
WHERE ROWNUM <= 5;