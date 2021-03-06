CREATE database employee
USE employee



/*Query 3*/
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT 
FROM emp_record_table;




/*Query 4(1)*/
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING < 2;

/*Query 4(2)*/
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING > 4;

/*Query 4(3)*/
SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING BETWEEN 2 AND 4;




/*Query 5*/
SELECT CONCAT(FIRST_NAME," ", LAST_NAME) AS NAME
FROM emp_record_table
WHERE DEPT = 'FINANCE';




/*Query 6*/
SELECT CONCAT(E.FIRST_NAME," ",E.LAST_NAME) AS EMPLOYEE_NAME, CONCAT(M.FIRST_NAME," ",M.LAST_NAME) AS MANAGER_NAME,
COUNT(M.EMP_ID) AS COUNT
FROM emp_record_table E, emp_record_table M
WHERE E.MANAGER_ID = M.EMP_ID
GROUP BY M.EMP_ID;




/*Query 7*/
SELECT CONCAT(FIRST_NAME," ", LAST_NAME) AS NAME, DEPT
FROM emp_record_table
WHERE DEPT = 'FINANCE'
UNION
SELECT CONCAT(FIRST_NAME," ", LAST_NAME) AS NAME, DEPT
FROM emp_record_table
WHERE DEPT = 'HEALTHCARE';




/*Query 8*/
SELECT EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT, EMP_RATING
FROM emp_record_table
WHERE EMP_RATING IN (SELECT MAX(EMP_RATING) FROM emp_record_table GROUP BY DEPT)




/* Query 9 */
SELECT E.FIRST_NAME, E.LAST_NAME, E.ROLE, D.MAX_SALARY
FROM emp_record_table E JOIN
(SELECT ROLE, MAX(SALARY)AS MAX_SALARY FROM emp_record_table GROUP BY ROLE) D
ON E.ROLE = D.ROLE AND E.SALARY = D.MAX_SALARY;

SELECT E.FIRST_NAME, E.LAST_NAME, D.ROLE, D.MIN_SALARY
FROM emp_record_table E JOIN
(SELECT ROLE, MIN(SALARY)AS MIN_SALARY FROM emp_record_table GROUP BY ROLE) D
ON E.ROLE = D.ROLE AND E.SALARY = D.MIN_SALARY;

/* Query 9
SELECT FIRST_NAME, LAST_NAME, ROLE, MAX(SALARY) FROM emp_record_table GROUP BY ROLE;
SELECT FIRST_NAME, LAST_NAME, ROLE, MIN(SALARY) FROM emp_record_table GROUP BY ROLE;

SELECT FIRST_NAME, LAST_NAME, ROLE
FROM emp_record_table
WHERE SALARY IN (SELECT MAX(SALARY) FROM emp_record_table GROUP BY ROLE);

SELECT FIRST_NAME, LAST_NAME, ROLE
FROM emp_record_table
WHERE SALARY IN (SELECT MIN(SALARY) FROM emp_record_table GROUP BY ROLE);
*/




/*Query 10*/
SELECT FIRST_NAME, LAST_NAME, EXP,
RANK() OVER (ORDER BY EXP DESC) AS RNK,
DENSE_RANK() OVER (ORDER BY EXP DESC) AS DENSE_RNK
FROM emp_record_table




/*Query 11*/
CREATE VIEW Employee_View AS
SELECT CONCAT(FIRST_NAME," ", LAST_NAME) AS NAME, COUNTRY
FROM emp_record_table
WHERE SALARY > 6000
SELECT * FROM Employee_View;




/* Query 12 */
SELECT DISTINCT FIRST_NAME, LAST_NAME, EXP
FROM emp_record_table
WHERE EXP IN (SELECT EXP FROM emp_record_table WHERE EXP > 10);




/* Query 13 */
DELIMITER &&
CREATE PROCEDURE get_experience()
BEGIN
SELECT * FROM emp_record_table WHERE EXP > 3;
END &&
CALL get_experience();




/* Query 14 */
DELIMITER $$
CREATE FUNCTION Standards(exper INT)
RETURNS VARCHAR(40)
    DETERMINISTIC
BEGIN
	DECLARE standard VARCHAR(40); 
	IF exper <= 2 THEN
		SET standard = 'JUNIOR DATA SCIENTIST';
	ELSEIF (exper > 2 AND exper <= 5)  THEN
		SET standard = 'ASSOCIATE DATA SCIENTIST';
	ELSEIF (exper > 5 AND exper <= 10)  THEN
		SET standard = 'SENIOR DATA SCIENTIST';
	ELSEIF (exper > 10 AND exper <= 12)  THEN
		SET standard = 'LEAD DATA SCIENTIST';
	ELSEIF (exper > 12 AND exper <= 16)  THEN
		SET standard = 'MANAGER';  
	END IF;
	RETURN standard;
END; $$
DELIMITER ;

SELECT FIRST_NAME, LAST_NAME, ROLE, EXP,
Standards(EXP) AS CHECK_STANDARDS
FROM data_science_team;




/* Query 15 */
SELECT * 
FROM emp_record_table 
WHERE FIRST_NAME = 'Eric'

/* By creating Indexing */
CREATE INDEX name_index ON emp_record_table (FIRST_NAME(45));




/* Query 16 */
SELECT FIRST_NAME, LAST_NAME, SALARY, EMP_RATING, SALARY * 0.05 * EMP_RATING AS BONUS
FROM emp_record_table





/* Query 17 */
SELECT FIRST_NAME, LAST_NAME, COUNTRY, CONTINENT, AVG(SALARY) AS SALARY_AVG
FROM emp_record_table
GROUP BY COUNTRY, CONTINENT


















	





















































