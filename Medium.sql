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

--*Occupations
select
    Doctor,
    Professor,
    Singer,
    Actor
from (
    select
        NameOrder,
        max(case Occupation when 'Doctor' then Name end) as Doctor,
        max(case Occupation when 'Professor' then Name end) as Professor,
        max(case Occupation when 'Singer' then Name end) as Singer,
        max(case Occupation when 'Actor' then Name end) as Actor
    from (
            select
                Occupation,
                Name,
                row_number() over(partition by Occupation order by Name ASC) as NameOrder
            from Occupations
         ) as NameLists
    group by NameOrder
    ) as Names

--Binary Tree Nodes
SELECT CASE
       WHEN P is NULL THEN CONCAT(n,' Root')
       WHEN N in 
       (SELECT DISTINCT P FROM BST) THEN CONCAT (n, ' Inner')
       ELSE CONCAT(n,' Leaf')
     END
FROM BST
ORDER BY N ASC























