WITH nums as (SELECT
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
    (b1 >= b2 AND e1 <= e2) OR (b2 >= b1 AND e2 <= e1)
