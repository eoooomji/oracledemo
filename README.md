# ORACLE

## 기본 처리 방식

### SELECT

- 기본적으로 식을 만들 때는 대문자를 이용한다.

- SELECT : 테이블에 있는 컬럼의 데이터를 조회할 때 쓴다.

                 - ORACLE 기본 식 처리
                 
                 - SELECT 컬럼명
                   SELECT 컬럼명, 컬럼명 (컬럼 복수 선택) AS(alias) 임의이름지정
                   (컬럼명, 테이블명에 별칭(alias)를 지정할 수 있다. 별칭(alias)에 공백이 있을 때는 " "(쌍따옴표)를 지정한다.)
                   FROM 테이블명
                 - SQL에서는 문자열을 더할 때 기호'+' 대신 '||'을 사용한다.
                 - DISTINCT : 중복 제거를 한 후 출력해 주는 명령어
                 - * : 전체
                 - tab : 테이블 검색
                 
                 - SELECT 입력 순서
                   SELECT column_name1, column_name2
                   FROM Label_name
                   WHERE comlum_name-'value' (조건식)
                   GROUP BU column_name
                   HAVING column_name-'value' (그룹 화된 컬럼 조건식)
                   ORDER BY column_name ASC(오름차순), column_name DESC(내림차순);
                 
                 - SELECT 해석 순서
                   FROM Lable_name
                   WHERE column_name-'value'
                   GROUP BY coumn_name
                   HAVING column_name-'value'
                   SELECT column_name1, column_name2
                   ORDER BY column_name ASC, column_name DESC;
                  
---
                   
### WHERE : SELECT의 컬럼에 조건식을 부여한다.

                 1. 비교 연산자 : =, >, >=, <, <=, !=, <>, ^=
                 2. SQL연산자 : BETWEEN a AND b, IN, LIKE, IS NULL
                 3. 논리연산자 : AND, OR, NOT
                 
                 - AND(&&), OR(||)
                 - java의 '=='은 oracle에서는 '='로 대입이 아닌 '같다'의 뜻을 가진다.
                 - !=, <>, ^=, NOT : 같은 의미로 쓰인다.(부정)
                 - AND, BETWEEN a AND b : 같은 의미로 쓰인다.(그리고 &&)
                 - OR, a IN (1, 2, 3) : 같은 의미로 쓰인다.(또는 ||)
                 - IS NULL : 값이 null일 때 사용한다.
                 - % : 모든 문자를 지정. (%der% = .*der.*)
                 - NOT : 부정을 뜻한다.
                 
---

### 집합연산자

- 둘 이상의 query결과를 하나의 결과로 조합한다.
  
- SELECT의 인자 갯수가 같아야 한다.(첫번째 SELECT가 2개이면 두번째 SELECT도 2개여야 한다.)
  
- 타입이 일치해야 한다.(예를들어 character이면 character이여야 한다)

- 사용 이유
  : 서로 다른 테이블에서 유사한 형태의 결과를 반환하기 위해서
  
  : 서로 같은 테이블에서 서로 다른 질의를 수행하여 결과를 합치기 위해서
                  
                 - 종류
                   (1) UNION(합집합) - 중복행이 제거된 두 query
                   (2) UNION ALL(합집합) - 중복행이 포함된 두 query행
                   (3) INTERSECT(교집합) - 두 query에 공통적인 행
                   (4) MINUS(차집합) - 첫번째 query에 있는 행 중 두번째 query에 없는 행 표시
                
 ---
 
 ### SQL(Structured query language)함수 - 1
 
 1. 단일행함수 : 행 하나당 하나의 결과를 출력한다.(문자함수, 숫자함수, 날짜함수, 변환함수, 일반함수)
 
 2. 복수행함수 : 행 여러개당 하나의 결과를 출력한다.(합계, 평균, 최대, 최소, 갯수)
 
 - SELECT문에서는 반드시 테이블명을 명시해야 한다.
 
 - 그래서 SELECT절에 식이나 특정함수를 이용해서 결과값을 가져올 때 사용할 수 있는 DUAL이라는 테이블을 제공하고 있다.
 
 - FROM절(테이블)은 항상 존재해야 한다.
 
                  1) 문자함수
                    - initcap() : 단어의 첫 글자만 대문자로 변경해주는 함수
                    - upper() : 모든 문자를 대문자로 변경해주는 함수
                    - lower() : 모든 문자를 소문자로 변경해주는 함수
                    - length() : 문자의 길이를 리턴해주는 함수
                    
                  2) 테이블 생성 및 이름 주기
                    : 테이블을 생성할 때 영어만 입력해야 한다.
                      - CREATE TABLE a()
                  
                  3) 컬럼 생성 및 삽입
                    - INSERT INTO a()
                      VALUES();
                  
                  4) 특정 범위의 문자를 추출해 주는 함수
                    : 오라클에서 인덱스의 시작은 1부터이다.(0이 아님)
                      - substr('문자', 시작위치, 갯수)
                      - instr('문자', '추출할 문자') : 특정문자의 인덱스를 추출해주는 함수
                      - lpad(left padding), rpad(right padding) : 주어진 문자열에서 왼쪽, 오른쪽으로 특정문자를 채우는 함수
                      - ltrim(left trim), rtrim(right trim) : 주어진 문자열에서 왼쪽, 오른쪽의 특정문자를 삭제하는 함수
                      - trim('특정문자' from '문장') : 주어진 문자열에서 양쪽 특정문자를 삭제하는 함수
                  
                  5) 아스키 코드값을 구하는 함수
                    - ascii('문자') : 주어진 문자의 아스키 코드값을 구하는 함수
                    - chr(숫자) : 주어진 아스키 코드값의 문자를 구하는 함수
                    - concat() : 주어진 문자를 연결하는 함수
                    
                  6) 숫자함수
                    - round(특정숫자, 숫자) : 특정숫자를 두번째 인자값에 준 숫자까지 반올림하는 함수
                    - ceil(숫자) : 무조건 올림하는 함수
                    - floor(숫자) : 소수점 아래는 무조건 버리는 함수
                    - power() : 거듭제곱 함수
                    - sqrt() : 제곱근을 구하는 함수
                    - mod() : 나머지를 구하는 함수
                  
                  7) 변환형 함수
                        숫자               문자               날짜
                     to_number( )   <->  to_char( )   <->  to_date( )
                     
                     - sysdate : 현재 날짜를 기준으로 작성한다.
                     - (sysdate, 'yyyy-mm-dd hh:mi:ss day')
                     - hh:12시간, hh24:24시간 / day:월요일, dy:월

