-- https://app.jedha.co/course/advanced-sql-e/advanced-sql-exercises-part-b-e
--
--
--
-- 01 Find out which day in the month had the most matches 
SELECT
  EXTRACT(
    DAY
    FROM
      DATE
  ) AS DAY,
  COUNT(*) AS cnt
FROM
  `european_soccer.match`
GROUP BY
  DAY
ORDER BY
  cnt DESC;

--
--
--
-- 02 Find out which month in the year had the most matches.
SELECT
  EXTRACT(
    MONTH
    FROM
      DATE
  ) AS MONTH,
  COUNT(*) AS cnt
FROM
  `european_soccer.match`
GROUP BY
  MONTH
ORDER BY
  cnt DESC;

-- TODO - 02bis Faire la liste des mois avec pour chacun le jour où y a plus de matches ???
-- En cours
/*
EXTRACT(month FROM date) as month, COUNT(*) AS cnt 
FROM `european_soccer.match` 
GROUP BY month
ORDER BY cnt DESC;

WITH movie_with_johnny_depp AS (
SELECT * FROM `dataset_imdb.movies` 
JOIN `dataset_imdb.main_actors`  USING(actor_1_id)
WHERE actor_1_name = "Johnny Depp" )
SELECT * FROM movie_with_johnny_depp;
 */