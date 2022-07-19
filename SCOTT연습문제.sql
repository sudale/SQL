--문제1
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO = 10;

--문제2
SELECT ENAME, hiredate, deptno
FROM EMP
WHERE EMPNO = 7369;

--문제3
SELECT *
FROM EMP
WHERE ENAME = 'ALLEN';

--문제4
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE hiredate = '81/02/20';

--문제5
SELECT *
FROM EMP
WHERE NOT job = 'MANAGER';

--문제6
SELECT *
FROM EMP
WHERE hiredate >= '81/04/02';

--문제7
SELECT ename, SAL, DEPTNO
FROM EMP
WHERE sal >= 800;

--문제8
SELECT *
FROM emp
WHERE deptno >= 20;

--문제9
SELECT *
FROM emp
WHERE ename > 'L';

--문제10
SELECT *
FROM EMP
WHERE hiredate < '81/12/09';

--문제11
SELECT empno, ename
FROM EMP
WHERE EMPNO <= 7698;

--문제12
SELECT ename, sal, deptno
FROM EMP
WHERE hiredate BETWEEN '81/04/02' AND '82/12/09';

--문제13
SELECT ename, sal, job
FROM emp
WHERE sal > 1600 AND sal < 3000;

--문제14
SELECT *
FROM EMP
WHERE empno NOT BETWEEN 7654 AND 7782;

--문제15
SELECT *
FROM EMP
WHERE ename BETWEEN 'B' AND 'J';

--문제16
SELECT *
FROM EMP
WHERE hiredate NOT BETWEEN '81/01/01' AND '81/12/31';

--문제17
SELECT *
FROM EMP
WHERE JOB IN ('MANAGER','SALESMAN');

--문제18
SELECT ENAME, empno, deptno
FROM EMP
WHERE DEPTNO NOT IN (20,30);

--문제19
SELECT empno, ename, hiredate, deptno
FROM emp
WHERE ename LIKE 'S%';

--문제20
SELECT *
FROM emp
WHERE hiredate BETWEEN '81/01/01' and '81/12/31';

--문제21
SELECT *
FROM emp
WHERE ename like '%S%';

--문제22
SELECT *
FROM EMP
WHERE ename like 'M%___N';

--문제23
SELECT *
FROM EMP
WHERE ename LIKE '_A%';

--문제24
SELECT *
FROM EMP
WHERE COMM IS NULL;

--문제25
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

--문제26
SELECT ename, deptno, sal
FROM EMP
WHERE deptno = 30 and sal >= 1500;

--문제27
SELECT empno, ename, deptno
FROM emp
WHERE deptno = 30;

--문제28
SELECT *
FROM emp
WHERE sal >= 1500 and deptno = 30 and job IN ('MANAGER');

--문제29
SELECT *
FROM emp
WHERE deptno = 30
ORDER by empno;

--문제30
SELECT *
FROM emp
ORDER BY sal DESC;

--문제31
SELECT *
FROM emp
ORDER by deptno , sal desc;

--문제32
SELECT deptno, ename, sal
FROM emp
ORDER by deptno desc, ename, sal desc;

--문제33
SELECT ename, sal, round (sal*0.13, 0) bouns, deptno
FROM emp
WHERE deptno = 10;

--문제34
SELECT ename, sal, nvl(comm, 0), sal+nvl(comm,0) total
FROM emp
ORDER BY total desc;

--문제35
SELECT ename, sal, to_char ( round (sal*0.15, 1), '$999.9' ) 회비
FROM emp
WHERE sal BETWEEN 1500 and 3000;

--문제36
SELECT d.DNAME, COUNT(E.EMPNO)
FROM EMP E
JOIN dept d
ON E.deptno = d.deptno
GROUP BY D.dNAME
HAVING COUNT(E.EMPNO) > 5;

--문제37
SELECT JOB, SUM(SAL) 급여합계
FROM emp
WHERE JOB <> 'SALESMAN'
GROUP BY JOB
HAVING SUM(SAL) > 5000;

--문제38
SELECT EMPNO, ENAME, SAL, GRADE
FROM emp
JOIN salgrade
ON SAL BETWEEN LOSAL AND HISAL;

--문제39
SELECT DEPTNO, COUNT(EMPNO) 사원수, COUNT(COMM) "커미션 받은 사원수"
FROM emp
GROUP BY DEPTNO;

--문제40
SELECT ENAME, DEPTNO,
        DECODE( DEPTNO, 10,  '총무부',
                               20,   '개발부',
                               30,   '영업부'
                                      ) "부서명"
FROM emp;






select*
from emp
where hiredate >= '1981/06/01';



select*
from emp 
join salgrade 
on sal BETWEEN losal and hisal
where grade = 3 and deptno = 30;

CREATE TABLE EMP_DDL (
    EMPNO    NUMBER(4),
    ENAME    VARCHAR2(10),
    JOB        VARCHAR2(9),
    MGR        NUMBER(4),
    HIREDATE  DATE DEFAULT SYSDATE,
    SAL         NUMBER(7,2),
    COMM     NUMBER(7,2),
    DEPTNO   NUMBER(2)
);

DROP TABLE EMP_DDL;
DESC EMP_DDL;
    SAL         TO_CHAR(;
    
    
CREATE OR REPLACE VIEW EMP_V3
AS
SELECT E.EMPNO 직원번호, E.ENAME 이름, E.JOB 직업, E.HIREDATE 고용일자, 
          E.SAL 월급, D.DEPTNO 부서번호
FROM EMP E
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;