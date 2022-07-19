-- ������ �Է��ϱ� INSERT

-- HR�������� �μ����̺� ���ο� �μ���ȣ 300, �μ��̸� 'Game'���� ���ο� �μ�����
insert into departments ( department_id, department_name, manager_id, location_id)
values ( 300, 'game', 100, 1700 );

SELECT * from departments;

desc departments;

-- �� �Է��ؾ��ϴ� ���� �Է� (�Է¾��� ���� �ΰ�)
insert into departments ( department_id, department_name)
values ( 280, 'music' );

SELECT * from departments;

-- ��翭�� ���� �� �������� ���̺��̸� ���� ��ȣ���� ����
INSERT INTO employees
values  (208, '���', '��','PENG', '010.123.1234', SYSDATE, 'IT_PROG', 9999, NULL, 205, 300);

SELECT * from employees WHERE EMPLOYEE_ID = 208;

--����
INSERT INTO departments
VALUES ( 217 , 'Sample Dept 1', 200, 1700);
INSERT INTO departments
VALUES ( 218 , 'Sample Dept 2', 200, 1700);
INSERT INTO departments
VALUES ( 219 , 'Sample Dept 3', 200, 1700);

select * from departments where department_id BETWEEN 217 and 219;

-- �������� ����
-- update
update departments
set manager_id = 200, location_id = 1700
where department_name = 'music';

select * from departments;

--����
update departments
set manager_id = 100
where department_id BETWEEN 150 and 200;

select * from departments where manager_id = 100;

-- �������� ����
-- delete
delete from departments
where department_name = 'music';

-- �ܷ�Ű ���� ���� ( ��� ������ ���� �μ��̱� ���������Ӻμ��� ������ ����� �μ��� �������Ƿ� ����x)
delete from departments
where department_name = 'Game';

delete from employees
where first_name = '���';

delete from departments
where department_id in ( select department_id from departments where department_name like '%Dept%');

select * from employees;

update employees
set salary = 100;

-- ���� Ŀ�Ի��·� �ǵ��ư�
ROLLBACK;
-- ��������
COMMIT;


-- ������ ������ Ÿ�� VARCHAR2
desc TEST;
INSERT INTO TEST VALUES ( 1, 'abcdefghij1234567890' );
--INSERT INTO TEST VALUES ( 2, 'abcdefghij12345678901' );
-- �ѱ� �����ڵ�� ����Ŭ���� 3����Ʈ, ��� ���ڴ� 1����Ʈ
INSERT INTO TEST VALUES ( 2, '�����ٶ󸶹�' );

INSERT INTO TEST VALUES ( 4, '���糯¥�Է�', SYSDATE );

INSERT INTO TEST VALUES ( 5, '���糯¥�Է�', '22/03/07' );

INSERT INTO TEST(ID, NAME)  VALUES ( 6, '���糯¥�Է�' );
SELECT * FROM TEST;

DELETE FROM TEST WHERE ID = 123456.123456;
DELETE FROM TEST;



-- ������ ������ Ÿ�� NUMBER
