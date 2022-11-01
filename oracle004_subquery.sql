/*--------------------------------------------------
서브쿼리
1. 스칼라 쿼리 : SELECT절에서 사용
2. 인라인 뷰 : FROM절에서 사용 ( ORDER BY 사용 가능)
3. 서브쿼리 : WHERE절에서 사용. 동등연산자(=) 사용 시 결과값이 한 개여야 한다.
--------------------------------------------------*/

-- 90번 부서에 근무하는 Lex사원의 근무하는 부서명을 출력하시오.
SELECT department_name
FROM departments
WHERE department_id = 90;

-- 'Lex'가 근무하는 부서명을 출력하시오.
SELECT department_id
FROM employees
WHERE first_name = 'Lex';

SELECT department_name
FROM departments
WHERE department_id = 90;


SELECT d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.first_name = 'Lex';

SELECT department_name
FROM departments
WHERE department_id = ( 
                        SELECT DISTINCT department_id
                        FROM employees
                        WHERE first_name = 'Lex'
                       );

-- 'Lex'와 동일한 업무(job_id)를 가진 사원의 이름(first_name), 업무명(job_title), 입사일(hire_date)를 출력하시오.
SELECT e.first_name, j.job_title, e.hire_date
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND e.job_id = (
                SELECT job_id
                FROM employees
                WHERE first_name = 'Lex');

-- 'IT'에 근무하는 사원이름(first_name), 부서번호를 출력하시오.
SELECT first_name, department_id
FROM employees
WHERE department_id = (
                        SELECT department_id
                        FROM departments
                        WHERE department_name = 'IT'
                        );

-- 'Bruce'보다 급여를 많이 받은 사원이름(first_name), 부서명, 급여를 출력하시오.
SELECT e.first_name, d.department_id, e.salary
FROM employees e, departments d
WHERE e.department_id = d.department_id 
AND salary > (
                SELECT salary
                FROM employees
                WHERE first_name = 'Bruce'
                )
ORDER BY e.salary;

-- Steven과 같은 부서에서 근무하는 사원의 이름, 급여, 입사일을 출력하시오.(in)
SELECT e.first_name, e.salary, e.hire_date
FROM employees e
WHERE department_id IN (
                        SELECT department_id
                        FROM employees
                        WHERE first_name = 'Steven'
                        );

-- 부서별로 가장 급여를 많이 받는 사원이름, 부서번호, 급여를 출력하시오.(in)
-- main쿼리에서 컬럼이 2개라면 sub쿼리에서도 2개의 컬럼이여야 하고, 서브쿼리에서는 정렬을 사용할 수 없다.
SELECT e.first_name, e.department_id, e.salary
FROM employees e
WHERE (e.department_id, e.salary) IN (
                                      SELECT department_id, max(salary)
                                      FROM employees
                                      GROUP BY department_id
                                      )
ORDER BY e.department_id;

-- 30부서의 모든 사원들의 급여보다 더 많은 급여를 받는 사원이름, 급여, 입사일을 출력하시오.(all)
-- (서브쿼리에서 max()함수를 사용하지 않는다)
SELECT first_name, salary, hire_date
FROM employees
WHERE salary > ALL (
                    SELECT salary 
                    FROM employees
                    WHERE department_id = 30 -- 11000
                    );

-- 30부서 사원들이 받은 최저급여보다 높은 급여를 받는 사원이름, 급여, 입사일을 출력하시오.(any)
-- (서브쿼리에서 min()함수를 사용하지 않는다.)
SELECT salary
FROM employees
WHERE department_id = 30; -- 2500

SELECT first_name, salary, hire_date
FROM employees
WHERE salary > any (
                    SELECT salary
                    FROM employees
                    WHERE department_id = 30
                    )
ORDER BY salary;

-- 20부서에 사원이 있으면 사원들의 사원명, 입사일, 급여, 부서번호를 출력하시오
-- EXISTS : 값이 존재하면 무조건 true이다.
SELECT first_name, hire_date, salary, department_id
FROM employees
WHERE EXISTS (
              SELECT department_id
              FROM employees
              WHERE department_id = 20
              )
ORDER BY department_id;

