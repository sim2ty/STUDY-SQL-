--1. hr 사용자 영역에 생성되어 있는 모든 테이블의 리스트를 출력한다.
SELECT * FROM TAB;

--2. employees, departments, locations, countries 테이블들의 구조를 점검한다.
DESC employees;
DESC departments;
DESC locations;
DESC countries;

--3. employees 테이블의 모든 데이터들을 출력하는데 먼저 입사한 순으로 출력한다.
SELECT *
FROM employees
ORDER BY hire_date;

--4. 직원들이 받는 월급의 총액수를 출력하는데 천 단위마다 , 를 함께 출력하고 마지막에 '원' 출력한다.   또한 컬럼명은 "총급여 금액" 이 되도록 한다.
SELECT to_char(sum(salary),'999,999,999')||'원' "총급여 금액"
FROM employees;

--5. 직원들의 이름(first_name) 그리고 직원이 근무하는 부서명을 출력한다.
--   부서 배정을 못받은 직원은 제외한다.(106행)
SELECT first_name "이름", department_name "부서명"
FROM employees e, departments d
WHERE e.department_id=d.department_id
AND e.department_id IS NOT NULL;

--6. 업무(JOB_ID)별 월급의 평균을 출력한다. 출력 컬럼명은 "업무", "월급의 평균" 이다.(19행)
SELECT job_id "업무", avg(salary) "월급의 평균"
FROM employees
GROUP BY job_id;

--7. 커미션을 받는 직원들의 이름과 성을 공백으로 구분되는 하나의 컬럼으로 출력한다.
--    컬럼명은 "직원의 성명" 이다.(35행)
SELECT last_name||' '||first_name "직원의 성명"
FROM employees
WHERE commission_pct IS NOT NULL;

--8. 직원의 사번과 커미션의 설정 여부를 출력하고자 한다. 커미션이 정해져 있으면 "있음", 없으면 "없음" 을 출력하며 컬럼명은 "사번", "커미션 설정 여부"로 한다.
SELECT employee_id "사번", nvl2(to_char(commission_pct), '있음', '없음') "커미션 설정 여부"
FROM employees;

--9. 부서 배치가 되지 않은 직원의 id(employee_id), 이름(first_name), 해당 직원을 담당하는 매니저 ID, 매니저의 이름을 조회하여 출력한다. 컬럼명은 "직원ID", "직원이름", "매니저ID", "매니저이름" 으로한다.(1행)
SELECT x.employee_id "직원ID", x.first_name "직원이름", x.manager_id "매니저 ID", y.first_name "매니저이름"
FROM employees x, employees y
WHERE x.manager_id=y.employee_id
AND x.department_id is null;

--10. 직급별로  직원의 최고급여를 조회하여 출력한다. 단, 출력시 최고급여 내림차순으로 정렬되어 출력하며 최고 급여가 10000 이상인 경우에만 출력한다. 컬럼명은 "직급", "최고 급여" 라고 설정한다.(9행)
SELECT job_id "직급", MAX(salary) "최고급여"
FROM employees
GROUP BY job_id
HAVING MAX(salary)>=10000
ORDER BY 최고급여 DESC;

--11. 입사월이 7월인 직원의 이름(first_name),  부서이름(department_name)  및 ‘축-입사기념달’을 출력한다.(7행)
SELECT first_name "직원의 이름", department_name "부서이름", '축-입사기념달'
FROM employees e, departments d
WHERE e.department_id=d.department_id
AND substr(hire_date,4,2)='07';

--12. 입사년도별 직원수를 구하여 출력하시오. 단, 급여가 5000에서 10000 사이만 직원만 그리고  직원수가 7명 이상인 경우만 입사년도 순으로 정렬한다.  년도에는 '년'을 붙여서 표현하며 컬럼명은 "입사년도", "직원수" 로 설정한다.(3행)
SELECT substr(hire_date,0,2) "입사년도", count(employee_id) "직원수"
FROM employees
WHERE salary BETWEEN 5000 AND 10000
GROUP BY substr(hire_date,0,2)
HAVING count(employee_id)>=7;

--13. 성과 이름을 합친 길이가 15자 이상인 직원들에 대하여 이름과 성을 공백으로 구성한 컬럼과 근무 나라명을
--     월급이 큰 순으로 출력한다.  컬럼명은 "직원 이름", "근무 나라" 로 설정한다.(11행)
SELECT  last_name||' '||first_name "직원 이름", country_name "근무 나라"
FROM employees e, departments d, locations l, countries c 
WHERE e.department_id=d.department_id
AND d.location_id=l.location_id
AND l.country_id=c.country_id
AND LENGTH(last_name)+LENGTH(first_name)>=15
ORDER BY salary DESC;