-- 1
-- What is the highest budget of all US films?
SELECT
  movie_title,
  budget
FROM
  IMDB.movies
WHERE
  country='USA'
ORDER BY
  budget DESC;

SELECT
  movie_title,
  MAX(budget) AS Maxi
FROM
  dataset_imdb.movies
WHERE
  country='USA'
GROUP BY
  movie_title
ORDER BY
  Maxi DESC
LIMIT
  5;

SELECT
  movie_title,
  budget
FROM
  dataset_imdb.movies
WHERE
  budget=(
    SELECT
      MAX(budget)
    FROM
      dataset_imdb.movies
  );

SELECT
  movie_title,
  budget
FROM
  dataset_imdb.movies
WHERE
  budget=(
    SELECT
      MAX(budget)
    FROM
      dataset_imdb.movies
    WHERE
      country='USA'
  );

-- What is the highest budget of all US films?
SELECT
  movie_title,
  budget,
  country
FROM
  `cours-sql-jedha.MyIMDB.movies`
WHERE
  country="USA"
ORDER BY
  budget DESC
LIMIT
  10;

-- The Host 12215500000
-- 2
-- Which actors have "John" in their name?
SELECT
  actor_1_name
FROM
  IMDB.main_actors
WHERE
  actor_1_name LIKE '%John%';

-- Which actors have "John" in their name?
SELECT
  actor_1_name
FROM
  `cours-sql-jedha.MyIMDB.main_actors`
WHERE
  actor_1_name LIKE "%John%";

-- 3
-- What is the movie with the most Facebook likes?
SELECT
  movie_title,
  movie_facebook_likes
FROM
  IMDB.movies
ORDER BY
  movie_facebook_likes DESC;

-- What is the movie with the most Facebook likes?
SELECT
  movie_title
FROM
  `cours-sql-jedha.MyIMDB.movies`
ORDER BY
  movie_facebook_likes DESC;

-- 4
-- What are the 15 best movies according to IMDB?
SELECT
  movie_title,
  imdb_score
FROM
  IMDB.movies
ORDER BY
  imdb_score DESC
LIMIT
  15;

-- What are the 15 best movies according to IMDB?
SELECT
  movie_title,
  imdb_score
FROM
  `cours-sql-jedha.MyIMDB.movies`
ORDER BY
  imdb_score DESC
LIMIT
  15;

-- Towering Inferno     9.5
-- The Shawshank Redemption 9.3
-- The Godfather 9.2
-- …
-- 5
-- Are there any of these 15 movies outside of the US?
SELECT
  movie_title,
  imdb_score
FROM
  (
    SELECT
      movie_title,
      imdb_score,
      country
    FROM
      IMDB.movies
    ORDER BY
      imdb_score DESC
    LIMIT
      15
  )
WHERE
  country<>"USA";

-- Are there any of these 15 movies outside of the US?
SELECT
  movie_title,
  country
FROM
  (
    SELECT
      movie_title,
      country,
      imdb_score
    FROM
      `cours-sql-jedha.MyIMDB.movies`
    ORDER BY
      imdb_score DESC
    LIMIT
      15
  )
WHERE
  country<>"USA";

-- 1	Towering Inferno            	  Canada
-- 2	Dekalog            	            Poland
-- 3	Dekalog            	            Poland
-- 4	The Good, the Bad and the Ugly	Italy
-- 6
-- What is the top 10 best films of the 1990s according to IMDB?
SELECT
  movie_title AS Title,
  title_year AS YEAR,
  imdb_score AS Score
FROM
  IMDB.movies
WHERE
  title_year BETWEEN 1990 AND 2000
ORDER BY
  imdb_score DESC
LIMIT
  10;

-- What is the top 10 best films of the 1990s according to IMDB?
SELECT
  movie_title,
  imdb_score,
  title_year
FROM
  `cours-sql-jedha.MyIMDB.movies`
WHERE
  title_year BETWEEN 1990 AND 1999
ORDER BY
  imdb_score DESC
LIMIT
  10;