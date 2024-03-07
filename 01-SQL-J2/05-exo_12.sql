-- JOIN - SQL Bolt - SQL Lesson 12 : Order of execution of a Query 
-- https://sqlbolt.com/lesson/select_queries_order_of_execution
-- SELECT DISTINCT column, AGG_FUNC(column_or_expression), …
-- FROM mytable
--     JOIN another_table
--       ON mytable.column = another_table.column
--     WHERE constraint_expression
--     GROUP BY column
--     HAVING constraint_expression
--     ORDER BY column ASC/DESC
--     LIMIT count OFFSET COUNT;
--
--
--
-- Find the number of movies each director has directed
SELECT
  COUNT(*) AS COUNT,
  Director
FROM
  movies
GROUP BY
  Director
ORDER BY
  COUNT DESC;

--
--
--
-- Find the total domestic and international sales that can be attributed to each director
--
-- Z! Fonctionne pas
SELECT
  SUM(Domestic_Sales),
  SUM(International_Sales),
  Director
FROM
  Boxoffice
  INNER JOIN Movies ON Boxoffice.Movie_id=Movies.id
GROUP BY
  Director;

--
-- Fonctionne
SELECT
  SUM(Domestic_Sales+International_Sales),
  Director
FROM
  Boxoffice
  INNER JOIN Movies ON Boxoffice.Movie_id=Movies.id
GROUP BY
  Director;