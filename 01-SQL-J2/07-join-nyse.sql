-- JOIN - NEW YORK STOCK EXCHANGE
--
--
--
-- 01 
-- Which company is making the most investment in 2016?
-- Use the USING() function if the columns you want to JOIN have the same name 
SELECT
  Security,
  Investments
FROM
  `NYSE.companies`
  JOIN `NYSE.indicators` USING (Ticker_Symbol)
WHERE
  EXTRACT(
    YEAR
    FROM
      Period_Ending
  )=2016
ORDER BY
  Investments DESC;

--
--
--
-- 02
-- Is it the same company that has invested the most over all the years of our base?
SELECT
  Security,
  SUM(Investments) AS sum_of_investments
FROM
  `NYSE.companies`
  JOIN `NYSE.indicators` USING (Ticker_Symbol)
GROUP BY
  Security
ORDER BY
  sum_of_investments DESC;

--
--
--
-- 03 
-- Which sector generated the most revenue in 2016?
SELECT
  GICS_Sector,
  SUM(total_revenue) AS sum_of_revenue
FROM
  `NYSE.companies`
  JOIN `NYSE.indicators` USING (Ticker_Symbol)
WHERE
  For_Year=2016
GROUP BY
  GICS_Sector
ORDER BY
  sum_of_revenue DESC;

--
--
--
-- 04 
-- Which sector generated the most profit in 2016?
SELECT
  GICS_Sector,
  SUM(Profit_Margin) AS total_margin
FROM
  `NYSE.companies`
  JOIN `NYSE.indicators` USING (Ticker_Symbol)
WHERE
  For_Year=2016
GROUP BY
  GICS_Sector
ORDER BY
  total_margin DESC;

--
--
--
-- 05 
-- Finally, in which sector IS there the most short-term debt ?
SELECT
  GICS_Sector,
  SUM(
    Short_Term_Debt___Current_Portion_of_Long_Term_Debt
  ) AS short_term_debt
FROM
  `NYSE.companies`
  JOIN `NYSE.indicators` USING (Ticker_Symbol)
GROUP BY
  GICS_Sector
ORDER BY
  short_term_debt DESC;