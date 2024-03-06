/*
00 - Créer un répertoire
01 - Récupérer NYSE.zip
02 - Déziper le fichier
03 - Lancer une console PowerShell
04 - Lancer ./sqlite3.exe (si besoin le récupérer en ligne)
05 - Une fois le prompt "sqlite>" visible taper
06 - .mode csv
07 - .import ./NYSE_companies companies
08 - .save companies.sqlite
09 - Quitter sqlite 3 avec .exit
10 - lancer VSCode depuis powershell "code ."  
 */
SELECT
  SQL
FROM
  sqlite_schema
WHERE
  name='companies';

SELECT
  *
FROM
  companies
LIMIT
  10;

SELECT
  *
FROM
  indicators
LIMIT
  10;

-- 01 
-- In which sector do we have the most companies?
SELECT
  GICS_Sector,
  COUNT(*) AS cnt_per_sector
FROM
  companies
GROUP BY
  GICS_Sector
ORDER BY
  cnt_per_sector DESC;

-- 02
-- What is the top 5 Californian cities with the most companies in the NYSE?
SELECT
  Address_of_Headquarters,
  COUNT(*) AS Count_Companies
FROM
  companies
WHERE
  Address_of_Headquarters LIKE "%California%"
GROUP BY
  Address_of_Headquarters
ORDER BY
  Count_Companies DESC
LIMIT
  5;

-- 03 OK
-- What is the top 5 companies that made the most profit in 2015?
-- Company: Ticker_Symbol
-- Profit: Net_income
-- Year: For_Year
SELECT
  Ticker_Symbol,
  Net_Income
FROM
  indicators
WHERE
  For_Year=2015
ORDER BY
  Net_Income DESC
LIMIT
  5;