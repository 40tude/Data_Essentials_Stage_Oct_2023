-- Exos 10 
-- 
-- https://sqlbolt.com/lesson/select_queries_with_aggregates
-- 
-- Queries with aggregates
-- 
-- SELECT AGG_FUNC(column_or_expression) AS aggregate_description, …
-- FROM mytable
-- WHERE constraint_expression;
-- 
-- SELECT AGG_FUNC(column_or_expression) AS aggregate_description, …
-- FROM mytable
-- WHERE constraint_expression
-- GROUP BY column;
-- 
-- 
-- 
-- AGG_FUNC : 
-- 	• COUNT()
-- 	• COUNT DISTINCT()
-- 	• STD()
-- 	• SUM()
-- 	• AVG()
-- 	• MIN()
-- 	• MAX()
-- 	• …
-- 
-- 
-- 
-- Find the longest time that an employee has been at the studio
SELECT
  MAX(Years_Employed)
FROM
  employees;

-- 
-- 
-- For each role, find the average number of years employed by employees in that role
SELECT
  Role,
  AVG(Years_Employed)
FROM
  employees
GROUP BY
  Role;

-- 
-- 
-- Find the total number of employee years worked in each building
SELECT
  Building,
  SUM(years_employed) AS Total_Years
FROM
  employees
GROUP BY
  Building;