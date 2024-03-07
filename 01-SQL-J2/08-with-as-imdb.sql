-- WITH AS - IMDB
--
--
--
-- 01 
-- Using WITH AS, store all of the movies in which Johnny Depp has played
WITH
  movie_with_johnny_depp AS (
    SELECT
      *
    FROM
      `dataset_imdb.movies`
      JOIN `dataset_imdb.main_actors` USING (actor_1_id)
    WHERE
      actor_1_name="Johnny Depp"
  )
SELECT
  *
FROM
  movie_with_johnny_depp;

--
--
--
-- 02 
-- What's the best movie he's ever been in?
WITH
  movie_with_johnny_depp AS (
    SELECT
      *
    FROM
      `dataset_imdb.movies`
      JOIN `dataset_imdb.main_actors` USING (actor_1_id)
    WHERE
      actor_1_name="Johnny Depp"
  )
SELECT
  movie_title
FROM
  movie_with_johnny_depp
ORDER BY
  imdb_score DESC
LIMIT
  1;