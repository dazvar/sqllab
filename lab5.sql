SELECT region, SUM(population) AS total_population
FROM cities
GROUP BY region;
SELECT region, COUNT(*) AS city_count, SUM(population) AS total_population
FROM cities
GROUP BY region
HAVING city_count >= 10;
SELECT name, population
FROM cities
WHERE region IN 
(
    SELECT region
    FROM cities
    GROUP BY region
    HAVING COUNT(*) >= 5
)
ORDER BY population DESC
LIMIT 5 OFFSET 10;
SELECT region, SUM(population) AS total_population
FROM cities
WHERE population > 300000
GROUP BY region;
SELECT name, population
FROM cities
WHERE region IN 
(
    SELECT region
    FROM cities
    GROUP BY region
    HAVING COUNT(*) <= 5
)
AND (population < 150000 OR population > 500000)
ORDER BY population DESC;