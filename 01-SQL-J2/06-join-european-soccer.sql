-- JOIN-EUROPEAN SOCCER
--
--
--
-- 01 OK
-- Using JOIN, find the team with the most goals at home
-- home_team_goal
SELECT
  Team.team_long_name,
  SUM(home_team_goal) AS SUM
FROM
  european_soccer.team AS Team
  INNER JOIN european_soccer.match AS MATCH ON Team.team_api_id=MATCH.home_team_api_id
GROUP BY
  Team.team_long_name
ORDER BY
  SUM DESC;

--
--
--
-- 02 OK
-- Is it the same as the team that put the most goals away?
-- away_team_goal
SELECT
  Team.team_long_name,
  SUM(away_team_goal) AS SUM
FROM
  european_soccer.team AS Team
  INNER JOIN european_soccer.match AS MATCH ON Team.team_api_id=MATCH.away_team_api_id
GROUP BY
  Team.team_long_name
ORDER BY
  SUM DESC;

--
--
--
-- 03 
-- What is the name of the best player according to our database in 2016?
-- Ne fonctionne pas
SELECT
  Player.player_name,
  Attributes.overall_rating
FROM
  european_soccer.player AS Player
  INNER JOIN european_soccer.player_attributes AS Attributes ON Player.player_api_id=Attributes.player_api_id
WHERE
  EXTRACT(
    YEAR
    FROM
      Attributes.date
  )=2016
GROUP BY
  Player.player_name
ORDER BY
  Attributes.overall_rating DESC;

-- Fonctionne
SELECT
  Player.player_name,
  Attributes.overall_rating
FROM
  european_soccer.player AS Player
  INNER JOIN european_soccer.player_attributes AS Attributes ON Player.player_api_id=Attributes.player_api_id
WHERE
  EXTRACT(
    YEAR
    FROM
      Attributes.date
  )=2016
GROUP BY
  Player.player_name,
  Attributes.overall_rating
ORDER BY
  Attributes.overall_rating DESC;