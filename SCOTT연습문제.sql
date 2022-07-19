--����1
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO = 10;

--����2
SELECT ENAME, hiredate, deptno
FROM EMP
WHERE EMPNO = 7369;

--����3
SELECT *
FROM EMP
WHERE ENAME = 'ALLEN';

--����4
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE hiredate = '81/02/20';

--����5
SELECT *
FROM EMP
WHERE NOT job = 'MANAGER';

--����6
SELECT *
FROM EMP
WHERE hiredate >= '81/04/02';

--����7
SELECT ename, SAL, DEPTNO
FROM EMP
WHERE sal >= 800;

--����8
SELECT *
FROM emp
WHERE deptno >= 20;

--����9
SELECT *
FROM emp
WHERE ename > 'L';

--����10
SELECT *
FROM EMP
WHERE hiredate < '81/12/09';

--����11
SELECT empno, ename
FROM EMP
WHERE EMPNO <= 7698;

--����12
SELECT ename, sal, deptno
FROM EMP
WHERE hiredate BETWEEN '81/04/02' AND '82/12/09';

--����13
SELECT ename, sal, job
FROM emp
WHERE sal > 1600 AND sal < 3000;

--����14
SELECT *
FROM EMP
WHERE empno NOT BETWEEN 7654 AND 7782;

--����15
SELECT *
FROM EMP
WHERE ename BETWEEN 'B' AND 'J';

--����16
SELECT *
FROM EMP
WHERE hiredate NOT BETWEEN '81/01/01' AND '81/12/31';

--����17
SELECT *
FROM EMP
WHERE JOB IN ('MANAGER','SALESMAN');

--����18
SELECT ENAME, empno, deptno
FROM EMP
WHERE DEPTNO NOT IN (20,30);

--����19
SELECT empno, ename, hiredate, deptno
FROM emp
WHERE ename LIKE 'S%';

--����20
SELECT *
FROM emp
WHERE hiredate BETWEEN '81/01/01' and '81/12/31';

--����21
SELECT *
FROM emp
WHERE ename like '%S%';

--����22
SELECT *
FROM EMP
WHERE ename like 'M%___N';

--����23
SELECT *
FROM EMP
WHERE ename LIKE '_A%';

--����24
SELECT *
FROM EMP
WHERE COMM IS NULL;

--����25
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

--����26
SELECT ename, deptno, sal
FROM EMP
WHERE deptno = 30 and sal >= 1500;

--����27
SELECT empno, ename, deptno
FROM emp
WHERE deptno = 30;

--����28
SELECT *
FROM emp
WHERE sal >= 1500 and deptno = 30 and job IN ('MANAGER');

--����29
SELECT *
FROM emp
WHERE deptno = 30
ORDER by empno;

--����30
SELECT *
FROM emp
ORDER BY sal DESC;

--����31
SELECT *
FROM emp
ORDER by deptno , sal desc;

--����32
SELECT deptno, ename, sal
FROM emp
ORDER by deptno desc, ename, sal desc;

--����33
SELECT ename, sal, round (sal*0.13, 0) bouns, deptno
FROM emp
WHERE deptno = 10;

--����34
SELECT ename, sal, nvl(comm, 0), sal+nvl(comm,0) total
FROM emp
ORDER BY total desc;

--����35
SELECT ename, sal, to_char ( round (sal*0.15, 1), '$999.9' ) ȸ��
FROM emp
WHERE sal BETWEEN 1500 and 3000;

--����36
SELECT d.DNAME, COUNT(E.EMPNO)
FROM EMP E
JOIN dept d
ON E.deptno = d.deptno
GROUP BY D.dNAME
HAVING COUNT(E.EMPNO) > 5;

--����37
SELECT JOB, SUM(SAL) �޿��հ�
FROM emp
WHERE JOB <> 'SALESMAN'
GROUP BY JOB
HAVING SUM(SAL) > 5000;

--����38
SELECT EMPNO, ENAME, SAL, GRADE
FROM emp
JOIN salgrade
ON SAL BETWEEN LOSAL AND HISAL;

--����39
SELECT DEPTNO, COUNT(EMPNO) �����, COUNT(COMM) "Ŀ�̼� ���� �����"
FROM emp
GROUP BY DEPTNO;

--����40
SELECT ENAME, DEPTNO,
        DECODE( DEPTNO, 10,  '�ѹ���',
                               20,   '���ߺ�',
                               30,   '������'
                                      ) "�μ���"
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
SELECT E.EMPNO ������ȣ, E.ENAME �̸�, E.JOB ����, E.HIREDATE �������, 
          E.SAL ����, D.DEPTNO �μ���ȣ
FROM EMP E
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;