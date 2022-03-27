--Revising the Select Query I
SELECT *
FROM CITY
WHERE population > 100000 AND countrycode = 'USA'

--Revising the Select Query II
SELECT name
FROM city
WHERE population > 120000 AND countrycode = 'USA'

--Select By ID
SELECT *
FROM city
WHERE ID = 1661;

--Japanese Cities' Attributes
SELECT Name
FROM city
WHERE countrycode = 'JPN';

--Weather Observation Station 1
SELECT city, state
FROM station;

--*Weather Observation Station 3
SELECT DISTINCT city
FROM station
WHERE MOD(station.ID,2)=0
ORDER BY city;

--Weather Observation Station 4
SELECT (COUNT(city)-COUNT(distinct city))
FROM station;

--Weather Observation Station 5
SELECT city,LENGTH(city) FROM station ORDER BY LENGTH(city) ASC, city limit 1;
SELECT city,LENGTH(city) FROM station ORDER BY LENGTH(city) DESC, city limit 1;

--Weather Observation Station 6
SELECT DISTINCT city
FROM station 
WHERE LOWER(substr(CITY,1,1)) in ('a','e','i','o','u') ;










