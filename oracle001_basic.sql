SELECT
    first_name
FROM
    employees;

-- 주석처리 하이픈 2개


-- 모든 컬럼의 데이터 출력

-- 도구 > 환경설정 > 코드편집기 > 글꼴 > 크기설정

-- ctrl + enter : 실행

-- SELECT : 테이블에 있는 컬럼의 데이터를 조회할 때 쓴다.

SELECT
    *
FROM
    employees;

-- 테이블 검색 (tab)

SELECT
    *
FROM
    tab;

-- SELECT 컬럼명
-- SELECT 컬럼명, 컬럼명 (컬럼 복수 선택) As 임의이름지정
-- FROM 테이블명

/*
컬럼명, 테이블명에 별칭(alias)을 지정할 수 있다.
별칭(alias)에 공백이 있을 때는 " "(쌍따옴표)를 지정한다.
*/
SELECT
    salary,
    salary * 10 AS bonus
FROM
    employees;

SELECT
    salary,
    salary * 10 AS 보너스
FROM
    employees;

SELECT
    salary,
    salary * 10 AS "b o n u s"
FROM
    employees;

-- SQL에서는 문자열을 더할 때 '+' 기호 대신 '||' 을 사용한다.
-- King님의 급여는 24000입니다.
SELECT
    last_name
    || '님의 급여는'
    || salary
    || '입니다.' AS name
FROM
    employees;

-- DISTINCT : 중복 제거를 한 후 출력해 주는 명령어이다.
SELECT DISTINCT
    first_name
FROM
    employees;

SELECT DISTINCT
    first_name,
    last_name
FROM
    employees;
/*
first_name      last_name
sunder          Abel
sunder          Abel
sunder          Ande
*/

/*
-- SELECT 입력 순서
SELECT column_name1, column_name2
FROM Lable_name
WHERE column_name-'value' (조건식)
GROUP BY column_name
HAVING column_name-'value'
ORDER BY column_name ASC, column_name DESC;

-- SELECT 해석 순서
FROM Lable_name
WHERE column_name-'value'
GROUP BY column_name
HAVING column_name-'value'
SELECT column_name1, column_name2
ORDER BY column_name ASC, column_name DESC;
*/

-- employees테이블에서 salary이 3000미만 일때의
-- first_name, salary를 출력하라.

SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary < 3000;

-- employees테이블에서 first_name컬럼의 값이 'David'일때의
-- first_name, salary를 출력하라.
-- WHERW절은 논리,조건절. ( '=' 은 대입이 아닌 '==' 의 뜻(같다)을 가짐) 
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    first_name = 'David';

-- employees테이블에서 first_name컬럼의 값이 'David'가 아닐때의
-- first_name, salary를 출력하라.
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    first_name != 'David';

SELECT
    first_name,
    salary
FROM
    employees
WHERE
    first_name <> 'David';
-- 위의 두 식 모두 같은 뜻이다.

-- &&(and), ||(or)
-- employees테이블에서 salary이 3000, 9000, 17000일 때
-- first_name, hire_date, salary를 출력하라.
SELECT
    first_name,
    hire_date,
    salary
FROM
    employees
WHERE
    salary = 3000
    OR salary = 9000
    OR salary = 17000;

SELECT
    first_name,
    hire_date,
    salary
FROM
    employees
WHERE
    salary IN ( 3000, 9000, 17000 );

-- employees테이블에서 salary이 3000부터 5000까지일 때
-- first_name, hire_date, salary를 출력하라.
SELECT
    first_name,
    hire_date,
    salary
FROM
    employees
WHERE
        salary >= 3000
    AND salary <= 5000;

SELECT
    first_name,
    hire_date,
    salary
FROM
    employees
WHERE
    salary BETWEEN 3000 AND 5000;

-- employees테이블에서 job_id가 'IT_PROG'이 아닐때
-- first_name, email, job_id를 출력하라.
SELECT
    first_name,
    email,
    job_id
FROM
    employees
WHERE
    job_id != 'IT_PROG';

SELECT
    first_name,
    email,
    job_id
FROM
    employees
WHERE
    job_id <> 'IT_PROG';

SELECT
    first_name,
    email,
    job_id
FROM
    employees
WHERE
    job_id^= 'IT_PROG';

SELECT
    first_name,
    email,
    job_id
FROM
    employees
WHERE
    NOT ( job_id = 'IT_PROG' );

-- employees테이블에서 salary이 3000, 9000, 17000아닐때의
-- first_name, hire_date, salary를 출력하라.
SELECT
    first_name,
    hire_date,
    salary
