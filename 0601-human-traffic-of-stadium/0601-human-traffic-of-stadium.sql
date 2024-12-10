-- Write your PostgreSQL query statement below
WITH temp as 
(SELECT s.id as id1,s1.id as id2,s2.id as id3 FROM Stadium s 
JOIN Stadium s1 ON s.id = s1.id + 1 
JOIN Stadium s2 ON s.id = s2.id + 2  
WHERE s.people >=100 and s1.people >= 100 and s2.people >= 100
),

temp2 as 
(SELECT id1 FROM temp
UNION
SELECT id2 FROM temp
UNION
SELECT id3 FROM temp
)

SELECT * FROM Stadium WHERE id IN (SELECT id1 FROM temp2)