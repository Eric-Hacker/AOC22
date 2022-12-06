nl -b a -s "," -n ln  input.txt > day3.csv
echo -e "sacknum,content\n$(cat day3.csv)" > day3.csv
steampipe query "
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
"
steampipe query "
WITH sack AS (SELECT DISTINCT
    CAST (s.sacknum AS INT) as sack,
    item
    FROM
        csv.day3 as s,
        regexp_split_to_table(s.content, '\s*') AS item)
SELECT
    SUM ( CASE
         WHEN ASCII(s1.item) >= 96 THEN ASCII(s1.item)-96
         ELSE ASCII(s1.item)-64+26  
         END),
    COUNT (s1.sack)
    FROM 
        sack as s1
        JOIN sack as s2 ON s1.sack + 1 = s2.sack AND s1.item = s2.item
        JOIN sack as s3 ON s1.sack + 2 = s3.sack AND s1.item = s3.item 
    WHERE MOD( s1.sack , 3 ) = 1"