-- 사원이 있는 부서만 출력하시오.
SELECT count(*)
FROM departments; /* 총 부서 : 27개 */

SELECT department_id, department_name
FROM departments
WHERE department_id IN (
                        SELECT DISTINCT department_id -- DISTINCT 중복제거
                        FROM employees
                        WHERE department_id IS NOT NULL -- 11
                        -- GROUP BY department_id
                        );

-- EXISTS는 WHERE(조건절)절이 참이기만 하면 수행을 하기 때문에 
-- 서브쿼리의 SELECT절에 아무거나 들어가도 상관은 없지만 형식을 위해 작성을 해준다.
-- 상관관계쿼리 : 메인쿼리의 컬럼을 서브쿼리의 컬럼에서 참조할 때(반대는 안된다.)
SELECT department_id, department_name
FROM departments d
WHERE EXISTS (
              SELECT 1
              FROM employees e
              WHERE e.department_id = d.department_id
              );

-- 사원이 없는 부서만 출력하시오.
SELECT department_id, department_name
FROM departments d
WHERE NOT EXISTS (
              SELECT 1
              FROM employees e
              WHERE e.department_id = d.department_id
              );

-- 부서가 있는 사원의 정보를 출력하시오.
SELECT e.employee_id, e.first_name, e.department_id
FROM employees e
WHERE EXISTS (
              SELECT 1
              FROM departments d
              WHERE e.department_id = d.department_id
              );

-- 부서가 없는 사원의 정보를 출력하시오.
SELECT e.employee_id, e.first_name, e.department_id
FROM employees e
WHERE NOT EXISTS (
              SELECT 1
              FROM departments d
              WHERE e.department_id = d.department_id
              );

-- 관리자가 있는 사원의 정보를 출력하시오.
SELECT count(*)
FROM employees
WHERE manager_id IS NOT NULL;

SELECT w.employee_id, w.first_name, w.manager_id
FROM employees w
WHERE EXISTS (
              SELECT 1
              FROM employees m
              WHERE w.manager_id = m.manager_id
              );

-- 관리자가 없는 사원의 정보를 출력하시오.
SELECT count(*)
FROM employees
WHERE manager_id IS NULL;

SELECT w.employee_id, w.first_name, w.manager_id
FROM employees w
WHERE NOT EXISTS (
              SELECT 1
              FROM employees m
              WHERE w.manager_id = m.manager_id
              );

/*--------------------------------------------------
TOP-N 서브쿼리
- 상위의 값을 추출할 때 사용한다.
- <, <= 연산자를 사용할 수 있다. 단 비교되는 값이 1일때는 =도 가능하다.
- ORDER BY절을 사용할 수 있다.
--------------------------------------------------*/

-- 급여가 가장 높은 상위 3명을 검색하시오.
SELECT rownum, emp.first_name, emp.salary
FROM (
      SELECT first_name, salary
      FROM employees
      ORDER BY salary DESC
      ) emp -- 가상의 테이블명 대입
WHERE rownum <= 3; /* rownum은 SELCE의 출력순서이다.(가상컬럼) */

-- 급여가 가장 높은 상위 4위부터 8위까지 검색하시오.
SELECT emp2.*
FROM (
      SELECT rownum AS rm, emp.*
      FROM (
            SELECT first_name, salary
            FROM employees
            ORDER BY salary DESC
            ) emp
      )emp2
WHERE emp2.rm >= 4 AND emp2.rm <= 8;

SELECT rownum AS rm, emp.*
FROM (
      SELECT first_name, salary
      FROM employees
      ORDER BY salary DESC
      ) emp;

SELECT rownum, first_name, salary
      FROM employees
      WHERE rownum <= 20
      ORDER BY salary DESC;

-- 월 별 입사자 수를 조회하되 입사자수가 가장 많은 상위 3개만 출력되도록 하시오.
-- <출력 : 월      입사자수 >
SELECT *
FROM (
     SELECT to_char(hire_date, 'mm') AS 월, count(*) AS 입사자수
     FROM employees
     GROUP BY to_char(hire_date, 'mm')
     ORDER BY 입사자수 DESC
     )
WHERE rownum <= 3;
