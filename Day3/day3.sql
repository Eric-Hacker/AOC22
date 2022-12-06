WITH leftsack AS (SELECT DISTINCT
    CAST (s.sacknum AS INT) as sack,
    item
    FROM
        csv.day3 as s,
        regexp_split_to_table(LEFT(s.content,LENGTH(s.content)/2), '\s*') AS item),
    rightsack AS (SELECT DISTINCT
    CAST (s.sacknum AS INT) as sack,
    item
    FROM
        csv.day3 as s,
        regexp_split_to_table(RIGHT(s.content,LENGTH(s.content)/2), '\s*') AS item)
SELECT
    SUM ( CASE
         WHEN ASCII(l.item) >= 96 THEN ASCII(l.item)-96
         ELSE ASCII(l.item)-64+26  
         END),
    COUNT (l.sack)
    FROM 
        leftsack as l
        JOIN rightsack as r ON r.sack = l.sack AND r.item = l.item 
