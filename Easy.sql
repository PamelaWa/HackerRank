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

--Weather Observation Station 3