FROM
    employees
WHERE
    NOT ( salary = 3000
          OR salary = 9000
          OR salary = 17000 );

SELECT
    first_name,
    hire_date,
    salary
FROM
    employees
WHERE
    salary NOT IN ( 3000, 9000, 17000 );
    
-- employees테이블에서 salary이 3000부터 5000까지 아닐때의
-- first_name, hire_date, salary를 출력하라.
SELECT
    first_name,
    hire_date,
    salary
FROM
    employees
WHERE
    NOT ( salary >= 3000
          AND salary <= 5000 );

SELECT
    first_name,
    hire_date,
    salary
FROM
    employees
WHERE
    salary NOT BETWEEN 3000 AND 5000;
    
-- employees테이블에서 commission_pct이 null일 때
-- first_name, salary, commission_pct를 출력하라.
SELECT
    first_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NULL;

-- employees테이블에서 commission_pct이 null이 아닐때
-- first_name, salary, commission_pct를 출력하라.
SELECT
    first_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NOT NULL;

-- employees테이블에서 first_name에 'der'이 포함이 된다면
-- first_name, salary, email을 출력하라.
-- %der% = .*der.*
SELECT
    first_name,
    salary,
    email
FROM
    employees
WHERE
    first_name LIKE '%der%';
-- '%'는 모든 문자를 지정
    
-- employees테이블에서 first_name의 값 중 'A'로 시작하고
-- 두번째 문자는 임의 문자이면 'exander'로 끝나는
-- first name, salary, email을 출력하라.
SELECT
    first_name,
    salary,
    email
FROM
    employees
WHERE
    first_name LIKE 'A_exander';
-- '_'는 한 글자만 임의의 문자로 지정

/*
WHERE절에서 사용된 연산자 3가지 종류
1. 비교연산자 : =, >, >=, <, <=, !=, <>, ^=
2. SQL연산자 : BETWEEN a AND b, IN, LIKE, IS NULL
3. 논리연산자 : AND, OR, NOT
우선순위
괄호() > NOT연산자 > 비교연산자, SQL연산자 > AND > OR
*/

-- employees테이블에서 job_id를 오름차순으로
-- first_name, email, job_id를 출력하시오.
SELECT first_name, email, job_id
FROM employees
ORDER BY job_id ASC;

SELECT first_name, email, job_id
FROM employees
ORDER BY job_id;

-- employees테이블에서 department_id를 오름차순하고
-- first_name을 내림차순으로
-- department_id, first_name, salary를 출력하시오.
SELECT department_id, first_name, salary
FROM employees
ORDER BY department_id ASC, first_name DESC;

-- employees테이블에서 가장 최근 입사 순으로
-- 사원의 first_name, salary, hire_date를 출력하시오.
SELECT first_name, salary, hire_date
FROM employees
ORDER BY hire_date DESC;

-- employees테이블에서 업무(job_id)가 'FI_ACCOUNT'인 사원들의
-- 급여(salary)가 높은 순으로 first_name, job_id, salary를 출략하시오.
SELECT first_name, job_id, salary
FROM employees
WHERE job_id = 'FI_ACCOUNT'
ORDER BY salary DESC;


/*=========================================
집합연산자(Set Operations)
===========================================*/

-둘 이상의 query결과를 하나의 결과로 조합한다.
-select의 인자 갯수가 같아야 한다.
  첫번째 select가 2개이면 두번째 select도 2개여야 한다.
-타입이 일치해야 한다.  
 예를 들어 character이면 character이여야 한다.

집합연산자 종류
union(합집합)- 중복행이 제거된 두 query
union all(합집합)-중복행이 포함된 두 query행
intersect(교집합)-두 query에 공통적인 행
minus(차집합)-첫번째 query에 있는 행 중 두번째 query에 없는 행표시

집합연산자 사용이유
-서로 다른 테이블에서 유사한 형태의 결과를 반환하기 위해서
-서로 같은 테이블에서 서로 다른 질의를 수행하여 결과를 합치기 위해서
 
--================================================================== 

-- union(합집합)
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id = 20 OR department_id = 40
UNION
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id = 20 OR department_id = 60;

-- union all(합집합)
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id = 20 OR department_id = 40
UNION ALL
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id = 20 OR department_id = 60;

-- intersect(교집합)
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id = 20 OR department_id = 40
INTERSECT
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id = 20 OR department_id = 60;

-- minus(=except)(차집합)
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id = 20 OR department_id = 40
MINUS
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id = 20 OR department_id = 60;