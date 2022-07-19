-- 데이터 입력하기 INSERT

-- HR계정에서 부서테이블에 새로운 부서번호 300, 부서이름 'Game'으로 새로운 부서생성
insert into departments ( department_id, department_name, manager_id, location_id)
values ( 300, 'game', 100, 1700 );

SELECT * from departments;

desc departments;

-- 꼭 입력해야하는 열만 입력 (입력안한 열은 널값)
insert into departments ( department_id, department_name)
values ( 280, 'music' );

SELECT * from departments;

-- 모든열의 값을 다 넣을때는 테이블이름 다음 괄호생략 가능
INSERT INTO employees
values  (208, '펭수', '김','PENG', '010.123.1234', SYSDATE, 'IT_PROG', 9999, NULL, 205, 300);

SELECT * from employees WHERE EMPLOYEE_ID = 208;

--예제
INSERT INTO departments
VALUES ( 217 , 'Sample Dept 1', 200, 1700);
INSERT INTO departments
VALUES ( 218 , 'Sample Dept 2', 200, 1700);
INSERT INTO departments
VALUES ( 219 , 'Sample Dept 3', 200, 1700);

select * from departments where department_id BETWEEN 217 and 219;

-- 데이터의 수정
-- update
update departments
set manager_id = 200, location_id = 1700
where department_name = 'music';

select * from departments;

--예제
update departments
set manager_id = 100
where department_id BETWEEN 150 and 200;

select * from departments where manager_id = 100;

-- 데이터의 삭제
-- delete
delete from departments
where department_name = 'music';

-- 외래키 삭제 에러 ( 펭수 직원이 게임 부서이기 때문에게임부서를 삭제시 펭수의 부서가 없어지므로 삭제x)
delete from departments
where department_name = 'Game';

delete from employees
where first_name = '펭수';

delete from departments
where department_id in ( select department_id from departments where department_name like '%Dept%');

select * from employees;

update employees
set salary = 100;

-- 그전 커밋상태로 되돌아감
ROLLBACK;
-- 영구저장
COMMIT;


-- 문자형 데이터 타입 VARCHAR2
desc TEST;
INSERT INTO TEST VALUES ( 1, 'abcdefghij1234567890' );
--INSERT INTO TEST VALUES ( 2, 'abcdefghij12345678901' );
-- 한글 유니코드는 오라클에서 3바이트, 영어나 숫자는 1바이트
INSERT INTO TEST VALUES ( 2, '가나다라마바' );

INSERT INTO TEST VALUES ( 4, '현재날짜입력', SYSDATE );

INSERT INTO TEST VALUES ( 5, '현재날짜입력', '22/03/07' );

INSERT INTO TEST(ID, NAME)  VALUES ( 6, '현재날짜입력' );
SELECT * FROM TEST;

DELETE FROM TEST WHERE ID = 123456.123456;
DELETE FROM TEST;



-- 숫자형 데이터 타입 NUMBER
