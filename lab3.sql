SELECT name
FROM cities
WHERE name LIKE '%ськ';
SELECT name
FROM cities
WHERE name LIKE '%донец%';
SELECT CONCAT(name, ' (', region, ')') AS formatted_name
FROM cities
WHERE population > 100000
ORDER BY formatted_name ASC;
SELECT name, population,
       (population / 40000000) * 100 AS population_percentage
FROM cities
ORDER BY population DESC
LIMIT 10;
SELECT CONCAT(name, ' - ', (population / 40000000) * 100, '%') AS city_population_percentage
FROM cities
WHERE population >= (0.001 * 40000000)
ORDER BY (population / 40000000) * 100 ASC;