---

### SQL함수 - 2

- 일반함수(NULL)
                   1) nvl(컬럼, 대체값) 
                     : 첫번째 인자값이 null이면 0으로 대체해서 출력한다.
                       - 대체할 값이 숫자이면 두번째 인자값에 숫자를 지정한다.
                       - 대체할 값이 문자이면 두번째 인자값에 문자를 지정한다.
                       - 대체할 값이 날짜이면 두번째 인자값에 날짜를 지정한다.
                     
                   2) nvl2(컬럼, 대체값1, 대체값2) 
                     : 컬럼의 값이 null이 아니면 대체값1, null이면 대체값2로 출력한다.
                   
                   3) NULLIF(컬럼, 비교값) 
                     : 컬럼값과 비교값이 같으면 null로 리턴하고 같지 않으면 컬럼의 값으로 리턴한다.
                   
                   4) coalesce(컬럼1, 컬럼2)
                     - 컬럼1, 컬럼2 모두 null이 아니면 컬럼1을 리턴한다.
                     - 컬럼1, 컬럼2 중 null이 아닌 컬럼을 리턴한다.
                     - 컬럼1, 컬럼2 모두 null이면 null을 리턴한다.
                   
                 - 다른 함수 종류
                   5) decode(컬럼, 값1, 값2, 처리2, 그밖의 처리)
                     - java의 switch-case문과 비슷하다.
                   
                   6) case when 조건식1 then 처리1
                           when 조건식2 then 처리2
                           else 처리n
                      end AS alias;
                     - java에서 다중 if-else문과 비슷
                 
                   7) 잡계함수(Aggregate Function) & 그룹함수(Group Function) (대괄호는 생략 가능하다.)
                     : 집계함수와 단순 컬럼은 함께 사용할 수 없다.(출력되는 레코드수가 다르기 때문)
                     : 레코드 = 행의 갯수
                     : 
                     - max([DISTINCT]|[ALL] 컬럼) : 최대값
                     - min([DISTINCT]|[ALL]컬럼) : 최소값
                     - count([DISTINCT]|[ALL]컬럼) : 갯수
                     - sum([DISTINCT]|[ALL]컬럼) : 합계
                     - avg([DISTINCT]|[ALL]컬럼) : 평균
                     - stddev([DISTINCT]|[ALL]컬럼) : 표준편자
                     - variance([DISTINCT]|[ALL]컬럼) : 분산
                  
                   8) ROWNUM
                     - oracle의 SELECT문 결과에 대해서 논리적인 일렬번호를 부여한다.
                     - ROWNUM은 조회되는 행수를 제한할 때 많이 사용한다.
                     - 예제) 
                       rownum = 1, rownum <= 3 (가능)
                       rownum = 3, rownum >= 3 (불가능)
                   
                   9) ROWID
                     - oracle에서 데이터를 구분할 수 있는 유일한 값이다.
                     - SELECT문에서 rowid를 사용할 수 있다.
                     - rowid를 통해서 데이터가 어떤 데이터파일, 어느 블록에 저장되어 있는지 알 수 있다.
                     - rowid 구조 (총 18자리)
                       오브젝트 번호(1~6) : 오브젝트 별로 유일한 값을 가지고 있으며, 해당 오브젝트가 속해 있는 값이다.
                       파일 번호(7~9) : 테이블스페이스(tablespace)에 속해 있는 데이터 파일에 대한 상대 파일번호이다.
                       블록 번호(10~15) : 데이터 파일 내부에서 어느 블록에 데이터가 있는지 알려준다.
                       데이터 번호(16~18) : 데이터 블록에 데이터가 저장되어 있는 순서를 의미한다.
