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

--Higher Than 75 Marks
SELECT name 
FROM students
WHERE marks > 75
ORDER BY SUBSTR(name, length(name)-2, LENGTH(name)), id;

--Employee Names
SELECT name
FROM Employee
ORDER BY name ASC;

--Employee Salaries
SELECT name
FROM Employee
WHERE salary > 2000 
AND months < 10
ORDER BY employee_id ASC;

--Type of Triangle
SELECT
  CASE 
    WHEN A + B <= C or A + C <= B or B + C <= A THEN 'Not A Triangle'
    WHEN A = B and B = C THEN 'Equilateral'
    WHEN A = B or A = C or B = C THEN 'Isosceles'
    WHEN A <> B and B <> C THEN 'Scalene'
  END 
FROM TRIANGLES;

--Revising Aggregations - The Count Function
SELECT COUNT(population)
FROM city
WHERE population > 100000;

--Revising Aggregations - The Sum Function
SELECT SUM(population)
FROM city
WHERE district = 'California';

--Revising Aggregations - Averages
SELECT AVG(population)
FROM city
WHERE district = 'California';

--Average Population
SELECT ROUND(AVG(population))
FROM city;

--Japan Population
SELECT SUM(population)
FROM city
WHERE countrycode = 'JPN';

--Population Density Difference
SELECT Max(population)-Min(population)
FROM city;

--*The Blunder
SELECT CEIL(AVG(Salary)-AVG(REPLACE(Salary,'0','')))
FROM  EMPLOYEES;

--Top Earners
SELECT MAX(salary * months),COUNT(salary * months)
FROM employee
WHERE (salary * months)=(SELECT MAX(salary * months) FROM employee)

--Weather Observation Station 2
SELECT ROUND(SUM(LAT_N),2) AS lat,ROUND(SUM(LONG_W),2) AS lon
FROM station;

--Weather Observation Station 13
SELECT ROUND(SUM(LAT_N),4)
FROM station
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345

--Weather Observation Station 14
SELECT ROUND(MAX(LAT_N),4)
FROM station
WHERE LAT_N < 137.2345

--Weather Observation Station 15
SELECT ROUND(LONG_W,4)
FROM station 
WHERE LAT_N=(
     SELECT MAX(LAT_N)
     FROM station
     WHERE LAT_N < 137.2345)

--Weather Observation Station 16
SELECT ROUND(MIN(LAT_N),4)
FROM station
WHERE LAT_N > 38.7780

--Weather Observation Station 17
SELECT ROUND(LONG_W,4)
FROM station 
WHERE LAT_N=(
     SELECT MIN(LAT_N)
     FROM station
     WHERE LAT_N > 38.7780)
     
--Population Census
SELECT SUM(city.population)
FROM city JOIN country ON city.countrycode = country.code
WHERE country.continent='ASIA'

--African Cities
SELECT city.name
FROM city JOIN country ON city.countrycode = country.code
WHERE country.continent='Africa'

--*Average Population of Each Continent
Select COUNTRY.Continent, FLOOR(AVG(CITY.POPULATION)) 
From CITY join COUNTRY on CITY.CountryCode = COUNTRY.Code  
Group by country.continent

--*Draw The Triangle 1
SET @no_of_lines = 20 + 1;
SELECT REPEAT('* ', @no_of_lines := @no_of_lines -1) 
FROM INFORMATION_SCHEMA.TABLES
LIMIT 20;

--Draw The Triangle 2
SET @no_of_lines = 0;
SELECT REPEAT('* ', @no_of_lines := @no_of_lines +1) 
FROM INFORMATION_SCHEMA.TABLES
LIMIT 20;



