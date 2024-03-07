-- Exos 11 
-- 
-- https://sqlbolt.com/lesson/select_queries_with_aggregates_pt_2
-- 
-- Queries with aggregates
-- 
-- SELECT group_by_column, AGG_FUNC(column_expression) AS aggregate_result_alias, …
-- FROM mytable
-- WHERE condition
-- GROUP BY column
-- HAVING group_condition;
-- 
-- 
-- Find the number of Artists in the studio (without a HAVING clause)
SELECT
  Role,
  COUNT(Role)
FROM
  employees
WHERE
  Role="Artist";

-- 
-- 
-- Find the number of Employees of each role in the studio ✓
SELECT
  Role,
  COUNT(Role)
FROM
  employees
GROUP BY
  Role;

-- 
-- 
-- Find the total number of years employed by all Engineers
SELECT
  Role,
  SUM(Years_Employed)
FROM
  employees
WHERE
  Role="Engineer";