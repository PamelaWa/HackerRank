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

--New Companies
select c.company_code, c.founder,
       count(distinct l.lead_manager_code),
       count(distinct s.senior_manager_code),
       count(distinct m.manager_code),
       count(distinct e.employee_code)
from Company as c 
join Lead_Manager as l 
on c.company_code = l.company_code
join Senior_Manager as s
on l.lead_manager_code = s.lead_manager_code
join Manager as m 
on m.senior_manager_code = s.senior_manager_code
join Employee as e
on e.manager_code = m.manager_code
group by c.company_code, c.founder
order by c.company_code asc

--Weather Observation Station 19
select round(sqrt(power(max(LAT_N) - min(LAT_N), 2) + power(max(LONG_W) - min(LONG_W), 2)), 4)
FROM STATION;

--Weather Observation Station 20
SELECT ROUND(S1.LAT_N, 4) 
    FROM STATION AS S1 
    WHERE (SELECT ROUND(COUNT(S1.ID)/2) - 1 
           FROM STATION) = 
          (SELECT COUNT(S2.ID) 
           FROM STATION AS S2 
           WHERE S2.LAT_N > S1.LAT_N)
           
--The Report
SELECT CASE
       WHEN Grades.grade < 8 THEN 'NULL'
       ELSE Students.name
       END
,Grades.grade, Students.marks
FROM Students,Grades
WHERE Students.marks >= Grades.min_mark AND Students.marks <= Grades.max_mark
ORDER BY Grades.grade DESC, Students.name

--Top Competitors
SELECT Submissions.hacker_id, Hackers.name 
FROM Hackers, Submissions, Challenges, Difficulty
WHERE Submissions.score = Difficulty.score
AND Hackers.hacker_id = Submissions.hacker_id 
AND Submissions.challenge_id = Challenges.challenge_id 
AND Challenges.difficulty_level = Difficulty.difficulty_level
GROUP BY Submissions.hacker_id, Hackers.name
HAVING count(*) > 1 
ORDER BY count(*) DESC, Submissions.hacker_id ASC;

--Ollivander's Inventory
SELECT w.id, p.age, w.coins_needed, w.power
FROM Wands AS w JOIN Wands_Property AS p ON w.code = p.code
WHERE w.coins_needed = (SELECT min(coins_needed)
                       FROM Wands INNER JOIN Wands_Property 
                        ON Wands.code = Wands_Property.code
                       WHERE Wands_Property.is_evil = 0 and p.age = Wands_Property.age and w.power = Wands.power)
ORDER BY w.power DESC, p.age DESC













