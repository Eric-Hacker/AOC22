sed "s_-_,_g" input.txt > day4.csv
echo -e "b1,e1,b2,e2\n$(cat day4.csv)" > day4.csv
steampipe query "WITH nums as (SELECT
    CAST( b1 as INT ) as b1,
    CAST( b2 as INT ) as b2,
    CAST( e1 as INT ) as e1,
    CAST( e2 as INT ) as e2 
    FROM csv.day4
    )
SELECT
    COUNT(*)
FROM
    nums
WHERE
    (b1 >= b2 AND e1 <= e2) OR (b2 >= b1 AND e2 <= e1)"
steampipe query "WITH nums as (SELECT
    CAST( b1 as INT ) as b1,
    CAST( b2 as INT ) as b2,
    CAST( e1 as INT ) as e1,
    CAST( e2 as INT ) as e2 
    FROM csv.day4
    )
SELECT
    COUNT(*)
FROM
    nums
WHERE
    (b1 >= b2 AND b1 <= e2) OR (e1 >= b2 AND e1 <= e2) OR (b2 >= b1 AND b2 <= e1) OR (e2 >= b1 AND e2 <= e1) "