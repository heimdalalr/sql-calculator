-- SELECT BASICS

-- 1
SELECT population FROM world
WHERE name = 'Germany';

-- 2
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3
SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000;


-- SUM and COUNT

-- 1
SELECT SUM(population)
FROM world;

-- 2
SELECT DISTINCT continent
FROM world;

-- 3
SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa';

-- 4
SELECT COUNT(name)
FROM world
WHERE area >= 1000000;

-- 5
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- 6
SELECT continent, COUNT(name)
FROM world
GROUP BY continent;

-- 7
SELECT continent, COUNT(name)
FROM world
WHERE population > 10000000
GROUP BY continent;

-- 8
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) > 100000000;


-- SELECT within SELECT

-- 1
SELECT name FROM world
WHERE population >
    (SELECT population FROM world
    WHERE name='Russia');

-- 2 
SELECT name FROM world
WHERE continent = 'Europe'
AND gdp/population >
    (SELECT gdp/population FROM world
    WHERE name = 'United Kingdom');

-- 3
SELECT name, continent
FROM world
WHERE continent IN
    (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia'))
ORDER BY name;

-- 4
SELECT name, population
FROM world
WHERE population >
    (SELECT population FROM world WHERE name = 'Canada')
AND population <
    (SELECT population FROM world WHERE name = 'Poland');

-- 5
SELECT name,
    CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name = 'Germany'),0),'%') percentage
FROM world
WHERE continent = 'Europe';

-- 6
SELECT name
FROM world
WHERE gdp > 
    (SELECT MAX(gdp) FROM world WHERE continent = 'Europe');

-- 7
SELECT continent, name, area FROM world x
WHERE area >= ALL
    (SELECT area FROM world y
    WHERE y.continent=x.continent)

-- 8
SELECT continent, name FROM world x
WHERE name = (SELECT name FROM world y WHERE x.continent = y.continent LIMIT 1)
ORDER BY continent;

-- 9
SELECT name, continent, population
FROM world x
WHERE 25000000 > ALL
(SELECT population FROM world y WHERE x.continent = y.continent);

-- 10
SELECT x.name, x.continent
FROM world x
WHERE population/3 >= ALL
(SELECT population
FROM world y
WHERE x.continent = y.continent AND x.name != y.name);


-- JOIN

-- 1
SELECT matchid, player FROM goal 
WHERE teamid = 'GER';

-- 2
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012;

-- 3
SELECT player,teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER';

-- 4
SELECT team1, team2, player
FROM game
JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%';

-- 5
SELECT player, teamid, coach, gtime
FROM goal
JOIN eteam ON (teamid = id)
WHERE gtime<=10;

-- 6
SELECT mdate, teamname
FROM game
JOIN eteam ON (team1 = eteam.id)
WHERE coach = 'Fernando Santos';

-- 7
SELECT player
FROM goal
JOIN game ON (matchid = id)
WHERE stadium = 'National Stadium, Warsaw';

-- 8
SELECT DISTINCT player
FROM goal JOIN game ON id = matchid
WHERE team1='GER' AND teamid <> 'GER'
OR team2 = 'GER' AND teamid <> 'GER';

-- 9
SELECT teamname, COUNT(player)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname

-- 10
SELECT stadium, COUNT(player)
FROM game
JOIN goal ON matchid=id
GROUP BY stadium;

-- 11
SELECT matchid, mdate, COUNT(player)
FROM game JOIN goal ON matchid = id
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate;

-- 12
SELECT matchid, mdate, COUNT(player)
FROM game
JOIN goal ON (id = matchid)
WHERE teamid = 'GER'
GROUP BY matchid, mdate;

-- 13
SELECT mdate,
team1,
SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
team2,
SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game 
JOIN goal ON matchid = id
GROUP BY mdate, team1, team2
ORDER BY mdate, matchid, team1, team2;-- SELECT BASICS

-- 1
SELECT population FROM world
WHERE name = 'Germany';

-- 2
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3
SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000;


-- SUM and COUNT

-- 1
SELECT SUM(population)
FROM world;

-- 2
SELECT DISTINCT continent
FROM world;

-- 3
SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa';

-- 4
SELECT COUNT(name)
FROM world
WHERE area >= 1000000;

-- 5
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- 6
SELECT continent, COUNT(name)
FROM world
GROUP BY continent;

-- 7
SELECT continent, COUNT(name)
FROM world
WHERE population > 10000000
GROUP BY continent;

-- 8
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) > 100000000;


-- SELECT within SELECT

-- 1
SELECT name FROM world
WHERE population >
    (SELECT population FROM world
    WHERE name='Russia');

-- 2 
SELECT name FROM world
WHERE continent = 'Europe'
AND gdp/population >
    (SELECT gdp/population FROM world
    WHERE name = 'United Kingdom');

-- 3
SELECT name, continent
FROM world
WHERE continent IN
    (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia'))
ORDER BY name;

-- 4
SELECT name, population
FROM world
WHERE population >
    (SELECT population FROM world WHERE name = 'Canada')
AND population <
    (SELECT population FROM world WHERE name = 'Poland');

-- 5
SELECT name,
    CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name = 'Germany'),0),'%') percentage
FROM world
WHERE continent = 'Europe';

-- 6
SELECT name
FROM world
WHERE gdp > 
    (SELECT MAX(gdp) FROM world WHERE continent = 'Europe');

-- 7
SELECT continent, name, area FROM world x
WHERE area >= ALL
    (SELECT area FROM world y
    WHERE y.continent=x.continent)

-- 8
SELECT continent, name FROM world x
WHERE name = (SELECT name FROM world y WHERE x.continent = y.continent LIMIT 1)
ORDER BY continent;

-- 9
SELECT name, continent, population
FROM world x
WHERE 25000000 > ALL
(SELECT population FROM world y WHERE x.continent = y.continent);

-- 10
SELECT x.name, x.continent
FROM world x
WHERE population/3 >= ALL
(SELECT population
FROM world y
WHERE x.continent = y.continent AND x.name != y.name);


-- JOIN

-- 1
SELECT matchid, player FROM goal 
WHERE teamid = 'GER';

-- 2
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012;

-- 3
SELECT player,teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER';

-- 4
SELECT team1, team2, player
FROM game
JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%';

-- 5
SELECT player, teamid, coach, gtime
FROM goal
JOIN eteam ON (teamid = id)
WHERE gtime<=10;

-- 6
SELECT mdate, teamname
FROM game
JOIN eteam ON (team1 = eteam.id)
WHERE coach = 'Fernando Santos';

-- 7
SELECT player
FROM goal
JOIN game ON (matchid = id)
WHERE stadium = 'National Stadium, Warsaw';

-- 8
SELECT DISTINCT player
FROM goal JOIN game ON id = matchid
WHERE team1='GER' AND teamid <> 'GER'
OR team2 = 'GER' AND teamid <> 'GER';

-- 9
SELECT teamname, COUNT(player)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname

-- 10
SELECT stadium, COUNT(player)
FROM game
JOIN goal ON matchid=id
GROUP BY stadium;

-- 11
SELECT matchid, mdate, COUNT(player)
FROM game JOIN goal ON matchid = id
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate;

-- 12
SELECT matchid, mdate, COUNT(player)
FROM game
JOIN goal ON (id = matchid)
WHERE teamid = 'GER'
GROUP BY matchid, mdate;

-- 13
SELECT mdate,
team1,
SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
team2,
SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game 
JOIN goal ON matchid = id
GROUP BY mdate, team1, team2
ORDER BY mdate, matchid, team1, team2;