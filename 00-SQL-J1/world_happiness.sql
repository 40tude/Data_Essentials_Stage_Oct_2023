-- 7
-- What are the 5 happiest countries in the world in 2016?
SELECT
  Country,
  Happiness_Score
FROM
  World_happiness_record
ORDER BY
  Happiness_score DESC
LIMIT
  5;

-- What are the 5 happiest countries in the world in 2016?
SELECT
  country,
  Happiness_rank
FROM
  `cours-sql-jedha.my_dataset.happy`
ORDER BY
  Happiness_rank Desc;

-- 8
-- What are the 5 most unhappy countries in the world in 2016?
SELECT
  Country,
  Happiness_score
FROM
  World_happiness_record
ORDER BY
  Happiness_score ASC
LIMIT
  5;

-- What are the 5 most unhappy countries in the world in 2016?
SELECT
  country,
  Happiness_rank
FROM
  `cours-sql-jedha.my_dataset.happy`
ORDER BY
  Happiness_rank asc
LIMIT
  5;

-- 9
-- Is the country with the highest life expectancy the happiest?
SELECT
  Country,
  Life_expectancy,
  Happiness_score
FROM
  World_happiness_record
ORDER BY
  Life_expectancy DESC,
  Happiness_score DESC;