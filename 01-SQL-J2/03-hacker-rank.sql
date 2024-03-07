-- Raise the bar
-- Hacker Rank - Weather Observation Station 5
-- https://www.hackerrank.com/challenges/weather-observation-station-5/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
--
--
-- Tip: CHAR_LENGTH for text length
-- 
-- 
-- Query the two cities in STATION with the shortest and longest CITY names
-- as well as their respective lengths (i.e.: number of characters in the name). 
-- If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
-- 
-- 
-- Fonctionne avec MySQL
-- Penser à LIMIT 1
-- Penser à mettre 2 requêtes l'une à la suite de l'autre
SELECT
  CITY,
  MIN(LENGTH (CITY))
FROM
  STATION
GROUP BY
  CITY
ORDER BY
  MIN(LENGTH (CITY)) ASC,
  CITY ASC
LIMIT
  1;

SELECT
  CITY,
  MAX(LENGTH (CITY))
FROM
  STATION
GROUP BY
  CITY
ORDER BY
  MAX(LENGTH (CITY)) DESC,
  CITY ASC
LIMIT
  1;

-- Hacker Rank - Top Earners
-- https://www.hackerrank.com/challenges/earnings-of-employees/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
--
--
-- We define an employee's total earnings to be their monthly salary*months worked
-- and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
-- Write a query to find the maximum total earnings for all employees 
-- as well as the total number of employees who have maximum total earnings. 
-- Then print these values as 2 space-separated integers.
SELECT
  (months*salary) AS earnings,
  COUNT(*)
FROM
  Employee
GROUP BY
  earnings
ORDER BY
  earnings DESC
LIMIT
  1;

-- Hacker Rank - The PADS
-- https://www.hackerrank.com/challenges/the-pads/problem
--
--
-- Tips
--  Check out this Stack Overflow
-- 	CONCAT to concatenate strings of characters
--
-- Generate the following two result sets:
-- Query an alphabetically ordered list of all names in OCCUPATIONS, 
-- immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). 
-- For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
-- Query the number of ocurrences of each occupation in OCCUPATIONS. 
-- Sort the occurrences in ascending order, and output them in the following format:
-- There are a total of [occupation_count] [occupation]s.
SELECT
  concat (Name, "(", LEFT (Occupation, 1), ")")
FROM
  occupations
ORDER BY
  name;

SELECT
  concat (
    "There are a total of ",
    COUNT(Occupation),
    " ",
    LOWER(Occupation),
    "s."
  )
FROM
  occupations
GROUP BY
  Occupation
ORDER BY
  COUNT(Occupation);

-- Hacker Rank - The Company
-- https://www.hackerrank.com/challenges/the-company/problem
--
--
-- Tips:
-- 	• No need to JOIN, you can use WHERE to join the columns
-- 	• You can make a SELECT col1, col2, ..., colN FROM table1, table2, ... ,tableN
-- 	• If you add several tables after your FROM, we advise you to rename them and then to precede the columns by the name of the table.
-- 	• Ex: SELECT a.col1, b.col1 FROM table1 AS a, table2 as b
--
--
-- Solution mais lente…
--
-- Given the table schemas below, write a query to print 
-- the company_code
-- founder name
-- total number of lead managers
-- total number of senior managers
-- total number of managers
-- total number of employees. 
-- Order your output by ascending company_code.
-- The tables may contain duplicate records.
-- The company_code is string, so the sorting should not be numeric. 
-- For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.
SELECT
  COMPANY.company_code,
  COMPANY.founder,
  COUNT(DISTINCT LEAD_MANAGER.lead_manager_code),
  COUNT(DISTINCT SENIOR_MANAGER.senior_manager_code),
  COUNT(DISTINCT MANAGER.manager_code),
  COUNT(DISTINCT EMPLOYEE.employee_code)
FROM
  COMPANY
  JOIN LEAD_MANAGER ON COMPANY.company_code=LEAD_MANAGER.company_code
  JOIN SENIOR_MANAGER ON COMPANY.company_code=SENIOR_MANAGER.company_code
  JOIN MANAGER ON COMPANY.company_code=MANAGER.company_code
  JOIN EMPLOYEE ON COMPANY.company_code=EMPLOYEE.company_code
GROUP BY
  COMPANY.company_code,
  COMPANY.founder
ORDER BY
  COMPANY.company_code ASC;

-- Autre solution plus rapide (j'ai l'impression qu'elle fonctionne plus... Bizarre)
SELECT DISTINCT
  cp.company_code,
  cp.founder,
SELECT
  COUNT(DISTINCT lead_manager_code)
FROM
  Lead_Manager lm
WHERE
  (lm.company_code=cp.company_code) lead_manager_number,
  (
    SELECT
      COUNT(DISTINCT senior_manager_code)
    FROM
      Senior_Manager sm
    WHERE
      sm.company_code=cp.company_code
  ) senior_manager_number,
  (
    SELECT
      COUNT(DISTINCT manager_code)
    FROM
      Manager mn
    WHERE
      mn.company_code=cp.company_code
  ) manager_number,
  (
    SELECT
      COUNT(DISTINCT employee_code)
    FROM
      Employee ep
    WHERE
      ep.company_code=cp.company_code
  ) employee_number
FROM
  company cp
ORDER BY
  company_code asc;