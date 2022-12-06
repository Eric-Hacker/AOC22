WITH results AS ( SELECT
    CASE 
        WHEN g.game = 'A X' then 3
        WHEN g.game = 'A Y' then 4
        WHEN g.game = 'A Z' then 8
        WHEN g.game = 'B X' then 1
        WHEN g.game = 'B Y' then 5
        WHEN g.game = 'B Z' then 9
        WHEN g.game = 'C X' then 2
        WHEN g.game = 'C Y' then 6
        WHEN g.game = 'C Z' then 7
    END AS result 
    FROM csv.day2 as g)
SELECT 
    SUM (result)
    FROM results


