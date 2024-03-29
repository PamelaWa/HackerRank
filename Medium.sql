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

--Challenges
SELECT c.hacker_id, h.name, COUNT(c.challenge_id) AS cnt 
FROM Hackers AS h JOIN Challenges AS c ON h.hacker_id = c.hacker_id
GROUP BY c.hacker_id, h.name 
HAVING cnt = (SELECT COUNT(c1.challenge_id) 
              FROM Challenges AS c1 
              GROUP BY c1.hacker_id 
              ORDER BY COUNT(*) DESC LIMIT 1) OR
cnt NOT IN (SELECT COUNT(c2.challenge_id) 
            FROM Challenges AS c2 
            GROUP BY c2.hacker_id 
            HAVING c2.hacker_id <> c.hacker_id)
ORDER BY cnt DESC, c.hacker_id

--Contest Leaderboard
SELECT h.hacker_id, h.name, SUM(sscore)
FROM Hackers h INNER JOIN (SELECT s.hacker_id, max(score) AS sscore
                          FROM Submissions s
                          GROUP BY s.hacker_id, s.challenge_id) st
                          ON h.hacker_id=st.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(sscore)>0
ORDER BY SUM(sscore) DESC, h.hacker_id asc

--SQL Project Planning
SELECT Start_Date, min(End_Date)
FROM 
 (SELECT Start_Date 
  FROM Projects 
  WHERE Start_Date NOT IN (SELECT End_Date 
                           FROM Projects)) a ,
 (SELECT End_Date 
  FROM Projects 
  WHERE End_Date NOT IN (SELECT Start_Date 
                         FROM Projects)) b
WHERE Start_Date < End_Date
GROUP BY Start_Date
ORDER BY DATEDIFF(min(End_Date), Start_Date) ASC, Start_Date ASC;

--Placements
Select S.Name
From Students S
Join Friends F On S.ID = F.ID
Join Packages P1 On P1.ID = S.Id
Join Packages P2 On P2.ID = F.Friend_ID
Where P2.Salary > P1.Salary
Order By P2.Salary





