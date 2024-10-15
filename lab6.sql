SELECT name, region
FROM cities
WHERE population > 350000;
SELECT cities.name, regions.region_name
FROM cities
JOIN regions ON cities.region = regions.region_code
WHERE regions.region_name = 'Nord';