--Weather Observation Station 18
SELECT ROUND(ABS(MIN(LAT_N)-MAX(LAT_N))+ABS(MIN(LONG_W)-MAX(LONG_W)),4)
FROM station

--*The PADS
SELECT CONCAT(name,CONCAT('(',LEFT(occupation,1),')'))
FROM occupations
ORDER BY name ASC;

SELECT CONCAT('There are a total of', ' ', COUNT(occupation),' ',LCASE(occupation),'s','.')
FROM occupations
GROUP BY occupation
ORDER BY COUNT(occupation) ASC, occupation;


