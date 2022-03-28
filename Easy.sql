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
WHERE upper(substr(city, 1,1)) IN ('A','E','I','O','U');

--Weather Observation Station 7
SELECT DISTINCT city
FROM station 
WHERE upper(substr(city, length(city),1)) IN ('A','E','I','O','U');

--Weather Observation Station 8
SELECT DISTINCT city
FROM station 
WHERE upper(substr(city, 1,1)) IN ('A','E','I','O','U') 
AND upper(substr(city, length(city),1)) IN ('A','E','I','O','U');

--Weather Observation Station 9
SELECT DISTINCT city
FROM station 
WHERE upper(substr(city, 1,1)) NOT IN ('A','E','I','O','U');

--Weather Observation Station 10
SELECT DISTINCT city
FROM station 
WHERE upper(substr(city, length(city),1)) NOT IN ('A','E','I','O','U');

--Weather Observation Station 11
SELECT DISTINCT city
FROM station 
WHERE upper(substr(city, 1,1)) NOT IN ('A','E','I','O','U') 
OR upper(substr(city, length(city),1)) NOT IN ('A','E','I','O','U');

--Weather Observation Station 12
SELECT DISTINCT city
FROM station 
WHERE upper(substr(city, 1,1)) NOT IN ('A','E','I','O','U') 
AND upper(substr(city, length(city),1)) NOT IN ('A','E','I','O','U');








