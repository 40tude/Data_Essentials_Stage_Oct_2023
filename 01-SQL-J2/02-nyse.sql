-- Exo NYSE 
-- https://app.jedha.co/course/advanced-sql-e/advanced-sql-exercises-part-a-e
-- Note : jamais d'alias sur un WHERE
-- SELECT * FROM `prj-sql-jedha-400918.nyse.companies` LIMIT 100;
-- SELECT * FROM nyse.companies LIMIT 100;
-- Where Group Having Order
-- SELECT select_list 
-- FROM source
-- [ WHERE condition(s) ] 
-- [ GROUP BY expression ]
-- [ HAVING condition ]
-- [ ORDER BY expression ] ;
-- 
-- 
-- 
-- 01 
-- In which sector do we have the most companies?
SELECT
  GICS_Sector,
  COUNT(*) AS cnt_per_sector
FROM
  nyse.companies
GROUP BY
  GICS_Sector
ORDER BY
  cnt_per_sector DESC;

-- 
-- 
-- 
-- 02 OK
-- What is the top 5 Californian cities with the most companies in the NYSE?
-- 
-- Z! Fonctionne pas
SELECT
  Address_of_Headquarters,
  COUNT(*) AS Count_Companies
FROM
  nyse.companies
WHERE
  Address_of_Headquarters LIKE "%California%"
ORDER BY
  Count_Companies DESC
LIMIT
  5;

-- 
-- Fonctionne
SELECT
  Address_of_Headquarters,
  COUNT(*) AS Count_Companies
FROM
  nyse.companies
WHERE
  Address_of_Headquarters LIKE "%California%"
GROUP BY
  Address_of_Headquarters
ORDER BY
  Count_Companies DESC
LIMIT
  5;

-- 
-- 
-- 
-- 03 OK
-- What is the top 5 companies that made the most profit in 2015?
-- Company: Ticker_Symbol
-- Profit: Net_income
-- Year: For_Year
SELECT
  Ticker_Symbol,
  Net_Income
FROM
  nyse.indicators
WHERE
  For_Year=2015
ORDER BY
  Net_Income DESC
LIMIT
  5;

-- 
-- 
-- 
-- 04 OK
-- And cumulatively between 2013 and 2016?
-- Company: Ticker_Symbol
-- Profit: Net_income
-- Year: For_Year
SELECT
  Ticker_Symbol,
  SUM(Net_Income) AS Total_Income
FROM
  nyse.indicators
WHERE
  For_Year BETWEEN 2013 AND 2016
GROUP BY
  Ticker_Symbol
ORDER BY
  Total_Income DESC
LIMIT
  5;

-- 
-- 
-- 
-- 05 OK
-- Which companies are less healthy? 
-- We will calculate this by performing a ratio between assets (Total_Assets) and liabilities (Total_Liabilities). 
-- We will also round the results to three decimal places
SELECT
  Ticker_Symbol,
  (Total_Assets/Total_Liabilities) AS ratio
FROM
  nyse.indicators
ORDER BY
  ratio ASC
LIMIT
  10;

-- 
-- 
-- 
SELECT
  Ticker_Symbol,
  ROUND(Total_Assets/Total_Liabilities, 3) AS ratio
FROM
  nyse.indicators
ORDER BY
  ratio ASC
LIMIT
  10;

-- 
-- 
-- 
-- Z! les boites apparaissent sur plusieurs années
-- Soit on fixe une année (2016 par ex.)
-- Soit on fait une somme (pas top)
-- 
-- 
-- 
-- 06 OK
-- What is Apple's average income between the years 2014 and 2016?
-- 
-- Z! Fonctionne pas
SELECT
  Ticker_Symbol,
  AVG(Net_Income) AS ratio
FROM
  nyse.indicators
WHERE
  (For_Year BETWEEN 2014 AND 2016)
  AND (Ticker_Symbol="AAPL");

-- 
-- Fonctionne
SELECT
  Ticker_Symbol,
  AVG(Net_Income) AS ratio
FROM
  nyse.indicators
WHERE
  (For_Year BETWEEN 2014 AND 2016)
  AND (Ticker_Symbol="AAPL")
GROUP BY
  Ticker_Symbol;

-- 
-- 
-- 
-- 07 OK
-- Which companies have the most after-tax income (Net_income) with long-term debt of less than $1,000,000?
SELECT
  Ticker_Symbol,
  SUM(Net_income) AS Sum_Income
FROM
  nyse.indicators
GROUP BY
  Ticker_Symbol
HAVING
  SUM(Long_Term_Debt)<1000000
ORDER BY
  Sum_Income DESC;

-- 
-- 
-- 
-- SUBQUERIES
-- 
-- 
-- 
-- 08 OK
-- Which foreign films scored higher than the best American film?
-- Attention ci-dessous on est pas sûr que le score soit sup aux scores des films US
SELECT
  imdb_score,
  movie_title,
  country
FROM
  `dataset_imdb.movies`
WHERE
  country<>"USA"
ORDER BY
  imdb_score DESC;

-- décomposition : requete principale
-- 
-- SELECT movie_title FROM dataset_imdb.movies
-- WHERE imdb_score > ( ... ) 
-- AND Country <> "USA"
-- ORDER BY movie_title;
-- 
-- 
-- 
-- décomposition : sous requête
-- 
-- SELECT imdb_score FROM dataset_imdb.movies 
-- WHERE Country = "USA" 
-- ORDER BY imdb_score DESC
-- LIMIT 1; 
-- 
-- 
-- 
-- fusion des 2 requêtes
-- 
SELECT
  imdb_score,
  movie_title,
  country
FROM
  `dataset_imdb.movies`
WHERE
  imdb_score>(
    SELECT
      imdb_score
    FROM
      `dataset_imdb.movies`
    WHERE
      Country="USA"
    ORDER BY
      imdb_score DESC
    LIMIT
      1
  )
  AND country!="USA"
ORDER BY
  imdb_score DESC;

-- 
-- 
-- 
-- Autre Solution proposée
SELECT
  movie_title
FROM
  dataset_imdb.movies
WHERE
  imdb_score>(
    SELECT
      imdb_score
    FROM
      `dataset_imdb.movies`
    WHERE
      Country="USA"
    ORDER BY
      imdb_score
    LIMIT
      1
  )
  AND Country!="USA"
ORDER BY
  movie_title;

-- 
-- 
-- 
-- Autre solution
SELECT
  movie_title
FROM
  IMDB.movies
WHERE
  imdb_score>(
    SELECT
      imdb_score
    FROM
      IMDB.movies
    WHERE
      Country="USA"
    ORDER BY
      imdb_score
    LIMIT
      1
  )
  AND Country!="USA"
ORDER BY
  movie_title;